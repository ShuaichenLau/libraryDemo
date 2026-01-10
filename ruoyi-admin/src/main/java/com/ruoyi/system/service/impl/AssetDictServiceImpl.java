package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.AssetDictEntity;
import com.ruoyi.system.mapper.AssetDictMapper;
import com.ruoyi.system.service.IAssetDictService;
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
public class AssetDictServiceImpl implements IAssetDictService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AssetDictServiceImpl.class);

    @Autowired
    private AssetDictMapper mapper;


    @Override
    public List<AssetDictEntity> selectDictByName(String typeName) {
        return mapper.selectDictByName(typeName);
    }
}
