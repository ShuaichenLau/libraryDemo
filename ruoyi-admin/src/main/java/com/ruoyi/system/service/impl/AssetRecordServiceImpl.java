package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.AssetRecordEntity;
import com.ruoyi.system.mapper.AssetRecordMapper;
import com.ruoyi.system.service.IAssetRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * @author liusc
 * @date 2022-05-27
 */
@Service
public class AssetRecordServiceImpl implements IAssetRecordService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AssetRecordServiceImpl.class);

    @Autowired
    private AssetRecordMapper assetRecordMapper;

    @Override
    public List<AssetRecordEntity> selectList(AssetRecordEntity params) {
        return assetRecordMapper.selectList(params);
    }

    /**
     * 添加JSON数据对比源
     *
     * @param params
     * @return
     */
    @Override
    public int insertJsonRecord(AssetRecordEntity params) {
        return assetRecordMapper.insertJsonRecord(params);
    }

    @Override
    public int deleteByIds(String ids) {
        return assetRecordMapper.deleteByIds(Convert.toStrArray(ids));
    }

    @Override
    public List<AssetRecordEntity> getListByIds(String ids) {
        return assetRecordMapper.getListByIds(Convert.toStrArray(ids));
    }


}
