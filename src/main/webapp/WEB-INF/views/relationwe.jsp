<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>联系我们</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <style>
        .xianshipic{
            width: 380px;
            height:184px;
        }
        .xianshipic1{
            background:url("/qst/images/cjsjz.png") no-repeat;
            width: 380px;
            height:184px;
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
        <a href="/founder"><li>创始人</li></a>
        <li class="active">联系我们</li>
    </ul>
    <div class="section-wrapper">
        <div class="location-now">
            <span>当前位置：</span>
            <a href="/">首页</a>
            <span>&gt;</span>
            <a href="javascript:void(0);">关于青软</a>
            <span>&gt;</span>
            <span>联系我们</span>
        </div>
    </div>
    <div class="tab contact">
        <ul class="map-list">
            <li>
                <div class="td map-index"></div>
                <div class="td map-msg">
                    <h5>QST青软实训青岛总部基地</h5>
                    <p><span>地址:</span><span>山东省青岛市高新区广博路325号</span></p>
                    <p><span>电话:</span><span>400-658-0166&nbsp;&nbsp;&nbsp; 0532-85938027/28</span></p>
                   
                </div>
                 <div class="td map-img xianshipic">
                    <a target="view_window" href="/baidumap?api=1"><img src="/qst/images/qdzb.png" alt=""></a>
                </div>
            </li>
            <li>
                <div class="td map-index"></div>
                <div class="td map-msg">
                    <h5>QST青软实训长三角基地</h5>
                    <p><span>地址:</span><span>江苏省如皋市万寿南路766号电子商务产业园C栋</span></p>
                    <p><span>电话:</span><span>400-658-0166</span></p>
                </div>
                <div class="td map-img xianshipic">
                    <a target="view_window" href="/baidumap?api=2"><img src="/qst/images/jsjd.png" alt=""></a>
                </div>
            </li>
            <li>
                <div class="td map-index"></div>
                <div class="td map-msg">
                    <h5>QST青软实训京津冀基地</h5>
                    <p><span>地址:</span><span>山东省德州市经济开发区鑫苑国际9楼</span></p>
                    <p><span>电话:</span><span>400-658-0166</span></p>
                </div>
                <div class="td map-img xianshipic">
                    <a target="view_window" href="/baidumap?api=3"><img src="/qst/images/dzjd.png" alt=""/></a>
                </div>
            </li>
            
            <li>
                <div class="td map-index"></div>
                <div class="td map-msg">
                    <h5>QST青软实训北京公司</h5>
                    <p><span>地址:</span><span>北京市西城区西直门南大街2号成铭大厦Ｃ座103室</span></p>
                    <p><span>电话:</span><span>400-658-0166</span></p>
                </div>
                <div class="td map-img xianshipic">
                    <a target="view_window" href="/baidumap?api=4"><img src="/qst/images/bjjd.png" alt=""></a>
                </div>
            </li>
            <li>
                <div class="td map-index"></div>
                <div class="td map-msg">
                    <h5>QST青软实训内蒙基地</h5>
                    <p><span>地址:</span><span>内蒙古自治区呼和浩特市新城区鸿盛大学科技园３号楼６楼</span></p>
                    <p><span>电话:</span><span>400-658-0166</span></p>
                </div>
                <div class="td map-img xianshipic">
                   <a target="view_window" href="/baidumap?api=5"> <img src="/qst/images/nmjd.png" alt=""></a>
                </div>
            </li>
            <li>
                <div class="td map-index"></div>
                <div class="td map-msg">
                    <h5>QST青软实训青岛科技大学青软国际软件学院</h5>
                    <p><span>地址:</span><span>青岛市高新区国家大学科技园A1-A5</span></p>
                    <p><span>电话:</span><span>400-658-0166</span></p>
                </div>
                <div class="td map-img xianshipic">
                    <a target="view_window" href="/baidumap?api=6"><img src="/qst/images/qdkjd.png" alt=""></a>
                </div>
            </li>
        </ul>
    </div>
</div>
<%@ include  file="./footer.jsp"%>
</body>
</html>