<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News data</title>
    <link rel="icon"
          type="image/png"
          href="${contextPath}/resources/favicon.ico" />
</head>
<body>
<h1>Новость</h1>
<table>
    <tr>
        <th width="80">Код</th>
        <th width="120">Заголовок</th>
        <th width="200">Содержание</th>
        <th width="120">Дата создания</th>
    </tr>
    <tr>
        <td>${news.id}</td>
        <td>${news.title}</td>
        <td>${news.info}</td>
        <td>${news.date}</td>
    </tr>
</table>
</body>
</html>
