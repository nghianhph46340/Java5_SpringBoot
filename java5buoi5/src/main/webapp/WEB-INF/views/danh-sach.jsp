<!doctype html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h2>Danh sach sinh vien</h2>
<form action="/add" method="post">
    <%--    <lable>ID</lable>--%>
    <%--    <input type="text" name="id"><br>--%>
    <lable>address</lable>
    <input type="text" name="address" value="${sv.address}"><br>
    <lable>name</lable>
    <input type="text" name="name" value="${sv.name}"><br>
    <lable>age</lable>
    <input type="text" name="age" value="${sv.age}"><br>
    <lable>Status</lable>
    <input type="radio" name="status" ${sv.status == "active"? "checked":""} value="active">Active
    <input type="radio" name="status" ${sv.status == "inactive"? "checked":""} value="inactive">Inative <br>
    <lable>ClassName</lable>
    <select name="lopHoc" id="">
<%--        <option value="" selected>${sv.lopHoc.className}</option>--%>
        <c:forEach items="${listClass}" var="lstC">
            <option value="${lstC.id}" ${lstC.id == sv.lopHoc.id? 'selected="selected"':''}>${lstC.className}</option>
        </c:forEach>
    </select><br>
    <button type="submit">ADD</button>
</form>
<table>
    <thead>
    <tr>
        <td>ID</td>
        <td>name</td>
        <td>address</td>
        <td>age</td>
        <td>Status</td>
        <td>ClassName</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sinhVien" items="${list}">
        <tr>
            <td>${sinhVien.id}</td>
            <td>${sinhVien.name}</td>
            <td>${sinhVien.address}</td>
            <td>${sinhVien.age}</td>
            <td>${sinhVien.status}</td>
            <td>${sinhVien.lopHoc.className}</td>
            <td><a href="/delete/${sinhVien.id}">Xoa</a></td>
            <td><a href="/detail/${sinhVien.id}">Detail</a></td>
        </tr>
    </c:forEach>
    </tbody>
<%--    <c:forEach>--%>
    <button><a href="/page?page=0&size=3">Min</a></button>
    <button><a href="/page?page=${trangHien-1}&size=3">Pre</a></button>
    <button><a href="/page?page=${trangHien+1}&size=3">Next</a></button>
    <button><a href="/page?page=${maxTrang-1}&size=3">Max</a></button>
<%--    </c:forEach>--%>
</table>
</body>
</html>
