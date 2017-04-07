<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Admin</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="icon"
          type="image/png"
          href="${contextPath}/resources/favicon.ico" />

    <style>
        div.col-sm-6:hover {
            background-color: #adadad;
        }

        div.col-sm-6 {
            min-height: 500px;
        }

        .outer {
            display: table;
            position: absolute;
            height: 100%;
            width: 100%;
        }

        .middle {
            display: table-cell;
            vertical-align: middle;
        }

        .inner {
            margin-left: auto;
            margin-right: auto;
            width: 80%;
        }

        .col-sm-12 {
            text-align: center;
            margin-bottom: 30px;
        }

        nav {
            display: block;
            position: absolute;
            margin: 0px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value='/welcome'/>">Полиглот</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="<c:url value='/admin'/>">Панель администратора</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <li>
                        <form id="logoutForm" method="post" action="${contextPath}/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </li>
                    <li><p class="navbar-text">Вы вошли как: <b>${pageContext.request.userPrincipal.name}</b></p>
                    </li>
                    <li><a onclick="document.forms['logoutForm'].submit()">Выход</a></li>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li><p class="navbar-text">Впервые здесь? Присоединяйся!</p></li>
                    <li><a href="${contextPath}/login">Войти</a></li>
                    <li><a href="${contextPath}/registration">Создать аккаунт</a></li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

    <div class="outer">
        <div class="middle">
            <div class="inner">
                <div class="row">
                    <div class="col-sm-12"><h1>Выберите тип действий</h1></div>
                </div>
                <div class="row">
                    <a href="#">
                        <div class="col-sm-6">
                            <img src="${contextPath}/resources/user_management.png" style="max-width: 100%; max-height: 100%">
                            <h2>Управление ролями пользователей</h2>
                        </div>
                    </a>
                    <a href="news/">
                        <div class="col-sm-6">
                            <img src="${contextPath}/resources/news_management.png" style="max-width: 100%; max-height: 256px">
                            <h2>Создание статей</h2>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

<script src="https://ajax.googleapis.com/libs/jquery/1.11.2/jquery.min.js"/>
<script src="${contextPath}/resources/js/bootstrap.min.ja"/>
</body>
</html>
