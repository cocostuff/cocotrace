<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home page</title>
</head>
</head>
<body>
    <h1>User Role</h1>

    <h3>Your role</h3>
        <ul>
            <li>${user.role.name}<br/></li>
        </ul>


    <a href="/logout">Logout</a>
</body>
</html>