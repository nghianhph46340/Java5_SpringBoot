<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form action="" method="post">
    <p>id:<input type="text" name="id" value="${b.id}" readonly></p>
    <p>ten:<input type="text" name="ten" value="${b.ten}"></p>
    <p>gia:<input type="text" name="gia" value="${b.gia}"></p>
    <p>ngon:<input type="radio" name="ngon" value="true" ${b.ngon?"checked":""}>Ngon
        <input type="radio" name="ngon" value="false" ${!b.ngon?"checked":""}>Khong</p>
    <button onclick="return confirm('ban co muon sua khong')" type="submit">sua</button>
</form>
</body>
</html>