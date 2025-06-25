<%-- 
    Document   : index
    Created on : May 29, 2025, 10:21:32 PM
    Author     : trang
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>BookSaw</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/normalize.css">
        <link rel="stylesheet" type="text/css" href="assets/icomoon/icomoon.css">
        <link rel="stylesheet" type="text/css" href="assets/css/vendor.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/myadd.css">
    </head>

    <body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">
        <div id="header-wrap">

            <jsp:include page = "topContent.jsp"></jsp:include>

                <!-- Navigation -->
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
                                            <li class="menu-item active"><a href="MainController?action=mc">Home</a></li>
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
                                        <li class="menu-item"><a href="#special-offer" class="nav-link">Offer</a></li>

                                        <li class="menu-item has-sub">
                                            <a href="#pages" class="nav-link">Accounts</a>
                                            <ul>
                                                <li><a href="login.jsp">Sign In</a></li>
                                                <li><a href="MainController?action=logout">Sign Out</a></li>
                                                <li><a href="productForm.jsp">Add products(admin only)</a></li>
                                                <li><a href="productEdit.jsp">Edit products(admin only)</a></li>                                        
                                            </ul>
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

        <!-- Featured Books -->
        <section id="featured-books" class="py-5 my-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-header align-center">
                            <div class="title"><span>Some quality items</span></div>
                            <h2 class="section-title">New Arrivals</h2>
                        </div>
                        <div class="product-list" data-aos="fade-up">
                            <div class="row">
                                <c:choose>
                                    <c:when test="${not empty listP}">
                                        <c:forEach var="p" items="${listP}">
                                            <div class="col-md-3">
                                                <div class="product-item">
                                                    <figure class="product-style">
                                                        <img src="${p.image}" alt="${p.name}" class="product-item">
                                                        <button type="button" class="add-to-cart">Add to Cart</button>
                                                    </figure>
                                                    <figcaption>
                                                        <h3>${p.name}</h3>
                                                        <span>${p.catID}</span>
                                                        <div class="item-price">
                                                            $<fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="2"/>
                                                        </div>
                                                    </figcaption>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-md-12">
                                            <p>No featured products available.</p>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="btn-wrap align-right">
                            <a href="MainController?action=viewAllProducts" class="btn-accent-arrow">
                                View all products <i class="icon icon-ns-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="special-offer" class="bookshelf pb-5 mb-5">

            <div class="section-header align-center">
                <div class="title">
                    <span>Grab your opportunity</span>
                </div>
                <h2 class="section-title">Books with offer</h2>
            </div>

            <div class="container">
                <div class="row">
                    <div class="inner-content">
                        <div class="product-list" data-aos="fade-up">
                            <div class="grid product-grid">
                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="assets/images/product-item5.jpg" alt="Books" class="product-item">
                                        <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                            Cart</button>
                                    </figure>
                                    <figcaption>
                                        <h3>Simple way of piece life</h3>
                                        <span>Armor Ramsey</span>
                                        <div class="item-price">
                                            <span class="prev-price">$ 50.00</span>$ 40.00
                                        </div>
                                </div>
                                </figcaption>

                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="assets/images/product-item6.jpg" alt="Books" class="product-item">
                                        <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                            Cart</button>
                                    </figure>
                                    <figcaption>
                                        <h3>Great travel at desert</h3>
                                        <span>Sanchit Howdy</span>
                                        <div class="item-price">
                                            <span class="prev-price">$ 30.00</span>$ 38.00
                                        </div>
                                </div>
                                </figcaption>

                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="assets/images/product-item7.jpg" alt="Books" class="product-item">
                                        <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                            Cart</button>
                                    </figure>
                                    <figcaption>
                                        <h3>The lady beauty Scarlett</h3>
                                        <span>Arthur Doyle</span>
                                        <div class="item-price">
                                            <span class="prev-price">$ 35.00</span>$ 45.00
                                        </div>
                                </div>
                                </figcaption>

                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="assets/images/product-item8.jpg" alt="Books" class="product-item">
                                        <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                            Cart</button>
                                    </figure>
                                    <figcaption>
                                        <h3>Once upon a time</h3>
                                        <span>Klien Marry</span>
                                        <div class="item-price">
                                            <span class="prev-price">$ 25.00</span>$ 35.00
                                        </div>
                                </div>
                                </figcaption>

                                <div class="product-item">
                                    <figure class="product-style">
                                        <img src="assets/images/product-item2.jpg" alt="Books" class="product-item">
                                        <button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to
                                            Cart</button>
                                    </figure>
                                    <figcaption>
                                        <h3>Simple way of piece life</h3>
                                        <span>Armor Ramsey</span>
                                        <div class="item-price">$ 40.00</div>
                                    </figcaption>
                                </div>
                            </div><!--grid-->
                        </div>
                    </div><!--inner-content-->
                </div>
            </div>
        </section>



        <jsp:include page = "footer.jsp"></jsp:include>


        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/script.js"></script>

    </body>

</html>