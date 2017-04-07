<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% response.setStatus(404); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ошибка 404</title>
</head>
<body>
<div align="center">
    <h1>Ошибка 404: запрашиваемая страница не найдена.</h1>
    <img src="${contextPath}/resources/404.png" style="max-width: 100%; max-height: 100%">
    <p>Никогда не знаешь, есть ли в туалете бумага.
        И чистоплотный гоблин Вася всегда запасает на этот случай пару свежих томиков.</p>
    <a href="<c:url value='/welcome'/>">На главную</a>
</div>
</body>
</html>
