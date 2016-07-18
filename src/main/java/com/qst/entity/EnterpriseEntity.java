package com.qst.entity;

/**
 * 类功能描述：
 * 企业维护
 * @author wangfeng
 * @date 2016/05/18/11:09
 */

import java.util.Date;

/**
 * +-------------+--------------+------+-----+---------+-----------------------------+
 | Field       | Type         | Null | Key | Default | Extra                       |
 +-------------+--------------+------+-----+---------+-----------------------------+
 | id          | int(20)      | NO   | PRI | NULL    | auto_increment              |
 | logo        | varchar(255) | YES  |     | NULL    |                             |
 | enter_name  | varchar(255) | YES  |     | NULL    |                             |
 | profile     | varchar(255) | YES  |     | NULL    |                             |
 | judge       | varchar(255) | YES  |     | NULL    |                             |
 | create_by   | varchar(255) | YES  |     | NULL    |                             |
 | create_date | timestamp    | YES  |     | NULL    | on update CURRENT_TIMESTAMP |
 | update_by   | varchar(255) | YES  |     | NULL    |                             |
 | update_date | timestamp    | YES  |     | NULL    |                             |
 | remarks     | varchar(255) | YES  |     | NULL    |                             |
 | del_flag    | char(1)      | YES  |     | 0       |                             |
 +-------------+--------------+------+-----+---------+-----------------------------+
 */
public class EnterpriseEntity {
    private  int id;
    private String logo;
    private String enterName;
    private String enterpic;
    private String profile;
    private String judge;
    private String author;
    private String createBy;
    private Date createDate;
    private String updateBy;
    private Date updateDate;
    private String remarks;
    private char delFlag;

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getEnterName() {
        return enterName;
    }

    public void setEnterName(String enterName) {
        this.enterName = enterName;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getJudge() {
        return judge;
    }

    public void setJudge(String judge) {
        this.judge = judge;
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

    public String getEnterpic() {
        return enterpic;
    }

    public void setEnterpic(String enterpic) {
        this.enterpic = enterpic;
    }
}
