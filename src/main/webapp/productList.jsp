<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Page</title>
</head>
<body>
<h2> Products : </h2>

<table>
    <tr>
        <th>Name</th>
        <th>Manufacturing Origin</th>
        <th>Manufacturing Date</th>
        <th>Consumed Before</th>
        <th>Weight</th>
        <th>Producer</th>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.name}</td>
            <td>${product.manufacturingOrigin}</td>
            <td>${product.manufacturingDate}</td>
            <td>${product.consumedBefore}</td>
            <td>${product.weight}</td>
            <td>${product.user.username}</td>
            <td>
        </tr>

    </c:forEach>

    <a href="/addProduct"> Add new product </a>

</table>
</body>
</html>