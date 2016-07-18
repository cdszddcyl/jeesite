<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>添加轮播</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
		.hidden{display:none}
		.show{display:block}
		.showred{
			display: inline-block;
			color: red;
		}
	</style>
	<link type="text/css" rel="stylesheet" href="/qst/css/my.css">
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					checkImg(form);
                    /* if (CKEDITOR.instances.content.getData()==""){
                        top.$.jBox.tip('请填写正文','warning');
                    }else{
                        loading('正在提交，请稍等...');
                        form.submit();
                    } */
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
						
				}
			});
		});
		 function addInfo(){
			 window.location.href="/a/carouselUploadForm";
    	}
    	function showList(){
    		window.location.href="/a/carouselList";
    	}
    	function checkImg(form){
    		$("#imgtip").hide();
    		$("#imgtiplabel").hide();
    		var img = $("#imagePreview li img"); 
    		if($(img).attr("src")==undefined){
    			$("#imgtip").show();
    			$("#imgtiplabel").show();
    			$("#imgtiplabel").html("必填信息");
    			//alert("请选择图片！");
    			return false;
    		}
    		var pic_real_width, pic_real_height;
    		$("<img/>").attr("src", $(img).attr("src"))
    		    .load(function() {
    		        pic_real_width = this.width;  
    		        pic_real_height = this.height;
    				console.log(pic_real_width+"--"+pic_real_height);
    				if(parseInt(pic_real_width)>=1366&&parseInt(pic_real_height)>=400){
    					 $(form).find(":submit").attr("disabled", true).attr("value", "提交中..."); 
    					 form.submit();
    				}else{
    					$("#imgtip").show();
    					$("#imgtiplabel").show();
    					$("#imgtiplabel").html("请选择1366*400尺寸或者更大尺寸");
    					//alert("请选择1024*236尺寸");
    				}
    		    });
    	}
    	
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="#" onclick="showList()">轮播列表</a></li>
		<li  class="active"><a href="javascript:void(0);" onclick="addInfo()">
		<c:choose>
			<c:when test="${url eq 'carouselSave' }">轮播添加</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${url eq 'updateCarousel' }">轮播修改</c:when>
		</c:choose>
		</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="carousel" action="/a/${url}" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<div class="control-group">
			<label class="control-label">缩略图:</label>
			<div class="controls ">
                <input type="hidden" id="image" name="picUrl" value="${carousel.picUrl}" class="required"/>
				<sys:ckfinder input="image" type="images" uploadPath="/qts/carousel" selectMultiple="false"/>
				<div class="showred">(1366*400)</div>
				<span id="imgtip" style="display:none">
					<span class="help-inline"></span>
					<label id="imgtiplabel" for="picUrl" class="error">必填信息</label>
				</span>
			</div>
		</div>
		
	<%--	<div class="control-group">
			<label class="control-label">展示的时间:</label>
			<div class="controls">
				<input id="createDate" name="showTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${carousel.showTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>--%>
		
		<div class="control-group">
			<label class="control-label">发布状态:</label>
			<div class="controls">
				<!-- 状态 0 发布 1 审核 2删除-->
				<form:radiobuttons path="status" items="${statusList}" itemLabel="value" itemValue="label" htmlEscape="false" class="required"/>
				<span class="help-inline"></span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">链接地址:</label>
			<div class="controls">
				<form:input path="linkUrl"  htmlEscape="false"   class="input-xxlarge"/>
			</div>
		</div>
		<%--
		<div class="control-group">
			<label class="control-label">正文:</label>
			<div class="controls">
				<form:textarea id="content" htmlEscape="true" path="content" rows="4"  class="input-xxlarge required"/>
				<sys:ckeditor replace="content" uploadPath="/qts/news" />
			</div>
		</div> --%>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="showList();"/>
		</div>
	</form:form>
</body>
</html>