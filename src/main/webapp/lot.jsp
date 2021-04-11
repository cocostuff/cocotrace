<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lot Detail</title>
</head>
<body>
<h2> Lot Detail </h2>

<img src="<c:url value="/images/QRCode.png" />" />
<table>
    <tr>
        <th>Id</th>
        <th>Product</th>
        <th>Quantity</th>
        <th>Total Weight</th>
        <th>Sending Date</th>
    </tr>
        <tr>
            <td>${lot.id}</td>
            <td>${lot.product.name}</td>
            <td>${lot.quantity}</td>
            <td>${lot.globalWeight}</td>
            <td>${lot.sendingDate}</td>
        </tr>

</table>
</body>
</html>