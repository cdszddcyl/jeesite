package com.qst.dao;

import com.qst.entity.UniversityAccreditationEntity;
import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 高校认可
 * @author wangfeng
 * @date 2016/05/16/14:11
 */
@MyBatisDao
public interface QstUniversityAccreditationDao  {
    public List<UniversityAccreditationEntity> getUniversityAccreditationlList(Map<String,Object> params);
    public int saveyAccreditation(UniversityAccreditationEntity entity);
    public int updateAccreditation(UniversityAccreditationEntity entity);
    public int deleteAccreditation(UniversityAccreditationEntity entity);
    public List<UniversityAccreditationEntity> getAllList();
    public UniversityAccreditationEntity getModelById(UniversityAccreditationEntity entity);
    public List<UniversityAccreditationEntity> getPageList(int currentpage);
    public Long getCounts(Map<String, Object> params);
    public Long getNoDeleteCounts();
}
