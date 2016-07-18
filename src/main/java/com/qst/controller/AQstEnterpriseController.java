package com.qst.controller;

import com.qst.dao.PageBean;
import com.qst.dao.QstEnterpriseDao;
import com.qst.entity.EnterpriseEntity;
import com.qst.entity.StudentEntity;
import com.qst.service.QstEnterpriseService;
import com.thinkgem.jeesite.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

/**
 * 类功能描述：
 * 企业维护
 * @author wangfeng
 * @date 2016/05/17/10:53
 */
@Controller
@RequestMapping("${adminPath}")
public class AQstEnterpriseController extends BaseController {
    @Autowired
    private QstEnterpriseService service;

    /**
     * 列表页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/enterpriseList")
    public String enterpriseList(HttpServletRequest request, HttpServletResponse response){
        return "background/enterpriseList";
    }

    /**
     * 获取所有列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/getEnterpriseList")
    public String getEnterpriseList(Integer currentpage,HttpServletRequest request, HttpServletResponse response){
        try {
            if(currentpage == null){
                currentpage = 1;
            }
            List<EnterpriseEntity> lists = service.getPageList((currentpage-1)*10);
            long count = service.getCounts(new HashMap<String, Object>());
            PageBean bean = new PageBean();
            bean.setPageSize(10);
            bean.setCurrentPage(currentpage);
            bean.setList(lists);
            bean.setTotalPage((int)Math.ceil((double) count/10));
            bean.setTotal(service.getCounts(new HashMap<String, Object>()));
            return resultSuccessData(response,"查询学生认可数据成功", bean);
        } catch (Exception e) {
            return resultErrorData(response,"查询学生认可数据异常", null);
        }
    }

    /**
     * 添加、编辑页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/addEnterprise",method = RequestMethod.GET)
    public String addEnterprise(int id,ModelMap model){
        model.addAttribute("id",id);
        return "background/addEnterprise";
    }

    /**
     * 添加、编辑的方法
     */
    @RequestMapping(value = "/addEnterprise",method = RequestMethod.POST)
    public String addEnterprise(HttpServletRequest request,HttpServletResponse response,EnterpriseEntity entity){
        try {
           /* //String save = new File(System.getProperty("user.dir")).getParent();
            String save = request.getSession().getServletContext()
                    .getRealPath("upload");
            String newpathsub = new Date().getTime()+".png";
            String newpath = save+"/"+newpathsub;
            File path = new File(newpath);
            FileUtils.copyInputStreamToFile(file.getInputStream(),path);
            //entity.setPicture("/upload/"+newpathsub);*/
            String id = entity.getId()+"";
            int data = 0;
            if(id.equals("0")||id==null&&id.equals("")&&id.equals("undefined")){
                data = service.save(entity);
            }else{
                data = service.update(entity);
            }
            if(data>0){
                return resultSuccessData(response,"插入成功", "true");
            }else{
                return resultErrorData(response,"插入失败","false");
            }

        } catch (Exception e) {
            return resultErrorData(response,"学生认可插入异常", null);
        }
    }

    /**
     * 查询某条记录
     * @param entity
     * @param response
     * @return
     */
    @RequestMapping(value = "/showEnterprise")
    public String showEntetprise(EnterpriseEntity entity, HttpServletResponse response){
        try {
            EnterpriseEntity model = service.getModelById(entity.getId());
            return resultSuccessData(response,"查询某学生认可数据成功", model);
        } catch (Exception e) {
            return resultErrorData(response,"查询某学生认可数据异常", null);
        }

    }
    /**
     * 删除
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/deleteEnterprise",method = RequestMethod.GET)
    public String deleteEntetprise(HttpServletRequest request, HttpServletResponse response, @ModelAttribute StudentEntity entity){
        List<EnterpriseEntity> entities = service.getAllList();
        try {
            int data = service.delete(entity.getId());
            if(data>0){
                return resultSuccessData(response,"删除成功", "true");
            }else{
                return resultErrorData(response,"删除失败","false");
            }
        } catch (Exception e) {
            return resultErrorData(response,"学生认可删除异常", null);
        }

    }

}
