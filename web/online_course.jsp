<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <jsp:useBean id="i" class="DAO.courseDAO" scope="request"></jsp:useBean>

            <title>Document</title>
            <!-- bootstrap@5.3.0 -->
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
                crossorigin="anonymous"
                />
            <!-- css -->
            <link rel="stylesheet" type="text/css" href="css/reset.css" />
            <link rel="stylesheet" type="text/css" href="css/onlineCourse.css"/>
        </head>
        <body>
        <%@ include file="header.jsp" %>
        <!-- end of header -->
        <div class="body-container">
            <section class="section-head">
                <div class="desc-container">
                    <h2>ONLINE COURSE</h2>
                    <h1>Unlock Your Potential as a Skilled and Inspiring Trainer</h1>
                    <p>
                        Our online course on becoming a trainer is designed to empower
                        individuals like you to embark on a journey of professional growth
                        and fulfillment. Whether you aspire to train in corporate settings,
                        educational institutions, or any other field, this comprehensive
                        course will equip you with the essential skills and knowledge to
                        excel as a trainer.
                    </p>
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
            <section class="onlineCourse-container">
                <div class="heading">
                    <div>
                        <h1>Featured Course by professional bird trainers</h1>
                    </div>
                </div>
                <div class="container searchbar-container">
                    <div class="row">

                        <div class="col-lg-12">
                            <div class="input-group">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Search for Online Course"
                                    />
                                <div class="input-group-append">
                                    <span class="input-group-text" style="height: 100%">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
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
                    </div>
                </div>
                <div class="section-course">
                    <div class="container">
                        <div class="row">
                            <c:forEach items="${i.allCourseOnlineTraining}" var="onlinetraining">

                                <div class="col-lg-4">
                                    <div class="card">
                                        <img
                                            src="data:images/jpg;base64,${onlinetraining.image}"
                                            class="card-img-top"
                                            alt="Product 1"
                                            />
                                        <div class="card-body">
                                            <div class="extra-price">
                                                <div class="button-container">
                                                    <button class="btn btn-primary">
                                                        <a href="MainController?action=view_online_course_detail&courseID=${onlinetraining.courseID}" style="text-decoration: none;color: white">Enroll</a>
                                                    
                                                    </button>
                                                </div>
                                                <p>£${onlinetraining.price}</p>
                                            </div>
                                            <h5 class="card-title">
                                                ${onlinetraining.title}
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
                                                <b class="star col-lg-4">5/5</b>
                                                <b class="review-count col-lg-9">based on 100 reviews</b>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- end of product -->
                            <!--                            <div class="col-md-4">
                                                            <div class="card">
                                                                <img
                                                                    src="./img/bluebirdgirl.png"
                                                                    class="card-img-top"
                                                                    alt="Product 1"
                                                                    />
                                                                <div class="card-body">
                                                                    <div class="extra-price">
                                                                        <div class="button-container">
                                                                            <button class="btn btn-primary">Enroll</button>
                                                                        </div>
                                                                        <p>£120.00</p>
                                                                    </div>
                                                                    <h5 class="card-title">
                                                                        Mastering Effective Communication: Unlocking the Power of
                                                                        Connection
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
                                                                        <b class="star col-lg-4">5/5</b>
                                                                        <b class="review-count col-lg-9">based on 100 reviews</b>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                         end of product 
                                                        <div class="col-md-4">
                                                            <div class="card">
                                                                <img
                                                                    src="./img/bluebirdgirl.png"
                                                                    class="card-img-top"
                                                                    alt="Product 1"
                                                                    />
                                                                <div class="card-body">
                                                                    <div class="extra-price">
                                                                        <div class="button-container">
                                                                            <button class="btn btn-primary">Enroll</button>
                                                                        </div>
                                                                        <p>£120.00</p>
                                                                    </div>
                                                                    <h5 class="card-title">
                                                                        Mastering Effective Communication: Unlocking the Power of
                                                                        Connection
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
                                                                        <b class="star col-lg-4">5/5</b>
                                                                        <b class="review-count col-lg-9">based on 100 reviews</b>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                         end of product 
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                     end of product -->
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- end of body -->
        <%@ include file="footer.jsp" %>
    </body>
</html>
