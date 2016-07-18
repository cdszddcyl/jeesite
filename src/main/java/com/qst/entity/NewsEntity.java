package com.qst.entity;

import java.util.Date;


/**
 * @className NewsEntity.java
 * @time   2016-5-16 下午5:00:03
 * @author zuoqb
 * @todo   新闻实体
 */
public class NewsEntity{
	public String id;
	public String title;
	public String content;
	public String descContent;
	public String imgUrl;
	public String messageType;//资讯类型：0-新闻资讯 1-青鸟观点 2-各界关怀 3-媒体聚焦
	public String type;//当message_type为0时起作用新闻类型 0-重大新闻 1-公告新闻 2-普通新闻
	public String insertTime;
	public String shortTime;
	public String status="";
	public String insertUser;
	public Date insertDate;
	public String linkUrl;//媒体聚焦外链接
	private Date showTime;
	private  String showstr;
	private String guanhuai;

	public String getShortTime() {
		return shortTime;
	}
	public void setShortTime(String shortTime) {
		this.shortTime = shortTime;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertUser() {
		return insertUser;
	}
	public void setInsertUser(String insertUser) {
		this.insertUser = insertUser;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public String getDescContent() {
		return descContent;
	}
	public void setDescContent(String descContent) {
		this.descContent = descContent;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(String insertTime) {
		this.insertTime = insertTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public Date getShowTime() {
		return showTime;
	}

	public void setShowTime(Date showTime) {
		this.showTime = showTime;
	}

	public String getShowstr() {
		return showstr;
	}

	public void setShowstr(String showstr) {
		this.showstr = showstr;
	}

	public String getGuanhuai() {
		return guanhuai;
	}

	public void setGuanhuai(String guanhuai) {
		this.guanhuai = guanhuai;
	}
}
