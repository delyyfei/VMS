<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>VMS2.0</title>
    <link href="resources/customer/img/favicon.ico" rel="shortcut icon" type="image/x-icon" media="screen"/>
    <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            overflow: hidden;
            margin: 0px;
            background-color: #eeeeee;
        }

        .navbar {
            border-width: 0px;
            margin-bottom: 0px;
        }

        .navbar-default {
            background-color: #3b3e43;
            border-color: #3b3e43;
        }

        .navbar-default .navbar-brand,
        .navbar-default .navbar-nav > li > a {
            line-height: 75px;
            padding: 0 15px;
            color: #eaeaec;
        }

        .navbar-default .navbar-brand {
            padding: 0 30px;
            font-size: 24px;
        }

        .navbar-default .navbar-brand:hover,
        .navbar-default .navbar-brand:focus {
            color: #000000;
            background-color: transparent;
        }

        .navbar-default .navbar-nav > li > a:hover,
        .navbar-default .navbar-nav > li > a:focus,
        .navbar-default .navbar-nav > .open > a,
        .navbar-default .navbar-nav > .open > a:hover,
        .navbar-default .navbar-nav > .open > a:focus {
            background-color: #ffffff;
            color: #000000;
        }

        #iframeBox {
            border: 1px solid transparent;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index">VMS</a>
        </div>
        <div class="navbar-collapse">
            <ul id="menuBox" class="nav navbar-nav">
                <li><a href="javascript:void(null);" data-url="view/operator">
                    <span class="glyphicon glyphicon-user"></span> 操作员管理
                </a></li>
                <li><a href="javascript:void(null);" data-url="view/scanfile">
                    <span class="glyphicon glyphicon-list"></span> 文件扫描管理
                </a></li>
                <li><a href="javascript:void(null);" data-url="view/transcoding">
                    <span class="glyphicon glyphicon-list"></span> 转码任务管理
                </a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> ${admin.id} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><span class="glyphicon glyphicon-edit"></span> 修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="login"><span class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <iframe id="iframeBox" src="view/base" width="100%" height="100%" frameborder="0" scrolling="no"></iframe>
</div>
<script type="text/javascript" src="resources/customer/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $('#iframeBox').height($(window).height() - 76);
    $(window).resize(function () {
        $('#iframeBox').height($(window).height() - 76);
    });
    $('#menuBox li a').click(function () {
        $('#iframeBox').attr('src', $(this).attr('data-url'));
    });
</script>
</body>
</html>
