package com.ruoyi.system.service;

import com.ruoyi.system.domain.AssetDictEntity;

import java.util.List;

/**
 *
 */
public interface IAssetDictService {

    List<AssetDictEntity> selectDictByName(String urls);
}
