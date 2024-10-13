<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ Bán Hàng</title>

</head>
<body>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
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

    #categories {
        background-color: #f4f4f4;
        padding: 20px;
        text-align: center;
    }

    .category {
        display: inline-block;
        width: 30%;
        margin: 20px;
        padding: 20px;
        border: 1px solid #ddd;
    }

    #products {
        padding: 20px;
        text-align: center;
    }

    .product {
        display: inline-block;
        width: 30%;
        margin: 20px;
        padding: 20px;
        border: 1px solid #ddd;
    }

    .product img {
        width: 100%;
        height: auto;
    }

    footer {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 10px 0;
        margin-top: 20px;
    }

</style>
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

<section id="categories">
    <h2>Loại Hàng</h2>
    <div class="category">
        <h3>Điện Thoại</h3>
        <p>Khám phá các loại điện thoại mới nhất.</p>
    </div>
    <div class="category">
        <h3>Máy Tính</h3>
        <p>Laptop, PC và phụ kiện công nghệ.</p>
    </div>
    <div class="category">
        <h3>Thời Trang</h3>
        <p>Thời trang hiện đại, cập nhật xu hướng mới.</p>
    </div>
</section>

<section id="products">
    <h2>Sản Phẩm Mới</h2>
    <c:forEach items="${listCTSP}" var="lctsp">

        <div class="product">
            <img src="image1.jpg" alt="${lctsp.san_pham.ten_san_pham}">
            <h3>${lctsp.san_pham.ten_san_pham}</h3>
            <p>Giá: ${lctsp.gia_ban} VNĐ</p>
            <a href="/shop/detail/${lctsp.id}">Xem Chi Tiết</a>
        </div>
    </c:forEach>
    <h2>Sản Phẩm Mới</h2>
    <div class="product">
        <img src="image1.jpg" alt="Sản Phẩm 1">
        <h3>Tên Sản Phẩm 1</h3>
        <p>Giá: 1,000,000 VNĐ</p>
        <button onclick="viewProductDetail('Sản Phẩm 1')">Xem Chi Tiết</button>
    </div>
    <div class="product">
        <img src="image2.jpg" alt="Sản Phẩm 2">
        <h3>Tên Sản Phẩm 2</h3>
        <p>Giá: 2,000,000 VNĐ</p>
        <button onclick="viewProductDetail('Sản Phẩm 2')">Xem Chi Tiết</button>
    </div>
    <!-- Thêm nhiều sản phẩm khác tại đây -->
</section>

<footer>
    <p>&copy; 2024 Cửa Hàng Trực Tuyến. Tất cả các quyền được bảo lưu.</p>
</footer>
<table>

</table>

</body>
</html>
