package com.qst.service;

import com.qst.dao.QstEliteDao;
import com.qst.dao.QstStudentDao;
import com.qst.entity.EliteEntity;
import com.qst.entity.StudentEntity;
import com.qst.entity.UniversityAccreditationEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 行业精英
 * @author wangfeng
 * @date 2016/05/17/10:44
 */
@Service
public class QstEliteService {
    @Autowired
    private QstEliteDao dao;
    public List<EliteEntity> getAllList(){
        return dao.getAllList();
    }
    public List<EliteEntity> getList(Map<String,Object> params){
        return dao.getList(params);
    }
    public EliteEntity getModelById(int id){
        return dao.getModelById(id);
    }
    public int save(EliteEntity entity){
       return dao.save(entity);
    }
    public int delete(int id){
        return dao.delete(id);
    }
    public int update(EliteEntity entity){
        return dao.update(entity);
    }
    public List<EliteEntity> getPageList(int currentpage){
        return dao.getPageList(currentpage);
    }
    public Long getCounts(Map<String, Object> params){
        return dao.getCounts(params);
    }


}
