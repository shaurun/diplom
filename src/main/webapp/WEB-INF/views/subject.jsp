<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Subject data</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
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
                    <li class="active"><a href="<c:url value='/subjects'/>">Дисциплины</a> </li>
                    <li><a href="#">Уроки</a> </li>
                    <li><a href="#">Темы</a> </li>
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

<h1>Дисциплина</h1>
<table>
    <tr>
        <th width="80">Код</th>
        <th width="120">Название</th>
        <th width="200">Уроки</th>
        <th width="200">Темы</th>
    </tr>
    <tr>
        <td>${subject.id}</td>
        <td>${subject.name}</td>
        <td>
            <table>
                <c:forEach items="${listLessons}" var="lesson">
                    <tr>
                        <td><a href="<c:url value='/lesson/${lesson.id}'/> ">${lesson.name}</a></td>
                        <td><a href="<c:url value='/subject/editLesson/${subject.id}-${lesson.id}'/>">Изменить</a> </td>
                        <td><a href="<c:url value='/subject/deleteLesson/${subject.id}-${lesson.id}'/>">Удалить</a></td>
                    </tr>
                </c:forEach>
            </table>
        </td>
        <td>
            <table>
                <c:forEach items="${listTopics}" var="topic">
                    <tr>
                        <td>${topic.name}</td>
                        <td><a href="<c:url value='/subject/editTopic/${subject.id}-${topic.id}'/>">Изменить</a> </td>
                        <td><a href="<c:url value='/subject/deleteTopic/${subject.id}-${topic.id}'/>">Удалить</a></td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
</table>

<h2>Добавить урок</h2>
<c:url var="addLessonAction" value="/subject/${subject.id}/addLesson"/>
<form:form action="${addLessonAction}" commandName="lesson">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <table>
        <c:if test="${!empty lesson.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Урок"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty lesson.name}">
                    <input type="submit"
                           value="<spring:message text="Изменить урок"/>"/>
                </c:if>
                <c:if test="${empty lesson.name}">
                    <input type="submit"
                           value="<spring:message text="Создать урок"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

<h2>Добавить тему</h2>
<c:url var="addTopicAction" value="/subject/${subject.id}/addTopic"/>
<form:form action="${addTopicAction}" commandName="topic">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <table>
        <c:if test="${!empty topic.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Тема"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty topic.name}">
                    <input type="submit"
                           value="<spring:message text="Изменить тему"/>"/>
                </c:if>
                <c:if test="${empty topic.name}">
                    <input type="submit"
                           value="<spring:message text="Создать тему"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</div>
</body>
</html>
