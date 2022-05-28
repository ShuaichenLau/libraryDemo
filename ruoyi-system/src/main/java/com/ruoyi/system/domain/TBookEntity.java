package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 图书信息管理对象 t_book
 * 
 * @author liusc
 * @date 2022-05-27
 */
public class TBookEntity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id主键 */
    private Long id;

    /*图书分类ID*/
    private Long bookTypeId;

    /*图书分类名称*/
    private String bookTypeName;

    /** 图书名称 */
    @Excel(name = "图书名称")
    private String name;

    /** 图书作者 */
    @Excel(name = "图书作者")
    private String author;

    /** 图书数量 */
    @Excel(name = "图书数量")
    private Long number;

    /** 出版社 */
    @Excel(name = "出版社")
    private String publish;

    /** 出版时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出版时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date pubTime;

    /** 简介 */
    @Excel(name = "简介")
    private String introduction;

    /** 标准书号 */
    @Excel(name = "标准书号")
    private String isbn;

    /** 语言 1中文 2英语 3其他语言 */
    @Excel(name = "语言 1中文 2英语 3其他语言")
    private Long language;

    /** 图书价格 */
    @Excel(name = "图书价格")
    private BigDecimal price;

    /** 图书分类 */
    @Excel(name = "图书分类")
    private Long bookType;

    /** 删除标识 0未删除1已删除 */
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
    public void setAuthor(String author) 
    {
        this.author = author;
    }

    public String getAuthor() 
    {
        return author;
    }
    public void setNumber(Long number) 
    {
        this.number = number;
    }

    public Long getNumber() 
    {
        return number;
    }
    public void setPublish(String publish) 
    {
        this.publish = publish;
    }

    public String getPublish() 
    {
        return publish;
    }
    public void setPubTime(Date pubTime) 
    {
        this.pubTime = pubTime;
    }

    public Date getPubTime() 
    {
        return pubTime;
    }
    public void setIntroduction(String introduction) 
    {
        this.introduction = introduction;
    }

    public String getIntroduction() 
    {
        return introduction;
    }
    public void setIsbn(String isbn) 
    {
        this.isbn = isbn;
    }

    public String getIsbn() 
    {
        return isbn;
    }
    public void setLanguage(Long language) 
    {
        this.language = language;
    }

    public Long getLanguage() 
    {
        return language;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setBookType(Long bookType) 
    {
        this.bookType = bookType;
    }

    public Long getBookType() 
    {
        return bookType;
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
            .append("author", getAuthor())
            .append("number", getNumber())
            .append("publish", getPublish())
            .append("pubTime", getPubTime())
            .append("introduction", getIntroduction())
            .append("isbn", getIsbn())
            .append("language", getLanguage())
            .append("price", getPrice())
            .append("bookType", getBookType())
            .append("delFlag", getDelFlag())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("updateUser", getUpdateUser())
            .append("updateTime", getUpdateTime())
            .append("ts", getTs())
            .toString();
    }
}
