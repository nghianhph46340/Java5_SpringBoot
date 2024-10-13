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
<h1>DANH SACH BANH TRUNG THU</h1>
<c:if test="${param.msg==1}">
    <h3>Xoa thanh cong</h3>
</c:if>
<table border="1">
    <tr>
        <td>id</td>
        <td>ten</td>
        <td>gia</td>
        <td>ngon</td>
        <td>action</td>

    </tr>
    <c:forEach items="${list}" var="b">
        <tr>
            <td>${b.id}</td>
            <td>${b.ten}</td>
            <td>${b.gia}</td>
            <td>${b.ngon?"Ngon":"Khong"}</td>
            <td><a onclick="return confirm('ban co muon xoa khong')" href="xoa/${b.id}">xoa</a>
                <a href="sua?id=${b.id}">sua</a>
                <a href="detail?id=${b.id}">detail</a>
            </td>
        </tr>
    </c:forEach>
</table>
<c:if test="${list.size()==0}">
    <h4>DANH SACH TRONG</h4>
</c:if>
</body>
</html>