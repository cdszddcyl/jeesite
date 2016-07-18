package com.qst.controller;

import com.qst.dao.PageBean;
import com.qst.entity.UniversityAccreditationEntity;
import com.qst.service.QstUniversityAccreditationService;
import com.thinkgem.jeesite.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 高校认可
 * @author wangfeng
 * @date 2016/05/16/14:37
 */
@Controller("qstUniversityAccreditationController")
@RequestMapping("${qstPath}")
public class QstUniversityAccreditationController extends BaseController{
    @Autowired
    private QstUniversityAccreditationService service;

    /**
     * 列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/getUniversityAccreditationlList",method = RequestMethod.GET)
    public String getUniversityAccreditationlList(Integer currentpage,HttpServletRequest request, HttpServletResponse response){
        //System.out.println( "------------------"+.size());
        try {
            Map<String,Object> params = new HashMap<String, Object>();
            params.put("start",(currentpage-1)*5);
            params.put("size",5);
            List<UniversityAccreditationEntity> entities = service.getUniversityAccreditationlList(params);
           long count = service.getNoDeleteCounts();
            PageBean pageBean= new PageBean();
            pageBean.setList(entities);
            pageBean.setTotalPage((int)Math.ceil((double) count/5));
            pageBean.setCurrentPage(currentpage);
            pageBean.setTotal(count);
            return resultSuccessData(response,"查询高校认可数据成功", pageBean);
        } catch (Exception e) {
            return resultSuccessData(response,"查询高校认可数据异常", null);
        }

    }


}
