<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="default"/>
    <link rel="shortcut icon" href=""/>
    <title>轮播图列表</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <style type="text/css">
     	.picId{width:135px;height:40px;}
     	.dis_none{display: none;}
     	.layout_add{position: fixed;top: 10%; left: 10%;border-radius: 10px;text-align: center;line-height: 40px;font-weight: bold;z-index: 19;}
     	.layout_fenxiang{display:none;z-index:20;position:absolute;top:30%;-webkit-transform:translate(-125px,-125px);transform:translate(-125px,-125px);}
        .layout_fenxiang img{width:100%;height:100%;}
        .mask{position: absolute;height:100%;background-color: rgba(0,0,0,.4);top: 0px;}
        
         .layout_iknow{display:none;position:fixed;top:30%;left:40%;border-radius: 10px;text-align: center;width:25%;z-index: 10;background-color: #EAEAEA;display: none;height:150px;}
         .layout_iknow p{padding:20px 5px;border-bottom: 1px solid #F1F1F1;font-size: 16px;height:40%;margin:0}
         .layout_iknow button{display: inline;height:20%;text-align: center;color:#48AEFF;font-weight: bold;width:65px;margin-left:15px;}
          .layout_iknow2{position:fixed;top:40%;left:50%;border-radius: 10px;text-align: center;width:25%;z-index: 10;background-color: #EAEAEA;display: none;height:150px;}
         .layout_iknow2 p{padding:20px 5px;border-bottom: 1px solid #F1F1F1;font-size: 16px;height:40%;}
         .layout_iknow2 button{display: inline;height:20%;text-align: center;color:#48AEFF;font-weight: bold;width:65px;margin-left:15px;}
         .tab-content{width:100%;}
         .tab-content table{border-collapse: collapse;width: 100%;}
         .tab-content td,.tab-content th{border:1px solid #ccc;text-align:center;}
         .tab-content table td img{width:200px;height:150px;}
         .thispage_btn{padding:5px 10px;margin-left:5px;border:none;cursor: pointer;border: 1px solid #ccc;color:#fff;background:#2fa4e7;}
         .add_data{overflow:hidden;margin-bottom:10px;}
         .add_data .thispage_btn{float:right;text-decoration: none;}
         ul li{cursor: pointer;}
         a{cursor: pointer;}
     </style>
<script type="text/javascript" src="/qst/js/jquery.min.js"></script>
<script type="text/javascript" src="/qst/js/picbox.js"></script>
<link rel="stylesheet" type="text/css" href="/qst/css/picbox.css" media="screen"/>
<script type="text/javascript" src="/qst/js/pageutil.js"></script>
     <script type="text/javascript">
     	var ids="";
 		var cuIndex=0;
    	 function addInfo(obj){
    		//window.location.href="/a/carouselUpload";
    		 if(""==obj){
    			 window.location.href="/a/carouselUploadForm";
    		 }else{
    			 window.location.href="/a/carouselUploadForm?id="+obj;
    		 }
    	}
    	function showList(){
    		window.location.href="/a/carouselList";
    	}
    	function showMask(){
    		$(".layout_iknow").show();
    	}
    	function cancle(){
    		$(".layout_iknow").hide();
    		$(".mask").hide();
    	}
    	function deleteInfo(obj,index){
    		ids=obj;
    		$(".layout_iknow").show();
    	}
    	function showImage(obj){
	 		$(obj).find(".mineTag").trigger("click");
	 	}

    	function confirmDelete(){
    		cancle();
    		$.ajax({
    			type : "post",
    			url : "/a/deleteCarousel",
    			data:"id="+ids+"&status=2",
    			dataType:'json',
    			success : function(data) {
    				if(data.statusCode==200){
    					var list=$("#bodyContent tr");
    					$.each(list,function(ind,it){
    						if(ind==cuIndex){
    							$(it).remove();
    						}
    					});
    				}else{
    					alert(data.resMessage);
    				}
    			}	
    		});
    	}
     </script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="#" onclick="showList()">轮播列表</a></li>
		<li><a href="#" onclick="addInfo('')">轮播添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="carousel" action="/a/carouselList" method="post" class="breadcrumb form-search">
		<input type="hidden"  name="currentPage"  value="${pageBean.currentPage}"/>
		<input type="hidden"  name="pageSize"  value="${pageBean.pageSize}"/>
		<label>状态：
		<form:radiobutton  path="status" value="0"/>发布
		<form:radiobutton path="status" value="1"/>审核
		<form:radiobutton path="status" value="2"/>无效</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<div class="content-box-content">
					<!-- <div class="add_data"><a class="thispage_btn" onclick="addInfo()">添加</a></div> -->
					
					<div class="tab-content default-tab" id="tab1">
						<table id="contentTable" class="table table-striped table-bordered table-condensed">							
							<thead>
								<tr class="lsp">
								   <th>维  护  人</th>
								   <th>图        片</th>
								   <th>插入时间</th>
								   <th>状	态</th>
								   <th>操        作</th>
								</tr>
							</thead>						 
							<tbody id="bodyContent">
								<c:forEach items="${pageBean.list}" var="comment" varStatus="status">
									<tr>
										<td>${comment.insertUser}</td>
									    <td>
									     <c:choose>
										   	<c:when test="${comment.picUrl!='' }">
										   	<span class="hasImg" onclick="showImage(this)">
											   	<a>点击查看大图</a>
											   	<a class="mineTag" style="display:none;" href="${comment.picUrl}" rel="lightbox-group"><img src="${comment.picUrl}" class="p1" style="max-width:214px;max-height:214px;"/></a>
										   	</span>
										   	</c:when>
										   	<c:otherwise>
										   	暂无图片
										   	</c:otherwise>
									   </c:choose>
									    
									    
									    </td>
									   <td style="width:200px;">${comment.updateTimeStr}</td>
									   <td>
									   	 <c:choose>
										   	<c:when test="${comment.status eq 0 }">
										   		发布
										   	</c:when>
										   	<c:when test="${comment.status eq 1 }">
										   		审核
										   	</c:when>
										   	<c:otherwise>
										   		无效
										   	</c:otherwise>
									   </c:choose>
									   </td>
									   <td>
									  	<%-- <a onclick="deleteInfo('${comment.id}','${ status.index}')">编辑</a> --%>
									  	<a onclick="addInfo('${comment.id}')">编辑</a>
									    </td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
							</tfoot>  
						</table>
						<div class="pagination"></div>
					</div>
				</div>		
				 <div class="layout layout_iknow">
			        <p>确认删除吗?</p>
			        <button onClick="confirmDelete()">确认</button>
			         <button onClick="cancle()">取消</button>
			    </div>
			    <form method="post" action="/a/carouselList" id="form" >
					<input type="hidden" id="currentPage" name="currentPage"  value="${pageBean.currentPage}"/>
					<input type="hidden" id="pageSize" name="pageSize"  value="${pageBean.pageSize}"/>
					<input type="hidden" id="status2" name="status" value="${statusori}" />
				</form>
				 <script type="text/javascript">
				 $(function(){
				 		var option={currnetPage:'${pageBean.currentPage}',totalCount:'${pageBean.allRow}',onChangePage:function(page){
				 			$("#currentPage").val(page);
				 			$("#form").submit();
						}};
						$(".pagination").showPage(option);
				 	});
     			</script>
</body>
</html>