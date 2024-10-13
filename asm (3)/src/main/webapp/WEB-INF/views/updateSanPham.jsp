<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>Document</title>
</head>
<style>
    .sidebar {
        height: 800px;
        width: 250px;
        background-color: #333333;
        margin-top: 50px;
    }

    .sidebar .nav-link {
        color: #ecf0f1;
        text-decoration: none;
        padding: 15px;
        display: block;
    }

    .sidebar .nav-link.active {
        background-color: #2980b9;
        color: white;
    }

    .sidebar-input {
        margin-bottom: 15px;
    }

    .sidebar-section {
        margin-bottom: 20px;
    }

    .sidebar-section h5 {
        font-size: 14px;
        color: #6c757d;
        margin-bottom: 5px;
    }

    .sidebar-section .value {
        font-size: 18px;
        font-weight: bold;
    }
</style>
<body>
<div class="d-flex">
    <nav class=" sidebar pt-3 ms-5">
        <ul class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <li class="nav-item text-center active">
                <img src="../views/imge/logoAgoni-hihi.png" alt="" class="w-75">
            </li>
            <li class="nav-item">
                <a class="nav-link active" id="v-pills-overview-tab" data-bs-toggle="pill" href="#v-pills-overview"
                   role="tab" aria-controls="v-pills-overview" aria-selected="true">
                    <i class="bi bi-house-door"></i> Tổng quan
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="v-pills-orders-tab" data-bs-toggle="pill" href="#v-pills-orders" role="tab"
                   aria-controls="v-pills-orders" aria-selected="false">
                    <i class="bi bi-card-checklist"></i> Đơn hàng
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="v-pills-shipping-tab" data-bs-toggle="pill" href="#v-pills-shipping"
                   role="tab" aria-controls="v-pills-shipping" aria-selected="false">
                    <i class="bi bi-truck"></i> Vận chuyển
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="products-tab" data-bs-toggle="collapse" href="#accordionContainer" role="button"
                   aria-expanded="true" aria-controls="accordionContainer">
                    <i class="bi bi-box-seam"></i> Sản phẩm
                </a>
            </li>
            <div class="collapse" id="accordionContainer">
                <div class="accordion" id="accordionExample">
                    <!-- Accordion 1 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <a href="#v-pills-products" id="v-pills-products-tab" data-bs-toggle="pill"
                               class="accordion-button" aria-expanded="false" role="tab"
                               aria-controls="v-pills-products" aria-selected="false">
                                Danh sách sản phẩm
                            </a>
                        </h2>
                    </div>

                    <!-- Accordion 2 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <a href="#v-pills-productsDetail" id="v-pills-productsDetail-tab" data-bs-toggle="pill"
                               class="accordion-button" aria-expanded="false" role="tab"
                               aria-controls="v-pills-products" aria-selected="false">
                                Chi tiết sản phẩm
                            </a>
                        </h2>
                    </div>
                </div>
            </div>
            <li class="nav-item">
                <a class="nav-link" id="v-pills-customers-tab" data-bs-toggle="pill" href="#v-pills-customers"
                   role="tab" aria-controls="v-pills-customers" aria-selected="false">
                    <i class="bi bi-person"></i> Khách hàng
                </a>
            </li>

            <div class="text-white border-dark-subtle pb-2  border-bottom"></div>
            <li class="nav-item">
                <a class="nav-link" id="v-pills-sells-tab" data-bs-toggle="pill" href="#v-pills-sells"
                   role="tab" aria-controls="v-pills-sells" aria-selected="false">
                    <i class="fa-duotone fa-solid fa-cash-register"></i> Bán hàng
                </a>

            </li>

        </ul>
    </nav>
    <div class="content d-flex d-flex justify-content-evenly ">
        <form action="/admin/update/${detailSP.id}" method="post">
            <div class="mb-3">
                <label class="form-label">Mã</label>
                <input type="text" class="form-control"
                       value="${detailSP.ma_san_pham}"
                       name="ma_san_pham" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Tên</label>
                <input type="text" class="form-control"
                       value="${detailSP.ten_san_pham}"
                       name="ten_san_pham" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Ngày tạo</label>
                <input type="date" class="form-control" required
                       value="${detailSP.ngay_tao}"
                       name="ngay_tao">
            </div>
            <div class="mb-3">
                <label class="form-label">Ngày sửa</label>
                <input type="date" class="form-control" required
                       value="${detailSP.ngay_sua}"
                       name="ngay_sua">
            </div>
            <div class=" mb-3">
                <label class="form-check-label">
                    Trạng thái
                </label>
                <div class="form-check">
                    <input class="form-check-input" type="radio"
                           name="trang_thai"
                           value="active" ${detailSP.trang_thai=="active"?"checked":":"}>
                    <label class="form-check-label">
                        Active
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio"
                           name="trang_thai"
                           value="inactive" ${detailSP.trang_thai=="inactive"?"checked":":"}>
                    <label class="form-check-label">
                        Inactive
                    </label>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Danh
                    mục</label>
                <select class="form-select" required
                        name="danhMuc">
                    <option value="">Chọn danh mục</option>
                    <c:forEach items="${listDanhMuc}" var="l">
                        <option value="${l.id}" ${l.id == detailSP.danhMuc.id_danh_muc}>${l.ten_danh_muc}</option>
                    </c:forEach>

                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">Đóng
                </button>
                <button type="submit" class="btn btn-primary">
                    Thêm
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>