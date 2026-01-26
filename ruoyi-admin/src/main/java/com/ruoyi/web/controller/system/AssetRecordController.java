package com.ruoyi.web.controller.system;

import cn.hutool.http.Header;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.ruoyi.common.annotation.Idempotent;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.AssetRecordEntity;
import com.ruoyi.system.domain.AssetRecordParam;
import com.ruoyi.system.service.IAssetDictService;
import com.ruoyi.system.service.IAssetRecordService;
import com.ruoyi.web.controller.demo.utils.JsonDiffHtmlUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


/**
 *
 */
@Controller
@RequestMapping("/system/record")
public class AssetRecordController extends BaseController {
    private static final String PREFIX = "system/record";
    private static final Logger LOGGER = LoggerFactory.getLogger(AssetRecordController.class);
    
    // 常量定义
    private static final int HTTP_OK = 200;
    private static final int REQUEST_TIMEOUT = 10000;
    private static final int MIN_DIFF_RECORDS = 2;

    @Autowired
    private IAssetRecordService assetRecordService;
    @Autowired
    private IAssetDictService assetDictService;

    @RequiresPermissions("system:record:view")
    @GetMapping()
    public String record() {
        return PREFIX + "/record";
    }

    /**
     * 查询JSON数据列表
     */
    @RequiresPermissions("system:record:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(AssetRecordEntity params) {
        startPage();
        List<AssetRecordEntity> list = assetRecordService.selectList(params);
        return getDataTable(list);
    }

    @GetMapping("/add")
    public String add() {
        return PREFIX + "/add";
    }

    @Idempotent(description = "hello")
    @RequiresPermissions("system:record:add")
    @Log(title = "添加JSON数据对比源", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(AssetRecordEntity params) {
        params.setCreateTime(Calendar.getInstance().getTime());
        return toAjax(assetRecordService.insertJsonRecord(params));
    }

    @GetMapping("/addJson")
    public String addJson(ModelMap mmap) {
        // 环境信息
        mmap.put("clustag", assetDictService.selectDictByName("clustag"));

        // baggage
        mmap.put("baggage", assetDictService.selectDictByName("baggage"));

        return PREFIX + "/addJson";
    }

    @Idempotent(description = "hello")
    @Log(title = "通过接口调用触发测试", businessType = BusinessType.INSERT)
    @PostMapping("/addJson")
    @ResponseBody
    public AjaxResult addJsonSave(AssetRecordParam params) {

        AssetRecordEntity assetRecordEntity = new AssetRecordEntity();
        assetRecordEntity.setCreateTime(Calendar.getInstance().getTime());
        assetRecordEntity.setClustag(params.getClustag());
        assetRecordEntity.setAccountId(params.getAccountId());
        assetRecordEntity.setBaggage(params.getBaggage());
        // 构造完整的GET URL - 使用配置化的基础URL
        String baseUrl = "https://" + params.getClustag();
        String apiPath = "/api/asset/profiles/" + params.getAccountId() + "/assets";
        String queryParams = "?_s=1768051607692&timezone=local&lang=zh_CN&bos_license=TBSG" +
                "&account_id=" + params.getAccountId() +
                "&asset_type=EQUITY&assetQuoteType=OVERNIGHT&fee_mode_type=WITH_FEE";
        String url = baseUrl + apiPath + queryParams;

        // 发起带Headers的GET请求
        HttpResponse response = HttpRequest.get(url)
                .header(Header.AUTHORIZATION, params.getAuthorization())
                .header("baggage", params.getBaggage()) // 自定义header
                .timeout(REQUEST_TIMEOUT) // 超时配置
                .execute();

        // 记录响应状态码（不记录敏感响应内容）
        LOGGER.info("API调用状态码: {}, URL: {}", response.getStatus(), baseUrl + apiPath);

        if (HTTP_OK == response.getStatus()) {
            JSONObject root = JSONUtil.parseObj(response.body());
            assetRecordEntity.setResponseJson(root.getJSONObject("data").toString());
        }
        return toAjax(assetRecordService.insertJsonRecord(assetRecordEntity));
    }

    /**
     * @param ids
     * @return
     */
    @Log(title = "添加JSON数据对比源", businessType = BusinessType.OTHER)
    @PostMapping(value = "/diffJson", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String diffJson(String ids) throws Exception {
        List<AssetRecordEntity> list = assetRecordService.getListByIds(ids);
        LOGGER.info("list:{}", JSON.toJSON(list));
        // 至少需要两份数据进行对比
        if (list.size() < MIN_DIFF_RECORDS) {
            return "<html><body style='padding:16px'>至少选择2条记录进行对比</body></html>";
        }
        // 1) payloads
        List<Object> payloads = new ArrayList<Object>();
        List<String> labels = new ArrayList<String>();

        for (AssetRecordEntity e : list) {
            // 这里按你的字段改：比如 e.getPayloadJson()
            payloads.add(e.getResponseJson());
            // 这里按你的字段改：比如 e.getBizDate() / e.getSnapshotDate()
            labels.add(String.valueOf(e.getId()) + "_" + e.getClustag() + "_" + e.getAccountId());
        }

        JsonDiffHtmlUtil.DiffResult result = JsonDiffHtmlUtil.diffToHtml(payloads, labels);

        long diffCount = 0L;
        for (JsonDiffHtmlUtil.DiffRow r : result.rows) {
            if (r.different) diffCount++;
        }

        return String.format(
                "<html>" +
                        "  <head>" +
                        "    <meta charset=\"utf-8\">" +
                        "    <title>JSON 对比结果</title>" +
                        "  </head>" +
                        "  <body style=\"padding:16px\">" +
                        "    <h2>JSON 对比结果</h2>" +
                        "    <div style=\"margin-bottom:12px\">" +
                        "      不同项数量：<b>%d</b>（与第一列不一致处标黄）" +
                        "    </div>" +
                        "    %s" +
                        "  </body>" +
                        "</html>",
                diffCount,
                result.htmlTable
        );
    }


    /**
     * 删除添加JSON数据对比源
     */
    @RequiresPermissions("system:record:remove")
    @Log(title = "添加JSON数据对比源", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(assetRecordService.deleteByIds(ids));
    }
}
