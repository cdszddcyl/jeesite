package com.qst.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qst.dao.QstCarouselDao;
import com.qst.entity.CarouselEntity;
import com.thinkgem.jeesite.common.persistence.Page;

@Service("QstCarouselService")
public class QstCarouselService{
	@Autowired
	private QstCarouselDao dao;
	public List<CarouselEntity> getCarouselList(){
		List<CarouselEntity> list= dao.getCarouselList();
		return list;
	}
	public int saveCarousel(CarouselEntity carousel){
		int result= dao.saveCarousel(carousel);
		return result;
	}
	public int deleteCarousel(CarouselEntity carousel){
		int result= dao.deleteCarousel(carousel);
		return result;
	}
	public List<CarouselEntity> getCarouselList(Map<String, Object> params){
		List<CarouselEntity> list= dao.findListByPage(params);
		return list;
	}
	public Long getCarouselCounts(Map<String, Object> params){
		return dao.getCarouselCounts(params);
	}
	public CarouselEntity getCarouselById(CarouselEntity carousel){
		return dao.getCarouselById(carousel);
	}
}
