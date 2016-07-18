package com.qst.entity;

/**
 * 类功能描述：
 *明星学员
 * @author wangfeng
 * @date 2016/05/17/10:03
 */

import java.lang.String;

import java.util.Date;

/**
 * +-------------+--------------+------+-----+-------------------+-----------------------------+
 | Field       | Type         | Null | Key | Default           | Extra                       |
 +-------------+--------------+------+-----+-------------------+-----------------------------+
 | id          | int(20)      | NO   | PRI | NULL              | auto_increment              |
 | picture     | varchar(255) | YES  |     | NULL              |                             |
 | company     | varchar(255) | YES  |     | NULL              |                             |
 | create_by   | varchar(255) | YES  |     | NULL              |                             |
 | create_date | timestamp    | YES  |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
 | update_by   | varchar(255) | YES  |     | NULL              |                             |
 | updata_date | timestamp    | YES  |     | NULL              |                             |
 | remarks     | varchar(255) | YES  |     | NULL              |                             |
 | del_flag    | char(1)      | YES  |     | 0                 |                             |
 +-------------+--------------+------+-----+-------------------+-----------------------------+
 9 rows in set
 */
public class StudentEntity {
    private int id;
    private  String picture;
    private String company;
    private String createBy;
    private Date createDate;
    private String updateBy;
    private Date updateDate;
    private String remarks;
    private  char delFlag;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public char getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(char delFlag) {
        this.delFlag = delFlag;
    }
}
