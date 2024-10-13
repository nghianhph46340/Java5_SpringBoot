<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Nhập</title>
</head>
<body>
<h2>Đăng Nhập</h2>
<form action="/user/login" method="post">
    <label for="username">Tên đăng nhập:</label>
    <input type="text" id="username" name="username" required><br><br>

    <label for="password">Mật khẩu:</label>
    <input type="password" id="password" name="password" required><br><br>

    <input type="submit" value="Đăng Nhập">
</form>
</body>
</html>
