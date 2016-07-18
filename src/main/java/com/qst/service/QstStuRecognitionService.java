package com.qst.service;

import com.qst.dao.QstStuRecognitionDao;
import com.qst.entity.StuRecognitionEntity;
import com.qst.entity.UniversityAccreditationEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 学生认可
 * @author wangfeng
 * @date 2016/05/17/10:44
 */
@Service
public class QstStuRecognitionService {
    @Autowired
    private QstStuRecognitionDao dao;
    public List<StuRecognitionEntity> getAllList(){
        return dao.getAllList();
    }
    public List<StuRecognitionEntity> getList(Map<String,Object> params){
        return dao.getList(params);
    }
    public StuRecognitionEntity getModelById(int id){
        return dao.getModelById(id);
    }
    public int save(StuRecognitionEntity entity){
       return dao.save(entity);
    }
    public int delete(int id){
        return dao.delete(id);
    }
    public int update(StuRecognitionEntity entity){
        return dao.update(entity);
    }
    public List<StuRecognitionEntity> getPageList(int currentpage){
        return dao.getPageList(currentpage);
    }
    public Long getCounts(Map<String, Object> params){
        return dao.getCounts(params);
    }


}
