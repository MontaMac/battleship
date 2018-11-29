<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:if test="${not myGame.myTurn}">
        <meta http-equiv="refresh" content="5">
    </c:if>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <title>Game</title>
    <style>
        div {
            display: inline-block;
        }

        td.EMPTY {
            background-color: azure;
        }
        td.SHIP {
            background-color: black;
        }
        td.MISS {
            background-color: aqua;
        }
        td.HIT {
            background-color: red;
        }
    </style>
</head>
<body>
<form method="post" action="game">
    <div>
        <table class="w3-table-all">
        <tr>
            <td>&nbsp;</td>
            <c:forEach items="A,B,C,D,E,F,G,H,I,J" var="col">
                <td>${col}</td>
            </c:forEach>
        </tr>
        <c:forEach begin="1" end="10" var="row">
            <tr>
                <td>${row}</td>
                <c:forEach items="A,B,C,D,E,F,G,H,I,J" var="col">
                    <c:set var="addr" value ="${col}${row}"/>
                    <td class = "${myGame.user.enemyField.getState(addr)}">
                        <c:if test="${myGame.myTurn}">
                                <input type="radio" name="cell" value="${addr}">
                        </c:if>
                        &nbsp;
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    </div>

    <div>
    <table class="w3-table-all">
        <tr>
            <td>&nbsp;</td>
            <c:forEach items="A,B,C,D,E,F,G,H,I,J" var="col">
                <td>${col}</td>
            </c:forEach>
        </tr>
        <c:forEach begin="1" end="10" var="row">
            <tr>
                <td>${row}</td>
                <c:forEach items="A,B,C,D,E,F,G,H,I,J" var="col">
                    <c:set var="addr" value ="${col}${row}"/>
                    <td class = "${myGame.user.myField.getState(addr)}">

                        &nbsp;
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    </div>
    <c:if test="${myGame.myTurn}">
        <button type="submit">Fire!</button>
    </c:if>
</form>
</body>
</html>
