<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
${msg}
<form:form action="/buoi8/staff" modelAttribute="staff" method="post">
    id: <form:input path="id"/>
    <form:errors path="id"/><br>
    name: <form:input path="name"/>
    <form:errors path="name"/><br>
    age: <form:input path="age"/>
    <form:errors path="age"/><br>
    position: <form:radiobuttons path="position" items="${positions}"/>
    <form:errors path="position"/> <br>
    Hobbies: <form:checkboxes path="hobbies" items="${hobbies}"/>
    <form:errors path="hobbies"/><br>
    Country: <form:select path="country.id"> <br>
    <option disabled hidden selected>vui long chon</option>
    <form:options items="${countries}" itemLabel="name" itemValue="id"/>
</form:select>
    <form:errors path="country"/><br>
    <button type="submit">save</button>
</form:form>
</body>
</html>