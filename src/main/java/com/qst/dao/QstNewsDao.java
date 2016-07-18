package com.qst.dao;

import java.util.List;
import java.util.Map;

import com.qst.entity.NewsEntity;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

@MyBatisDao
public interface QstNewsDao{


	public List<NewsEntity> getNewsPageList(Map<String, Object> params);

	// 分页总条数
	public Long getNewspageCounts(Map<String, Object> params);
	public NewsEntity getNewsById(NewsEntity news);
	public int saveNews(NewsEntity news);
	public int updateNews(NewsEntity news);
}
