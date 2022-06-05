package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TReaderInfoEntityMapper;
import com.ruoyi.system.domain.TReaderInfoEntity;
import com.ruoyi.system.service.ITReaderInfoEntityService;
import com.ruoyi.common.core.text.Convert;

/**
 * 读者信息Service业务层处理
 * 
 * @author zhangyuan
 * @date 2022-06-04
 */
@Service
public class TReaderInfoEntityServiceImpl implements ITReaderInfoEntityService 
{
    @Autowired
    private TReaderInfoEntityMapper tReaderInfoEntityMapper;

    /**
     * 查询读者信息
     * 
     * @param id 读者信息主键
     * @return 读者信息
     */
    @Override
    public TReaderInfoEntity selectTReaderInfoEntityById(Long id)
    {
        return tReaderInfoEntityMapper.selectTReaderInfoEntityById(id);
    }

    /**
     * 查询读者信息列表
     * 
     * @param tReaderInfoEntity 读者信息
     * @return 读者信息
     */
    @Override
    public List<TReaderInfoEntity> selectTReaderInfoEntityList(TReaderInfoEntity tReaderInfoEntity)
    {
        return tReaderInfoEntityMapper.selectTReaderInfoEntityList(tReaderInfoEntity);
    }

    /**
     * 新增读者信息
     * 
     * @param tReaderInfoEntity 读者信息
     * @return 结果
     */
    @Override
    public int insertTReaderInfoEntity(TReaderInfoEntity tReaderInfoEntity)
    {
        return tReaderInfoEntityMapper.insertTReaderInfoEntity(tReaderInfoEntity);
    }

    /**
     * 修改读者信息
     * 
     * @param tReaderInfoEntity 读者信息
     * @return 结果
     */
    @Override
    public int updateTReaderInfoEntity(TReaderInfoEntity tReaderInfoEntity)
    {
        return tReaderInfoEntityMapper.updateTReaderInfoEntity(tReaderInfoEntity);
    }

    /**
     * 批量删除读者信息
     * 
     * @param ids 需要删除的读者信息主键
     * @return 结果
     */
    @Override
    public int deleteTReaderInfoEntityByIds(String ids)
    {
        return tReaderInfoEntityMapper.deleteTReaderInfoEntityByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除读者信息信息
     * 
     * @param id 读者信息主键
     * @return 结果
     */
    @Override
    public int deleteTReaderInfoEntityById(Long id)
    {
        return tReaderInfoEntityMapper.deleteTReaderInfoEntityById(id);
    }
}
