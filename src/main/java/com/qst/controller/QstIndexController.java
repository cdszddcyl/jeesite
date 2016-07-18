package com.qst.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qst.service.QstIndexService;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 
 * @author StoneCai
 * @time 2016年05月12日09:01:56
 * 添加
 * QST 首页信息
 */
@Controller
@RequestMapping(value = "${qstPath}")
public class QstIndexController  extends BaseController{

	@Autowired
	private QstIndexService service;
	/**
	 * @authorStone.Cai
	 * @time 2016年05月12日09:07:40
	 * 添加
	 * 首页展示
	 */
	@RequestMapping("/index")
	public String showIndex(){
		service.index();
		return "qst/index";
	}
	
}
