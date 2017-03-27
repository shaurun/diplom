<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Полиглот</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="icon"
          type="image/png"
          href="${contextPath}/resources/favicon.ico"/>
</head>
<body>
<div class="container">
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
                    <li><a href="<c:url value='/tutorial'/>">Как это работает?</a></li>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li><a href="<c:url value='/subjects'/>">Дисциплины</a></li>
                    </c:if>
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
    <div id="section1" class="container-fluid">
    <div class="row">
        <div class="col-sm-7">
            <div class="jumbotron">
                <h1><strong>Изучение</strong> слов онлайн</h1>
                <p>Пора покончить с тетрадями и словарями, весящями тонну! Как хочется носить все в голове или хотя бы в мобильном!
                    На нашем сайте вы можете составить свой индивидуальный список слов и выражений на изучаемом языке.
                    А мы поможем вам их запомнить с помощью упражнений. Совершенствуйте себя!
                </p>
            </div>
        </div>
        <div class="col-sm-5">
            <img src="${contextPath}/resources/bookgirl.jpg" style="max-width: 100%; max-height: 100%">
        </div>
    </div>
    </div>

    <div id="section2" class="container-fluid" style="margin-top: 50px;">
        <div class="row">
            <div class="col-md-12 headline">
                <h2>Хочешь узнать больше?</h2>
            </div>
        </div>
        <hr/>
    <div class="row">
        <c:if test="${!empty listNews}">
            <c:set var="iter" value="1" scope="page" />
            <div class="col-md-6">
                <c:forEach items="${listNews}" var="news">
                    <c:if test="${iter % 2 == 1}">
                        <div style="margin-bottom: 20px">
                        <p class="lead">${news.title}</p>
                        <p>${news.info}</p>
                        <div>
                            <span class="badge pull-right">От ${news.date}</span>
                        </div>
                        </div>
                    </c:if>
                    <c:set var="iter" value="${iter+1}" scope="page"/>
                </c:forEach>
            </div>
            <div class="col-md-6">
                <c:set var="iter" value="1" scope="page"/>
                <c:forEach items="${listNews}" var="news">
                    <c:if test="${iter % 2 == 0}">
                    <div style="margin-bottom: 20px">
                        <p class="lead">${news.title}</p>
                        <p>${news.info}</p>
                        <div>
                            <span class="badge pull-right">От ${news.date}</span>
                        </div>
                    </div>
                    </c:if>
                    <c:set var="iter" value="${iter+1}" scope="page"/>
                </c:forEach>
            </div>
        </c:if>
    </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/libs/jquery/1.11.2/jquery.min.js"/>
<script src="${contextPath}/resources/js/bootstrap.min.ja"/>
</body>
</html>
