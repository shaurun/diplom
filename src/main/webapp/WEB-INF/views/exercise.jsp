<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Словарь</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
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

    <h1>This is sparta</h1>

    <div class="row">
    <c:if test="${!empty listWords}">
        <table class="table table-striped">
            <thead>
            <h2>Словарь урока</h2>
            <tr>
                <th>Слово</th>
                <th>Значение</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listWords}" var="word">
                <tr>
                    <td>${word.word}</td>
                    <td>${word.translation}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    </div>

    <script>
        var i = 0;
        const end = ${listWords.size()};

        function generateDictionary() {
            var dict = [];
            <c:forEach items="${listWords}" var="word">
            dict.push({
                key: "${word.word}",
                value: "${word.translation}"
            });
            </c:forEach>
            return dict;
        }

        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            } else {
                window.onload = function() {
                    if (oldonload) {
                        oldonload();
                    }
                    func();
                }
            }
        }

        function setWord() {
            var o = document.getElementById("word");
            o.innerHTML = generateDictionary()[i].key;
            //document.getElementById("translation").addEventListener("onfocusout", checkWord());
        }

        function checkWord() {
            var word = document.getElementById("word").innerHTML;
            var o = document.getElementById("check");
            if (document.getElementById("translation").value == generateDictionary()[i].value) {
                o.setAttribute("class", "glyphicon glyphicon-ok form-control-feedback");
                document.getElementById("dict").setAttribute("class", "form-group has-success has-feedback");
            } else {
                o.setAttribute("class", "glyphicon glyphicon-remove form-control-feedback");
                document.getElementById("dict").setAttribute("class", "form-group has-error has-feedback");
            }

        }

        function iter(){
            if (i < end) {
                i++;
            }
            setWord();
        }

        addLoadEvent(setWord);
    </script>

    <form class="form-horizontal">
        <fieldset>
            <div id="dict" class="form-group">
                <label class="control-label col-sm-2 col-sm-push-4" id="word" for="translation"></label>
                <div class="col-sm-2 col-sm-push-4">
                    <input autocomplete="off" onchange="checkWord()" class="form-control" type="text" id="translation"/>
                    <span id="check"></span>
                </div>
            </div>
            <input type="button" value="check" onclick="iter()"/>
        </fieldset>
    </form>
</div>
</body>
</html>
