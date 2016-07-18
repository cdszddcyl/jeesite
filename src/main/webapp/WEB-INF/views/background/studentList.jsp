<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>轮播图列表</title>
	<style type="text/css">
		.xianzhi{
			width:200px;
			word-break: break-all;
			word-wrap: break-word;
			white-space: pre-wrap;
		}
	</style>
	<link type="text/css" rel="stylesheet" href="../qst/css/my.css">
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
					url : "/a/getstudentList",
					data:"currentpage="+str,
					dataType:'json',
					success : function(data) {
						var resData = data.resData;
						var result = data.resData.list;
						var str = '';
						$.each(result,function(index, item) {
							var flag  = item.delFlag;
							str+='<tr >'+
									'<td class="logo"><img src="'+item.picture+'"/></td>'+
									'<td class="xianzhi">'+item.company+'</td>'+
									'<td>'+new Date(item.createDate).Format("yyyy-MM-dd hh:mm:ss")+'</td>';
							if(flag == 0){
								str+='<td>有效</td>';
								str+='<td>'+
										'<a class="golink" onclick="edit('+item.id+')" value="修改">修改</a>&nbsp;'+
										'<a class="golink" onclick="deletestr('+item.id+')" value="删除">删除</a>'+
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
			window.location.href = '/a/addStudent?id=0';
		}
		function edit(str){
			window.location.href = '/a/addStudent?id='+str;
		}
		function deletestr(str){
			delid = str;
			$('.layout').css('display','block');

		}
		function sure(str){
			$.ajax({
				type : "get",
				url : "/a/deleteStudent",
				data:"&id="+delid,
				dataType:'json',
				success : function(data) {
					showmess('删除成功');
					location.reload();
				}
			});
		}
		function showList(){
			window.location.href = '/a/studentList';
		}

	</script>
</head>
<body>
<ul class="nav nav-tabs">
	<li class="active"><a href="#" onclick="showList()">列表</a></li>
	<li><a href="#" onclick="addInfo()">添加</a></li>
</ul>
<div>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr class="lsp">
			<th>图片</th>
			<th>就职公司</th>
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