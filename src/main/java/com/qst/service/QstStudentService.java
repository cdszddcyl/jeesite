package com.qst.service;

import com.qst.dao.QstStuRecognitionDao;
import com.qst.dao.QstStudentDao;
import com.qst.entity.StuRecognitionEntity;
import com.qst.entity.StudentEntity;
import com.qst.entity.UniversityAccreditationEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 明星学员
 * @author wangfeng
 * @date 2016/05/17/10:44
 */
@Service
public class QstStudentService {
    @Autowired
    private QstStudentDao dao;
    public List<StudentEntity> getAllList(){
        return dao.getAllList();
    }
    public List<StudentEntity> getList(Map<String,Object> params){
        return dao.getList(params);
    }
    public StudentEntity getModelById(int id){
        return dao.getModelById(id);
    }
    public int save(StudentEntity entity){
       return dao.save(entity);
    }
    public int delete(int id){
        return dao.delete(id);
    }
    public int update(StudentEntity entity){
        return dao.update(entity);
    }
    public List<StudentEntity> getPageList(int currentpage){
        return dao.getPageList(currentpage);
    }
    public Long getCounts(Map<String, Object> params){
        return dao.getCounts(params);
    }


}
