<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .sidebar {
            height: 100vh;
            background-color: #f8f9fa;
        }
        .main-content {
            height: 100vh;
            overflow-y: auto;
        }
        .dashboard {
            background-color: bisque;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse">
            <div class="position-sticky pt-3">
                <h2 class="h4 px-3 pb-3 border-bottom">Agoni</h2>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="/trang-chu">
                            <i class="bi bi-house-door"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item dashboard">
                        <a class="nav-link active" href="/ban-hang">
                            <i class="bi bi-cart"></i> Đơn hàng
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/san-pham">
                            <i class="bi bi-box"></i> Sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/khach-hang">
                            <i class="bi bi-people"></i> Khách hàng
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
            <!-- Header -->
            <header class="navbar navbar-light sticky-top bg-light flex-md-nowrap p-0 border-bottom">
                <div class="navbar-brand col-md-3 col-lg-2 me-0 px-3">Admin Dashboard</div>
                <input class="form-control w-50" type="text" placeholder="Tìm kiếm sản phẩm..." aria-label="Search" id="productSearch">
                <div class="navbar-nav">
                    <div class="nav-item text-nowrap">
                        <a class="nav-link px-3" href="#"><i class="bi bi-bell"></i></a>
                    </div>
                </div>
                <div class="dropdown">
                    <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end text-small shadow" aria-labelledby="dropdownUser1">
                        <li><a class="dropdown-item" href="#">Hồ sơ</a></li>
                        <li><a class="dropdown-item" href="#">Cài đặt</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                    </ul>
                </div>
            </header>

            <!-- Sales Interface Content -->
            <div class="container mt-4">
                <h1 class="h2 mb-4">Bán hàng</h1>

                <div class="row mb-4">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Danh sách sản phẩm</h5>

                                <table class="table" id="productTable">
                                    <thead>
                                    <tr class="text-center">
                                        <th>STT</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Giá bán</th>
                                        <th>Trạng thái</th>
<%--                                        <th>Ngày sửa</th>--%>
<%--                                        <th>Ngày tạo</th>--%>
                                        <th>Màu sắc</th>
                                        <th>Size</th>
                                        <th colspan="4">Hành động</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Product rows will be dynamically added here -->
                                    <c:forEach items="${listSPBanHang}" var="ct" varStatus="c">
                                        <tr>
                                            <td>${c.count}</td>
                                            <td>${ct.ten_san_pham}</td>
                                            <td>${ct.so_luong_ton}</td>
                                            <td>${ct.gia_ban}</td>
                                            <td>${ct.trang_thai}</td>
<%--                                            <td>${ct.ngay_sua}</td>--%>
<%--                                            <td>${ct.ngay_tao}</td>--%>
                                            <td>${ct.ten_mau}</td>
                                            <td>${ct.ten_size}</td>
                                            <td>
                                                <a href="/ban-hang"><button type="submit" class="btn btn-danger">Xóa</button></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Danh sách hóa đơn</h5>
                                <button class="btn btn-primary mb-3" id="addInvoiceBtn">Tạo hóa đơn mới</button>
                                <table class="table" id="invoiceTable">
                                    <thead>
                                    <tr>
                                        <th>Mã hóa đơn</th>
                                        <th>Khách hàng</th>
                                        <th>Tổng tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Invoice rows will be dynamically added here -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Chi tiết hóa đơn</h5>
                                <table class="table" id="invoiceDetailTable">
                                    <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Đơn giá</th>
                                        <th>Thành tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Invoice detail rows will be dynamically added here -->
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-between align-items-center mt-3">
                                    <h4>Tổng cộng: <span id="invoiceTotal">0 đ</span></h4>
                                    <button class="btn btn-success" id="paymentBtn">Thanh toán</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Sample data
    <%--let products = [--%>
    <%--    { id: 1, name: "Laptop", price: 15000000, quantity: 10 },--%>
    <%--    { id: 2, name: "Smartphone", price: 5000000, quantity: 20 },--%>
    <%--    { id: 3, name: "Headphones", price: 1000000, quantity: 50 },--%>
    <%--];--%>

    <%--let invoices = [];--%>
    <%--let currentInvoice = null;--%>

    <%--// Function to render product table--%>
    <%--function renderProductTable() {--%>
    <%--    const tableBody = document.querySelector("#productTable tbody");--%>
    <%--    tableBody.innerHTML = "";--%>
    <%--    products.forEach(product => {--%>
    <%--        const row = `--%>
    <%--            <tr>--%>
    <%--                <td>${product.name}</td>--%>
    <%--                <td>${product.price.toLocaleString()} đ</td>--%>
    <%--                <td>${product.quantity}</td>--%>
    <%--                <td><button class="btn btn-sm btn-primary add-to-invoice" data-id="${product.id}">Thêm vào hóa đơn</button></td>--%>
    <%--            </tr>--%>
    <%--        `;--%>
    <%--        tableBody.insertAdjacentHTML('beforeend', row);--%>
    <%--    });--%>
    <%--}--%>

    <%--// Function to render invoice table--%>
    <%--function renderInvoiceTable() {--%>
    <%--    const tableBody = document.querySelector("#invoiceTable tbody");--%>
    <%--    tableBody.innerHTML = "";--%>
    <%--    invoices.forEach(invoice => {--%>
    <%--        const row = `--%>
    <%--            <tr>--%>
    <%--                <td><a href="#" class="invoice-link" data-id="${invoice.id}">${invoice.id}</a></td>--%>
    <%--                <td>${invoice.customerName}</td>--%>
    <%--                <td>${invoice.total.toLocaleString()} đ</td>--%>
    <%--            </tr>--%>
    <%--        `;--%>
    <%--        tableBody.insertAdjacentHTML('beforeend', row);--%>
    <%--    });--%>
    <%--}--%>

    <%--// Function to render invoice detail table--%>
    <%--function renderInvoiceDetail(invoice) {--%>
    <%--    const tableBody = document.querySelector("#invoiceDetailTable tbody");--%>
    <%--    tableBody.innerHTML = "";--%>
    <%--    invoice.items.forEach(item => {--%>
    <%--        const row = `--%>
    <%--            <tr>--%>
    <%--                <td>${item.name}</td>--%>
    <%--                <td>${item.quantity}</td>--%>
    <%--                <td>${item.price.toLocaleString()} đ</td>--%>
    <%--                <td>${(item.quantity * item.price).toLocaleString()} đ</td>--%>
    <%--            </tr>--%>
    <%--        `;--%>
    <%--        tableBody.insertAdjacentHTML('beforeend', row);--%>
    <%--    });--%>
    <%--    document.getElementById("invoiceTotal").textContent = invoice.total.toLocaleString() + " đ";--%>
    <%--}--%>

    <%--// Event listener for adding a new product--%>
    <%--document.getElementById("addProductBtn").addEventListener("click", () => {--%>
    <%--    const newProduct = {--%>
    <%--        id: products.length + 1,--%>
    <%--        name: `New Product ${products.length + 1}`,--%>
    <%--        price: 100000,--%>
    <%--        quantity: 10--%>
    <%--    };--%>
    <%--    products.push(newProduct);--%>
    <%--    renderProductTable();--%>
    <%--});--%>

    <%--// Event listener for adding a new invoice--%>
    <%--document.getElementById("addInvoiceBtn").addEventListener("click", () => {--%>
    <%--    const newInvoice = {--%>
    <%--        id: invoices.length + 1,--%>
    <%--        customerName: `Customer ${invoices.length + 1}`,--%>
    <%--        items: [],--%>
    <%--        total: 0--%>
    <%--    };--%>
    <%--    invoices.push(newInvoice);--%>
    <%--    currentInvoice = newInvoice;--%>
    <%--    renderInvoiceTable();--%>
    <%--    renderInvoiceDetail(currentInvoice);--%>
    <%--});--%>

    <%--// Event delegation for adding product to invoice--%>
    <%--document.getElementById("productTable").addEventListener("click", (e) => {--%>
    <%--    if (e.target.classList.contains("add-to-invoice")) {--%>
    <%--        const productId = parseInt(e.target.getAttribute("data-id"));--%>
    <%--        const product = products.find(p => p.id === productId);--%>
    <%--        if (currentInvoice && product) {--%>
    <%--            const existingItem = currentInvoice.items.find(item => item.id === product.id);--%>
    <%--            if (existingItem) {--%>
    <%--                existingItem.quantity += 1;--%>
    <%--            } else {--%>
    <%--                currentInvoice.items.push({ ...product, quantity: 1 });--%>
    <%--            }--%>
    <%--            currentInvoice.total = currentInvoice.items.reduce((sum, item) => sum + item.price * item.quantity, 0);--%>
    <%--            renderInvoiceTable();--%>
    <%--            renderInvoiceDetail(currentInvoice);--%>
    <%--        } else {--%>
    <%--            alert("Please create an invoice first");--%>
    <%--        }--%>
    <%--    }--%>
    <%--});--%>

    <%--// Event delegation for selecting an invoice--%>
    <%--document.getElementById("invoiceTable").addEventListener("click", (e) => {--%>
    <%--    if (e.target.classList.contains("invoice-link")) {--%>
    <%--        e.preventDefault();--%>
    <%--        const invoiceId = parseInt(e.target.getAttribute("data-id"));--%>
    <%--        currentInvoice = invoices.find(inv => inv.id === invoiceId);--%>
    <%--        if (currentInvoice) {--%>
    <%--            renderInvoiceDetail(currentInvoice);--%>
    <%--        }--%>
    <%--    }--%>
    <%--});--%>

    <%--// Event listener for payment button--%>
    <%--document.getElementById("paymentBtn").addEventListener("click", () => {--%>
    <%--    if (currentInvoice) {--%>
    <%--        alert(`Payment processed for Invoice #${currentInvoice.id}. Total: ${currentInvoice.total.toLocaleString()} đ`);--%>
    <%--        // Here you would typically send this data to your server--%>
    <%--        currentInvoice = null;--%>
    <%--        renderInvoiceDetail({ items: [], total: 0 });--%>
    <%--    } else {--%>
    <%--        alert("No invoice selected");--%>
    <%--    }--%>
    <%--});--%>

    <%--// Event listener for product search--%>
    <%--document.getElementById("productSearch").addEventListener("input", (e) => {--%>
    <%--    const searchTerm = e.target.value.toLowerCase();--%>
    <%--    const filteredProducts = products.filter(product =>--%>
    <%--        product.name.toLowerCase().includes(searchTerm)--%>
    <%--    );--%>
    <%--    renderProductTable(filteredProducts);--%>
    <%--});--%>

    <%--// Initial render--%>
    <%--renderProductTable();--%>
    <%--renderInvoiceTable();--%>
</script>
</body>
</html>