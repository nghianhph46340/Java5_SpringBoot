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
    <form action="/user/detail/${ng.id}" method="post">
        <label for="">id</label>
        <input type="text" value="${ng.id}" name="id" readonly>
        <label for="">name</label>
        <input type="text" value="${ng.name}" name="name">
        <button type="submit" formaction="/detail/${ng.id}">Update</button>
    </form>
</body>
</html>