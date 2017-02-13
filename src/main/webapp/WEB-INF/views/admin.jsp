<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Admin</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="post" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <h2>Admin page ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutform'].submit()">Log out</a> </h2>
        </c:if>
    </div>

<script src="https://ajax.googleapis.com/libs/jquery/1.11.2/jquery.min.js"/>
<script src="${contextPath}/resources/js/bootstrap.min.ja"/>
</body>
</html>
