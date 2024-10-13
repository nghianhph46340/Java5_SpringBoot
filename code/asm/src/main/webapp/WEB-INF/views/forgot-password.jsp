<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu</title>
</head>
<body>
<h2>Quên Mật Khẩu</h2>

<c:if test="${not empty error}">
    <div style="color:red;">${error}</div>
</c:if>

<c:if test="${not empty message}">
    <div style="color:green;">${message}</div>
</c:if>

<form action="/user/forgot-password" method="post">
    <label for="email">Email của bạn:</label>
    <input type="email" id="email" name="email" required>
    <br><br>
    <input type="submit" value="Gửi Yêu Cầu">
</form>
</body>
</html>
