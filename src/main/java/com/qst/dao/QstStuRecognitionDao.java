package com.qst.dao;

import com.qst.entity.StuRecognitionEntity;
import com.qst.entity.UniversityAccreditationEntity;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 学生认可
 * @author wangfeng
 * @date 2016/05/17/10:15
 */
@MyBatisDao
public interface QstStuRecognitionDao {
    public List<StuRecognitionEntity> getAllList();
    public List<StuRecognitionEntity> getList(Map<String,Object> params);
    public StuRecognitionEntity getModelById(int id);
    public int update(StuRecognitionEntity entity);
    public int delete(int id);
    public int save(StuRecognitionEntity entity);
    public List<StuRecognitionEntity> getPageList(int currentpage);
    public Long getCounts(Map<String, Object> params);
}
