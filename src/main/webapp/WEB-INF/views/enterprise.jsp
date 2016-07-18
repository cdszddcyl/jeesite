<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte  IE 9]> <html class="ie"> <!--<![endif]-->
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>企业合作</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <style>
        .job-star{
            padding-bottom: 30px;
            width: 100%;
            height: 230px;
            position: relative;
        }
        .job-star li{
            width: 249px;
            height: 230px;
            float: left;
            margin-right: 10px;
        }
        .imgBox{
            height: 180px;
            width:100%;
            border: 1px solid;
        }
        .job-star li p{
            padding: 10px 0;
            text-align: center;
            font-size: 16px;
            line-height: 1.5em;
        }
        .list-arrow{
            display:block;width:45px;height:25px;text-align:center;line-height:25px;color:#fff;background:#2265b3;float:left;margin-top:12px;

        }
        .list-arrow.list-prev{border-right:1px solid #2265b3;}
        .list-arrow.disabled{background:#ccc;cursor:default;}
        .job-classify{
            float: left;
            position: relative;
            width: 88px;
            padding-right: 12px;
            line-height: 50px;
            font-size: 20px;

        }
        .job-classify:after{
            content: "";
            display: block;
            width: 0;
            height: 0;
            border-left: 6px solid #2265b3;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            position: absolute;
            top: 19px;
            right: 0;
        }
        .new-content{
            height: 290px;
        }
        .imgBox img{
            width: 100%;
            height: 100%;
        }

    </style>
</head>
<body>
<%@ include  file="./hade.jsp"%>

<div class="mainWrapper businessWrapper">
    <div class="main-title">
        <div class="title-box">
            <div class="title-name">
                <h4>青软业务</h4>
                <p class="f14 pt10 pb5">推动教育与产业的无缝衔接</p>
                <p>TO BE THE BEST</p>
            </div>
              <div class="title-pic">
                <img src="/qst/images/business-top.png" alt="">
            </div>
        </div>
    </div>
    <ul class="tabs">
       
        <a href="/school"><li >高校合作</li></a>
        <li class="active">企业合作</li>
         <a href="/platform"><li>平台支撑</li></a>
    </ul>
    <div class="section-wrapper">
        <div class="location-now">
            <span>当前位置：</span>
            <a href="/">首页</a>
            <span>&gt;</span>
            <a href="javascript:void(0);">青软业务</a>
            <span>&gt;</span>
            <span>企业合作</span>
        </div>
    </div>
    <div class="tab company">
        <div class="tac">
            <a href="http://www.itoffer.cn" target="view_window" class="tab-msg-more">
                <span class="f12 mr5">详细了解</span>
                <span class="f20 fwb">企业合作</span>
            </a>
        </div>
        <div class="tab-intro"  style="width: 1050px;margin: 0 auto 40px;text-indent: 25px;text-align: left;">
            根据IT行业人才短缺的发展现状，QST青软实训推出成本可控的定时、定制、定量的“锐聘”服务，提出了从招聘外包、定制培养到
            人才租赁的一揽子IT人力资源整体解决方案，帮助企业招到人、培训好人、用好人，协助企业走出优秀人才短缺的困境。
        </div>
        <h4 class="msg-title">企<span>业评</span>价</h4>
        <div class="section-content">
            <ul class="company-list clearfix">
               <%-- <li>
                    <div class="company-icon">
                        <img src="" alt="">
                    </div>
                    <h4>南京富士通南大软件技术有限公司</h4>
                    <p>南京富士通南大软件技术有限公司是国际著名的富士通株式会社与南京大学合资组建的软件技术公司。是富士通软件事业本部在中国唯一的系统和基础软件研发中心，主要从事面向服务器的基础软件开发，开发领域涵盖富士通Linux大型服务器平台，富士通服务器中间件开发与支持，富士通服务器硬件验证和测试软件；此外还进行嵌入式软件，系统与应用软件的开发。</p>
                    <div class="company-evaluate">
                        <div class="evaluate-box">
                            <h5>企业评价</h5>
                            <div class="evaluate-content">
                                <p>RTO锐聘为我们公司招聘和定制培养的这批学员，工作踏实肯干，诚恳好学，责任心强；能够遵守公司各项规章制度，与同事相处融洽。能够在很短时间内适应我公司的工作强度和环境，稳定性很高，很少出现人员离职的情况，绝大部分人员已经成为我公司重点培养的年轻员工，发展潜力巨大。</p>
                                <p>感谢你们的辛苦和付出，希望我们之间的友谊天长日久，我们的合作亲密无间！</p>
                            </div>
                            <div class="evaluate-person">—副总裁&nbsp;&nbsp;庞军</div>
                        </div>
                    </div>
                </li>--%>

            </ul>
        </div>
        <div class="section-content new-content mt20">
            <div class="clearfix">
                <p class="job-classify">企业合作</p>
                <div class="fr">
                    <a href="javascript:void(0);" class="list-arrow list-prev disabled">&lt;</a>
                    <a href="javascript:void(0);" class="list-arrow list-next">&gt;</a>
                </div>
            </div>
            <div class="job-star clearfix">



            </div>
        </div>
    </div>
</div>
<%@ include  file="./footer.jsp"%>
<script>
    $(function () {

        /*行业精英*/
        $.ajax({
            type: "get",
            url: "/qst/getEnterpriseList",
            dataType: 'json',
            success: function (data) {
                var result = data.resData;
                var str = '';
                var strli = '';
                $.each(result,function(index, item) {
                    str +='<li>'+
                            '<div class="company-icon">'+
                            '<img src="'+item.logo+'" alt="">'+
                           '</div>'+
                            '<h4>'+item.enterName+'</h4>'+
                            '<p>'+item.profile+'</p>'+
                    '<div class="company-evaluate">'+
                            '<div class="evaluate-box">'+
                           '<h5>企业评价</h5>'+
                            '<div class="evaluate-content">'+
                    '<p>'+item.judge+'</p>'+
                    '</div>'+
                    '<div class="evaluate-person">—'+item.author+'</div>'+
                    '</div>'+
                   '</div>'+
                    '</li>';
                });
                var size = parseInt(data.resData.length/4)+1;
                for(var i =0;i<size;i++){
                    strli+='<ul class="star-list">';
                    $.each(result, function (index1, item1) {
                        if((index1>=i*4)&&(index1<=i*4+3)){
                            strli += ' <li>' +
                                    '<div class="imgBox">' +
                                    '<img src="' + item1.enterpic + '" alt="">' +
                                    ' </div>' +
                                    '<p>' + item1.enterName + '</p>' +
                                    '</li>';
                        }
                    });
                    strli+='</ul>';
                }
                $('.company-list').empty().append(str);
                $('.job-star').empty().append(strli);
                $(".star-list").eq(0).fadeIn(200).siblings().fadeOut(200);
                var stu_index = 0;
                $(".list-prev").on("click",function(){
                    var len = $(".star-list").length;
                    if(len > 1){
                        $(".list-next").removeClass("disabled");
                    }
                    stu_index --;
                    if(stu_index <= 0){
                        stu_index = 0;
                        $(".list-prev").addClass("disabled");
                    }else{
                        $(".list-prev").removeClass("disabled");
                    }
                    $(".star-list").eq(stu_index).fadeIn(200).siblings().hide();
                });
                $(".list-next").on("click",function(){
                    var len = $(".star-list").length;
                    if(len > 1){
                        $(".list-prev").removeClass("disabled");
                    }
                    stu_index ++;
                    if(stu_index >= len - 1){
                        stu_index = len - 1;
                        $(".list-next").addClass("disabled");
                    }else{
                        $(".list-next").removeClass("disabled");
                    }
                    $(".star-list").eq(stu_index).fadeIn(200).siblings().hide();
                });
            }
        });

    })
</script>
</body>
</html>