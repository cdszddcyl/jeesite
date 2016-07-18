package com.qst.controller;

import com.qst.entity.StuRecognitionEntity;
import com.qst.entity.StudentEntity;
import com.qst.service.QstStuRecognitionService;
import com.qst.service.QstStudentService;
import com.thinkgem.jeesite.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 学生认可
 * @author wangfeng
 * @date 2016/05/16/14:37
 */
@Controller
@RequestMapping("${qstPath}")
public class QstStuRecognitionController extends BaseController{
    @Autowired
    private QstStuRecognitionService service;

    /**
     * 列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/getStuRecognitionList",method = RequestMethod.GET)
    public String getUniversityAccreditationlList(Integer currentpage, HttpServletRequest request, HttpServletResponse response){
        try {
            if(currentpage == null){
                currentpage =1;
            }
            Map<String,Object> params = new HashMap<String, Object>();
            params.put("start",(currentpage-1)*10);
            params.put("size",10);
            List<StuRecognitionEntity> entities = service.getList(params);
            return resultSuccessData(response,"查询高校认可数据成功", entities);
        } catch (Exception e) {
            return resultSuccessData(response,"查询高校认可数据异常", null);
        }

    }


}
