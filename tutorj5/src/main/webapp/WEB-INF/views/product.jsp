<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <table class="table table-hover">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Status</th>
        </tr>
        <c:forEach items="${list}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.category}</td>
                <td>${p.price}</td>
                <td>${p.status}</td>
                <td><a href="/detail/${p.id}">Detail</a></td>
                <td><a href="/delete/${p.id}">Xoa</a></td>
            </tr>
        </c:forEach>
    </table>
    <form method="post" action="/update/${pr.id}">
        <div class="mb-3">
            <label for="exampleInputEmail1" class=" form-label">ID</label>
            <input type="text" class="form-control" name="id" value="${pr.id}" id="exampleInputEmail1" aria-describedby="emailHelp">

        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Name</label>
            <input type="text" class="form-control"value="${pr.name}" name="name" id="exampleInputPassword1">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Price</label>
            <input type="number" class="form-control" value="${pr.price}" name="price" id="exampleInputPassword1">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Category</label>
            <select class="form-select" name="category" aria-label="Default select example">
<%--                <option selected>Chon di na`</option>--%>
                <c:forEach var="op" items="${listcate}">
                    <option value="${op.name}" ${op.name == pr.category? 'selected':''}>Danh muc ${op.name}</option>
                </c:forEach>
            </select>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Status</label> <br>
                <input type="radio" class="btn-check" name="status" value="yes" id="option5" autocomplete="off" ${pr.status == "yes"?"checked":""}>
                <label class="btn" for="option5">Yes</label>

                <input type="radio" class="btn-check" name="status" value="no" id="option6" autocomplete="off" ${pr.status == "no"?"checked":""}>
                <label class="btn" for="option6">No</label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Add</button>
    </form>
</div>
</body>
</html>