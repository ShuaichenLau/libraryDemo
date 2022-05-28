package com.ruoyi.web.controller.system;

import java.util.Calendar;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
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
import com.ruoyi.system.domain.TBookTypeEntity;
import com.ruoyi.system.service.ITBookTypeEntityService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.annotation.Resource;

/**
 * 图书分类管理Controller
 * 
 * @author liusc
 * @date 2022-05-27
 */
@Controller
@RequestMapping("/system/booktype")
public class TBookTypeController extends BaseController
{

    private String prefix = "system/booktype";

    @Autowired
    private ITBookTypeEntityService tBookTypeEntityService;

    @RequiresPermissions("system:booktype:view")
    @GetMapping()
    public String booktype()
    {
        return prefix + "/booktype";
    }

    /**
     * 查询图书分类管理列表
     */
    @RequiresPermissions("system:booktype:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TBookTypeEntity tBookTypeEntity)
    {
        startPage();
        List<TBookTypeEntity> list = tBookTypeEntityService.selectTBookTypeEntityList(tBookTypeEntity);
        return getDataTable(list);
    }

    /**
     * 导出图书分类管理列表
     */
    @RequiresPermissions("system:booktype:export")
    @Log(title = "图书分类管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TBookTypeEntity tBookTypeEntity)
    {
        List<TBookTypeEntity> list = tBookTypeEntityService.selectTBookTypeEntityList(tBookTypeEntity);
        ExcelUtil<TBookTypeEntity> util = new ExcelUtil<TBookTypeEntity>(TBookTypeEntity.class);
        return util.exportExcel(list, "图书分类管理数据");
    }

    /**
     * 新增图书分类管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存图书分类管理
     */
    @RequiresPermissions("system:booktype:add")
    @Log(title = "图书分类管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TBookTypeEntity tBookTypeEntity)
    {

        tBookTypeEntity.setCreateUser(getSysUser().getUserId());
        tBookTypeEntity.setDelFlag(0);
        return toAjax(tBookTypeEntityService.insertTBookTypeEntity(tBookTypeEntity));
    }

    /**
     * 修改图书分类管理
     */
    @RequiresPermissions("system:booktype:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TBookTypeEntity tBookTypeEntity = tBookTypeEntityService.selectTBookTypeEntityById(id);
        mmap.put("tBookTypeEntity", tBookTypeEntity);
        return prefix + "/edit";
    }

    /**
     * 修改保存图书分类管理
     */
    @RequiresPermissions("system:booktype:edit")
    @Log(title = "图书分类管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TBookTypeEntity tBookTypeEntity)
    {
        SysUser sysUser = getSysUser();
        tBookTypeEntity.setUpdateUser(sysUser.getUserId());
        tBookTypeEntity.setUpdateTime(Calendar.getInstance().getTime());
        return toAjax(tBookTypeEntityService.updateTBookTypeEntity(tBookTypeEntity));
    }

    /**
     * 删除图书分类管理
     */
    @RequiresPermissions("system:booktype:remove")
    @Log(title = "图书分类管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tBookTypeEntityService.deleteTBookTypeEntityByIds(ids));
    }
}
