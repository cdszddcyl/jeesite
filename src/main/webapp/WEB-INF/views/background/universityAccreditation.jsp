<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>轮播图列表</title>
	<link type="text/css" rel="stylesheet" href="../qst/css/my.css">
	<style type="text/css">
			.selecteditem{
				color: red;
			}
		.xianzhi{
			width: 200px;
			overflow: hidden;
			word-break: break-all;
			word-wrap: break-word;
			white-space: pre-wrap;
		}
	</style>
	<script type="text/javascript" src="../qst/js/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="../qst/js/pageutil.js"></script>
	<script type="text/javascript" src="../qst/js/my.js"></script>
	<script type="text/javascript">
		var delid=0;
		$(function(){
			getList(1);
			function getList(str){
				$.ajax({
					type : "get",
					url : "/a/getAllList",
					data:"currentpage="+str,
					dataType:'json',
					success : function(data) {
						var resData =  data.resData;
						var result = resData.list;
						var str = '';

						$.each(result,function(index, item) {
							var flag  = item.delFlag;

							str+='<tr>'+
									'<td  class="logo"><img src="'+item.univerLogo+'"/></td>'+
									'<td><div style="width: 100px;word-break: break-all;overflow: hidden;">'+item.univerName+'</div></td>'+
									'<td ><div class="xianzhi">'+item.cooperationProfile+'</div></td>'+
									'<td><div class="xianzhi">'+item.reply+'</div></td>'+
									'<td ><div class="xianzhi">'+item.author+'</div></td>'+
									'<td>'+new Date(item.createDate).Format("yyyy-MM-dd hh:mm:ss")+'</td>';
							if(flag == 0){
								str+='<td>有效</td>';
								str+='<td>'+
										'<a class="golink"  type="button" onclick="edit('+item.id+')" value="修改">修改</a>'+
										'<a class="golink"  type="button" onclick="deletestr('+item.id+')" value="删除">删除</a>'+
										'</td>'+
										'</tr>';
							}else{
								str+='<td>无效</td>';
								str+='<td></td>';
							}


						});
						$('#bodyContent').empty().append(str);
						var option={currnetPage:resData.currentPage,totalCount:resData.total,showPage:resData.totalPage,onChangePage:function(page){
							getList(page);
						}};
						$(".pagination").showPage(option);
					}
				});
			}

		})
		function addInfo(){
			window.location.href = '/a/addAccreditation?id=0';
		}
		function edit(str){
			window.location.href = '/a/addAccreditation?id='+str;
		}
		function deletestr(str){
			delid = str;
			$('.layout').css('display','block');
		}
		function  sure(){
			cancel();
			$.ajax({
				type : "get",
				url : "/a/deleteAccreditation",
				data:"&id="+delid,
				dataType:'json',
				success : function(data) {
					showmess('删除成功');
					location.reload();
				}
			});
		}

		function showList(){
			window.location.href = '/a/universityAccreditation';
		}


	</script>
</head>
<body>
<ul class="nav nav-tabs">
	<li class="active"><a  onclick="showList()">列表</a></li>
	<li><a  onclick="addInfo()">添加</a></li>
</ul>

<div>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>logo</th>
			<th>名称</th>
			<th>高校简介</th>
			<th>回复内容</th>
			<th>回复人</th>
			<th>创建时间</th>
			<th>是否有效</th>
			<td>操        作</td>
		</tr>
		</thead>
		<tbody id="bodyContent">


		</tbody>
		<tfoot>
		</tfoot>
	</table>
	<div class="pagination"></div>
</div>

<div class="layout layout_iknow">
	<p>确认删除吗?</p>
	<button onClick="sure()">确认</button>
	<button onClick="cancel()">取消</button>
</div>

</body>

</html>