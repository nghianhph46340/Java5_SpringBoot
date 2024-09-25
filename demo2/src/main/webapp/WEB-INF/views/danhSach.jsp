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
<link rel="stylesheet" href="../views/css/bootstrap.min.css">
<body>
<div class="container">
    <form action="/user/add" method="post">
        <label for="">id</label>
        <input type="text" name="id">
        <label for="">name</label>
        <input type="text" name="name">
        <button type="submit">ADD</button>
    </form>
    <table class="table-hover">
        <tr>
            <th>ID</th>
            <th>Name</th>
        </tr>
        <c:forEach items="${list}" var="l">
            <tr>
                <td>${l.id}</td>
                <td><a href="/detail/${l.id}">${l.name}</a></td>
                <td>Detail</td>
            </tr>
        </c:forEach>
    </table>
</div>


</body>
</html>