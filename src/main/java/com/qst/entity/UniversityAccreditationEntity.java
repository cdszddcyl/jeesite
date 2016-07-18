package com.qst.entity;

import com.thinkgem.jeesite.common.persistence.Page;

import java.util.Date;

/**
 * 
 * @className CarouselEntity.java
 * @time   2016年5月16日14:04:04
 * @author wf
 *    高校认可
 */
public class UniversityAccreditationEntity {
	private int id;
	private String univerLogo;
	private String univerName;
	private String cooperationProfile;
	private String reply;
	private String author;
	private String create_by;
	private Date createDate;
	private String update_by;
	private Date updateDate;
	private String remarks;
	private char delFlag;
	protected Page<UniversityAccreditationEntity> page;

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Page<UniversityAccreditationEntity> getPage() {
		return page;
	}

	public void setPage(Page<UniversityAccreditationEntity> page) {
		this.page = page;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUniverLogo() {
		return univerLogo;
	}

	public void setUniverLogo(String univerLogo) {
		this.univerLogo = univerLogo;
	}

	public String getUniverName() {
		return univerName;
	}

	public void setUniverName(String univerName) {
		this.univerName = univerName;
	}

	public String getCooperationProfile() {
		return cooperationProfile;
	}

	public void setCooperationProfile(String cooperationProfile) {
		this.cooperationProfile = cooperationProfile;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getCreate_by() {
		return create_by;
	}

	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdate_by() {
		return update_by;
	}

	public void setUpdate_by(String update_by) {
		this.update_by = update_by;
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
