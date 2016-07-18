package com.qst.controller;

import com.qst.entity.EliteEntity;
import com.qst.entity.UniversityAccreditationEntity;
import com.qst.service.QstEliteService;
import com.qst.service.QstUniversityAccreditationService;
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
 * 行业精英
 * @author wangfeng
 * @date 2016/05/16/14:37
 */
@Controller
@RequestMapping("${qstPath}")
public class QstEliteController extends BaseController{
    @Autowired
    private QstEliteService service;

    /**
     * 列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/getElitelList",method = RequestMethod.GET)
    public String getUniversityAccreditationlList(HttpServletRequest request, HttpServletResponse response){
        try {
            Map<String,Object> params = new HashMap<String, Object>();
            params.put("size",5);
            List<EliteEntity> entities = service.getList(new HashMap<String, Object>());
            return resultSuccessData(response,"查询高校认可数据成功", entities);
        } catch (Exception e) {
            return resultSuccessData(response,"查询高校认可数据异常", null);
        }

    }


}
