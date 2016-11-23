<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>VMS2.0 - 登录</title>
    <link href="resources/customer/img/favicon.ico" rel="shortcut icon" type="image/x-icon" media="screen"/>
    <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            margin: 0px;
            background-color: #ffffff;
        }

        .login-box {
            width: 100%;
            background-color: #ffffff;
        }

        .logo {
            width: 80px;
            margin: 0px auto;
            padding: 50px 0px;
        }

        .login-form {
            width: 300px;
            margin: 0px auto;
        }

        @media (min-width: 992px) {
            body {
                background-color: #f5f5f5;
            }

            .login-box {
                position: absolute;
                left: 50%;
                top: 50%;
                margin-left: -350px;
                margin-top: -225px;
                width: 700px;
                min-height: 450px;
            }

            .login-form {
                width: 350px;
            }
        }

        .form-control:focus {
            border-color: #cccccc;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
        }

        .input-lg, .btn-lg {
            font-size: 12px;
            padding: 13px 16px;
        }

        .login-error-tip {
            display: none;
        }

        .login-btn {
            padding-top: 25px;
        }
    </style>
</head>
<body class="zh_CN">
<div class="login-box">
    <div class="logo">
        <img src="resources/customer/img/logo.png" width="80" height="auto">
    </div>
    <div class="login-form">
        <form action="index" method="post">
            <div class="form-group">
                <input class="form-control input-lg" name="userName" type="text" placeholder="输入账号">
            </div>
            <div class="form-group">
                <input class="form-control input-lg" name="password" type="password" placeholder="输入密码">
            </div>
            <div class="login-error-tip has-error">
                <p class="help-block">
                    <span class="glyphicon glyphicon-warning-sign"></span> 用户名或密码错误！
                </p>
            </div>
            <div class="login-btn">
                <button class="btn btn-danger btn-block btn-lg" type="submit">立即登录</button>
            </div>
        </form>
    </div>
</div>
<script src="resources/customer/js/jquery-3.1.1.min.js"></script>
<script>
    var message = "${message}";
    if (Boolean(message)) {
        $('.login-error-tip').show().find('.help-block').html('<span class="glyphicon glyphicon-warning-sign"></span> ' + message);
    }
</script>
</body>
</html>
