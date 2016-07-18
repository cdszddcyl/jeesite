package com.qst.controller;

import com.qst.dao.PageBean;
import com.qst.entity.UniversityAccreditationEntity;
import com.qst.service.QstUniversityAccreditationService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.utils.WiexinSignUtil;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import org.mozilla.javascript.Undefined;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类功能描述：
 * 高校合作后台
 * @author wangfeng
 * @date 2016/05/16/14:37
 */
@Controller
@RequestMapping("${adminPath}")
public class AQstUniversityAccreditationController  extends BaseController{
    @Autowired
    private QstUniversityAccreditationService service;
    /**
     * 高校认可列表页面
     * 2016年5月16日15:59:11
     * wf
     * @return
     */
    @RequestMapping("/universityAccreditation")
    public String universityAccreditation(){
        return "background/universityAccreditation";

    }
    /**
     * 高校认可所有列表（包括删除的）
     * 2016年5月16日15:59:11
     * wf
     * @return
     */
    @RequestMapping("/getAllList")
    public String getAllList(Integer currentpage,HttpServletRequest request, HttpServletResponse response,UniversityAccreditationEntity entity){
        try {
            if(currentpage == null){
                currentpage = 1;
            }
            List<UniversityAccreditationEntity> lists = service.getPageList((currentpage-1)*10);
            long count = service.getCounts(new HashMap<String, Object>());
            PageBean bean = new PageBean();
            bean.setPageSize(10);
            bean.setCurrentPage(currentpage);
            bean.setList(lists);
            bean.setTotalPage((int)Math.ceil((double) count/10));
            bean.setTotal(service.getCounts(new HashMap<String, Object>()));
            return resultSuccessData(response,"查询高校认可数据成功", bean);
        } catch (Exception e) {
            return resultErrorData(response,"查询高校认可数据异常", null);
        }

    }

    /**
     * 增加、修改页面
     * @return
     */
    @RequestMapping("/addAccreditation")
    public String addAccreditation(int id, HttpServletRequest request, HttpServletResponse response, ModelMap model){
        model.addAttribute("id",id);
        return "background/addAccreditation";

    }
    /**
     * 插入
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/saveyAccreditation",method = RequestMethod.POST)
    public String saveyAccreditation(HttpServletRequest request, HttpServletResponse response, @ModelAttribute UniversityAccreditationEntity entity){
        try {
            String id = entity.getId()+"";
            int data = 0;
            if(id.equals("0")||id==null&&id.equals("")&&id.equals("undefined")){
                data = service.saveyAccreditation(entity);
            }else{
                data = service.updateAccreditation(entity);
            }
            if(data>0){
                return resultSuccessData(response,"插入成功", "true");
            }else{
                return resultErrorData(response,"插入失败","false");
            }

        } catch (Exception e) {
            return resultErrorData(response,"高校插入异常", null);
        }

    }
    /**
     * 列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/updateAccreditation",method = RequestMethod.GET)
    public String updateAccreditation(HttpServletRequest request, HttpServletResponse response){
        //System.out.println( "------------------"+.size());
        try {
            //List<UniversityAccreditationEntity> entities = service.getUniversityAccreditationlList();
            return resultSuccessData(response,"查询高校认可数据成功", null);
        } catch (Exception e) {
            return resultErrorData(response,"查询高校认可数据", null);
        }

    }
    /**
     * 删除
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/deleteAccreditation",method = RequestMethod.GET)
    public String deleteAccreditation(HttpServletRequest request, HttpServletResponse response, @ModelAttribute UniversityAccreditationEntity entity){
        try {
            int data = service.deleteAccreditation(entity);
            if(data>0){
                return resultSuccessData(response,"删除成功", "true");
            }else{
                return resultErrorData(response,"删除失败","false");
            }
        } catch (Exception e) {
            return resultErrorData(response,"高校删除异常", null);
        }

    }

    @RequestMapping(value = "/show")
    public String getModuleById(UniversityAccreditationEntity entity,HttpServletResponse response){
        try {
            UniversityAccreditationEntity model = service.getModelById(entity);
            return resultSuccessData(response,"查询某高校认可数据成功", model);
        } catch (Exception e) {
            return resultErrorData(response,"查询某高校认可数据异常", null);
        }

    }
   /* @RequestMapping(value = "/getImg")
    public String getImg(String path,HttpServletResponse response){
        try {
            String save = new File(System.getProperty("user.dir")).getParent();
            BufferedReader br = new BufferedReader(new FileReader(save+"/"+path));
            String line = "";
            String result = "";
            while ((line=br.readLine())!= null){
                result +=line;
            }
            return result;
        } catch (Exception e) {
            return resultErrorData(response,"img fail", null);
        }

    }*/

    /**
     * 上传图片
     * @param request
     * @param response
     * @param file
     * @return
     */
    @RequestMapping(value = "/uploadImg")
    public String uploadImg(HttpServletRequest request,HttpServletResponse response,MultipartFile file){
        try {
            String save = request.getSession().getServletContext()
                    .getRealPath("/userfiles/1/images/qts/school");
            if(!new File(save).exists()){
                new File(save).mkdirs();
            }
            String newpathsub = new Date().getTime()+".png";
            String newpath = save+"/"+newpathsub;
            File path = new File(newpath);
            FileUtils.copyInputStreamToFile(file.getInputStream(),path);
            if(path.length()>1000000){
                return resultErrorData(response,"图片大小不能超过1M", null);
            }
            return resultSuccessData(response,"上传成功", "/userfiles/1/images/qts/school/"+newpathsub);
        } catch (IOException e) {
            return resultErrorData(response,"上传异常", null);
        }
    }


}
