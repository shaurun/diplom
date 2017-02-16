<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Subject data</title>
</head>
<body>
<h1>Дисциплина</h1>
<table>
    <tr>
        <th width="80">Код</th>
        <th width="120">Название</th>
        <th width="200">Уроки</th>
        <th width="200">Темы</th>
    </tr>
    <tr>
        <td>${subject.id}</td>
        <td>${subject.name}</td>
        <td>
            <table>
                <c:forEach items="${listLessons}" var="lesson">
                    <tr>
                        <td><a href="<c:url value='/lesson/${lesson.id}'/> ">${lesson.name}</a></td>
                        <td><a href="<c:url value='/subject/editLesson/${subject.id}-${lesson.id}'/>">Изменить</a> </td>
                        <td><a href="<c:url value='/subject/deleteLesson/${subject.id}-${lesson.id}'/>">Удалить</a></td>
                    </tr>
                </c:forEach>
            </table>
        </td>
        <td>
            <table>
                <c:forEach items="${listTopics}" var="topic">
                    <tr>
                        <td>${topic.name}</td>
                        <td><a href="<c:url value='/subject/editTopic/${subject.id}-${topic.id}'/>">Изменить</a> </td>
                        <td><a href="<c:url value='/subject/deleteTopic/${subject.id}-${topic.id}'/>">Удалить</a></td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
</table>

<h2>Добавить урок</h2>
<c:url var="addLessonAction" value="/subject/${subject.id}/addLesson"/>
<form:form action="${addLessonAction}" commandName="lesson">
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
                    <spring:message text="Урок"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty lesson.name}">
                    <input type="submit"
                           value="<spring:message text="Изменить урок"/>"/>
                </c:if>
                <c:if test="${empty lesson.name}">
                    <input type="submit"
                           value="<spring:message text="Создать урок"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

<h2>Добавить тему</h2>
<c:url var="addTopicAction" value="/subject/${subject.id}/addTopic"/>
<form:form action="${addTopicAction}" commandName="topic">
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
                    <spring:message text="Тема"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty lesson.name}">
                    <input type="submit"
                           value="<spring:message text="Изменить тему"/>"/>
                </c:if>
                <c:if test="${empty lesson.name}">
                    <input type="submit"
                           value="<spring:message text="Создать тему"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
