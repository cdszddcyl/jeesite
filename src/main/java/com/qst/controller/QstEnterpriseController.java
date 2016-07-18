package com.qst.controller;

import com.qst.entity.EnterpriseEntity;
import com.qst.entity.StudentEntity;
import com.qst.service.QstEnterpriseService;
import com.qst.service.QstStudentService;
import com.thinkgem.jeesite.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 企业合作
 * @author wangfeng
 * @date 2016/05/16/14:37
 */
@Controller
@RequestMapping("${qstPath}")
public class QstEnterpriseController extends BaseController{
    @Autowired
    private QstEnterpriseService service;

    /**
     * 列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/getEnterpriseList",method = RequestMethod.GET)
    public String getUniversityAccreditationlList(HttpServletRequest request, HttpServletResponse response){
        try {
            Map<String,Object> params = new HashMap<String, Object>();
            params.put("size",6);
            List<EnterpriseEntity> entities = service.getList(new HashMap<String, Object>());
            return resultSuccessData(response,"查询高校认可数据成功", entities);
        } catch (Exception e) {
            return resultSuccessData(response,"查询高校认可数据异常", null);
        }

    }


}
