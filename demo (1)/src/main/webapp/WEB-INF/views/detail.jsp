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
    <%--<h1>ID: ${user.id}</h1>--%>
    <%--<h1>Họ và tên: ${user.name}</h1>--%>
<h2>Danh sach User</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
    </tr>
       <tr>
           <td>${user.id}</td>
           <td>${user.name}</td>
       </tr>
</table>
</body>
</html>