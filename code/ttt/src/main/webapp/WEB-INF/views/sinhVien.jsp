<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form action="sinh-vien/add" method="post">

    <p>name:<input type="text" name="name"></p>
    <p>address:<input type="text" name="address"></p>
    <p>age:<input type="text" name="age"></p>
    <p>status:<input type="radio" name="status" value="active">active
        <input type="radio" name="status" value="inactive">inactive</p>
    <p>lop hoc:<select name="lopHoc">
        <c:forEach items="${lop}" var="l">
            <option value="${l.id}">${l.class_name}</option>
        </c:forEach>

    </select></p>
    <button type="submit">them</button>
</form>
<table border="1">
    <thead>
    <tr>
        <td>id</td>
        <td>name</td>
        <td>address</td>
        <td>age</td>
        <td>status</td>
        <td>lop</td>
        <td>action</td>

    </tr>
    </thead>
    <tbody>

    <c:forEach items="${list}" var="s">
        <tr>
            <td>${s.id}</td>
            <td>${s.name}</td>
            <td>${s.address}</td>
            <td>${s.age}</td>
            <td>${s.status}</td>
            <td>${s.lopHoc.class_name}</td>
            <td><a href="/delete/${s.id}">delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<table border="1">
    <tr>
        <td>ten</td>
        <td>chi so</td>
    </tr>
    <c:forEach items="${listChiSo}" var="cs">
        <tr>
            <td>${cs.className}</td>
            <td>${cs.siSo}</td>
        </tr>
    </c:forEach>
</table>

<c:choose>
    <c:when test="${a == 0}">
        <a href="/page?page=${0}&size=3"> <= </a>
    </c:when>
    <c:otherwise>
        <a href="/page?page=${a-1}&size=3"> <= </a>
    </c:otherwise>
</c:choose>
<h3>${a+1}</h3>
<c:choose>
    <c:when test="${a == b - 1}">
        <a href="/page?page=${a}&size=3"> => </a>
    </c:when>
    <c:otherwise>
        <a href="/page?page=${a+1}&size=3"> => </a>

    </c:otherwise>
</c:choose>
</body>
</html>