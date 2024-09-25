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
<form action="/update/${banh.id}" method="post">
    <label for="">ID</label>
    <input type="text" name="id" value="${banh.id}" readonly><br>
    <label for="">Ten</label>
    <input type="text" name="ten" value="${banh.ten}"><br>
    <label for="">Gia</label>
    <input type="number" name="gia" value="${banh.gia}"><br>
    <label for="">Ngon</label>
    <input type="radio" name="ngon" value="true" ${banh.ngon == "true"?"checked":""}>Ngon
    <input type="radio" name="ngon" value="false" ${banh.ngon == "false"?"checked":""}>Không ngon
    <br>
    <button type="submit">Update</button>
</form>
</body>
</html>