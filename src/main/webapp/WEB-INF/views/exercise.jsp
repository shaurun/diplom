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

    <h1>Тестирование знаний</h1>

    <script>
        var i = 0;
        const end = ${listWords.size()};
        var wrong = 0;
        var checked = false;

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
            document.getElementById("translation").value = "";
            document.getElementById("check").setAttribute("class", "");
            document.getElementById("dict").setAttribute("class", "form-group");
        }

        function checkWord() {
            if (document.getElementById("translation").value.trim() == "") {
                return;
            }

            var word = document.getElementById("word").innerHTML;
            var o = document.getElementById("check");
            if (document.getElementById("translation").value == generateDictionary()[i].value) {
                o.setAttribute("class", "glyphicon glyphicon-ok form-control-feedback");
                document.getElementById("dict").setAttribute("class", "form-group has-success has-feedback");
                document.getElementsByName("verification_icon")[i].innerHTML =
                    "<span class='glyphicon glyphicon-ok text-success'/>"
                document.getElementsByName("single_word")[i].setAttribute("class", "bg-success");
            } else {
                o.setAttribute("class", "glyphicon glyphicon-remove form-control-feedback");
                document.getElementById("dict").setAttribute("class", "form-group has-error has-feedback");
                document.getElementsByName("verification_icon")[i].innerHTML =
                    "<span class='glyphicon glyphicon-remove text-warning'/>";
                document.getElementsByName("single_word")[i].setAttribute("class", "bg-danger");
                wrong++;

            }
            document.getElementsByName("user_input")[i].innerHTML = document.getElementById("translation").value;

            checked = true;
        }

        function iter(){
            if(!checked) {
                checkWord();
                return;
            }
            document.getElementById("pb").setAttribute("style", "width:"+(i+1)/end*100+"%");
            document.getElementById("pb").innerHTML=(i+1)+"/"+end;
            if (i < end-1) {
                i++;
                setWord();
                checked = false;

            }else{
                document.getElementById("exercise").setAttribute("style", "display:block");
                var result = document.getElementById("result");
                result.setAttribute("style", "display: block;");
                if ((end-wrong)/end*100 == 100) {
                    result.setAttribute("class", "alert alert-success");
                    result.innerHTML = "<strong>Отлично!</strong> Все ответы верные!";
                } else if ((end-wrong)/end*100 > 80) {
                    result.setAttribute("class", "alert alert-info");
                    result.innerHTML = "<strong>Хорошо.</strong> Вы почти усвоили материал, нужно только закрепить!";
                } else if ((end-wrong)/end*100 > 50) {
                    result.setAttribute("class", "alert alert-warning");
                    result.innerHTML = "<strong>Неплохо.</strong> Вы запомнили более половины слов!";
                } else {
                    result.setAttribute("class", "alert alert-danger");
                    result.innerHTML = "<strong>Взбодритесь.</strong> Результат пока оставляет желать лучшего, но вы идете к успеху!";
                }
            }
        }

        addLoadEvent(setWord);
    </script>

    <div class="row">
    <form onsubmit="iter(); return false;" class="form-horizontal">
        <fieldset>
            <div id="dict" class="form-group">
                <label class="control-label col-sm-3" id="word" for="translation"></label>
                <div class="col-sm-3">
                    <input autocomplete="off" class="form-control" type="text" id="translation"/>
                    <span id="check"></span>
                </div>
                <div class="col-sm-1">
                    <input type="submit" value="" style="background: url(${contextPath}/resources/right_arrow.png) no-repeat;
                       cursor: pointer; border: none; background-size: contain; background-position: center;
                            min-width: 124px; height: 34px"/>
                </div>
            </div>

        </fieldset>
    </form>
    </div>

    <p>Шкала прогресса</p>
    <div class="progress">
        <div class="progress-bar" role="progressbar" id="pb"
             aria-valuemin="0" aria-valuemax="100" style="width:0%">
            0/${listWords.size()}
        </div>
    </div>

    <div id="result" style="display: none">
    </div>

    <div id="exercise" class="row" style="display: none">
        <c:if test="${!empty listWords}">
        <table class="table table-hover">
            <thead>
            <h2>Слова упражнения</h2>
            <tr>
                <th>Слово</th>
                <th>Значение</th>
                <th>Ваш вариант</th>
                <th>Правильно</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listWords}" var="word">
                <tr name="single_word">
                    <td>${word.word}</td>
                    <td>${word.translation}</td>
                    <td name="user_input"></td>
                    <td name="verification_icon"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    </div>
</div>
</body>
</html>
