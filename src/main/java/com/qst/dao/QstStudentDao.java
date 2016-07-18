package com.qst.dao;

import com.qst.entity.StudentEntity;
import com.qst.entity.UniversityAccreditationEntity;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 明星学员
 * @author wangfeng
 * @date 2016/05/17/10:14
 */
@MyBatisDao
public interface QstStudentDao {
    public List<StudentEntity> getAllList();
    public List<StudentEntity> getList(Map<String,Object> params);
    public StudentEntity getModelById(int id);
    public int update(StudentEntity entity);
    public int delete(int id);
    public int save(StudentEntity entity);
    public List<StudentEntity> getPageList(int currentpage);
    public Long getCounts(Map<String, Object> params);
}
