<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý bạn bè</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Quản lý bạn bè</h1>
    <form class="mb-4" method="post" action="/ban/add">
        <div class="form-row">
            <div class="form-group col-md-3">
                <label for="ma">Mã:</label>
                <input type="text" class="form-control" id="ma" name="ma" value="${ban.ma}" placeholder="Mã">
            </div>
            <div class="form-group col-md-3">
                <label for="ten">Tên:</label>
                <input type="text" class="form-control" id="ten" name="ten" value="${ban.ten}" placeholder="Tên">
            </div>
            <div class="form-group col-md-3">
                <label for="sothich">Sở thích:</label>
                <input type="text" class="form-control" id="sothich" name="sothich" value="${ban.sothich}"
                       placeholder="Sở thích">
            </div>
            <div class="form-group col-md-3">
                <label>Giới tính:</label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gioitinh" ${ban.gioitinh == 1? "checked":""}
                               id="nam" value="1">
                        <label class="form-check-label" for="nam">Nam</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gioitinh" ${ban.gioitinh == 0? "checked": ""}
                               id="nu" value="0">
                        <label class="form-check-label" for="nu">Nữ</label>
                    </div>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-success">Add</button>
    </form>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã bạn</th>
            <th>Tên bạn</th>
            <th>Sở thích</th>
            <th>Giới tính</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="l" varStatus="c">
            <tr>
                <td>${c.count}</td>
                <td>${l.ma}</td>
                <td>${l.ten}</td>
                <td>${l.sothich}</td>
                <td>${l.gioitinh==1? "Nam": "Nữ"}</td>
                <td><a href="/ban/detail/" class="btn btn-info">Detail</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>