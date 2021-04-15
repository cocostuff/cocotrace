<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lot Detail</title>
</head>
<body>
<h2> Lot Detail </h2>

<img src="<c:url value="/images/${lot.qrCodeId}.png" />" />
<form:form method="POST" modelAttribute="lot" action="/updateLot">
<table>
<form:input path="qrCodeId" type="hidden" value="${lot.qrCodeId}"/>
    <tr>
        <th>Id</th>
        <th>Product</th>
        <th>Quantity</th>
        <th>Total Weight</th>
        <th>Sending Date</th>
    </tr>
        <tr>
            <td>${lot.id}<form:input path="id" type="hidden" value="${lot.id}"/></td>
            <td>
            <select name="product">
                <c:forEach items="${products}" var="product" >
                <option value="${product.id}">${product.name}</option>
                </c:forEach>
                </select>
            </td>
            <td><form:input path="quantity" value="${lot.quantity}"/></td>
            <td><form:input path="globalWeight" value="${lot.globalWeight}"/></td>
            <td><form:input path="sendingDate" type="date" value="${lot.sendingDateString}"/></td>
        </tr>
        <tr>
            <td><input class="button-update-sc" type="submit" value="Save Product" /></td>
        </tr>

</table>
</form:form>
</body>
</html>