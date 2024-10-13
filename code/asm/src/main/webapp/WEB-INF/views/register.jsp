<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Ký</title>
</head>
<body>
<h2>Đăng Ký Tài Khoản</h2>
<form action="/user/register" method="post">
    <label for="username">Tên đăng nhập:</label>
    <input type="text" id="username" name="username" required><br><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>

    <label for="password">Mật khẩu:</label>
    <input type="password" id="password" name="password" required><br><br>

    <input type="submit" value="Đăng Ký">
</form>
</body>
</html>
