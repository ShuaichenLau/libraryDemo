package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TBookTypeEntity;

/**
 * 图书分类管理Mapper接口
 * 
 * @author liusc
 * @date 2022-05-27
 */
public interface TBookTypeEntityMapper 
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
     * 删除图书分类管理
     * 
     * @param id 图书分类管理主键
     * @return 结果
     */
    public int deleteTBookTypeEntityById(Long id);

    /**
     * 批量删除图书分类管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTBookTypeEntityByIds(String[] ids);

    /**
     * 批量逻辑删除图书分类管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteLogicallyTBookTypeEntityByIds(String[] ids);
}
