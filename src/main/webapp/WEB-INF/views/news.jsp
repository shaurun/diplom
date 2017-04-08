<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <link rel="icon"
          type="image/png"
          href="${contextPath}/resources/favicon.ico" />
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        td, th {
            padding: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
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
                    <li><a href="<c:url value='/admin'/>">Панель администратора</a></li>
                    <li class="active"><a href="<c:url value='/news'/>">Статьи</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li>
                            <form id="logoutForm" method="post" action="${contextPath}/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </li>
                        <li><p class="navbar-text">Вы вошли как: <b>${pageContext.request.userPrincipal.name}</b></p>
                        </li>
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
        <div class="col-md-5 col-md-offset-3">
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
                    <form:input cssStyle="min-width: 500px;" path="title"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="info">
                        <spring:message text="Cодержание"/>
                    </form:label>
                </td>
                <td>
                    <form:textarea cssStyle="min-width: 500px; min-height: 200px" path="info"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="published">
                        <spring:message text="Опубликовать?"/>
                    </form:label>
                </td>
                <td>
                    <form:checkbox path="published"/>
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
            </div>
        </div>

    <h1>Список новостей</h1>
    <c:if test="${!empty listNews}">
        <table>
            <tr>
                <th>Заголовок</th>
                <th style="max-width: 700px">Содержание</th>
                <th>Дата создания</th>
                <th>Опубликовано?</th>
                <th>Изменить</th>
                <th>Удалить</th>
            </tr>
            <c:forEach items="${listNews}" var="news">
                <tr>
                    <td><a href="<c:url value='/newsData/${news.id}'/>">${news.title}</a></td>
                    <td style="max-width: 700px">${news.info}</td>
                    <td>${news.date}</td>
                    <td>
                        <c:if test="${news.published == true}"><span class="glyphicon glyphicon-ok text-success"/></c:if>
                        <c:if test="${news.published == false}"><span class='glyphicon glyphicon-remove text-warning'/></c:if>
                    </td>
                    <td><a href="<c:url value='/edit/${news.id}'/>">Изменить</a></td>
                    <td><a href="<c:url value='/delete/${news.id}'/>">Удалить</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>



    <footer>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                <a href="<c:url value='/admin'/>">Управление сайтом</a>
            </c:if>
        </c:if>
    </footer>
</div>






<script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>
</body>
</html>
