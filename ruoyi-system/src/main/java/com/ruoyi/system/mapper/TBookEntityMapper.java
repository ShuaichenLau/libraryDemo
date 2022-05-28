package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TBookEntity;

/**
 * 图书信息管理Mapper接口
 * 
 * @author liusc
 * @date 2022-05-27
 */
public interface TBookEntityMapper 
{
    /**
     * 查询图书信息管理
     * 
     * @param id 图书信息管理主键
     * @return 图书信息管理
     */
    public TBookEntity selectTBookEntityById(Long id);

    /**
     * 查询图书信息管理列表
     * 
     * @param tBookEntity 图书信息管理
     * @return 图书信息管理集合
     */
    public List<TBookEntity> selectTBookEntityList(TBookEntity tBookEntity);

    /**
     * 新增图书信息管理
     * 
     * @param tBookEntity 图书信息管理
     * @return 结果
     */
    public int insertTBookEntity(TBookEntity tBookEntity);

    /**
     * 修改图书信息管理
     * 
     * @param tBookEntity 图书信息管理
     * @return 结果
     */
    public int updateTBookEntity(TBookEntity tBookEntity);

    /**
     * 删除图书信息管理
     * 
     * @param id 图书信息管理主键
     * @return 结果
     */
    public int deleteTBookEntityById(Long id);

    /**
     * 批量删除图书信息管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTBookEntityByIds(String[] ids);

    /**
     * 逻辑批量删除图书信息管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteLogicTBookEntityByIds(String[] ids);

    List<TBookEntity> checkBookName(TBookEntity tBookEntity);

    List<TBookEntity> checkIsbn(TBookEntity tBookEntity);
}
