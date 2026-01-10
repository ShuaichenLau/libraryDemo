package com.ruoyi.system.service;

import com.ruoyi.system.domain.AssetRecordEntity;

import java.util.List;

/**
 *
 */
public interface IAssetRecordService {

    List<AssetRecordEntity> selectList(AssetRecordEntity params);

    int insertJsonRecord(AssetRecordEntity params);

    int deleteByIds(String ids);

    List<AssetRecordEntity> getListByIds(String ids);
}
