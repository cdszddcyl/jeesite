package com.qst.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qst.dao.PageBean;
import com.qst.entity.CarouselEntity;
import com.qst.entity.KeyValue;
import com.qst.entity.NewsEntity;
import com.qst.service.QstCarouselService;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 
 * @className QstCarouselController.java
 * @time 2016年5月16日14:34:18
 * @author zuoqb
 * @todo 后台轮播图列表
 */
@Controller
@RequestMapping("${adminPath}")
public class AQstCarouselController extends BaseController {
	@Autowired
	private QstCarouselService service;
	/**
	 * @time 2016-5-16 下午2:23:15
	 * @author zuoqb
	 * @todo 后台 轮播图页面
	 * @param @return
	 * @return_type String
	 */
	@RequestMapping("/carouselList")
	public String carouselList(HttpServletRequest request, HttpServletResponse response,@ModelAttribute PageBean pageBean,@ModelAttribute CarouselEntity carousel,Model model) {
				Map<String, Object> params = new HashMap<String, Object>();
				// 添加查询条件
				params.put("status", carousel.getStatus());
				// 获取总条数
				Long totalCount = service.getCarouselCounts(params);
				// 压入查询参数:开始条数与结束条灵敏
				params.put("startIndex", pageBean.getStartIndex());
				params.put("endIndex", pageBean.getPageSize());
				List<CarouselEntity> carouselList = service.getCarouselList(params);
				pageBean.setList(carouselList);
				pageBean.setCurrentPage(Integer.valueOf(pageBean.getCurrentPage()));
	    		int pageSize = pageBean.getPageSize();
	    		long totalPage=0L;
	    		if(totalCount%pageSize==0){
	    			totalPage=totalCount/pageSize;
	    		}else{
	    			totalPage=totalCount/pageSize+1;
	    		}
	    		pageBean.setTotalPage(Integer.valueOf(totalPage+""));
	    		pageBean.setAllRow(Integer.valueOf(totalCount+""));
	    		model.addAttribute("pageBean", pageBean);
	    		model.addAttribute("carousel", carousel);
				model.addAttribute("statusori",carousel.getStatus());
				return "background/carouselList";
	}

	/*@RequestMapping("/carouselUpload")
	public String carouselUpload() {
		return "background/carouselUpload";
	}*/

	/*@RequestMapping(value = "/upload")
	public String upload(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {
		String path = request.getSession().getServletContext()
				.getRealPath("/userfiles/1/images/qts/carousel");
		String fileName = file.getOriginalFilename();
		// String fileName = new Date().getTime()+".jpg";
		//System.out.println(path);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String paths=request.getContextPath() + "/userfiles/1/images/qts/carousel/"
				+ fileName;
		//model.addAttribute("fileUrl",paths);
		//保存数据
		CarouselEntity carousel=new CarouselEntity();
		carousel.setInsertTime(new Date());
		carousel.setUpdateTime(new Date());
		carousel.setInsertUser(UserUtils.getUser().getName());
		carousel.setPicUrl(paths);
		int result=service.saveCarousel(carousel);
		return "redirect:/a/carouselList";
	}*/
	/**
	 * @time   2016-5-19 上午8:56:50
	 * @author zuoqb
	 * @todo   进入新增轮播图页面
	 * @param  @param request
	 * @param  @param response
	 * @param  @param carousel
	 * @param  @param model
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping("/carouselUploadForm")
	public String carouselUploadForm(HttpServletRequest request, HttpServletResponse response,CarouselEntity carousel, Model model) {
		String url="";
		if(carousel!=null&&!"".equals(carousel.getId())&&!"null".equals(carousel.getId())&&carousel.getId()!=null){
			url="updateCarousel";
			carousel=service.getCarouselById(carousel);
			if(carousel!=null&&!"".equals(carousel.getInsertTimeStr())){
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try {
					carousel.setInsertTime(sdf.parse(carousel.getInsertTimeStr()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}else{
			url="carouselSave";
		}
		//状态 0 发布 1 审核 2删除
		List<KeyValue> statusList=new ArrayList<KeyValue>();
		String[] statusArr=new String[]{"发布","审核","无效"};
		for(int x=0;x<statusArr.length;x++){
			KeyValue v=new KeyValue();
			v.setLabel(x+"");
			v.setValue(statusArr[x]);
			statusList.add(v);
		}
		model.addAttribute("statusList", statusList);
		model.addAttribute("url", url);
		model.addAttribute("carousel", carousel);
		return "background/carouselForm";
	}
	/**
	 * @time   2016-5-19 上午8:57:07
	 * @author zuoqb
	 * @todo   新增轮播图
	 * @param  @param request
	 * @param  @param response
	 * @param  @param carousel
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping("/carouselSave")
	public String carouselSave(HttpServletRequest request, HttpServletResponse response,CarouselEntity carousel) {
		carousel.setInsertUser(UserUtils.getUser().getName());
		carousel.setInsertTime(new Date());
		carousel.setUpdateTime(new Date());
		service.saveCarousel(carousel);
		return "redirect:/a/carouselList";
	}
	/**
	 * @time   2016-5-16 下午1:17:26
	 * @author zuoqb
	 * @todo   根据轮播图id删除数据
	 * @param  @param request
	 * @param  @param response
	 * @param  @param carousel
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping(value = "/updateCarousel")
	public String updateCarousel(HttpServletRequest request, HttpServletResponse response,@ModelAttribute CarouselEntity carousel){
			carousel.setUpdateTime(new Date());
			carousel.setInsertTime(new Date());
			service.deleteCarousel(carousel);
			return "redirect:/a/carouselList";
	}
}
