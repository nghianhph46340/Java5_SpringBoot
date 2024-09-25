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
<%--<c:if test="not emty ${mess}">--%>
    <p>${mess}</p>
<%--</c:if>--%>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Ten</th>
        <th>Gia</th>
        <th>Ngon</th>
    </tr>
    <c:forEach items="${list}" var="l">
        <tr>
            <td>${l.id}</td>
            <td>${l.ten}</td>
            <td>${l.gia}</td>
            <td>${l.ngon}</td>
            <td><a href="detail/${l.id}">Detail</a></td>
            <td><a href="delete/${l.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>