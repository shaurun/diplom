<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Словарь</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${contextPath}/resources/css/print.css" rel="stylesheet"/>
    <link rel="icon"
          type="image/png"
          href="${contextPath}/resources/favicon.ico" />
</head>
<body>
<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
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
                    <li><a href="<c:url value='/subjects'/>">Дисциплины</a> </li>
                    <li><p class="navbar-text">>></p></li>
                    <li><a href="<c:url value='/subject/${subject.id}'/>">${subject.name}</a> </li>
                    <li><p class="navbar-text">>></p></li>
                    <li><a href="#">Уроки</a> </li>
                    <li><p class="navbar-text">>></p> </li>
                    <li class="active"><a href="<c:url value='/lesson/${lesson.id}'/>">${lesson.name}</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li>
                            <form id="logoutForm" method="post" action="${contextPath}/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </li>
                        <li><p class="navbar-text">Вы вошли как: <b>${pageContext.request.userPrincipal.name}</b></p></li>
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

    <div class="row">
    <c:if test="${!empty listWords}">
        <table class="table table-striped">
            <thead>
            <h2>Словарь урока</h2>
            <span type="button" class="btn btn-success pull-right"><a href="<c:url value='/exercises/lesson/${lesson.id}'/>">Начать упражнение</a></span>
            <tr>
                <th>Слово</th>
                <th>Значение</th>
                <th class="hidden-print">Темы</th>
                <th colspan="2" class="hidden-print"/>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listWords}" var="word">
                <tr>
                    <td>${word.word}</td>
                    <td>${word.translation}</td>
                    <td class="hidden-print">
                        <c:if test="${!empty word.topic}">
                            <span class="badge" style="background-color: ${word.topic.color}">
                                <a href="<c:url value='/lesson/editWord/${lesson.id}-${word.id}/unbindTopic/${word.topic.id}'/>">
                                        ${word.topic.name}
                                </a>
                            </span>
                        </c:if>
                    </td>
                    <td class="hidden-print"><a href="<c:url value='/lesson/editWord/${lesson.id}-${word.id}'/>">Изменить</a></td>
                    <td class="hidden-print"><a href="<c:url value='/lesson/deleteWord/${lesson.id}-${word.id}'/>">Удалить</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    </div>

    <div class="row hidden-print">
        <div class="col-sm-6">
    <c:url var="addWordAction" value="/lesson/${lesson.id}/addWord"/>
    <form:form action="${addWordAction}" commandName="word" accept-charset="UTF-8" class="form-inline">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <c:if test="${!empty word.word}">
            <div class="form-group">
                <form:input path="id" readonly="true" size="8" disabled="true" style="display: none" class="form-control"/>
                <form:hidden path="id"/>
            </div>
        </c:if>
        <div class="form-group">
            <form:input path="word" class="form-control" placeholder="Слово"/>
        </div>
        <div class="form-group">
            <form:input path="translation" class="form-control" placeholder="Значение"/>
        </div>
            <div class="form-group">
                <form:input id="topicId" path="topicId" value="${word.topic.id}" class="form-control" style="display: none"/>
            </div>
        <c:if test="${!empty word.word}">
            <button type="submit" class="btn btn-default"><spring:message text="Изменить слово"/></button>
        </c:if>
        <c:if test="${empty word.word}">
            <button type="submit" class="btn btn-default"><spring:message text="Добавить слово"/></button>
        </c:if>
    </form:form>
            <div id="topicBadge">
                    <c:if test="${!empty word.topic}">
                    <span onclick="changeValue(document.getElementById(0))" id="selected_topic_badge" class="badge" style="font-size: x-large; background-color: ${word.topic.color}">${word.topic.name}</span>
                    </c:if>
                    <c:if test="${empty word.topic}">
                    <span id="selected_topic_badge" class="badge" style="display: none"/>
                    </c:if>
            </div>

        </div>
        <div class="col-sm-6" style="
                padding: 120px 90px;
                min-width: 400px;
                background: url(${contextPath}/resources/sticker.png) no-repeat;
                background-size: 100%;">
        <div>
            <script>
                function changeValue(o){
                    document.getElementById('topicId').value=o.id;
                    var selected_topic = document.getElementById('selected_topic_badge');
                    selected_topic.setAttribute("style", o.getAttribute("style"));
                    selected_topic.textContent=o.innerText;
                    selected_topic.setAttribute("onclick", "changeValue(document.getElementById(0))");
                }
            </script>
            <c:forEach items="${listTopics}" var="topic">
                <span id="${topic.id}" class="badge"
                      style="background-color: ${topic.color}; font-size: x-large; margin: 10px"
                      onclick="changeValue(this)">${topic.name}</span>
            </c:forEach>
                <span id="0" style="display: none"></span>
        </div>
        </div>
    </div>
</div>
</body>
</html>
