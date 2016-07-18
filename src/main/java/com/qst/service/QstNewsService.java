package com.qst.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qst.dao.QstNewsDao;
import com.qst.entity.NewsEntity;

@Service("QstNewsService")
public class QstNewsService{
	@Autowired
	private QstNewsDao dao;
	public List<NewsEntity> getNewsPageList(Map<String, Object> params){
		return dao.getNewsPageList(params);
	}
	public Long getNewspageCounts(Map<String, Object> params){
		return dao.getNewspageCounts(params);
	}
	public NewsEntity getNewsById(NewsEntity news){
		return dao.getNewsById(news);
	}
	public int saveNews(NewsEntity news){
		return dao.saveNews(news);
	}
	public int updateNews(NewsEntity news){
		return dao.updateNews(news);
	}
}
