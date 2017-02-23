<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Welcome</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
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

    <div class="container">
        <div class="col-md-12">
            <h1>Alice in Wonderland, part dos</h1>
            <p>'You ought to be ashamed of yourself for asking such a simple question,' added the Gryphon; and then they both sat silent and looked at poor Alice, who felt ready to sink into the earth. At last the Gryphon said to the Mock Turtle, 'Drive on, old fellow! Don't be all day about it!' and he went on in these words:
                'Yes, we went to school in the sea, though you mayn't believe it—'
                'I never said I didn't!' interrupted Alice.
                'You did,' said the Mock Turtle.
            </p>
            <div>
                <span class="badge">Posted 2012-08-02 20:47:04</span>
                <div class="pull-right"><span class="label label-default">alice</span>
                    <span class="label label-primary">story</span>
                    <span class="label label-success">blog</span>
                    <span class="label label-info">personal</span>
                    <span class="label label-warning">Warning</span>
                <span class="label label-danger">Danger</span>
                </div>
            </div>
            <hr>
            <h1>Revolution has begun!</h1>
            <p>'I am bound to Tahiti for more men.'
                'Very good. Let me board you a moment—I come in peace.' With that he leaped from the canoe, swam to the boat; and climbing the gunwale, stood face to face with the captain.
                'Cross your arms, sir; throw back your head. Now, repeat after me. As soon as Steelkilt leaves me, I swear to beach this boat on yonder island, and remain there six days. If I do not, may lightning strike me!'A pretty scholar,' laughed the Lakeman. 'Adios, Senor!' and leaping into the sea, he swam back to his comrades.
            </p>
            <div>
                <span class="badge">Posted 2012-08-02 20:47:04</span>
                <div class="pull-right"><span class="label label-default">alice</span>
                    <span class="label label-primary">story</span>
                    <span class="label label-success">blog</span>
                    <span class="label label-info">personal</span>
                    <span class="label label-warning">Warning</span>
                    <span class="label label-danger">Danger</span>
                </div>
            </div>
            <hr>

            <c:forEach var="i" begin="0" end="${pageScope.values().size()}">
                <h2>${pageScope.values().toArray()[i]}</h2>
                <!--<h1>Revolution has begun!</h1>
                <p>'I am bound to Tahiti for more men.'
                    'Very good. Let me board you a moment—I come in peace.' With that he leaped from the canoe, swam to the boat; and climbing the gunwale, stood face to face with the captain.
                    'Cross your arms, sir; throw back your head. Now, repeat after me. As soon as Steelkilt leaves me, I swear to beach this boat on yonder island, and remain there six days. If I do not, may lightning strike me!'A pretty scholar,' laughed the Lakeman. 'Adios, Senor!' and leaping into the sea, he swam back to his comrades.
                </p>
                <div>
                    <span class="badge">Posted 2012-08-02 20:47:04</span>
                    <div class="pull-right"><span class="label label-default">alice</span>
                        <span class="label label-primary">story</span>
                        <span class="label label-success">blog</span>
                        <span class="label label-info">personal</span>
                        <span class="label label-warning">Warning</span>
                        <span class="label label-danger">Danger</span>
                    </div>
                </div>-->
            </c:forEach>

        </div>
    </div>

<script src="https://ajax.googleapis.com/libs/jquery/1.11.2/jquery.min.js"/>
<script src="${contextPath}/resources/js/bootstrap.min.ja"/>
</body>
</html>
