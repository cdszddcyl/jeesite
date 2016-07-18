package com.qst.service;

import com.qst.dao.QstUniversityAccreditationDao;
import com.qst.entity.UniversityAccreditationEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import org.aspectj.apache.bcel.generic.RET;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 *
 * @author wangfeng
 * @date 2016/05/16/14:39
 */
@Service("qstUniversityAccreditationService")
public class QstUniversityAccreditationService {
    @Autowired
    private QstUniversityAccreditationDao dao;
    public List<UniversityAccreditationEntity>  getUniversityAccreditationlList(Map<String,Object> params){
        return dao.getUniversityAccreditationlList(params);
    }
    public int saveyAccreditation(UniversityAccreditationEntity entity){
        return dao.saveyAccreditation(entity);
    }
    public int updateAccreditation(UniversityAccreditationEntity entity){
        return dao.updateAccreditation(entity);
    }
    public int deleteAccreditation(UniversityAccreditationEntity entity){
        return dao.deleteAccreditation(entity);
    }
    public List<UniversityAccreditationEntity> getAllList(){
        return dao.getAllList();
    }
    public UniversityAccreditationEntity getModelById(UniversityAccreditationEntity entity){
        return dao.getModelById(entity);
    }
    public List<UniversityAccreditationEntity> getPageList(int currentpage){
        return dao.getPageList(currentpage);
    }
    public Long getCounts(Map<String, Object> params){
        return dao.getCounts(params);
    }
    public Long getNoDeleteCounts(){
        return dao.getNoDeleteCounts();
    }





}
