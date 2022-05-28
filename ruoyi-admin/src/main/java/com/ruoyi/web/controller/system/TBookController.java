package com.ruoyi.web.controller.system;

import java.util.Calendar;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.TBookTypeEntity;
import com.ruoyi.system.service.ITBookTypeEntityService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.TBookEntity;
import com.ruoyi.system.service.ITBookEntityService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 图书信息管理Controller
 * 
 * @author liusc
 * @date 2022-05-27
 */
@Controller
@RequestMapping("/system/book")
public class TBookController extends BaseController
{
    private String prefix = "system/book";

    @Autowired
    private ITBookEntityService tBookEntityService;

    @Autowired
    private ITBookTypeEntityService tBookTypeEntityService;

    @RequiresPermissions("system:book:view")
    @GetMapping()
    public String book()
    {
        return prefix + "/book";
    }

    /**
     * 查询图书信息管理列表
     */
    @RequiresPermissions("system:book:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TBookEntity tBookEntity)
    {
        startPage();
        List<TBookEntity> list = tBookEntityService.selectTBookEntityList(tBookEntity);
        return getDataTable(list);
    }

    /**
     * 导出图书信息管理列表
     */
    @RequiresPermissions("system:book:export")
    @Log(title = "图书信息管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TBookEntity tBookEntity)
    {
        List<TBookEntity> list = tBookEntityService.selectTBookEntityList(tBookEntity);
        ExcelUtil<TBookEntity> util = new ExcelUtil<TBookEntity>(TBookEntity.class);
        return util.exportExcel(list, "图书信息管理数据");
    }

    /**
     * 新增图书信息管理
     */
    @GetMapping("/add")
    public String add(ModelMap map) {
        List<TBookTypeEntity> value = tBookTypeEntityService.selectTBookTypeEntityList(null);

        map.put("bookTypes", value);
        return prefix + "/add";
    }

    /**
     * 新增保存图书信息管理
     */
    @RequiresPermissions("system:book:add")
    @Log(title = "图书信息管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TBookEntity tBookEntity)
    {

        if (tBookEntity.getBookType() == null){
            return error("图书分类不允许为空!");
        }

        // 图书名称 标准书号 校验  不允许重复
        String message = tBookEntityService.checkBookNameAndBookCode(tBookEntity);
        if (StringUtils.isNotEmpty(message)){
            return error(message);
        }

        tBookEntity.setDelFlag(0);
        tBookEntity.setCreateUser(getUserId());
        tBookEntity.setCreateTime(Calendar.getInstance().getTime());
        return toAjax(tBookEntityService.insertTBookEntity(tBookEntity));
    }

    /**
     * 修改图书信息管理
     */
    @RequiresPermissions("system:book:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        List<TBookTypeEntity> bookTypeList = tBookTypeEntityService.selectTBookTypeEntityList(null);

        TBookEntity tBookEntity = tBookEntityService.selectTBookEntityById(id);
        mmap.put("tBookEntity", tBookEntity);
        mmap.put("bookTypes", bookTypeList);

        return prefix + "/edit";
    }

    /**
     * 修改保存图书信息管理
     */
    @RequiresPermissions("system:book:edit")
    @Log(title = "图书信息管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TBookEntity tBookEntity)
    {
        if (tBookEntity.getBookType() == null){
            return error("图书分类不允许为空!");
        }

        // 图书名称 标准书号 校验  不允许重复
        String message = tBookEntityService.checkBookNameAndBookCode(tBookEntity);
        if (StringUtils.isNotEmpty(message)){
            return error(message);
        }

        tBookEntity.setUpdateUser(getUserId());
        tBookEntity.setUpdateTime(Calendar.getInstance().getTime());
        return toAjax(tBookEntityService.updateTBookEntity(tBookEntity));
    }

    /**
     * 删除图书信息管理
     */
    @RequiresPermissions("system:book:remove")
    @Log(title = "图书信息管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tBookEntityService.deleteTBookEntityByIds(ids));
    }
}
