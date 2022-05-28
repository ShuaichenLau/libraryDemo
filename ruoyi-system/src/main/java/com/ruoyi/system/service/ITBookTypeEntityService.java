package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.TBookTypeEntity;

/**
 * 图书分类管理Service接口
 * 
 * @author liusc
 * @date 2022-05-27
 */
public interface ITBookTypeEntityService 
{
    /**
     * 查询图书分类管理
     * 
     * @param id 图书分类管理主键
     * @return 图书分类管理
     */
    public TBookTypeEntity selectTBookTypeEntityById(Long id);

    /**
     * 查询图书分类管理列表
     * 
     * @param tBookTypeEntity 图书分类管理
     * @return 图书分类管理集合
     */
    public List<TBookTypeEntity> selectTBookTypeEntityList(TBookTypeEntity tBookTypeEntity);

    /**
     * 新增图书分类管理
     * 
     * @param tBookTypeEntity 图书分类管理
     * @return 结果
     */
    public int insertTBookTypeEntity(TBookTypeEntity tBookTypeEntity);

    /**
     * 修改图书分类管理
     * 
     * @param tBookTypeEntity 图书分类管理
     * @return 结果
     */
    public int updateTBookTypeEntity(TBookTypeEntity tBookTypeEntity);

    /**
     * 批量删除图书分类管理
     * 
     * @param ids 需要删除的图书分类管理主键集合
     * @return 结果
     */
    public int deleteTBookTypeEntityByIds(String ids);

    /**
     * 删除图书分类管理信息
     * 
     * @param id 图书分类管理主键
     * @return 结果
     */
    public int deleteTBookTypeEntityById(Long id);
}
