<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte  IE 9]> <html class="ie"> <!--<![endif]-->
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>各界关怀</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <style>
        .zhizhen:hover{
            cursor: pointer;
        }
    </style>
    <script type="text/javascript" src="/qst/js/common.js"></script>
</head>
<body>
<%@ include  file="./hade.jsp"%>
<div class="mainWrapper informationWrapper">
    <div class="main-title">
        <div class="title-box">
            <div class="title-name">
                <h4>青软资讯</h4>
                <p class="f14 pt10 pb5">推动教育与产业的无缝衔接</p>
                <p>TO BE THE BEST</p>
            </div>
            <div class="title-pic">
                <img src="/qst/images/information-top.png" alt="">
            </div>
        </div>
    </div>
    <ul class="tabs">
        <a href="/media"><li>媒体聚焦</li></a>
        <a href="/newsInformation"><li>新闻资讯</li></a>
        <a href="/qstViewpoint"><li >青软观点</li></a>
        <li class="active">各界关怀</li>
    </ul>
    <div class="section-wrapper">
        <div class="location-now">
            <span>当前位置：</span>
            <a href="/">首页</a>
            <span>&gt;</span>
            <a href="javascript:void(0);">青软资讯</a>
            <span>&gt;</span>
            <span>各界关怀</span>
        </div>
    </div>
    <div class="tab careFor">
        <div class="section-wrapper viewpoint-list">
        </div>
        <div class="pages">
                <div id="Pagination"></div>
        </div>
    </div>
</div>
<form method="post" action="/qst/news/newsDetail" id="form" >
	<input type="hidden"  name="ids"  id="newsId"/>
	<input type="hidden"  name="messageType" value="2"/>
</form>
<%@ include  file="./footer.jsp"%>
<script type="text/javascript" src="/qst/js/page/jquery.pagination.js"></script>
<script type="text/javascript" src="/qst/js/my.js"></script>
<link type="text/css" rel="stylesheet" href="/qst/css/page/pagination.css"/>
<script>
function showNewsDetail(ids){
	$("#newsId").val(ids);
	$("#form").submit();
}
function getNewsList(currentPage){
	$.ajax({
		type : "post",
		url : "/qst/news/getNewsList",
		data:"messageType=2&status=0&currentPage="+currentPage+"&pageSize=6"+"&guanhuai=${titletype}",
		dataType:'json',
		success : function(data) {
			if(data.statusCode==200){
				var result=data.resData;
				var htmls='<ul class="clearfix">';
				$.each(result.list,function(index,item){
					htmls+='<li class="zhizhen" onclick="showNewsDetail('+item.id+')"><div class="imgBox"><img src="'+item.imgUrl+'" alt=""></div>';
					htmls+='<p>'+new Date(item.showTime).Format("yyyy-MM-dd hh:mm:ss")+'</p>';
					htmls+='<a href="javascript:void(0);">'+item.descContent+'</a></li>';  
				});
				htmls+='</ul>';
				$(".viewpoint-list").html(htmls);
				 $("#Pagination").html("").pagination(parseInt(result.totalPage),{
		            current_page:parseInt(result.currentPage)-1,
		            callback:function(new_current_page, containers){
		            	currentPage=new_current_page+1;
		            	getNewsList(currentPage);
		            }
		        });
			}
		}			
	});
}
var currentPage=1;
 $(document).ready(function () {
     getNewsList(currentPage);
 });
</script>
</body>
</html>