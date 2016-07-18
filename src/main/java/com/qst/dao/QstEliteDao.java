package com.qst.dao;

import com.qst.entity.EliteEntity;
import com.qst.entity.UniversityAccreditationEntity;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 行业精英
 * @author wangfeng
 * @date 2016/05/17/10:14
 */
@MyBatisDao
public interface QstEliteDao {
    public List<EliteEntity> getAllList();
    public List<EliteEntity> getList(Map<String,Object> params);
    public int save(EliteEntity entity);
    public EliteEntity getModelById(int id);
    public int update(EliteEntity entity);
    public int delete(int id);
    public List<EliteEntity> getPageList(int currentpage);
    public Long getCounts(Map<String, Object> params);

}
