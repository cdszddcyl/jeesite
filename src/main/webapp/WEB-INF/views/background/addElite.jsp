<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="default"/>
    <title>轮播图列表</title>
    <style type="text/css">
        #imgfile{
            width: 150px;
            height: 150px;
            display: none;
            min-height: 0px;
        }
        .kuan{
            width: 350px;
            height: 100px;
        }
        .showred{
            display: inline-block;
            color: red;
        }
    </style>
    <link type="text/css" rel="stylesheet" href="../qst/css/my.css">
    <script type="text/javascript" src="../qst/js/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="../qst/js/jquery.form.js"></script>
    <script src="../qst/js/ajaxfileupload.js"></script>
    <script src="../qst/js/my.js"></script>
    <script type="text/javascript">
        function showList(){
            window.location.href = '/a/eliteList';
        }

        function submit(){
            var names = $('#personName').val();
            var profiles = $('#depart').val();
            var contents = $('#position').val();
            var introduction = $('#introduction').val();
            var imgfile = $('#imgfile')[0].src;
            if(!names||!profiles||!contents||!imgfile||!introduction){
               showmess("请先完善信息");
                return;
            }else{
                $("#picture").val(imgfile);
            }
            if(names.length>20){
                showmess("名字在20个字符以内");
                return;
            }
            if(profiles.length>80){
                showmess("部门在80个字符以内");
                return;
            }
            if(contents.length>20){
                showmess("职位在20个字符以内");
                return;
            }
            if(introduction.length>65){
                showmess("简介在65个字符以内");
                return;
            }

            var options = {
                url: "/a/addElite",
                success: function () {
                   showmess("成功");
                    window.location.href = '/a/eliteList';
                },
                fail:function () {
                   showmess("fail");
                }
            };
            $("#form1").ajaxSubmit(options);
            submit = function () {

            };
        }
        if('${id}'&&'${id}'!=0){
            $.ajax({
                type : "get",
                url : "/a/showElite",
                data:"id=${id}",
                dataType:'json',
                success : function(data) {
                    var result = data.resData;
                    if(result){
                        $('#personName').val(result.personName);
                        $('#depart').val(result.depart);
                        $('#position').val(result.position);
                        $('#introduction').val(result.introduction);
                        $('#imgfile').attr('src',result.picture).css('display','block');
                    }


                },
                fail:function(data){

                }
            })
        }
        function  upload(){
            var files = $("#files").val();
            if(!files){
                showmess('请先选择上传的图片');
                return;
            }
            var a = document.getElementById("files").files[0].size;
            if(a>1000000){
                showmess('图片大小不应超过1M');
                return;
            }
            console.log(a);
            var sub = files.substring(files.lastIndexOf('.')).toLowerCase();
            var ImageFileExtend = ".gif,.png,.jpg,.ico,.bmp,.jpeg";
            if(ImageFileExtend.indexOf(sub)>-1){

                $.ajaxFileUpload({
                    url : "/a/uploadImg",   //submit to UploadFileServlet
                    secureuri : false,
                    fileElementId : 'files',
                    dataType : 'text', //or json xml whatever you like~
                    success : function(data, status) {
                        var ss = data.replace(/<[^>]+>/g, "");
                        var rejson = JSON.parse(ss);
                        var result = rejson.resData;
                        if(JSON.parse(ss).statusCode == 500){
                            showmess(rejson.resMessage);
                            return;
                        }
                        $("#imgfile").attr('src',result).css('display','block');
                    }
                });
            }else{
                showmess('图片格式应为gif,png,jpg,ico,bmp,jpeg');
            }
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
            new TextCount().init({id:'personName'}).render();
            new TextCount().init({id:'depart'}).render();
            new TextCount().init({id:'position'}).render();
            new TextCount().init({id:'introduction'}).render();
        })



    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li ><a href="#" onclick="showList()">列表</a></li>
    <li class="active"><a href="#" onclick="addInfo()">添加</a></li>
</ul>
<jsp:include page="inc.jsp"></jsp:include>
   <form id="form1" action="/a/addElite" enctype="multipart/form-data" method="post"  class="form-horizontal">
       <div class="control-group">
           <label class="control-label">图片：</label>
           <div class="controls">
               <div class="showred">(210*305)</div>
               <input type="file" name="file" id="files"><div class="btn btn-primary" type="button" onclick="upload()" id="upload" value="上传">上传</div>
               <img id="imgfile" ><br>
           </div>
       </div>
       <div class="control-group">
           <label class="control-label">姓名：</label>
           <div class="controls">
               <input type="text" name="personName" id="personName"><br>
               <div class="showred"><20个字</div>
           </div>
       </div>
       <div class="control-group">
           <label class="control-label">部门：</label>
           <div class="controls">
               <textarea cols="330" rows="12" class="kuan"  name="depart" id="depart"></textarea><br>
               <%--<input type="text" name="depart" id="depart"><br>--%>
               <div class="showred"><80个字</div>
           </div>
       </div>
       <div class="control-group">
           <label class="control-label">职位：</label>
           <div class="controls">
               <input type="text" name="position" id="position"><br>
               <div class="showred"><20个字</div>
           </div>
       </div>
       <div class="control-group">
           <label class="control-label">简介：</label>
           <div class="controls">
               <textarea cols="330" rows="12" class="kuan"  name="introduction" id="introduction"></textarea><br>
               <div class="showred"><65个字</div>
           </div>
       </div>
       <input type="hidden" value="${id}" name="id">
       <input type="hidden" name="picture" id="picture">
       <div class="form-actions">
           <div id="submit" class="btn btn-primary" type="button" onclick="submit()" value="保 存">保存</div>
           <div id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)">返 回</div>
       </div>

   </form>
<div class="mask">
    <div class="mask-info">
        <span>请先完善信息</span>
    </div>
</div>
</body>

</html>