package com.qst.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qst.dao.PageBean;
import com.qst.entity.KeyValue;
import com.qst.entity.NewsEntity;
import com.qst.service.QstNewsService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 
 * @author StoneCai
 * 2016-05-12 10:51:03
 * 添加
 * （管理员）新闻和动态都需要到这里维护和获取
 *
 */
@Controller
@RequestMapping("${adminPath}/news")
public class AQstNewsController {
	@Autowired
	private QstNewsService service;
	/**
	 * 2016年05月12日10:53:04
	 * 添加
	 * 跳转新闻列表
	 */
	@RequestMapping("/universityAccreditation")
	public String adminNewsListPage(){
		
		return "qst/news/adminNewsList";
	}
	/**
	 * @time   2016-5-17 下午3:10:41
	 * @author zuoqb
	 * @todo   xinwen
	 * @param  @param request
	 * @param  @param response
	 * @param  @param pageBean
	 * @param  @param news
	 * @param  @param model
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping(value = "/newsListPage")
	public String newsListPage(HttpServletRequest request, HttpServletResponse response,@ModelAttribute PageBean pageBean,@ModelAttribute NewsEntity news,Model model){
		Map<String, Object> params = new HashMap<String, Object>();
		// 添加查询条件
		params.put("status", news.getStatus());
		params.put("messageType", news.getMessageType());
		params.put("type", news.getType());
		params.put("title", news.getTitle());
		// 获取总条数
		Long totalCount = service.getNewspageCounts(params);
		// 压入查询参数:开始条数与结束条灵敏
		params.put("startIndex", pageBean.getStartIndex());
		params.put("endIndex", pageBean.getPageSize());
		List<NewsEntity> newsList = service.getNewsPageList(params);
		pageBean.setList(newsList);
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
		model.addAttribute("news", news);
		return "background/newsList";
	}
	/**
	 * @time   2016-5-17 下午4:50:07
	 * @author zuoqb
	 * @todo   进入修改 新增新闻页面
	 * @param  @param request
	 * @param  @param response
	 * @param  @param news
	 * @param  @param model
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping("/newsForm")
	public String newsForm(HttpServletRequest request, HttpServletResponse response,NewsEntity news, Model model){
		String url="";
		if(news!=null&&!"".equals(news.getId())&&!"null".equals(news.getId())&&news.getId()!=null){
			url="updateNews";
			news=service.getNewsById(news);
			if(news!=null&&!"".equals(news.getInsertTime())){
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try {
					news.setInsertDate(sdf.parse(news.getInsertTime()));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}else{
			url="saveNews";
		}
		news.setInsertTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		//资讯类型
		List<KeyValue> messageTypeList=new ArrayList<KeyValue>();
		String[] messageTypeArr=new String[]{"新闻资讯","青软观点","各界关怀","媒体聚焦"};
		for(int x=0;x<messageTypeArr.length;x++){
			KeyValue v=new KeyValue();
			v.setLabel(x+"");
			v.setValue(messageTypeArr[x]);
			messageTypeList.add(v);
		}
		model.addAttribute("messageTypeList", messageTypeList);
		//新闻类型 0-重大新闻 1-公告新闻 2-普通新闻
		List<KeyValue> newsTypeList=new ArrayList<KeyValue>();
		String[] newsTypeArr=new String[]{"重大新闻","公告新闻","普通新闻"};
		for(int x=0;x<newsTypeArr.length;x++){
			KeyValue v=new KeyValue();
			v.setLabel(x+"");
			v.setValue(newsTypeArr[x]);
			newsTypeList.add(v);
		}
		model.addAttribute("newsTypeList", newsTypeList);
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
		
		
		model.addAttribute("news", news);
		model.addAttribute("url", url);
		return "background/newsForm";
	}
	/**
	 * @time   2016-5-17 下午4:50:29
	 * @author zuoqb
	 * @todo   保存新闻
	 * @param  @param news
	 * @param  @param model
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping("/saveNews")
	public String saveNews(NewsEntity news, Model model) {
		news.setInsertUser(UserUtils.getUser().getName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		news.setInsertTime(sdf.format(new Date()));
		try {
			news.setShowTime(sdf.parse(news.getShowstr()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		service.saveNews(news);
		return "redirect:/a/news/newsListPage";
	}
	/**
	 * @time   2016-5-17 下午4:50:29
	 * @author zuoqb
	 * @todo   更新资讯
	 * @param  @param news
	 * @param  @param model
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping("/updateNews")
	public String updateNews(NewsEntity news, Model model) {
		news.setInsertUser(UserUtils.getUser().getName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if("".equals(news.getInsertTime())){
			news.setInsertTime(sdf.format(new Date()));
		}
		news.setInsertTime(sdf.format(new Date()));
		try {
			news.setShowTime(sdf.parse(news.getShowstr()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		service.updateNews(news);
		return "redirect:/a/news/newsListPage";
	}

}
