package com.qst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qst.dao.QstIndexDao;
import com.qst.entity.IndexEntity;

@Service("qstIndexService")
@Transactional(readOnly = true)
public class QstIndexService  {
	
	@Autowired
	private QstIndexDao dao;
	public void index(){
		List<IndexEntity> list= dao.findIndex();
		System.out.println(list.size());
	}
}
