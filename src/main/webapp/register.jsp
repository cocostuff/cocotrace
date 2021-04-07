<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .error {
            color: #ff0000;
            font-weight: bold;
        }
    </style>
    <meta charset="ISO-8859-1">
    <title>Registration</title>
</head>
<body>
<h1>Register</h1>
<form:form method="POST" modelAttribute="user">
    <spring:bind path="username">
        <div>
            <form:input type="text" path="username" class="form-control" placeholder="Username" autofocus="true" />
            <form:errors path="username" class="error"> </form:errors>
        </div>
    </spring:bind>
    <spring:bind path="password">
        <div>
            <form:input type="password" path="password" class="form-control" placeholder="Password"/>
            <form:errors path="password" class="error"> </form:errors>
        </div>
    </spring:bind>

    <spring:bind path="passwordConfirmation">
        <div>
            <form:input type="password" path="passwordConfirmation" class="form-control" placeholder="Confirm your password"/>
            <form:errors path="passwordConfirmation" class="error"> </form:errors>
        </div>
    </spring:bind>
    <spring:bind path="email">
        <div>
            <form:input type="text" path="email" class="form-control" placeholder="Email" autofocus="true"/>
            <form:errors path="email" class="error"> </form:errors>
        </div>
    </spring:bind>

    <spring:bind path="role">
        <div>
            Roles :<br/>
            <form:radiobutton path="role" value="1" />
            ROLE_ADMIN<br/>

            <form:radiobutton path="role" value="2" />
            ROLE_USER<br/>
        </div>
    </spring:bind>

    <Input type="submit" name="submit" value="submit">

</form:form>
</body>
</html>