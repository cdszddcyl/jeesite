package com.qst.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;

@Controller
@RequestMapping("/")
public class RouteController  extends BaseController {
	@RequestMapping("/{url}")
	public String index(@PathVariable("url") String url){
		if(StringUtils.isEmpty(url)){
			url="index";
		}
		return url;
	}
}
