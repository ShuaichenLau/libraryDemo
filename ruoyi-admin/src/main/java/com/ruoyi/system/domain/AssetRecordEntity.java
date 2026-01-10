package com.ruoyi.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 *
 *   `id` bigint(20) NOT NULL AUTO_INCREMENT,
 *   `clustag` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
 *   `account_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
 *   `response_json` longtext COLLATE utf8mb4_unicode_520_ci,
 *   `create_time` datetime DEFAULT NULL,
 *
 */
public class AssetRecordEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * id主键
     */
    private Long id;

    /**
     * 环境信息
     */
    private String clustag;

    /**
     * 登录ID
     */
    private String accountId;

    /**
     * 返回获取记录JSON
     */
    private String responseJson;

    private String baggage;

    /**
     * 数据库时间戳
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBaggage() {
        return baggage;
    }

    public void setBaggage(String baggage) {
        this.baggage = baggage;
    }

    public String getClustag() {
        return clustag;
    }

    public void setClustag(String clustag) {
        this.clustag = clustag;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getResponseJson() {
        return responseJson;
    }

    public void setResponseJson(String responseJson) {
        this.responseJson = responseJson;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
