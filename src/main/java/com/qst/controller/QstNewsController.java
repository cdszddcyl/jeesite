package com.qst.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.qst.dao.PageBean;
import com.qst.entity.NewsEntity;
import com.qst.service.QstNewsService;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 
 * @author StoneCai 2016-05-12 10:51:03 添加 新闻和动态都需要到这里获取
 * 
 */
@Controller
@RequestMapping("${qstPath}/news")
public class QstNewsController extends BaseController {
	@Autowired
	private QstNewsService service;

	/**
	 * @time 2016-5-16 下午5:21:24
	 * @author zuoqb
	 * @todo 根据类型进行新闻分页查询
	 * @param @param request
	 * @param @param response
	 * @param @return
	 * @return_type String
	 */
	@ResponseBody
	@RequestMapping(value = "/getNewsList", method = { RequestMethod.POST })
	public String getNewsList(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute NewsEntity news,
			@ModelAttribute PageBean page) {
		//news/getNewsList?type=0&pageSize=10&currentPage=1
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			// 添加查询条件
			params.put("messageType", news.getMessageType());
			params.put("type", news.getType());
			params.put("status", news.getStatus());
			params.put("title", news.getTitle());
			params.put("guanhuai", news.getGuanhuai());
			// 获取总条数
			Long totalCount = service.getNewspageCounts(params);
			// 压入查询参数:开始条数与结束条灵敏
			params.put("startIndex", page.getStartIndex());
			params.put("endIndex", page.getPageSize());
			List<NewsEntity> newsList = service.getNewsPageList(params);
			page.setList(newsList);
			page.setCurrentPage(Integer.valueOf(page.getCurrentPage()));
			int pageSize = page.getPageSize();
			long totalPage=0L;
			if(totalCount%pageSize==0){
				totalPage=totalCount/pageSize;
			}else{
				totalPage=totalCount/pageSize+1;
			}
			page.setTotalPage(Integer.valueOf(totalPage+""));
			page.setAllRow(Integer.valueOf(totalCount+""));
			/*// 获取总条数
			// Long totalCount = service.getNewspageCounts(params);
			// 压入查询参数:开始条数与结束条灵敏
			//System.out.println(page.getPageSize());
			params.put("startIndex", page.getStartIndex());
			params.put("endIndex", page.getEndIndex());
			// 查询集合
			List<NewsEntity> newsList = service.getNewsPageList(params);*/
			return resultSuccessData(response, "查询新闻成功", page);
		} catch (Exception e) {
			e.printStackTrace();
			return resultSuccessData(response, "查询新闻失败", null);
		}
	}
	/**
	 * @time   2016-5-16 下午6:34:39
	 * @author zuoqb
	 * @todo   根据id查询新闻
	 * @param  @param request
	 * @param  @param response
	 * @param  @return
	 * @return_type   String
	 */
	@ResponseBody
	@RequestMapping(value = "/getNewsById", method ={RequestMethod.POST})
	public String getNewsById(HttpServletRequest request, HttpServletResponse response, @ModelAttribute NewsEntity news){
		try {
			if("".equals(news.getId())){
				return resultSuccessData(response,"新闻主键不能为空!", null);
			}
			NewsEntity newsEntity=service.getNewsById(news);
			if(newsEntity==null){
				return resultSuccessData(response,"条记录已被删除！", newsEntity);
			}else{
				return resultSuccessData(response,"查询新闻成功信息", newsEntity);
			}
		} catch (Exception e) {
			return resultSuccessData(response,"查询新闻信息失败", null);
		}
	}
	/**
	 * @time   2016-5-18 下午12:59:02
	 * @author zuoqb
	 * @todo   新闻详情
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping("/newsDetail")
	public String showIndex(String ids,String messageType, HttpServletRequest request, HttpServletResponse response, ModelMap model){
		model.addAttribute("ids", ids);
		String type="";
		if("0".equals(messageType)){
			type="新闻资讯";
		}else if("1".equals(messageType)){
			type="青软观点";
		}else if("2".equals(messageType)){
			type="各界关怀";
		}else{
			type="媒体聚焦";
		}
		model.addAttribute("messageType", type);
		return "newsDetail";
	}
	@RequestMapping("/concernpage")
	public String concernpage(String titletype, Model model) {
		model.addAttribute("titletype", titletype);
		return "concern";
	}
}
