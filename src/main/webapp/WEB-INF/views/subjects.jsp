<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Subjects</title>
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

<c:if test="${!empty listSubjects}">
    <table class="table table-striped">
        <thead>
        <tr>
            <th colspan="3">Дисциплины</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listSubjects}" var="subject">
            <tr>
                <td><a href="<c:url value='/subject/${subject.id}'/>">${subject.name}</a></td>
                <td><a href="<c:url value='/subjects/edit/${subject.id}'/>">Изменить</a></td>
                <td><a href="<c:url value='/subjects/delete/${subject.id}'/>">Удалить</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

    <c:url var="addAction" value="/subjects/add"/>
<form:form action="${addAction}" commandName="subject"  accept-charset="UTF-8" class="form-inline">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <c:if test="${!empty subject.name}">
        <div class="form-group">
            <form:input path="id" readonly="true" size="8" disabled="true" style="display: none" class="form-control"/>
            <form:hidden path="id"/>
        </div>
    </c:if>
        <div class="form-group">
            <form:input path="name" class="form-control" placeholder="Название"/>
        </div>
    <c:if test="${!empty subject.name}">
        <button type="submit" class="btn btn-default"><spring:message text="Изменить предмет"/></button>
    </c:if>
    <c:if test="${empty subject.name}">
        <button type="submit" class="btn btn-default"><spring:message text="Создать предмет"/></button>
    </c:if>
</form:form>
</div>

</body>
</html>
