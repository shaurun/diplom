<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Руководство пользователя</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="icon"
          type="image/png"
          href="${contextPath}/resources/favicon.ico"/>
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
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li><a href="<c:url value='/subjects'/>">Дисциплины</a></li>
                    </c:if>
                    <li class="active"><a href="<c:url value='/tutorial'/>">Как это работает?</a></li>
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


        <div class="page-header">
            <h1>FAQ - Изучение слов онлайн</h1>
            <p class="text-muted">Руководство пользователя.</p>
        </div>

        <p class="lead">Какой принцип работы у сайта по изучению слов?</p>
        <div class="well well-sm">
            <p>Суть сервиса очень проста. После того как вы составите свой список слов и
                выражений с переводом на изучаемый язык, вы сможете проходить тестирования по ним.

        <c:if test="${pageContext.request.userPrincipal.name == null}">
            Ваш словарь индивидуален. Поэтому, чтобы система могла персонализировать ваш словарь,
                Вы должны быть авторизованы.
        </c:if>
            </p>
        </div>

        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <p class="lead">Что такое авторизация?</p>
            <div class="well well-sm">
                <p>Авторизация - это своего рода знакомство системы с Вами. Вы представляетесь системе, а система
                    Вас запоминает. Чтобы авторизироваться, вам нужно сначала представиться сайту,
                    то есть <a href="${contextPath}/registration">создать аккаунт</a>.
                    Даже если система знакома с Вами, не всегда она сразу Вас распознает. Если в правом верхнем углу Вы
                    не видите своего имени, значит, система вас не узнала.
                    Поздоровайтесь с ней: <a href="${contextPath}/login">войдите</a>.
                </p>
            </div>
        </c:if>

        <p class="lead" id="tomem">Как составить словарь?</p>
        <div class="well well-sm">
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <p>Для того, чтобы составить словарь, вы должны быть авторизованы.</p>
            </c:if>
            <p>Выберите в меню пункт Дисциплины.</p>
            <p>Если список ваших дисциплин пуст, создайте одну, например, "Английский язык".</p>
            <p>Выберите дисциплину и пункт Без урока.</p>
            <p>Добавляйте слова и значения!</p>
        </div>

        <p class="lead">Как можно отсортировать слова?</p>
        <div class="well well-sm">
            <p>Во-первых, слова автоматически сортируются по дисциплинам. Это как учить английский язык и японский язык.
            Дисциплины разные - значит, разные словари. Но часто и внутри дисциплины нужна сортировка!</p>
            <p>Для этого сервис предусматривает <strong>сортировку по урокам и темам</strong>.</p>
            <p>Создавайте уроки, чтобы следовать своей учебной программе, и записывайте слова внутри урока.</p>
            <p>Создавайте темы, чтобы помечать слова тематически, и используйте тематические метки.</p>
        </div>

        <p class="lead">Как приступить к упражнениям?</p>
        <div class="well well-sm">
            <p>Самый простой способ - войти в урок или тему, и нажать кнопку Упражнение. Так в упражнение
            попадут только те слова, которые относятся к уроку или теме. Упражнение со словами без урока тоже работает!
            </p>
        </div>

        <p class="lead" >Как настроить упраженения?</p>
        <div class="well well-sm">
            <p>Настройка упражнений позволит вас включать в упражнение именно тот список слов, который вы хотите.</p>
            <p>Чтобы настроить упражнение, нажмите на вкладку упражнения в верхнем меню.</p>
            <p>Выберите дисциплину.</p>
            <p>Отметьте те уроки и темы, которые вы хотите включить в упражнение.</p>
            <p>Если вы не хотите, чтобы в упражнении встречались повторы, снимите галочку с пункта "Повторы".</p>
            <p>Если вы хотите, чтобы список слов в упражнении не превышал некоторой длины, выберите, сколько в упражнении
            должно быть слоов.</p>
            <p>Нажмите "Начать упражнение"!</p>
        </div>

        <p class="lead" id="vkeyboard">Что делать? Мне нужна клавиатура изучаемого языка.</p>
        <div class="well well-sm">
            <p>Воспользуйтесь браузером
                <a href="https://www.google.ru/chrome/browser/desktop/">Google Chrome</a>
                и <a href="https://chrome.google.com/webstore/detail/google-input-tools/mclkkofklkfljcocdinagocijmpgbhab?hl=ru">расширением Инструменты ввода Google</a>.</p>
        </div>

</div><!-- End container -->


<script src="https://ajax.googleapis.com/libs/jquery/1.11.2/jquery.min.js"/>
<script src="${contextPath}/resources/js/bootstrap.min.ja"/>
</body>
</html>
