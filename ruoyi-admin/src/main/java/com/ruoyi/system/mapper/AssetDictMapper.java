package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.AssetDictEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 */
@Repository
public interface AssetDictMapper {

    List<AssetDictEntity> selectDictByName(@Param("typeName") String typeName);
}