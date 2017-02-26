<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lessons</title>
    <link rel="icon"
          type="image/png"
          href="${contextPath}/resources/favicon.ico" />
</head>
<body>
<h1>Уроки</h1>

<c:if test="${!empty listLessons}">
<table>
    <tr>
        <th>Заголовок</th>
        <th>Дисциплина</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach items="${listessons}" var="lesson">
    <tr>
        <td>${lesson.name}</td>
        <td>${lesson.subject.name}</td>
        <td><a href="<c:url value='subject/${lesson.subject.id}/lessons/edit/${lesson.id}'/>">Изменить</a></td>
        <td><a href="<c:url value='subject/${lesson.subject.id}/lessons/delete/${lesson.id}'/>">Удалить</a></td>
    </tr>
    </c:forEach>
</table>
</c:if>

<h2>Добавить урок</h2>
<c:url var="addAction" value="/subject/${lesson.subject.id}/lessons/add"/>
<form:form action="${addAction}" commandName="lesson">
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
                    <spring:message text="Название урона"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty subject.name}">
                    <input type="submit"
                           value="<spring:message text="Изменить урок"/>"/>
                </c:if>
                <c:if test="${empty subject.name}">
                    <input type="submit"
                           value="<spring:message text="Создать урок"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
