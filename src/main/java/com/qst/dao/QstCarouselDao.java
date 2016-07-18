package com.qst.dao;

import java.util.List;
import java.util.Map;

import com.qst.entity.CarouselEntity;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

@MyBatisDao
public interface QstCarouselDao{
	public List<CarouselEntity> getCarouselList();
	public int saveCarousel(CarouselEntity carousel);
	public int deleteCarousel(CarouselEntity carousel);
	public List<CarouselEntity> findListByPage(Map<String, Object> params);
	public Long getCarouselCounts(Map<String, Object> params);
	public CarouselEntity getCarouselById(CarouselEntity carousel);
}
