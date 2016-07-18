package com.qst.dao;

import com.qst.entity.EnterpriseEntity;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 企业维护
 * @author wangfeng
 * @date 2016/05/18/11:14
 */
@MyBatisDao
public interface QstEnterpriseDao {
    public List<EnterpriseEntity> getAllList();
    public List<EnterpriseEntity> getList(Map<String,Object> params);
    public EnterpriseEntity getModelById(int id);
    public int update(EnterpriseEntity entity);
    public int delete(int id);
    public int save(EnterpriseEntity entity);
    public List<EnterpriseEntity> getPageList(int currentpage);
    public Long getCounts(Map<String, Object> params);
}
