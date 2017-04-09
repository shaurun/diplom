<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <link rel="icon"
          type="image/png"
          href="${contextPath}/resources/favicon.ico" />
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        td, th {
            padding: 10px;
        }
    </style>
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
                    <li><a href="<c:url value='/admin'/>">Панель администратора</a></li>
                    <li class="active"><a href="<c:url value='/users'/>">Пользователи</a></li>
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

    <h1>Список пользователей</h1>
    <c:if test="${!empty listUsers}">
        <table>
            <tr>
                <th>Имя пользователя</th>
                <th>Администратор?</th>
            </tr>
            <c:forEach items="${listUsers}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>
                        <c:url var="setAdmin" value="/users"/>
                        <form:form id="form-id-${user.id}" action="${setAdmin}" accept-charset="UTF-8" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="username" value="${user.username}"/>
                            <input type="hidden" name="curAdmin" value="${user.roles.contains(adminRole)}"/>
                            <input type="checkbox" <c:if test="${user.roles.contains(adminRole)}">checked</c:if>
                            <c:if test="${user.id == 1}">disabled="disabled"</c:if>
                                   onclick="document.getElementById('form-id-${user.id}').submit();"/>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <footer>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                <a href="<c:url value='/admin'/>">Управление сайтом</a>
            </c:if>
        </c:if>
    </footer>
</div>

<script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>
</body>
</html>
