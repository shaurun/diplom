<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
</head>
<body>
<h1>Список новостей</h1>

<c:if test="${!empty listNews}">
<table>
    <tr>
        <th>Заголовок</th>
        <th>Содержание</th>
        <th>Дата создания</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach items="${listNews}" var="news">
    <tr>
        <td><a href="<c:url value='/newsData/${news.id}'/>">${news.title}</a></td>
        <td>${news.info}</td>
        <td>${news.date}</td>
        <td><a href="<c:url value='/edit/${news.id}'/>">Изменить</a></td>
        <td><a href="<c:url value='/delete/${news.id}'/>">Удалить</a></td>
    </tr>
    </c:forEach>
</table>
</c:if>

<h2>Добавить новость</h2>
<c:url var="addAction" value="/news/add"/>
<form:form action="${addAction}" commandName="news">
    <!--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
    <table>
        <c:if test="${!empty news.title}">
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
                <form:label path="title">
                    <spring:message text="Заголовок"/>
                </form:label>
            </td>
            <td>
                <form:input path="title"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="info">
                    <spring:message text="Cодержание"/>
                </form:label>
            </td>
            <td>
                <form:textarea path="info"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty news.title}">
                    <input type="submit"
                           value="<spring:message text="Изменить новость"/>"/>
                </c:if>
                <c:if test="${empty news.title}">
                    <input type="submit"
                           value="<spring:message text="Создать новость"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
