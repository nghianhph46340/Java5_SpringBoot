<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <style>
        .cart-container {
            width: 60%;
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            border: 1px solid #ddd;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .cart-item img {
            width: 100px;
            height: auto;
        }

        .checkout {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            cursor: pointer;
        }
        header {
            background-color: #333;
            color: white;
            padding: 10px 0;
            text-align: center;
        }

        header nav ul {
            list-style-type: none;
            padding: 0;
        }

        header nav ul li {
            display: inline;
            margin: 0 15px;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<header>
    <h1>Cửa Hàng Trực Tuyến</h1>
    <nav>
        <ul>
            <li><a href="#">Trang Chủ</a></li>
            <li><a href="#">Sản Phẩm</a></li>
            <li><a href="#">Loại Hàng</a></li>
            <li><a href="#">Liên Hệ</a></li>
        </ul>
    </nav>
</header>
<header>
    <h1>Giỏ Hàng</h1>
</header>

<section class="cart-container">
    <c:if test="${empty listHDCT}">
        <p>Giỏ hàng của bạn hiện đang trống.</p>
    </c:if>
    <c:if test="${not empty listHDCT}">
        <div>
            <c:set var="totalAmount" value="0"/>
            <c:forEach items="${listHDCT}" var="lhdct">
                <div class="cart-item">
                    <img src="" alt="${lhdct.ctsp.san_pham.ten_san_pham}">
                    <div>
                        <h3>${lhdct.ctsp.san_pham.ten_san_pham}</h3>
                        <p>Giá: ${lhdct.ctsp.gia_ban} VNĐ</p>
                        <p>Số lượng: ${lhdct.so_luong_mua}</p>
                        <p>Tong : ${lhdct.so_luong_mua*lhdct.ctsp.gia_ban} VNĐ</p>
                    </div>
                </div>
                <c:set var="totalAmount" value="${totalAmount + (lhdct.so_luong_mua * lhdct.ctsp.gia_ban)}"/>
            </c:forEach>
                <div class="cart-item">
<h2 style="color: red">TONG HOA DON:${totalAmount} VNĐ</h2>
                </div>
        </div>
        <button class="checkout">Thanh Toán</button>
    </c:if>
</section>

<footer>
    <p>&copy; 2024 Cửa Hàng Trực Tuyến. Tất cả các quyền được bảo lưu.</p>
</footer>
</body>
</html>
