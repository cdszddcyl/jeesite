<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>创始人</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <script type="text/javascript" src="/qst/js/common.js"></script>
    <style>
        .xianshipic{
            background: url("/qst/images/person.jpg") no-repeat;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<%@ include  file="./hade.jsp"%>
<div class="mainWrapper aboutWrapper">
    <div class="main-title">
        <div class="title-box">
            <div class="title-name">
                <h4>关于青软</h4>
                <p class="f14 pt10 pb5">推动教育与产业的无缝衔接</p>
                <p>TO BE THE BEST</p>
            </div>
            <div class="title-pic">
                <img src="/qst/images/about-top.png" alt="">
            </div>
        </div>
    </div>
    <ul class="tabs">
        <a href="/enterprisejs"><li>企业介绍</li></a>
         <a href="/enterprisewh"><li>企业文化</li></a>
        <li class="active">创始人</li>
         <a href="/relationwe"><li>联系我们</li></a>
    </ul>
    <div class="section-wrapper">
        <div class="location-now">
            <span>当前位置：</span>
            <a href="javascript:void(0);">首页</a>
            <span>&gt;</span>
            <a href="javascript:void(0);">关于青软</a>
            <span>&gt;</span>
            <span>创始人</span>
        </div>
    </div>
    <div class="tab founder">
        <div class="founder-msg">
            <div class="td founder-intro">
                <span class="founder-name">创始人：刘全</span>
                <div class="founder-pic">
                    <div class="xianshipic"></div>
                    <%--<img src="" alt="">--%>
                </div>
                <p>青软实训教育科技股份有限公司（运营品牌：QST青软实训）董事长，兼任青岛市服务外包协会秘书长</p>
            </div>
            <div class="td founder-resume">
                <h5>工作履历：</h5>
                <div>
                    <p class="td resume-date">1999-2003</p>
                    <p class="td resume-info">国内知名互联网企业工作</p>
                </div>
                <div>
                    <p class="td resume-date">2003-2006</p>
                    <p class="td resume-info">参与青岛软件园的筹建及运营，担任青岛软件园产业发展中心人力资源部、公共技术服务部部长；深刻理解企业需求和产业园区运营。</p>
                </div>
                <div>
                    <p class="td resume-date">2006-至今</p>
                    <p class="td resume-info">先后创办QST青软实训、RTO锐聘、IT领域在线教育及企业化定制平台——锐聘学院，成为国内最具影响力的IT人才培养和专业化人力资源服务机构。</p>
                </div>
                <h5 class="mt15">主要成就：</h5>
                <div class="resume-main">
                    <p>QST青软实训以青岛为总部、在全国建设八大实训基地，在青岛高新区投资2.5亿建设8万平米中国北方区最大的大学生实训基地，一期2万平米已经投入使用。</p>
                    <p>QST青软实训是中国最著名的IT人才实训公司，2016年3月完成A轮融资，青岛华资达信资本领投1000万，为青岛IT产业A轮最大融资，2015年12月30日完成股改，计划2016年登录新三板。</p>
                    <p>获得 “青岛市服务外包十大领军人物”、“江苏省优秀企业家”等个人荣誉称号。</p>
                    <p>带领企业在短时间内做大做强，成为从青岛走出去的知名教育品牌，先后获得科技部火炬计划软件人才培训基地、工信部国家中小企业公共服务示范平台、商务部服务外包重点联系培训机构、中国服务外包教育培训机构最佳实践五强、山东省省级服务外包实训基地、青岛市名牌等企业荣誉称号。</p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include  file="./footer.jsp"%>
</body>
</html>