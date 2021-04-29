<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>Cocotrace - A Product Traceability App</title>
    <!-- Custom CSS -->
    <link href="https://technext.github.io/adminmart/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="https://technext.github.io/adminmart/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="https://technext.github.io/adminmart/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="https://technext.github.io/adminmart/assets/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

    <link href="https://technext.github.io/adminmart/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<style>
            .collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #555;
}

.collapsible:after {
  content: '\002B';
  color: white;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2212";
}

.content {
  padding: 0 18px;
  padding-top: 10px;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #f1f1f1;
}

* {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 33.33%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}
</style>


<body>

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
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <header class="topbar" data-navbarbg="skin6">
        <nav class="navbar top-navbar navbar-expand-md">
            <div class="navbar-header" data-logobg="skin6">
                <!-- This is for the sidebar toggle which is visible on mobile only -->
                <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                        class="ti-menu ti-close"></i></a>
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-brand">
                    <!-- Logo icon -->
                    <a href="/home">
                        <b class="logo-icon">
                            <!-- Dark Logo icon -->
                            <img src="https://i.ibb.co/429gCcS/Cocotrace-logo.png" alt="homepage" class="dark-logo" width="186" height="auto"/>
                            <!-- Light Logo icon -->
                            <img src="https://i.ibb.co/429gCcS/Cocotrace-logo.png" alt="homepage" class="light-logo" width="186" height="auto"/>
                        </b>
                        <!--End Logo icon -->
                    </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Toggle which is visible on mobile only -->
                <!-- ============================================================== -->
                <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)"
                   data-toggle="collapse" data-target="#navbarSupportedContent"
                   aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
                        class="ti-more"></i></a>
            </div>
            <!-- ============================================================== -->
            <!-- End Logo -->
            <!-- ============================================================== -->
            <div class="navbar-collapse collapse" id="navbarSupportedContent">
                <!-- ============================================================== -->
                <!-- toggle and nav items -->
                <!-- ============================================================== -->
                <ul class="navbar-nav float-left mr-auto ml-3 pl-1">
                    <!-- Notification -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle pl-md-3 position-relative" href="javascript:void(0)"
                           id="bell" role="button" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            <span><i data-feather="bell" class="svg-icon"></i></span>
                            <span class="badge badge-primary notify-no rounded-circle">5</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-left mailbox animated bounceInDown">
                            <ul class="list-style-none">
                                <li>
                                    <div class="message-center notifications position-relative">
                                        <!-- Message -->
                                        <a href="javascript:void(0)"
                                           class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                            <div class="btn btn-danger rounded-circle btn-circle"><i
                                                    data-feather="airplay" class="text-white"></i></div>
                                            <div class="w-75 d-inline-block v-middle pl-2">
                                                <h6 class="message-title mb-0 mt-1">Luanch Admin</h6>
                                                <span class="font-12 text-nowrap d-block text-muted">Just see
                                                        the my new
                                                        admin!</span>
                                                <span class="font-12 text-nowrap d-block text-muted">9:30 AM</span>
                                            </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="javascript:void(0)"
                                           class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-success text-white rounded-circle btn-circle"><i
                                                        data-feather="calendar" class="text-white"></i></span>
                                            <div class="w-75 d-inline-block v-middle pl-2">
                                                <h6 class="message-title mb-0 mt-1">Event today</h6>
                                                <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                        a reminder that you have event</span>
                                                <span class="font-12 text-nowrap d-block text-muted">9:10 AM</span>
                                            </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="javascript:void(0)"
                                           class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-info rounded-circle btn-circle"><i
                                                        data-feather="settings" class="text-white"></i></span>
                                            <div class="w-75 d-inline-block v-middle pl-2">
                                                <h6 class="message-title mb-0 mt-1">Settings</h6>
                                                <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">You
                                                        can customize this template
                                                        as you want</span>
                                                <span class="font-12 text-nowrap d-block text-muted">9:08 AM</span>
                                            </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="javascript:void(0)"
                                           class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-primary rounded-circle btn-circle"><i
                                                        data-feather="box" class="text-white"></i></span>
                                            <div class="w-75 d-inline-block v-middle pl-2">
                                                <h6 class="message-title mb-0 mt-1">Pavan kumar</h6> <span
                                                    class="font-12 text-nowrap d-block text-muted">Just
                                                        see the my admin!</span>
                                                <span class="font-12 text-nowrap d-block text-muted">9:02 AM</span>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <a class="nav-link pt-3 text-center text-dark" href="javascript:void(0);">
                                        <strong>Check all notifications</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!-- End Notification -->
                    <!-- ============================================================== -->
                    <!-- create new -->
                    <!-- ============================================================== -->
                    <!-- <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i data-feather="settings" class="svg-icon"></i>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li> -->
                    <li class="nav-item d-none d-md-block">
                        <a class="nav-link" href="javascript:void(0)">
                            <div class="customize-input">
                                <select
                                        class="custom-select form-control bg-white custom-radius custom-shadow border-0">
                                    <option selected>EN</option>
                                    <option value="1">TH</option>
                                </select>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- ============================================================== -->
                <!-- Right side toggle and nav items -->
                <!-- ============================================================== -->
                <ul class="navbar-nav float-right">
                    <!-- ============================================================== -->
                    <!-- Search -->
                    <!-- ============================================================== -->
                    <li class="nav-item d-none d-md-block">
                        <a class="nav-link" href="javascript:void(0)">
                            <form>
                                <div class="customize-input">
                                    <input class="form-control custom-shadow custom-radius border-0 bg-white"
                                           type="search" placeholder="Search" aria-label="Search">
                                    <i class="form-control-icon" data-feather="search"></i>
                                </div>
                            </form>
                        </a>
                    </li>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <img src="../assets/images/users/profile-pic.jpg" alt="user" class="rounded-circle"
                                 width="40">
                            <span class="ml-2 d-none d-lg-inline-block"><span>Hello,</span> <span
                                    class="text-dark">Jason Doe</span> <i data-feather="chevron-down"
                                                                          class="svg-icon"></i></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                            <a class="dropdown-item" href="javascript:void(0)"><i data-feather="user"
                                                                                  class="svg-icon mr-2 ml-1"></i>
                                My Profile</a>
                            <a class="dropdown-item" href="javascript:void(0)"><i data-feather="settings"
                                                                                  class="svg-icon mr-2 ml-1"></i>
                                Account Setting</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="javascript:void(0)"><i data-feather="power"
                                                                                  class="svg-icon mr-2 ml-1"></i>
                                Logout</a>
                        </div>
                    </li>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                </ul>
            </div>
        </nav>
    </header>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <aside class="left-sidebar" data-sidebarbg="skin6">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="productList"
                                                 aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                            class="hide-menu">All Products</span></a></li>

                    <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="lots"
                                                 aria-expanded="false"><i data-feather="list" class="feather-icon"></i><span
                            class="hide-menu">Lots</span></a></li>

                    <li class="sidebar-item"> <a class="sidebar-link" href="#"
                                                 aria-expanded="false"><i data-feather="tag" class="feather-icon"></i><span
                            class="hide-menu">Sales
                                </span></a>
                    </li>
                    <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="/sales-analytics"
                                                 aria-expanded="false"><i data-feather="bar-chart" class="feather-icon"></i><span
                            class="hide-menu">Analytics</span></a></li>
                    <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="#"
                                                 aria-expanded="false"><i data-feather="user" class="feather-icon"></i><span
                            class="hide-menu">Profile</span></a></li>
                    <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="#"
                                                 aria-expanded="false"><i data-feather="log-out" class="feather-icon"></i><span
                            class="hide-menu">Log out</span></a></li>

                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Lot Detail</h3>
                    <!-- <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="/home">Dashboard</a>
                                </li>
                            </ol>
                        </nav>
                    </div> -->
                </div>

            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            <!-- *************************************************************** -->
            <!-- Create New Lot Form -->
            <!-- *************************************************************** -->

            <div class="row">
                <div class="col-sm-12">

                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">

                            <div style="display: flex; flex: wrap;">
                            <div class="col-lg-3 col-md-6">
                                <!-- Card -->
                                <div class="card">
                                    <img class="card-img-top img-fluid" src="<c:url value="/images/${lot.qrCodeId}.png" />" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">QR Code</h4>
                                        <p class="card-text">${lot.qrCodeId}</p>
                                    </div>
                                </div>
                                <!-- Card -->
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <!-- Card -->
                                <div class="card">
                                    <img class="card-img-top img-fluid" src="${lot.imageUrl}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Image of Lot</h4>
                                        <p class="card-text">${lot.product.name}</p>
                                    </div>
                                </div>
                                <!-- Card -->
                            </div>
                            </div>
                                    <table id="zero_config" class="table no-wrap">
                                        <tr>
                                            <th>Id</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Total Weight</th>
                                            <th>Sending Date</th>
                                            <th>Actions</th>
                                        </tr>
                                        <tr>
                                            <td>${lot.id}</td>
                                            <td>${lot.product.name}</td>
                                            <td>${lot.quantity}</td>
                                            <td>${lot.globalWeight}</td>
                                            <td>${lot.sendingDate}</td>
                                            <td>
                                            <div style="display: inline-block">
                                            <a href="/updateLot?id=${lot.id}" style="margin-right: 10px;">Update Lot</a>
                                            <a href="/deleteLot?id=${lot.id}">Delete</a>
                                            </div>
                                            </td>
                                        </tr>

                                </table>

                                <div class="container">
                                    <!-- ============================================================== -->
                                    <!-- Start Page Content -->
                                    <!-- ============================================================== -->
                                    <div class="row">
                                        <!-- column -->
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <h1 class="card-title" align="center"><b>Organic Coconut Oil</b></h1>
                                                <div class="row">
                                                    <div class="column">
                                                      <img src="https://images.squarespace-cdn.com/content/v1/5c1074accc8fed6a4251da8f/1584018403560-UR2PZW6K1C87J0DHNWCH/ke17ZwdGBToddI8pDm48kCdVBj3r2HsFKAh4Ms3KnMQUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8PaoYXhp6HxIwZIk7-Mi3Tsic-L2IOPH3Dwrhl-Ne3Z2yEoa3-OP9vPbL_illJ4-W0pcJZge7kW8cl3bGs6jbBtkOpdljO7Z-5qh0zg85Jnj/Coconut+Oil.jpg?format=750w" alt="Snow" style="width:100%">
                                                    </div>
                                                    <div class="column">
                                                      <img src="https://images.squarespace-cdn.com/content/v1/5c1074accc8fed6a4251da8f/1584018470978-QZJI2FXC9NB8ENWIW53A/ke17ZwdGBToddI8pDm48kCdVBj3r2HsFKAh4Ms3KnMQUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8PaoYXhp6HxIwZIk7-Mi3Tsic-L2IOPH3Dwrhl-Ne3Z2yEoa3-OP9vPbL_illJ4-W0pcJZge7kW8cl3bGs6jbBtkOpdljO7Z-5qh0zg85Jnj/Extra+Virgin+Coconut+Oil.jpg?format=750w" alt="Forest" style="width:100%">
                                                    </div>
                                                    <div class="column">
                                                      <img src="https://images.squarespace-cdn.com/content/v1/5c1074accc8fed6a4251da8f/1551438739319-6FEASYDYLPCYPRXVOHXN/ke17ZwdGBToddI8pDm48kCdVBj3r2HsFKAh4Ms3KnMQUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8PaoYXhp6HxIwZIk7-Mi3Tsic-L2IOPH3Dwrhl-Ne3Z2yEoa3-OP9vPbL_illJ4-W0pcJZge7kW8cl3bGs6jbBtkOpdljO7Z-5qh0zg85Jnj/oco-back1.jpg?format=500w" alt="Mountains" style="width:100%">
                                                    </div>
                                                  </div>                          
                                                    <!---text part-->
                                                    <button class="collapsible">Smoothly does it: all about coconut oil</button>
                                                    <div class="content">
                                                      <p>
                                                       Check out our organic coconut oil products. It’s not oh-so-humble, but we promise we really do sell the best coconut oil available. We really care that you’re getting the good stuff, jam-packed with coconutty-goodness. So read on to find out why you should buy coconut oil, what the difference is between our Extra Virgin Coconut Oil and our Coconut Cooking Oil, and why you should choose Organic Coconut Oil from us.
                                                     </p>
                                                    </div>
                    
                                                    <button class="collapsible">What can I use coconut oil for?</button>
                                                    <div class="content">
                                                      <p>
                                                        Coconut oil is a versatile little beasty. Yes, it’s a must-have in your kitchen cupboard, but it can be used for pets, skincare, cleaning and more.
                                                     </p>
                                                     <p>
                                                        You’re probably familiar with the use of coconut oil for cooking. Coconut cooking oil is simply fabulous for using at high temperatures, as its already been organically refined and won’t smoke at low temperatures. It can also be used as an ingredient in baking or even a mayonnaise.
                                                    </p>
                                                    <p>
                                                        Swot up on coconut oil benefits below, and you’ll know that it’s also incredible stuff to incorporate into your diet. What’s more, for vegetarians and vegans, coconut oil is an excellent alternative to solid fats in cooking, such as butter. It’ll also make a mean dark chocolate.
                                                    </p>
                                                    <p>
                                                        Beyond its pride-of-place in the kitchen, organic coconut oil can be used as a moisturiser and light sun cream, it can help keep your hair shiny and healthy, work as an insect repellent when mixed with essential oils, serve as a deodorant and even buff up your favourite wooden table beautifully. It’s not just a superfood, it’s super stuff!
                                                    </p>
                                                    </div>
                    
                                                    <button class="collapsible">  What are the benefits of coconut oil?</button>
                                                    <div class="content">
                                                        <p>
                                                            Most of you buying our coconut oils do so for cooking. Let’s look at just some of the coconut oil benefits crammed inside that jar.
                                                        </p>
                                                        <p>
                                                            Coconut oil for cooking is bursting with benefits. These may include:
                                                        </p>
                                                        
                                                        <ul>
                                                            <li>   
                                                                The fatty acids in coconut can give your ‘good’ cholesterol a boost, giving your heart a helping hand.
                                                            </li>
                                                            <li>
                                                                The fats in coconut oil are primarily medium-chain triglycerides (MCTs). Some studies suggest these are used as immediate energy by your body as opposed to being stored. 
                                                            </li>
                                                            <li>    
                                                                Certain studies suggest MCTs can be metabolised quickly by the body, which may make coconut oil responsible for being a fat-burning aid, as well as helping to reduce hunger.
                                                            </li>
                                                            <li>    
                                                                Lauric acid in coconut oil has been shown to help your body kill off harmful bacteria, viruses and fungi.
                                                            </li>
                                                            
                                                        </ul>
                                                    </div>
                    
                                                    <button class="collapsible">Coconut Oil Terminology 101</button>
                                                    <div class="content">
                                                        <p>
                                                            The difference between non-organic and organic coconut oil comes down to farming practice. We only sell organic coconut oil. This means that it has been produced using coconut trees which are grown without the use of chemicals.
                                                        </p>
                                                        <p>
                                                            We sell our Coconut Cooking Oil and our Extra Virgin Coconut Oil. The difference here is the production process. Our Coconut Cooking Oil uses heat and filtration in its production process, itself making it ideal for high temperature cooking. The refinement process also means it has no coconut aroma.
                                                        </p>
                                                        <p>
                                                            Our Extra Virgin Coconut Oil is raw and unrefined, and therefore retains more of the coconut flavour as well as more of the nutritional content of the raw coconut.
                                                        </p>
                                                    </div>
                                                                                
                                                    <button class="collapsible">How does our coconut oil make it to your jar?</button>
                                                    <div class="content">
                                                        <p>
                                                            All of our coconut oil is produced in Sri Lanka, by an independent company with over 50 years of history in the coconut market.  They pay their workers a fair wage, follow meaningful environmental policies and all of their coconuts come from their own Sri Lankan plantations, so they know the origin of each batch. 
                                                        </p>
                                                        <p>
                                                            The factory only uses organic farming and traditional production techniques to produce our Coconut Oil.  This way the highest amounts of natural nutrients make it to your jar. 
                                                        </p>
                                                        <p>
                                                            Our farmers allow the coconuts to fully mature before using them to make oil. They use the flesh of the coconut (known as the meat, or kernel). You also get coconut milk from this part of the coconut.
                                                        </p>
                                                        <p>
                                                            Our Coconut Cooking Oil is made using the dried meat.  Our Extra Virgin Coconut Oil is made using fresh, raw coconut meat. It’s taken from the coconut very soon after the coconut is opened. The oil is pressed out of the kernel. This tends to yield less oil than standard coconut oil production, hence it is more expensive.
                                                        </p>
                                                        
                                                    </div>
                                                                                  
                                                    
                                                    <table class="table no-wrap dataTable no-footer" role="grid" aria-describedby="zero_config_info">
                                                        <thead>
                                                            <tr role="row"><th>
                                                                Nutrientional Facts
                                                            </th>
                                                            <th>
                                                                
                                                            </th>
                                                        </thead>
                                                        <tbody>
                                                            
                                                            <tr >
                                                                <td>Calories</td>
                                                                <td>120</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Total Fat</td>
                                                                <td>14g</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Saturated Fat</td>
                                                                <td>12g</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Trans Fat</td>
                                                                <td>0g</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Polyunsaturated Fat</td>
                                                                <td>0g</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Monounsaturated Fat</td>
                                                                <td>1g</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Cholestrol</td>
                                                                <td>0g</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Sodium</td>
                                                                <td>0g</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Carbogydrates</td>
                                                                <td>0g</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Total Sugars</td>
                                                                <td>Og</td>
                                                                
                                                            </tr>
                                                            <tr >
                                                                <td>Protein</td>
                                                                <td>0g</td>
                                                                
                                                            </tr>
                                                            
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- column -->
                                        
                                        
                                        
                                    </div>
                                    <!-- ============================================================== -->
                                    <!-- End PAge Content -->
                                    <!-- ============================================================== -->
                                    <!-- ============================================================== -->
                                    <!-- Right sidebar -->
                                    <!-- ============================================================== -->
                                    <!-- .right-sidebar -->
                                    <!-- ============================================================== -->
                                    <!-- End Right sidebar -->
                                    <!-- ============================================================== -->
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <!-- *************************************************************** -->
                <!-- End Create New Lot Form -->
                <!-- *************************************************************** -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->

            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="https://technext.github.io/adminmart/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="https://technext.github.io/adminmart/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://technext.github.io/adminmart/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="https://technext.github.io/adminmart/dist/js/app-style-switcher.js"></script>
    <script src="https://technext.github.io/adminmart/dist/js/feather.min.js"></script>
    <script src="https://technext.github.io/adminmart/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="https://technext.github.io/adminmart/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="https://technext.github.io/adminmart/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="https://technext.github.io/adminmart/assets/extra-libs/c3/d3.min.js"></script>
    <script src="https://technext.github.io/adminmart/assets/extra-libs/c3/c3.min.js"></script>
    <script src="https://technext.github.io/adminmart/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="https://technext.github.io/adminmart/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="https://technext.github.io/adminmart/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="https://technext.github.io/adminmart/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="https://technext.github.io/adminmart/dist/js/pages/dashboards/dashboard1.min.js"></script>

    <script src="https://technext.github.io/adminmart/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="https://technext.github.io/adminmart/dist/js/pages/datatable/datatable-basic.init.js"></script>
</div>

</body>
</html>