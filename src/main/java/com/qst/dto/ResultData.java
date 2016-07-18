package com.qst.dto;

import java.io.Serializable;

/**
 * 
 * @author StoneCai
 * 2016年04月26日18:18:27
 * 添加
 * 返回结果数据容器
 *
 */
@SuppressWarnings("serial")
public class ResultData  implements Serializable{
	
	/**
	 * Stone.Cai
	 * 2016年04月26日18:22:26
	 * 添加
	 * 状态
	 */
	private Integer statusCode;
	/**
	 * Stone.Cai
	 * 2016年04月26日18:23:56
	 * 添加
	 * 返回消息（例如提示用户的消息）
	 */
	private String resMessage;
	/**
	 * Stone.Cai
	 * 2016年04月26日18:24:44
	 * 添加
	 * 额外是数据，例如标识东西等待
	 */
	private String tag;
	/**
	 * Stone.Cai
	 * 2016年04月26日18:25:28
	 * 添加
	 * 用户返回的数据
	 */
	private Object resData;
	public Integer getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(Integer statusCode) {
		this.statusCode = statusCode;
	}
	public String getResMessage() {
		return resMessage;
	}
	public void setResMessage(String resMessage) {
		this.resMessage = resMessage;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Object getResData() {
		return resData;
	}
	public void setResData(Object resData) {
		this.resData = resData;
	}
	public ResultData(Integer statusCode, String resMessage, String tag, Object resData) {
		this.statusCode = statusCode;
		this.resMessage = resMessage;
		this.tag = tag;
		this.resData = resData;
	}
	public ResultData(Integer statusCode, String resMessage, String tag) {
		this(statusCode, resMessage, tag, "");
	}
	public ResultData(Integer statusCode, String resMessage) {
		this(statusCode, resMessage,"");
	}
	
}
