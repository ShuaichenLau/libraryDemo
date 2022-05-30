package com.ruoyi.system.service.impl;

import java.util.List;

import cn.hutool.core.collection.CollectionUtil;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TBookEntityMapper;
import com.ruoyi.system.domain.TBookEntity;
import com.ruoyi.system.service.ITBookEntityService;
import com.ruoyi.common.core.text.Convert;

/**
 * 图书信息管理Service业务层处理
 * 
 * @author liusc
 * @date 2022-05-27
 */
@Service
public class TBookEntityServiceImpl implements ITBookEntityService 
{
    @Autowired
    private TBookEntityMapper tBookEntityMapper;

    /**
     * 查询图书信息管理
     * 
     * @param id 图书信息管理主键
     * @return 图书信息管理
     */
    @Override
    public TBookEntity selectTBookEntityById(Long id)
    {
        return tBookEntityMapper.selectTBookEntityById(id);
    }

    /**
     * 查询图书信息管理列表
     * 
     * @param tBookEntity 图书信息管理
     * @return 图书信息管理
     */
    @Override
    public List<TBookEntity> selectTBookEntityList(TBookEntity tBookEntity)
    {
        return tBookEntityMapper.selectTBookEntityList(tBookEntity);
    }

    /**
     * 新增图书信息管理
     * 
     * @param tBookEntity 图书信息管理
     * @return 结果
     */
    @Override
    public int insertTBookEntity(TBookEntity tBookEntity)
    {
        tBookEntity.setCreateTime(DateUtils.getNowDate());
        return tBookEntityMapper.insertTBookEntity(tBookEntity);
    }

    /**
     * 修改图书信息管理
     * 
     * @param tBookEntity 图书信息管理
     * @return 结果
     */
    @Override
    public int updateTBookEntity(TBookEntity tBookEntity)
    {
        tBookEntity.setUpdateTime(DateUtils.getNowDate());
        return tBookEntityMapper.updateTBookEntity(tBookEntity);
    }

    /**
     * 逻辑批量删除图书信息管理
     * 
     * @param ids 需要删除的图书信息管理主键
     * @return 结果
     */
    @Override
    public int deleteTBookEntityByIds(String ids)
    {
        return tBookEntityMapper.deleteLogicTBookEntityByIds(Convert.toStrArray(ids));

//        return tBookEntityMapper.deleteTBookEntityByIds(Convert.toStrArray(ids));
    }

    @Override
    public String checkBookNameAndBookCode(TBookEntity tBookEntity) {
        if (StringUtils.isNotEmpty(tBookEntity.getName())){
            List<TBookEntity> bookEntitiesA = tBookEntityMapper.checkBookName(tBookEntity);
            if (CollectionUtil.isNotEmpty(bookEntitiesA)){
                return "已经存在的图书名称!";
            }
        }

        if (StringUtils.isNotEmpty(tBookEntity.getIsbn())){
            List<TBookEntity> bookEntitiesB = tBookEntityMapper.checkIsbn(tBookEntity);
            if (CollectionUtil.isNotEmpty(bookEntitiesB)){
                return "已经存在的标准书号!";
            }
        }

        return null;
    }
}
