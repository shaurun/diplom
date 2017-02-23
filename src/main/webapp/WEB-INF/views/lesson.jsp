<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Словарь</title>
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
                    <li><a href="<c:url value='/subjects'/>">Дисциплины</a> </li>
                    <li><p class="navbar-text">>></p></li>
                    <li><a href="<c:url value='/subject/${subject.id}'/>">${subject.name}</a> </li>
                    <li><p class="navbar-text">>></p></li>
                    <li><a href="#">Уроки</a> </li>
                    <li><p class="navbar-text">>></p> </li>
                    <li class="active"><a href="<c:url value='/lesson/${lesson.id}'/>">${lesson.name}</a></li>
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

    <c:if test="${!empty listWords}">
        <table class="table table-striped">
            <thead>
            <h2>Словарь урока</h2>
            <tr>
                <th>Слово</th>
                <th>Значение</th>
                <th>Темы</th>
                <th colspan="2"/>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listWords}" var="word">
                <tr>
                    <td>${word.word}</td>
                    <td>${word.translation}</td>
                    <td>${word.topic}</td>
                    <td><a href="<c:url value='/lesson/editWord/${lesson.id}-${word.id}'/>">Изменить</a></td>
                    <td><a href="<c:url value='/lesson/deleteWord/${lesson.id}-${word.id}'/>">Удалить</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:url var="addWordAction" value="/lesson/${lesson.id}/addWord"/>
    <form:form action="${addWordAction}" commandName="word" accept-charset="UTF-8" class="form-inline">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <c:if test="${!empty word.word}">
            <div class="form-group">
                <form:input path="id" readonly="true" size="8" disabled="true" style="display: none" class="form-control"/>
                <form:hidden path="id"/>
            </div>
        </c:if>
        <div class="form-group">
            <form:input path="word" class="form-control" placeholder="Слово"/>
        </div>
        <div class="form-group">
            <form:input path="translation" class="form-control" placeholder="Значение"/>
        </div>
        <c:if test="${!empty word.word}">
            <button type="submit" class="btn btn-default"><spring:message text="Изменить слово"/></button>
        </c:if>
        <c:if test="${empty word.word}">
            <button type="submit" class="btn btn-default"><spring:message text="Добавить слово"/></button>
        </c:if>
    </form:form>
</div>
</body>
</html>
