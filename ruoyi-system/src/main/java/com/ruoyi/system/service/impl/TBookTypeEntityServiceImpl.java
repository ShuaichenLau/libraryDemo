package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TBookTypeEntityMapper;
import com.ruoyi.system.domain.TBookTypeEntity;
import com.ruoyi.system.service.ITBookTypeEntityService;
import com.ruoyi.common.core.text.Convert;

/**
 * 图书分类管理Service业务层处理
 * 
 * @author liusc
 * @date 2022-05-27
 */
@Service
public class TBookTypeEntityServiceImpl implements ITBookTypeEntityService 
{
    @Autowired
    private TBookTypeEntityMapper tBookTypeEntityMapper;

    /**
     * 查询图书分类管理
     * 
     * @param id 图书分类管理主键
     * @return 图书分类管理
     */
    @Override
    public TBookTypeEntity selectTBookTypeEntityById(Long id)
    {
        return tBookTypeEntityMapper.selectTBookTypeEntityById(id);
    }

    /**
     * 查询图书分类管理列表
     * 
     * @param tBookTypeEntity 图书分类管理
     * @return 图书分类管理
     */
    @Override
    public List<TBookTypeEntity> selectTBookTypeEntityList(TBookTypeEntity tBookTypeEntity)
    {
        return tBookTypeEntityMapper.selectTBookTypeEntityList(tBookTypeEntity);
    }

    /**
     * 新增图书分类管理
     * 
     * @param tBookTypeEntity 图书分类管理
     * @return 结果
     */
    @Override
    public int insertTBookTypeEntity(TBookTypeEntity tBookTypeEntity)
    {
        tBookTypeEntity.setCreateTime(DateUtils.getNowDate());
        return tBookTypeEntityMapper.insertTBookTypeEntity(tBookTypeEntity);
    }

    /**
     * 修改图书分类管理
     * 
     * @param tBookTypeEntity 图书分类管理
     * @return 结果
     */
    @Override
    public int updateTBookTypeEntity(TBookTypeEntity tBookTypeEntity)
    {
        tBookTypeEntity.setUpdateTime(DateUtils.getNowDate());
        return tBookTypeEntityMapper.updateTBookTypeEntity(tBookTypeEntity);
    }

    /**
     * 批量删除图书分类管理
     * 
     * @param ids 需要删除的图书分类管理主键
     * @return 结果
     */
    @Override
    public int deleteTBookTypeEntityByIds(String ids)
    {
        // 逻辑删除
        return tBookTypeEntityMapper.deleteLogicallyTBookTypeEntityByIds(Convert.toStrArray(ids));

//        return tBookTypeEntityMapper.deleteTBookTypeEntityByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除图书分类管理信息
     * 
     * @param id 图书分类管理主键
     * @return 结果
     */
    @Override
    public int deleteTBookTypeEntityById(Long id)
    {
        return tBookTypeEntityMapper.deleteTBookTypeEntityById(id);
    }
}
