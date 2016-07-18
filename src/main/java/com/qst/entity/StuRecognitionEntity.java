package com.qst.entity;

/**
 * 类功能描述：
 * 学生认可
 * @author wangfeng
 * @date 2016/05/17/10:06
 */

import java.util.Date;

/**
 * +-------------+--------------+------+-----+-------------------+-----------------------------+
 | Field       | Type         | Null | Key | Default           | Extra                       |
 +-------------+--------------+------+-----+-------------------+-----------------------------+
 | id          | int(20)      | NO   | PRI | NULL              | auto_increment              |
 | content     | varchar(255) | YES  |     | NULL              |                             |
 | school      | varchar(255) | YES  |     | NULL              |                             |
 | create_by   | varchar(255) | YES  |     | NULL              |                             |
 | create_date | timestamp    | YES  |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
 | update_by   | varchar(255) | YES  |     | NULL              |                             |
 | updata_date | timestamp    | YES  |     | NULL              |                             |
 | remarks     | varchar(255) | YES  |     | NULL              |                             |
 | del_flag    | char(1)      | YES  |     | NULL              |                             |
 +-------------+--------------+------+-----+-------------------+-----------------------------+
 9 rows in set
 */
public class StuRecognitionEntity {
    private int id;
    private String content;
    private String school;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
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
