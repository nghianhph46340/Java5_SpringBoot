<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm</title>

</head>
<body>
<style>
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

    .product-detail-container {
        width: 60%;
        margin: 0 auto;
        text-align: center;
        padding: 20px;
        border: 1px solid #ddd;
    }

    .product-image {
        width: 300px;
        height: auto;
        margin-bottom: 20px;
    }

    button {
        padding: 10px 20px;
        background-color: #333;
        color: white;
        border: none;
        cursor: pointer;
    }

    button:hover {
        background-color: #555;
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
<header>
    <h1>Chi Tiết Sản Phẩm</h1>
</header>

<section id="product-detail">
    <div class="product-detail-container">

        <img src="image1.jpg" alt="${product.san_pham.ten_san_pham}" class="product-image">
        <h2>${product.san_pham.ten_san_pham}</h2>
        <p><strong>MaSP:</strong> ${product.san_pham.ma_san_pham}</p>
        <p><strong>Giá:</strong> ${product.gia_ban} VNĐ</p>
        <p><strong>Size:</strong> ${product.size.ten_size}</p>
        <p><strong>Mau sac:</strong> ${product.mau_sac.ten_mau}</p>
        <p><strong>So luong ton:</strong> ${product.so_luong_ton}</p>
        <p><strong>Số lượng mua:</strong>
            <button id="decrease">-</button>
            <input style="width: 50px" type="text" id="quantity" value="1" readonly />
            <button id="increase">+</button>
        </p>
        <form action="/addCart" method="post">
            <button onclick="addToCart('${product.san_pham.ten_san_pham}')">Thêm Vào Giỏ Hàng</button>
        </form>

    </div>
</section>

<footer>
    <p>&copy; 2024 Cửa Hàng Trực Tuyến. Tất cả các quyền được bảo lưu.</p>
</footer>

<script>
    let quantity = parseInt(document.getElementById('quantity').value);

    document.getElementById('increase').addEventListener('click', function () {
        if (quantity < ${product.so_luong_ton}) {  // Check the max limit
            quantity++;
            document.getElementById('quantity').value = quantity;
        }
    });

    document.getElementById('decrease').addEventListener('click', function () {
        if (quantity > 1) {  // Check the min limit
            quantity--;
            document.getElementById('quantity').value = quantity;
        }
    });

    function addToCart(productName) {
        alert('Sản phẩm ' + productName + ' đã được thêm vào giỏ hàng!');
    }
</script>
</body>
</html>
