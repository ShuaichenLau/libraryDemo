package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.AssetRecordEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 */
@Repository
public interface AssetRecordMapper {

    List<AssetRecordEntity> selectList(AssetRecordEntity params);

    int insertJsonRecord(AssetRecordEntity params);

    int deleteByIds(String[] ids);

    List<AssetRecordEntity> getListByIds(String[] ids);
}