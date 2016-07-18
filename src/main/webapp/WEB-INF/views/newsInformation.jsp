<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte  IE 9]> <html class="ie"> <!--<![endif]-->
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>新闻资讯</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <style type="text/css">
    	.td{min-width: 250px;}

    </style>
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
        <li class="active">新闻资讯</li>
        <a href="/qstViewpoint"><li >青软观点</li></a>
        <a href="/concern"><li>各界关怀</li></a>
    </ul>
    <div class="section-wrapper">
        <div class="location-now">
            <span>当前位置：</span>
            <a href="/">首页</a>
            <span>&gt;</span>
            <a href="javascript:void(0);">青软资讯</a>
            <span>&gt;</span>
            <span>新闻资讯</span>
        </div>
    </div>
    <div class="tab news">
        <div class="section-wrapper news-list">
          
        </div>
        <div class="pages">
                <div id="Pagination"></div>
        </div>
    </div>
</div>
<form method="post" action="/qst/news/newsDetail" id="form" >
	<input type="hidden"  name="ids"  id="newsId"/>
	<input type="hidden"  name="messageType" value="0"/>
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
//获得url参数信息
function getQueryString(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
function getNewsList(currentPage){
	var tit=decodeURIComponent(getQueryString("title"));
	if(tit=="null"||tit==null){
		tit="";
	}
	$("#seachNews").val(tit);
	$.ajax({
		type : "post",
		url : "/qst/news/getNewsList",
		data:"messageType=0&status=0&currentPage="+currentPage+"&pageSize=6&title="+tit,
		dataType:'json',
		success : function(data) {
			if(data.statusCode==200){
				var result=data.resData;
				var htmls='<ul class="clearfix">';
				$.each(result.list,function(index,item){
					htmls+='<li onclick="showNewsDetail('+item.id+')"><div class="td"><div class="imgBox"><img src="'+item.imgUrl+'" alt=""></div></div>';
					htmls+='<div class="td"><p class="news-time">'+new Date(item.showTime).Format("yyyy-MM-dd hh:mm:ss")+'</p>';
                    if(item.title.length>34){
                        htmls+=' <a href="javascript:void(0);" class="news-title">'+item.title.substring(0,32)+'...</a>';
                    }else{
                        htmls+=' <a href="javascript:void(0);" class="news-title">'+item.title+'</a>';
                    }
                    //htmls+=' <a href="javascript:void(0);" class="news-title">'+item.title+'</a>';

                   /* if(item.descContent.length>44){
                        htmls+='<p class="news-content">'+item.descContent.substring(0,42)+'...</p>';
                    }else{
                        htmls+='<p class="news-content">'+item.descContent+'</p>';
                    }*/
                    htmls+='<p class="news-content">'+item.descContent+'</p>';

					htmls+='</div></li>';
				});
				htmls+='</ul>';
				$(".news-list").html(htmls);
				//page
				 $("#Pagination").html("").pagination(parseInt(result.totalPage),{
			            current_page:parseInt(result.currentPage)-1,
                     prev_text:"<i></i>&lt;",
                     next_text:"&gt;<i></i>",
			            callback:function(new_current_page, containers){
			            	var pageNum=new_current_page+1;
			            	getNewsList(pageNum);
			            }
			        });
			}
			
		}			
	});
}

  $(document).ready(function () {
      getNewsList(1);
  });
  
</script>
</body>
</html>