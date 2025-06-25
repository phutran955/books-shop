
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.AuthUtils" %>
<%@page import="model.UserDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>BookSaw - All Products</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/icomoon/icomoon.css">
        <link rel="stylesheet" href="assets/css/vendor.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    
    

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
                                        <li class="menu-item"><a href="MainController?action=viewAllProducts" class="nav-link">View All Products</a></li>                                   
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

        <!-- Main Content -->
        <section id="all-products" class="bookshelf py-5 my-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-list">
                            <div class="row">
                                <c:if test="${not empty listP}">
                                    <c:forEach var="p" items="${listP}">
                                        <div class="col-md-3 mb-4">
                                            <div class="product-item">
                                                <figure class="product-style">
                                                    <a href="MainController?action=viewProduct&id=${p.id}">
                                                        <img src="${p.image}" alt="${p.name}" class="product-item">
                                                    </a>

                                                    <button type="button" class="add-to-cart">Add to Cart</button>
                                                </figure>
                                                <figcaption>
                                                    <h3>${p.name}</h3>
                                                    <span>${p.catID}</span>
                                                    <div class="item-price">
                                                        $<fmt:formatNumber value="${p.price}" type="number" minFractionDigits="2"/>
                                                    </div>
                                                </figcaption>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty listP}">
                                    <div class="col-md-12">
                                        <div class="alert alert-info">No products available at this time.</div>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- Pagination (static for now) -->
                        <div class="row">
                            <div class="col-md-12">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
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
