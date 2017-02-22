<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Create an account</title>


    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style>
        body{padding-top:20px;}
    </style>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Регистрация</h3>
                </div>
                <div class="panel-body">
                <form:form method="POST" modelAttribute="userform" role="form">
                        <fieldset>
                    <spring:bind path="username">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="username" class="form-control" placeholder="Имя пользователя"
                                    autofocus="true"></form:input>
                        <form:errors path="username"></form:errors>
                            </div>
                    </spring:bind>
                    <spring:bind path="password">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="password" path="password" class="form-control" placeholder="Пароль"></form:input>
                            <form:errors path="password"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="confirmPassword">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="password" path="confirmPassword" class="form-control"
                                        placeholder="Подтверждение пароля"></form:input>
                            <form:errors path="confirmPassword"></form:errors>
                        </div>
                    </spring:bind>
                            <input class="btn btn-lg btn-success btn-block" type="submit" value="Создать аккаунт">
                        </fieldset>
                </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
