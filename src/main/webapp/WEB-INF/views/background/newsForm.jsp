<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>资讯管理</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
		.hidden{display:none}
		.show{display:block}
		.showred{
			display: inline-block;
			color: red;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
            if($("#link").val()){
                $('#linkBody').show();
                $('#url').attr("checked", true);
            }
			$("#title").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
                    if (CKEDITOR.instances.content.getData()==""){
                        top.$.jBox.tip('请填写正文','warning');
                    }else{
                       // loading('正在提交，请稍等...');
                       $(form).find(":submit").attr("disabled", true).attr("value", "提交中..."); 
                        form.submit();
                    }
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
    		window.location.href="/a/news/newsForm";
    	}
    	function showList(){
    		window.location.href="/a/news/newsListPage";
    	}
		$(function () {
			var TextCount = (function(){
				//私有方法，外面将访问不到
				var _bind = function(that){
					that.input.on('keyup',function(){
						that.render();
					});
				}

				var _getNum = function(that){
					return that.input.val().length;
				}

				var TextCountFun = function(config){

				}

				TextCountFun.prototype.init = function(config) {
					this.input = $("#"+config.id);
					this.id = config.id;
					_bind(this);

					return this;
				};

				TextCountFun.prototype.render = function() {
					var num = _getNum(this);
					var ss = $(this.input).next(".jcount");
					if (ss.length == 0) {
						var a = this.id+"jj";
						this.input.after('<span class="jcount"></span>');
					};

					ss.html(num+'个字');
				};
				//返回构造函数
				return TextCountFun;

			})();
			new TextCount().init({id:'miaoshu'}).render();

		})


	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li ><a href="#" onclick="showList()">资讯列表</a></li>
		<li class="active"><a href="#" onclick="addInfo()">
		<c:choose>
			<c:when test="${url eq 'saveNews' }">资讯添加</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${url eq 'updateNews' }">资讯修改</c:when>
		</c:choose>
		</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="news" action="/a/news/${url}" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<div class="control-group">
			<label class="control-label">标题:</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false"   class="input-xxlarge measure-input required"/>
				<%-- &nbsp;<label>颜色:</label>
				<form:select path="color" class="input-mini">
					<form:option value="" label="默认"/>
					<form:options items="${fns:getDictList('color')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select> --%>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">关键字:</label>
			<div class="controls">
				<form:input path="keyWords" htmlEscape="false" maxlength="200" class="input-xlarge"/>
				<span class="help-inline">多个关键字，用空格分隔。</span>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">描述:</label>
			<div class="controls">
				<form:textarea path="descContent" id="miaoshu" htmlEscape="false" rows="4" maxlength="40" class="input-xxlarge required"/>
				<div class="showred"><40个字</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">缩略图:</label>
			<div class="controls">
                <input type="hidden" id="image" name="imgUrl" value="${news.imgUrl}" />
				<sys:ckfinder input="image" type="thumb" uploadPath="/qts/news" selectMultiple="false"/>
				<div class="showred">(290*300)</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">正文:</label>
			<div class="controls">
				<form:textarea id="content" htmlEscape="true" path="content" rows="4"  class="input-xxlarge required"/>
				<sys:ckeditor replace="content" uploadPath="/qts/news" />
			</div>
		</div>
		<div class="control-group" >
			<label class="control-label">发布时间:</label>
			<div class="controls">
				<input id="createDate" name="showstr" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${news.showTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">资讯类型:</label>
			<div class="controls">
				<!-- 资讯类型：0-新闻资讯 1-青鸟观点 2-各界关怀 3-媒体聚焦-->
				<form:radiobuttons path="messageType" onclick="toggleDiv(this)" items="${messageTypeList}" itemLabel="value" itemValue="label" htmlEscape="false" class="required"/>
				<span class="help-inline"></span>
			</div>
		</div>
		 <div id="linkBody" class="control-group hidden">
            <label class="control-label">外部链接:</label>
            <div class="controls">
                <form:input id="mypaths" path="linkUrl" htmlEscape="false" maxlength="200" class="input-xlarge"/>
                <span class="help-inline">绝对或相对地址。</span>
            </div>
        </div>
        <div id="typeFlag" class="control-group hidden">
			<label class="control-label">新闻类型:</label>
			<div class="controls">
				<!-- 0-重大新闻 1-公告新闻 2-普通新闻 -->
				<form:radiobuttons path="type" items="${newsTypeList}" itemLabel="value" itemValue="label" htmlEscape="false" class="required"/>
				<%-- <form:radiobutton path="type" class="required" value="2"/>普通新闻
				<form:radiobutton path="type" value="1"/>公告新闻
				<form:radiobutton path="type" value="0"/>重大新闻 --%>
				<span class="help-inline"></span>
			</div>
		</div>
		<div id="guanhuaiFlag" class="control-group hidden">
			<label class="control-label">关怀类型:</label>
			<div class="controls">
				<!-- 0-重大新闻 1-公告新闻 2-普通新闻 -->
				<%--<form:radiobuttons path="type" items="${newsTypeList}" itemLabel="value" itemValue="label" htmlEscape="false" class="required"/>--%>
					 <form:radiobutton path="guanhuai" class="required" value="0"/>高校来访
                    <form:radiobutton path="guanhuai" value="1"/>政府来访
                    <form:radiobutton path="guanhuai" value="2"/>企业来访
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发布状态:</label>
			<div class="controls">
				<!-- 状态 0 发布 1 审核 2删除-->
				<form:radiobuttons path="status" items="${statusList}" itemLabel="value" itemValue="label" htmlEscape="false" class="required"/>
				<%-- <form:radiobutton path="status" class="required" value="0"/>发布
				<form:radiobutton path="status" value="1"/>审核
				<form:radiobutton path="status" value="2"/>删除 --%>
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="showList()"/>
		</div>
	</form:form>
	<script type="text/javascript">
		$(function(){
			if('${news.messageType}'=="0"||'${url}'=="saveNews"){
				showInfo();

			}
			if('${news.messageType}'=="3"||'${url}'=="saveNews"){
				$("#linkBody").addClass("show").removeClass("hidden");
			}
			if('${news.guanhuai}'){
				$("#guanhuaiFlag").addClass("show").removeClass("hidden");
			}
		});
		function showLinkInfo(){
			if($("#typeFlag").hasClass("hidden")){
				$("#typeFlag").addClass("show").removeClass("hidden");
			}else{
				$("#typeFlag").addClass("hidden").removeClass("show");
			}
		}
		function showInfo(){
			//console.log('${news.messageType}')
			if($("#typeFlag").hasClass("hidden")){
				$("#typeFlag").addClass("show").removeClass("hidden");
			}else{
				$("#typeFlag").addClass("hidden").removeClass("show");
			}
		}
		function toggleDiv(obj){
			$("#linkBody").addClass("hidden").removeClass("show");
			$("#mypaths").val('');
			if($(obj).val()=="0"){
				$("#typeFlag").addClass("show").removeClass("hidden");
			}else{
				$("#typeFlag").addClass("hidden").removeClass("show");
				if($(obj).val()=="3"){
					$("#linkBody").addClass("show").removeClass("hidden");
				}

			}
			if($(obj).val()=="2"){
				$("#guanhuaiFlag").addClass("show").removeClass("hidden");
			}else{
				$("#guanhuaiFlag").addClass("hidden").removeClass("show");
			}
		}
	</script>
</body>
</html>