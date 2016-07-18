package com.qst.controller;

import groovy.util.logging.Log4j;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;

import com.qst.dao.PageBean;
import com.qst.entity.CarouselEntity;
import com.qst.entity.NewsEntity;
import com.qst.service.QstCarouselService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
/**
 * 
 * @className QstCarouselController.java
 * @time   2016-5-16 上午10:29:58
 * @author zuoqb
 * @todo   轮播图
 */
@Controller
@RequestMapping("${qstPath}")
public class QstCarouselController extends BaseController{
	@Autowired
	private QstCarouselService service;
	/**
	 * 
	 * @time   2016-5-16 上午10:31:45
	 * @author zuoqb
	 * @todo   获取轮播图集合
	 * @param  @return
	 * @return_type   String
	 */
	@ResponseBody
	@RequestMapping(value = "/getCarouselList", method ={RequestMethod.POST})
	public String getCarouselList(HttpServletRequest request, HttpServletResponse response,@ModelAttribute PageBean pageBean){
			Map<String, Object> params = new HashMap<String, Object>();
			// 添加查询条件
			params.put("status", "0");
			// 压入查询参数:开始条数与结束条灵敏
			//System.out.println(page.getPageSize());
			params.put("startIndex", pageBean.getStartIndex());
			params.put("endIndex", pageBean.getPageSize());
			List<CarouselEntity> carouselList = service.getCarouselList(params);
			return resultSuccessData(response,"查询轮播图数据成功", carouselList);
	}
	/**
	 * 
	 * @time   2016-5-16 上午11:25:01
	 * @author zuoqb
	 * @todo   新增轮播图
	 * @param  @param request
	 * @param  @param response
	 * @param  @return
	 * @return_type   String
	 */
	/*@ResponseBody
	@RequestMapping(value = "/saveCarousel", method ={RequestMethod.POST})
	public String saveCarousel(HttpServletRequest request, HttpServletResponse response,@ModelAttribute CarouselEntity carousel){
			if("".equals(carousel.getPicUrl())){
				return resultErrorData(response, "轮播图地址不能为空",null);
			}
			carousel.setInsertTime(new Date());
			carousel.setUpdateTime(new Date());
			int result=service.saveCarousel(carousel);
			if(result>0){
				return resultSuccessData(response,"插入轮播图成功", null);
			}else{
				return resultErrorData(response, "插入轮播图失败",null);
			}
	}*/
}
