<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>${messageType }详情</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link type="text/css" rel="stylesheet" href="/qst/css/index.css"/>
    <script type="text/javascript" src="/qst/js/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="/qst/js/common.js"></script>
    <script type="text/javascript" src="/qst/js/my.js"></script>
    <style type="text/css">
    	.news-info a{text-decoration: underline;color: blue;}
    </style>
</head>
<body>
<%@ include  file="./hade.jsp"%>

<div class="mainWrapper newsWrapper">
    <div class="section-wrapper">
        <div class="location-now">
            <span>当前位置：</span>
            <a href="/qst/index">首页</a>
            <span>&gt;</span>
            <a href="/media">青软资讯</a>
            <span>&gt;</span>
            <span>${messageType }详情</span>
        </div>
        <div class="section-content news-info">
            
        </div>
    </div>
</div>
<%@ include  file="./footer.jsp"%>
</body>
<script type="text/javascript">
function getNewsDetail(){
	$.ajax({
		type : "post",
		url : "/qst/news/getNewsById",
		data:"id=${ids}",
		dataType:'json',
		success : function(data) {
			if(data.statusCode==200){
				var item=data.resData;
				var htmls='';
				htmls+='<h4>'+item.title+'</h4>';
				htmls+='<div class="news-time">'+new Date(item.showTime).Format("yyyy-MM-dd hh:mm:ss")+'</div>';
				htmls+=' <div class="news-content">'+item.content+'</div>';
				if(item.messageType=="3"&&item.linkUrl!=""&&item.linkUrl!="null"){
					htmls+='<div style="margin-top:20px;" class="news-content"><a href="'+item.linkUrl+'" target="_blank">媒体链接:'+item.linkUrl+'</a></div>';
				}
				$(".news-info").html(htmls);
			}
			
		}			
	});
}
$(function(){
	getNewsDetail();
    var timer = setInterval(function(){
        $("object,embed").attr("wmode","transparent");
        if($("object").find("param[name='wmode']").size() < 1){
            $("object").prepend('<param name="wmode" value="transparent">');
            clearInterval(timer);
        }
    },1000);
    setTimeout(function(){
        clearInterval(timer);
    },10000);
});
</script>
</html>