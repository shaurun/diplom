<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Словарь</title>
</head>
<body>
<h1>Дисциплина: ${lesson.subject.name}</h1>
<h2>Урок: ${lesson.name}</h2>

<c:if test="${!empty listWords}">
<table>
    <tr>
        <th width="80">Код</th>
        <th width="200">Слово</th>
        <th width="200">Значение</th>
        <th width="200">Темы</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach items="${listWords}" var="word">
        <tr>
            <td>${word.id}</td>
            <td>${word.word}</td>
            <td>${word.translation}</td>
            <td>${word.topic}"</td>
            <td><a href="<c:url value='/lesson/editWord/${lesson.id}-${word.id}'/>">Изменить</a></td>
            <td><a href="<c:url value='/lesson/deleteWord/${lesson.id}-${word.id}'/>">Удалить</a></td>
        </tr>
    </c:forEach>
</table>
</c:if>

<h2>Добавить слово</h2>
<c:url var="addWordAction" value="/lesson/${lesson.id}/addWord"/>
<form:form action="${addWordAction}" commandName="word">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <table>
        <c:if test="${!empty word.word}">
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
                <form:label path="word">
                    <spring:message text="Слово"/>
                </form:label>
            </td>
            <td>
                <form:input path="word"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="translation">
                    <spring:message text="Значение"/>
                </form:label>
            </td>
            <td>
                <form:input path="translation"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty word.word}">
                    <input type="submit"
                           value="<spring:message text="Изменить слово"/>"/>
                </c:if>
                <c:if test="${empty word.word}">
                    <input type="submit"
                           value="<spring:message text="Добавить слово"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
