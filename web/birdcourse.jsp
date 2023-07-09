<%--
    Document   : birdcourse
    Created on : Jun 15, 2023, 12:14:55 AM
    Author     : vuvoh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/birdCourse.css" type="text/css">
        <jsp:useBean id="i" class="DAO.courseDAO" scope="request"></jsp:useBean>

        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="body-container">
            <section class="section-head">
                <div class="desc-container">
                    <div style="height: 83%; overflow-y: hidden">
                        <h2>BIRD COURSE</h2>
                        <h1>Unlock the Potential of Your Feathered Companion</h1>
                        <p>
                            Becoming a trainer is designed to empower
                            individuals like you to embark. Whether you aspire to train in corporate settings,
                            educational institutions, or any other field, this comprehensive
                            course will equip you with the essential skills and knowledge to
                            excel as a trainer.
                        </p>
                    </div>
                    <div class="button-container">
                        <button>Explore Course</button>
                    </div>
                </div>
                <div class="img-container">
                    <div class="image1">
                        <img src="./img/bluebirdgirl.png" alt="" />
                    </div>
                    <div class="image2">
                        <img src="./img/flyheader3pics.png" alt="" />
                    </div>
                </div>
            </section>
            <section class="section-body">
                <div class="heading">
                    <div>
                        <h1>Discover Courses for Your Beloved Birds</h1>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="input-group">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Search for Bird Course"
                                    style="width: 30rem;
                                    height: 5rem; font-size: 2rem"

                                    />
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="20"
                                            height="40"
                                            fill="currentColor"
                                            class="bi bi-search"
                                            viewBox="0 0 16 16"
                                            >
                                        <path
                                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
                                            />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <select class="custom-select" onchange="submitForm()" name="filterChose">
                                <option hidden value="1" ${!filterChose ? "selected" : ""}>Select Skill</option>
                                <option value="1" ${filterChose eq "1" ? "selected" : ""}>Talk</option>
                                <option value="2" ${filterChose eq "2" ? "selected" : ""}>Dancing</option>
                                <option value="3" ${filterChose eq "3" ? "selected" : ""}>Fly</option>
                                <option value="4" ${filterChose eq "4" ? "selected" : ""}>Sing</option>
                            </select>
                        </div>
                        <div class="col-lg-3">
                            <select class="custom-select" onchange="submitForm()" name="filterChose">
                                <option hidden value="1" ${!filterChose ? "selected" : ""}>Select Specie</option>
                                <option value="1" ${filterChose eq "1" ? "selected" : ""}>Owl</option>
                                <option value="2" ${filterChose eq "2" ? "selected" : ""}>Bobolink</option>
                                <option value="3" ${filterChose eq "3" ? "selected" : ""}>Gull</option>
                                <option value="4" ${filterChose eq "4" ? "selected" : ""}>Dunlin</option>
                            </select>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section-course">
                <div class="container">
                    <div class="row">
                <c:forEach items="${i.allCourseBirdCourse}" var="birdcourse">
                        <div class="col-md-4">
                            <div class="card">
                                <img
                                     src="data:images/jpg;base64,${birdcourse.image}"
                                    class="card-img-top"
                                    alt="Product 1"
                                    />
                                <div class="card-body">
                                    <div class="extra-price">
                                        <div class="button-container">
                                            <a href="detail?cid=${birdcourse.courseID}""><button>Enroll</button></a>
                                            <!--                                        <button class="btn btn-primary"><a href="bir">Enroll<a/></button>-->
                                        </div>
                                        <p>£${birdcourse.price}</p>
                                    </div>
                                    <h5 class="card-title">
                                        ${birdcourse.title}
                                    </h5>
                                    <div class="card-text">
                                        <div style="display: inline">
                                            <span style="color: #617a55">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="25"
                                                    height="25"
                                                    fill="currentColor"
                                                    class="bi bi-clock-fill"
                                                    viewBox="0 0 16 16"
                                                    >
                                                <path
                                                    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"
                                                    />
                                                </svg>
                                            </span>
                                            <span>3 weeks</span>
                                        </div>
                                        <div style="display: inline">
                                            <span style="color: #617a55">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="25"
                                                    height="25"
                                                    fill="currentColor"
                                                    class="bi bi-grid-3x2-gap-fill"
                                                    viewBox="0 0 16 16"
                                                    >
                                                <path
                                                    d="M1 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V4zM1 9a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V9z"
                                                    />
                                                </svg>
                                            </span>
                                            <span>6 modules</span>
                                        </div>
                                    </div>
                                    <hr
                                        style="
                                        border: 1px solid black;
                                        width: 100%;
                                        padding: 0 2%;
                                        margin: 20px auto;
                                        "
                                        />
                                    <div class="review">
                                        <b class="star col-lg-4" style="font-size: 15px">5/5⭐</b>
                                        <b class="review-count col-lg-9"style="font-size: 15px">based on 100 reviews</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                </c:forEach>
        <%@include file="footer.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    </body>
</html>
