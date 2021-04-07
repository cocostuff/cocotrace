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
<h1>Add new Product</h1>

<form:form method="POST" modelAttribute="product" action="/addProduct">

        <div class="product-preview-container">
            <ul>
                <li>Name:
                    <form:input path="name"/>
                </li>
                <li>Manufacturing Origin:
                    <form:input path="manufacturingOrigin"/>
                </li>
                <li>Manufacturing Date:
                    <form:input path="manufacturingDateString" type="date"/>
                </li>
                <li>Consumed before:
                    <form:input path="consumedBeforeString" type="date"/>
                </li>
                <li>Weight:
                    <form:input path="weight" />
                </li>

            </ul>
        </div>

    <input class="button-update-sc" type="submit" value="Add Product" />

</form:form>

</body>
</html>