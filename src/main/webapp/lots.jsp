<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lot List</title>
</head>
<body>
<h2> Lots : </h2>

<table>
    <tr>
        <th>Id</th>
        <th>Product</th>
        <th>Quantity</th>
        <th>Total Weight</th>
        <th>Sending Date</th>
    </tr>
    <c:forEach items="${lots}" var="lot">
        <tr>
            <td>${lot.id}</td>
            <td>${lot.product}</td>
            <td>${lot.quantity}</td>
            <td>${lot.globalWeight}</td>
            <td>${lot.sendingDate}</td>
        </tr>

    </c:forEach>

    <a href="/addLot"> Add a new lot</a>

</table>
</body>
</html>