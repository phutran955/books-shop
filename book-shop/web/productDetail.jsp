<%-- 
    Document   : productDetail
    Created on : Jun 21, 2025, 11:24:14 PM
    Author     : trang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.AuthUtils" %>
<%@page import="model.UserDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>BookSaw - Product Details</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/icomoon/icomoon.css">
        <link rel="stylesheet" href="assets/css/vendor.css">
        <link rel="stylesheet" href="assets/css/style.css">  
        <link rel="stylesheet" href="assets/css02/myadd.css"> 
    </head>

    <style>
       
    </style>


    <body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">
        <div id="header-wrap">

            <jsp:include page = "topContent.jsp"></jsp:include>


                <header id="header">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="main-logo">
                                    <a href="index.jsp"><img src="assets/images/main-logo.png" alt="logo"></a>
                                </div>
                            </div>
                            <div class="col-md-10">
                                <nav id="navbar">
                                    <div class="main-menu stellarnav">
                                        <ul class="menu-list">
                                            <li class="menu-item"><a href="MainController?action=mc" class="nav-link">Home</a></li>
                                            <li class="menu-item"><a href="MainController?action=viewAllProducts" class="nav-link">View All Products</a></li>

                                            <li class="menu-item has-sub">
                                                <a href="#categories" class="nav-link">Categories</a>
                                                <ul>
                                                <c:if test="${not empty listC}">
                                                    <c:forEach var="c" items="${listC}">
                                                        <li>
                                                            <a href="MainController?action=viewCat&catID=${c.catID}">
                                                                ${c.catName}
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                </c:if>
                                            </ul>
                                            <c:if test="${empty listC}">
                                                <div class="col-md-12">
                                                    <div class="alert alert-info">No categories available at this time.</div>
                                                </div>
                                            </c:if>
                                        </li>
                                    </ul>

                                    <div class="hamburger">
                                        <span class="bar"></span>
                                        <span class="bar"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </header>
        </div>

        <!-- Product Detail Content -->
        <section class="product-detail-container">

            <div class="container">
                <div class="row">

                    <div class="col-md-6">
                        <img src="${p.image}" alt="${p.name}" class="img-fluid product-image">
                    </div>

                    <div class="col-md-6 product-info">
                        <h1 class="product-title">${p.name}</h1>
                        <div class="product-price">
                            $<fmt:formatNumber value="${p.price}" type="number" minFractionDigits="2" />
                        </div>

                        <div class="product-description mt-3">
                            <h5>Description:</h5>
                            <p>${p.description}</p>
                        </div>

                        <div class="quantity-selector mt-3">
                            <h5>Quantity:</h5>
                            <input type="number" name="quantity" class="form-control quantity-input" value="1" min="1" style="width: 100px;">
                        </div>

                        <div class="action-buttons mt-4">
                            <button class="btn btn-primary btn-buy-now">BUY NOW</button>
                            <button class="btn btn-success btn-add-to-cart">ADD TO CART</button>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <jsp:include page = "footer.jsp"></jsp:include>

        <!-- JS Scripts -->
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/script.js"></script>

    </body>
</html>