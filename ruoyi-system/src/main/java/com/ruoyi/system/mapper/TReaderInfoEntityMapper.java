package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TReaderInfoEntity;

/**
 * 读者信息Mapper接口
 * 
 * @author zhangyuan
 * @date 2022-06-04
 */
public interface TReaderInfoEntityMapper 
{
    /**
     * 查询读者信息
     * 
     * @param id 读者信息主键
     * @return 读者信息
     */
    public TReaderInfoEntity selectTReaderInfoEntityById(Long id);

    /**
     * 查询读者信息列表
     * 
     * @param tReaderInfoEntity 读者信息
     * @return 读者信息集合
     */
    public List<TReaderInfoEntity> selectTReaderInfoEntityList(TReaderInfoEntity tReaderInfoEntity);

    /**
     * 新增读者信息
     * 
     * @param tReaderInfoEntity 读者信息
     * @return 结果
     */
    public int insertTReaderInfoEntity(TReaderInfoEntity tReaderInfoEntity);

    /**
     * 修改读者信息
     * 
     * @param tReaderInfoEntity 读者信息
     * @return 结果
     */
    public int updateTReaderInfoEntity(TReaderInfoEntity tReaderInfoEntity);

    /**
     * 删除读者信息
     * 
     * @param id 读者信息主键
     * @return 结果
     */
    public int deleteTReaderInfoEntityById(Long id);

    /**
     * 批量删除读者信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTReaderInfoEntityByIds(String[] ids);
}
