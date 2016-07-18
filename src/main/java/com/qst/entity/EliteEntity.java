package com.qst.entity;

/**
 * 类功能描述：
 * 行业精英
 * @author wangfeng
 * @date 2016/05/17/09:59
 */

import javax.sql.rowset.serial.SerialStruct;
import java.util.Date;

/**
 * +--------------+--------------+------+-----+-------------------+-----------------------------+
 | Field        | Type         | Null | Key | Default           | Extra                       |
 +--------------+--------------+------+-----+-------------------+-----------------------------+
 | id           | int(20)      | NO   | PRI | NULL              | auto_increment              |
 | picture      | varchar(255) | YES  |     | NULL              |                             |
 | person_name  | varchar(255) | YES  |     | NULL              |                             |
 | depart       | varchar(255) | YES  |     | NULL              |                             |
 | position     | varchar(255) | YES  |     | NULL              |                             |
 | introduction | varchar(255) | YES  |     | NULL              |                             |
 | create_by    | varchar(255) | YES  |     | NULL              |                             |
 | create_date  | timestamp    | YES  |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
 | update_by    | varchar(255) | YES  |     | NULL              |                             |
 | updata_date  | datetime     | YES  |     | NULL              |                             |
 | remarks      | varchar(255) | YES  |     | NULL              |                             |
 | del_flag     | char(2)      | YES  |     | 0                 |                             |
 +--------------+--------------+------+-----+-------------------+-----------------------------+
 */
public class EliteEntity {
    private int id;
    private String picture;
    private String personName;
    private String depart;
    private String position;
    private String introduction;
    private String createBy;
    private Date createDate;
    private String updateBy;
    private Date updateDate;
    private String remarks;
    private char delFlag;

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

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getDepart() {
        return depart;
    }

    public void setDepart(String depart) {
        this.depart = depart;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
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
