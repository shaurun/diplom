<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Subjects</title>
</head>
<body>
<h1>Список предметов</h1>

<c:if test="${!empty listSubjects}">
<table>
    <tr>
        <th>Заголовок</th>
        <th>Пользователь</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach items="${listSubjects}" var="subject">
    <tr>
        <td><a href="<c:url value='/subject/${subject.id}'/>">${subject.name}</a></td>
        <td>${subject.user.username}</td>
        <td><a href="<c:url value='/subjects/edit/${subject.id}'/>">Изменить</a></td>
        <td><a href="<c:url value='/subjects/delete/${subject.id}'/>">Удалить</a></td>
    </tr>
    </c:forEach>
</table>
</c:if>

<h2>Добавить предмет</h2>
<c:url var="addAction" value="/subjects/add"/>
<form:form action="${addAction}" commandName="subject"  accept-charset="UTF-8">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <table>
        <c:if test="${!empty subject.name}">
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
                    <spring:message text="Предмет"/>
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
                           value="<spring:message text="Изменить предмет"/>"/>
                </c:if>
                <c:if test="${empty subject.name}">
                    <input type="submit"
                           value="<spring:message text="Создать предмет"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
