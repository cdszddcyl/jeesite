package com.qst.dao;

import java.util.List;

import com.qst.entity.IndexEntity;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

@MyBatisDao
public interface QstIndexDao {

	public List<IndexEntity> findIndex();
	
}
