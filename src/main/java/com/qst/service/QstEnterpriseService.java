package com.qst.service;

import com.qst.dao.QstEnterpriseDao;
import com.qst.entity.EnterpriseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 企业维护
 * @author wangfeng
 * @date 2016/05/18/11:27
 */
@Service
public class QstEnterpriseService {
    @Autowired
    private QstEnterpriseDao dao;
    public List<EnterpriseEntity> getAllList(){
        return dao.getAllList();
    }
    public List<EnterpriseEntity> getList(Map<String,Object> params){
        return dao.getList(params);
    }
    public EnterpriseEntity getModelById(int id){
        return dao.getModelById(id);
    }
    public int save(EnterpriseEntity entity){
        return dao.save(entity);
    }
    public int delete(int id){
        return dao.delete(id);
    }
    public int update(EnterpriseEntity entity){
        return dao.update(entity);
    }
    public List<EnterpriseEntity> getPageList(int currentpage){
        return dao.getPageList(currentpage);
    }
    public Long getCounts(Map<String, Object> params){
        return dao.getCounts(params);
    }

}
