<%@ page pageEncoding="utf-8"%>  
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>  
<html>  
<head>  
<meta charset="utf-8"> 
<meta name="decorator" content="default"/> 
<title>上传图片</title>  
<style type="text/css">
 ul li{cursor: pointer;}
</style>
 <script type="text/javascript">
  	 function addInfo(){
  		window.location.href="/a/carouselUpload";
  	}
  	function showList(){
  		window.location.href="/a/carouselList";
  	}
   </script>
</head>  
<body>  
<ul class="nav nav-tabs">
	<li ><a href="#" onclick="showList()">轮播列表</a></li>
	<li class="active"><a href="#" onclick="addInfo()">轮播添加</a></li>
</ul>
<form action="/a/upload" method="post" enctype="multipart/form-data">  
<input type="file" name="file" /> <input type="submit" value="上传图片" /></form>  
</body>  
</html>  