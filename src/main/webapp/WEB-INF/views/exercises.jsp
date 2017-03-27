<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Упражнения</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="icon"
          type="image/png"
          href="${contextPath}/resources/favicon.ico" />
</head>
<body>
<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
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
                    <li><a href="<c:url value='/subjects'/>">Дисциплины</a> </li>
                    <li><p class="navbar-text">>></p></li>
                    <li><a href="<c:url value='/subject/${subject.id}'/>">${subject.name}</a> </li>
                    <li><p class="navbar-text">>></p></li>
                    <li class="active"><a href="<c:url value='/${subject.id}/exercises'/>">Упражнения</a> </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li>
                            <form id="logoutForm" method="post" action="${contextPath}/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </li>
                        <li><p class="navbar-text">Вы вошли как: <b>${pageContext.request.userPrincipal.name}</b></p></li>
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

    <c:url var="createExercise" value="/subject/${subject.id}/exercise"/>
    <form:form action="${createExercise}" accept-charset="UTF-8" method="get">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="row">
            <div class="col-sm-6">
                <p class="lead">Выберите уроки</p>
                <c:forEach items="${lessons}" var="lesson">
                <input type="checkbox" name="lesson" value="${lesson.id}"/>${lesson.name}<br>
                </c:forEach>
            </div>
            <div class="col-sm-6">
                <p class="lead">Выберите темы</p>
                <c:forEach items="${topics}" var="topic">
                <input type="checkbox" name="topic" value="${topic.id}"/>${topic.name}<br>
                </c:forEach>
            </div>
        </div>
        <div class="row">
            <p class="lead">Допускать повторы?</p>
            <input type="radio" name="repeatable" value="true" checked/>Да
            <input type="radio" name="repeatable" value="false"/>Нет
        </div>
        <div class="row">
            <p class="lead">Максимальное количество слов</p>
            <input type="number" name="quantity" min="0" max="100" step="5"/>
        </div>
        <div class="row">
            <p class="lead">Тип упражнения</p>
            <input type="radio" name="type" value="1" checked/>Дано слово
            <input type="radio" name="type" value="2" />Дано значение
            <input type="radio" name="type" value="3" />Вперемешку
        </div>
        <div class="row">
            <button type="submit" class="btn btn-success"><spring:message text="Начать упражнение"/></button>
        </div>
    </form:form>

</div> <!-- end container-->
</body>
</html>
