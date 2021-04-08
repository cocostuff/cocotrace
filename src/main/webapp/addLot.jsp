<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home page</title>
</head>
<body>
<h1>Create New Lot</h1>

<form:form method="POST" modelAttribute="lot" action="/addLot">

        <div class="product-preview-container">
            <ul>
                <li>Choose Product:
                    Choose Product: <select name="pid">
                    	<c:forEach items="${products}" var="product" >
                    		<option value="${product.id}">${product.name}</option>
                    	</c:forEach>
                    	</select> <br/>
                </li>
                <li>Total weight:
                    <form:input path="globalWeight"/>
                </li>
                <li>Quantity:
                    <form:input path="quantity"/>
                </li>
                <li>Sending Date:
                    <form:input path="sendingDate" type="date"/>
                </li>

            </ul>
        </div>

    <input class="button-update-sc" type="submit" value="Add Product" />

</form:form>

</body>
</html>