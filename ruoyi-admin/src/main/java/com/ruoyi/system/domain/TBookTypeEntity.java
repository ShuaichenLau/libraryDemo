package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 图书分类管理对象 t_book_type
 * 
 * @author liusc
 * @date 2022-05-27
 */
public class TBookTypeEntity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id主键 */
    private Long id;

    /** 图书分类 */
    @Excel(name = "图书分类")
    private String name;

    /** 分类编码 */
    @Excel(name = "分类编码")
    private String typeCode;

    /** 删除标识0未删除1已删除 */
    private int delFlag;

    /** 创建人 */
    @Excel(name = "创建人")
    private Long createUser;

    /** 更新人 */
    @Excel(name = "更新人")
    private Long updateUser;

    /** 数据库时间戳 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "数据库时间戳", width = 30, dateFormat = "yyyy-MM-dd")
    private Date ts;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setTypeCode(String typeCode)
    {
        this.typeCode = typeCode;
    }

    public String getTypeCode()
    {
        return typeCode;
    }
    public void setDelFlag(int delFlag)
    {
        this.delFlag = delFlag;
    }

    public int getDelFlag()
    {
        return delFlag;
    }
    public void setCreateUser(Long createUser)
    {
        this.createUser = createUser;
    }

    public Long getCreateUser()
    {
        return createUser;
    }
    public void setUpdateUser(Long updateUser)
    {
        this.updateUser = updateUser;
    }

    public Long getUpdateUser()
    {
        return updateUser;
    }
    public void setTs(Date ts)
    {
        this.ts = ts;
    }

    public Date getTs()
    {
        return ts;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("typeCode", getTypeCode())
            .append("delFlag", getDelFlag())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("updateUser", getUpdateUser())
            .append("updateTime", getUpdateTime())
            .append("ts", getTs())
            .toString();
    }
}
