<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Subject data</title>
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
                    <li class="active"><a href="<c:url value='/subject/${subject.id}'/>">${subject.name}</a> </li>
                    <li><a href="<c:url value='/${subject.id}/exercises'/>">Упражнения</a> </li>
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

<h1>${subject.name}</h1>
    <div class="row">
        <div class="col-sm-6">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th colspan="3">Уроки</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listLessons}" var="lesson">
                    <tr>
                        <td><a href="<c:url value='/lesson/${lesson.id}'/> ">${lesson.name}</a></td>
                        <td><a href="<c:url value='/subject/editLesson/${subject.id}-${lesson.id}'/>">Изменить</a> </td>
                        <td><a href="<c:url value='/subject/deleteLesson/${subject.id}-${lesson.id}'/>">Удалить</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-sm-6">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th colspan="3">Темы</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listTopics}" var="topic">
                    <tr>
                        <td><span class="badge" style="background-color: ${topic.color}"><a href="<c:url value='/topic/${topic.id}'/>">${topic.name}</a></span></td>
                        <td><a href="<c:url value='/subject/editTopic/${subject.id}-${topic.id}'/>">Изменить</a> </td>
                        <td><a href="<c:url value='/subject/deleteTopic/${subject.id}-${topic.id}'/>">Удалить</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <c:url var="addLessonAction" value="/subject/${subject.id}/addLesson"/>
            <form:form action="${addLessonAction}" commandName="lesson"  accept-charset="UTF-8" class="form-inline">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <c:if test="${!empty lesson.name}">
                    <div class="form-group">
                        <form:input path="id" readonly="true" size="8" disabled="true" style="display: none" class="form-control"/>
                        <form:hidden path="id"/>
                    </div>
                </c:if>
                <div class="form-group">
                    <form:input path="name" class="form-control" placeholder="Заголовок"/>
                </div>
                <c:if test="${!empty lesson.name}">
                    <button type="submit" class="btn btn-default"><spring:message text="Изменить урок"/></button>
                </c:if>
                <c:if test="${empty lesson.name}">
                    <button type="submit" class="btn btn-default"><spring:message text="Создать урок"/></button>
                </c:if>
            </form:form>
        </div>
        <div class="col-sm-6">
            <c:url var="addTopicAction" value="/subject/${subject.id}/addTopic"/>
            <form:form action="${addTopicAction}" commandName="topic"  accept-charset="UTF-8" class="form-inline">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <c:if test="${!empty topic.name}">
                    <div class="form-group">
                        <form:input path="id" readonly="true" size="8" disabled="true" style="display: none" class="form-control"/>
                        <form:hidden path="id"/>
                    </div>
                </c:if>
                <div class="form-group">
                    <form:input path="name" class="form-control" placeholder="Название"/>
                </div>
                <c:if test="${!empty topic.name}">
                    <form:input path="color" type="color"/>
                    <button type="submit" class="btn btn-default"><spring:message text="Изменить тему"/></button>
                </c:if>
                <c:if test="${empty topic.name}">
                    <form:input path="color" type="color" value="#FFFFFF"/>
                    <button type="submit" class="btn btn-default"><spring:message text="Создать тему"/></button>
                </c:if>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
