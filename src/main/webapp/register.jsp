<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>Adminmart Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="https://technext.github.io/adminmart/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="main-wrapper">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Login box.scss -->
    <!-- ============================================================== -->
    <div class="auth-wrapper d-flex no-block justify-content-center align-items-center position-relative">
        <div class = "no-repeat center center" >
            <div class="auth-box row text-center">
                <div class="col-lg-7 col-md-5 modal-bg-img" style="background-image: url(https://image.freepik.com/free-vector/illustrated-person-scanning-qr-code-with-smartphone_23-2148628102.jpg);">
                </div>
                <div class="col-lg-5 col-md-7 bg-white">
                    <div class="p-3">
                        <img src="https://technext.github.io/adminmart/assets/images/big/icon.png" alt="wrapkit">
                        <h2 class="mt-3 text-center">Register</h2>

                        <form:form method="POST" modelAttribute="user" class="mt-4">
                        <spring:bind path="username">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <form:input type="text" path="username" class="form-control" placeholder="Username" autofocus="true" />
                                    <form:errors path="username" class="error"> </form:errors>
                                </div>
                            </div>
                            </spring:bind>
                            <spring:bind path="password">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <form:input type="password" path="password" class="form-control" placeholder="Password"/>
                                        <form:errors path="password" class="error"> </form:errors>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="passwordConfirmation">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <form:input type="password" path="passwordConfirmation" class="form-control" placeholder="Confirm your Password"/>
                                        <form:errors path="passwordConfirmation" class="error"> </form:errors>
                                    </div>
                                </div>
                            </spring:bind>
                            <spring:bind path="email">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <form:input type="text" path="email" class="form-control" placeholder="Email Address" autofocus="true"/>
                                        <form:errors path="email" class="error"> </form:errors>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="role">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        Roles :<br/>
                                        <form:radiobutton path="role" value="1" />
                                        ROLE_ADMIN<br/>

                                        <form:radiobutton path="role" value="2" />
                                        ROLE_USER<br/>

                                    </div>
                                </div>
                            </spring:bind>

                            <div class="col-lg-12">
                                <div class="form-group">
                                    <Input class="btn btn-block btn-dark" type="submit" name="Sign Up" value="Submit">
                                </div>
                            </div>

                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- Login box.scss -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- All Required js -->
        <!-- ============================================================== -->
        <script src="https://technext.github.io/adminmart/assets/libs/jquery/dist/jquery.min.js "></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="https://technext.github.io/adminmart/assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="https://technext.github.io/adminmart/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- ============================================================== -->
        <!-- This page plugin js -->
        <!-- ============================================================== -->
        <script>
            $(".preloader ").fadeOut();
        </script>
    </div>
</div>
</body>

</html>

