package com.ruoyi.web.controller.system;

import java.util.List;
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
import com.ruoyi.system.domain.TReaderInfoEntity;
import com.ruoyi.system.service.ITReaderInfoEntityService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 读者信息Controller
 * 
 * @author zhangyuan
 * @date 2022-06-04
 */
@Controller
@RequestMapping("/system/reader")
public class TReaderInfoEntityController extends BaseController
{
    private String prefix = "system/reader";

    @Autowired
    private ITReaderInfoEntityService tReaderInfoEntityService;

    @RequiresPermissions("system:reader:view")
    @GetMapping()
    public String reader()
    {
        return prefix + "/reader";
    }

    /**
     * 查询读者信息列表
     */
    @RequiresPermissions("system:reader:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TReaderInfoEntity tReaderInfoEntity)
    {
        startPage();
        List<TReaderInfoEntity> list = tReaderInfoEntityService.selectTReaderInfoEntityList(tReaderInfoEntity);
        return getDataTable(list);
    }

    /**
     * 导出读者信息列表
     */
    @RequiresPermissions("system:reader:export")
    @Log(title = "读者信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TReaderInfoEntity tReaderInfoEntity)
    {
        List<TReaderInfoEntity> list = tReaderInfoEntityService.selectTReaderInfoEntityList(tReaderInfoEntity);
        ExcelUtil<TReaderInfoEntity> util = new ExcelUtil<TReaderInfoEntity>(TReaderInfoEntity.class);
        return util.exportExcel(list, "读者信息数据");
    }

    /**
     * 新增读者信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存读者信息
     */
    @RequiresPermissions("system:reader:add")
    @Log(title = "读者信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TReaderInfoEntity tReaderInfoEntity)
    {
        return toAjax(tReaderInfoEntityService.insertTReaderInfoEntity(tReaderInfoEntity));
    }

    /**
     * 修改读者信息
     */
    @RequiresPermissions("system:reader:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TReaderInfoEntity tReaderInfoEntity = tReaderInfoEntityService.selectTReaderInfoEntityById(id);
        mmap.put("tReaderInfoEntity", tReaderInfoEntity);
        return prefix + "/edit";
    }

    /**
     * 修改保存读者信息
     */
    @RequiresPermissions("system:reader:edit")
    @Log(title = "读者信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TReaderInfoEntity tReaderInfoEntity)
    {
        return toAjax(tReaderInfoEntityService.updateTReaderInfoEntity(tReaderInfoEntity));
    }

    /**
     * 删除读者信息
     */
    @RequiresPermissions("system:reader:remove")
    @Log(title = "读者信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tReaderInfoEntityService.deleteTReaderInfoEntityByIds(ids));
    }
}
