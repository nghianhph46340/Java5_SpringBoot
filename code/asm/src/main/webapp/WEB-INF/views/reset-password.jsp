<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Lại Mật Khẩu</title>
</head>
<body>
<h2>Đặt Lại Mật Khẩu</h2>

<c:if test="${not empty error}">
    <div style="color:red;">${error}</div>
</c:if>

<form action="/user/reset-password" method="post">
    <input type="hidden" name="token" value="${token}">
    <label for="password">Mật khẩu mới:</label>
    <input type="password" id="password" name="password" required>
    <br><br>

    <label for="confirm-password">Xác nhận mật khẩu mới:</label>
    <input type="password" id="confirm-password" name="confirmPassword" required>
    <br><br>

    <input type="submit" value="Đặt Lại Mật Khẩu">
</form>
</body>
</html>
