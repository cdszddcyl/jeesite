<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--[if lte  IE 9]> <html class="ie"> <!--<![endif]-->
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>企业介绍</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <style>
        .xianshipic{
            background: url("/qst/images/q1.jpg") no-repeat;
            width: 100%;
            height: 100%;

        }

        .xianshipic1{
            background: url("/qst/images/q2.jpg") no-repeat;
            width: 100%;
            height: 100%;

        }

        .xianshipic2{
            background: url("/qst/images/q3.jpg") no-repeat;
            width: 100%;
            height: 100%;

        }

    </style>
    <link href="/qst/js/video/js/video-js.css" rel="stylesheet">
</head>

<body>
<%@ include file="./hade.jsp" %>
<script src="/qst/js/video/js/video.js"></script>
<script type="text/javascript">
	videojs.options.flash.swf = "/qst/js/video-js.swf";
</script>
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
        <li class="active">企业介绍</li>
        <a href="/enterprisewh">
            <li>企业文化</li>
        </a>
        <a href="/founder">
            <li>创始人</li>
        </a>
        <a href="/relationwe">
            <li>联系我们</li>
        </a>
    </ul>
    <div class="section-wrapper">
        <div class="location-now">
            <span>当前位置：</span>
            <a href="/">首页</a>
            <span>&gt;</span>
            <a href="javascript:void(0);">关于青软</a>
            <span>&gt;</span>
            <span>企业介绍</span>
        </div>
    </div>
    <div class="tab introduce" style="padding-bottom:0 !important;">

        <div class="section-content">

            <div class="intro-video">
                <video id="example_video1" class="video-js vjs-default-skin" controls preload="none" width="1050px" height="500px"
                       poster=""
                       data-setup="{}">
                    <source src="/userfiles/qst.mp4" type='video/mp4'/>
                     <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    				<track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                </video>
            </div>
        </div>
        <h4 class="msg-title">公<span>司介</span>绍</h4>
        <div class="section-content">
            <p>青岛青软实训教育科技股份有限公司，旗下运营品牌有 “QST青软实训”、“RTO锐聘”、“锐聘学院”，是中国最具影响力的IT职业教育和人才服务提供商，面向IT领域，根植产业园区，线上线下结合，提供高校人才培养及企业定制人才服务、大学生创业孵化解决方案。以青岛为中心建立长三角基地、大连基地、内蒙基地、北京公司、京津冀基地、珠三角基地以及西部（成都）基地等8大实训基地。</p>
            <p>与500余所高校和3000余家企业建立合作关系，拥有200余名线上线下校企名师，累计培训人数超过30000人，在线注册用户超过100000名，目前中国有20000多人在使用青软实训自主研发出版的教材体系。</p>
            <ul class="intro-pic clearfix">
                <li>
                    <div class="xianshipic"></div>
                </li>
                <li>
                    <div class="xianshipic1"></div>
                </li>
                <li>
                    <div class="xianshipic2"></div>
                </li>
            </ul>
        </div>
        <h4 class="msg-title">主<span>营业</span>务</h4>

        <div class="section-content">
            <p>针对IT行业发展与人才需求之间的矛盾，青软实训为高校提供完整的人才实训解决方案，参与高校教学改革，与高校共同制定教学计划，联合招生，共同培养。将企业实践式教学作为高校课程大纲的有益补充，使在校大学生能够最大程度的满足业界职业要求，培育出满足产业需求的实用型、复合型软件人才。采用2.5+1.5（大学本科4年，前2.5年在高校进行理论学习，后1.5年在青软实训基地实习实训）等创新教学模式，每年联合招生4000余名，在校生30000人。是高等教育必要而有益的环节。</p>
            <p>同时，公司根据企业对人才的需求，提供定时、定量、定制的锐聘服务，为企业提供从招聘外包、定制培养到人才租赁的一整套IT人力资源解决方案，帮助企业招到人、培训好人、用好人。在IT运维和对日外包领域，文思海辉、埃森哲、中软国际、软通动力等中国排名前十的企业有8家采用了青软实训的解决方案。</p>
            <p>青软实训利用互联网思维打造的IT慕课平台——“锐聘学院”，专注IT领域在线教育及企业定制人才培养平台，课程覆盖行业技术的主流、发展趋势以及职业学习路径，涵盖移动互联、互联网开发、云计算、大数据、游戏开发、软件开发、服务外包、集成电路等领域。支撑对高校和企业的线下服务，形成了线上线下相结合的O2O的业务模式。</p>
            <p>此外，QST青软实训积极创新办学体制和办学模式，吸收社会和产业资本，计划建设一个由3所省内、2所国内、1所国际知名院校共同组成的“321”软件学院集群，培养信息化社会发展所需要的人格健全、基础扎实、知识面宽、综合素质高、适应能力强，具有创新和创业精神的应用性复合型优秀IT软件与服务外包人才。</p>
        </div>
        <div class="intro-school">
            <h4 class="msg-title">打造一<span>流园</span>区环境</h4>

            <div class="section-content">
                <p>目前在建的青岛软件科技城建设项目作为首家入驻青岛高新区的人才培训基地，通过建设园区型实训基地和创业孵化器，将着力打造成一个涵盖IT实训、软件学院、产业孵化等多项服务的综合性基地。规划建设3000个标准工位，同时涵盖创业孵化、实训区域、独立软件学院及生活配套设施，建设面积8万平方米，计划总投资人民币2.5亿元。一期投资8500万，于2015年8月正式投入使用，9月迎入首批合作高校IT专业大学生正式入驻。项目最终落成后，可同时容纳在训学生3000人，每年为6000名大学生提供实习实训服务,聚集技术专家、教师、教授等在基地开展产学研合作，并引进相关企业实现教企联动，实现以人才促招商，从而打造成中国北方地区最具规模和影响力的大学生公共实训服务平台及大学生创业孵化器。</p>
                <p>青软实训重视并扶持大学生创业孵化工作，建立创新实验室，通过引入企业研发项目，进行产学研对接，培养大学生创业精神，同时与青岛高新区创业服务事业部联合创建青苹果创客基地，为优秀大学生创业项目孵化提供软硬件支撑。孵化了智慧能源管理系统、金融大数据分析系统、农业智能传感网节点芯片等大学生创业项目。</p>

            </div>
        </div>
    </div>
</div>
<%@ include file="./footer.jsp" %>
<script>
    $(document).ready(function () {
        var myPlayer = videojs('example_video1');
        videojs("example_video1").ready(function () {
            var myPlayer = this;
            myPlayer.play();
        });
    });
</script>
</body>
</html>