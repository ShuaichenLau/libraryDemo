package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 读者信息对象 t_reader_info
 * 
 * @author zhangyuan
 * @date 2022-06-04
 */
public class TReaderInfoEntity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 读者姓名 */
    @Excel(name = "读者姓名")
    private String name;

    /** 读者性别 */
    @Excel(name = "读者性别")
    private String sex;

    /** 读者生日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "读者生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birth;

    /** 读者地址 */
    @Excel(name = "读者地址")
    private String address;

    /** 读者电话 */
    @Excel(name = "读者电话")
    private String phone;

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
    public void setSex(String sex) 
    {
        this.sex = sex;
    }

    public String getSex() 
    {
        return sex;
    }
    public void setBirth(Date birth) 
    {
        this.birth = birth;
    }

    public Date getBirth() 
    {
        return birth;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("sex", getSex())
            .append("birth", getBirth())
            .append("address", getAddress())
            .append("phone", getPhone())
            .toString();
    }
}
