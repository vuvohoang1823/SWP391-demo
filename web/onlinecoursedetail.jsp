<%-- 
    Document   : online_course_detail
    Created on : Jun 14, 2023, 8:40:43 PM
    Author     : vuvoh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/onlinecourseDetail.css" type="text/css">
        <title>JSP Page</title>
    </head><body>
        <%@ include file="header.jsp" %>
        <section class="section-head">
            <p>
                COURSE INFORMATION
            </p>
            <p>
                Mastering Effective Communication: Unlocking the Power of Connection
            </p>


        </section>

        <c:if test="${not empty sessionScope.online_course_detail}">
            <c:set var="detail" value="${sessionScope.online_course_detail}"/>
            <section class="section-body" style="background-color: #DDE6F1">
                <div class="col-xl-5">
                    <div class="body-content-left">
                        <img src="data:images/jpg;base64,${detail.image}" style="width: 40rem;height: 43.4rem">
                        <p style="color: #617a55">
                            £${detail.price}
                        </p>
                        <p>
                            ${detail.title}
                        </p>
                        <p style="color: #617a55">

                        </p>
                        <div class="week-module">
                            <div class="col-xl-6">
                                <div style="color: #617a55">
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
                                </div>
                                <p>
                                    3 week
                                </p>
                            </div>
                            <div class="col-xl-6">
                                <div style="color: #617a55">
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
                                </div>
                                <p>
                                    6 modules
                                </p>
                            </div>
                        </div>
                        <hr>
                        <div class="review">
                            <b class="star col-lg-4">5/5⭐</b>
                            <b class="review-count col-lg-9">based on 87 reviews</b>
                        </div>



                        <c:choose>
                            <c:when test="${empty fullname}">


                                <button>
                                    <a href="signin.jsp">
                                        Purchase This Course
                                    </a>
                                </button>

                            </c:when>
                            <c:otherwise>
                                <button>
                                    <a href="#payment">
                                        Purchase This Course
                                    </a>
                                </button>
                            </c:otherwise>

                        </c:choose>



                    </div>
                </div>
                <div class="col-xl-7">
                    <div class="first-content">
                        <p>
                            <b>The course will cover the following topics</b>
                        </p>
                        <p>
                            <img src="img/349252734_479596974359728_5596993599118262797_n.png" alt="first content tick">
                            Can call the flock with resounding calls
                        </p>
                        <p>
                            <img src="img/349252734_479596974359728_5596993599118262797_n.png" alt="first content tick">
                            Array of sophisticated strategies and professional lesson
                        </p>
                        <p>
                            <img src="img/349252734_479596974359728_5596993599118262797_n.png" alt="first content tick">
                            Nurturing crested birds
                        </p>
                        <p>
                            <img src="img/349252734_479596974359728_5596993599118262797_n.png" alt="first content tick">
                            Quality - peace of mind - care
                        </p>
                    </div>
                    <div class="second-content">
                        <!--                <div class="title">-->
                        <!--                    <hr>-->
                        <!--                    <p>-->
                        <!--                        About Course-->
                        <!--                    </p>-->
                        <!--                    <hr>-->
                        <!--                </div>-->
                        <div class="line-container">
                            <hr class="line">
                            <span class="line-text">About Course</span>
                        </div>
                        <div class="text-detail">
                            ${detail.content}
                        </div>
                    </div>
                    <div class="third-content">
                        <div class="line-container">
                            <hr class="line">
                            <span class="line-text">Duration</span>
                        </div>
                        <div class="text-detail">
                            This course will takes some times from 1 month - 3 months
                            based on their birds and some related features.
                        </div>
                    </div>
                </div>
                <hr>
            </section>
            <section class="section-footer" style="background-color: #DDE6F1">
                <p style="font-size: 3rem; font-weight: bolder;text-align: center;padding-bottom: 3rem">
                    MODULES FOR THIS COURSE
                </p>
                <div class="module-container">
                    <div class="content-left">
                        <p style="font-weight: bolder; font-size: 3rem">
                            Module 1
                        </p>
                    </div>
                    <div class="content-right">
                        <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                            Getting used to the training mode for the first time
                        </p>
                        <p style="font-size: 2rem">
                            In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
                        </p>
                        <hr>
                    </div>
                </div>
                <div class="module-container">
                    <div class="content-left">
                        <p style="font-weight: bolder; font-size: 3rem">
                            Module 2
                        </p>
                    </div>
                    <div class="content-right">
                        <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                            Practice flying techniques
                        </p>
                        <p style="font-size: 2rem">
                            In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
                        </p>
                        <hr>
                    </div>
                </div>
                <div class="module-container">
                    <div class="content-left">
                        <p style="font-weight: bolder; font-size: 3rem">
                            Module 3
                        </p>
                    </div>
                    <div class="content-right">
                        <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                            Outdoor Access
                        </p>
                        <p style="font-size: 2rem">
                            In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
                        </p>
                        <hr>
                    </div>
                </div>
                <div class="module-container">
                    <div class="content-left">
                        <p style="font-weight: bolder; font-size: 3rem">
                            Module 4
                        </p>
                    </div>
                    <div class="content-right">
                        <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                            Strengthen the connection
                        </p>
                        <p style="font-size: 2rem">
                            In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
                        </p>
                        <hr>
                    </div>
                </div>
                <div class="module-container">
                    <div class="content-left">
                        <p style="font-weight: bolder; font-size: 3rem">
                            Module 5
                        </p>
                    </div>
                    <div class="content-right">
                        <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                            Check for safe behavior before you let go
                        </p>
                        <p style="font-size: 2rem">
                            In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
                        </p>
                        <hr>
                    </div>
                </div>
            </section>
            <p id="payment" style="font-size: 3rem;font-weight: bolder;padding:5rem 5rem;background-color: white">
                SECURE CHECKOUT
            <hr style="margin: 0">
        </p>

        <section class="form-container" style="background-color: white">
            <div class="col-xl-6">
                <p style="font-size: 4rem;font-weight: bolder;margin-top: 4rem;margin-bottom: 4rem">
                    Customer Details
                </p>
                <div class="logged-in">
                    <p>
                        Logged in as <b>${sessionScope.LOGIN_USER.fullName}</b>
                    </p>
                </div>
                <p style="font-size: 4rem;font-weight: bolder;margin-top: 4rem;margin-bottom: 4rem">
                    Express Checkout
                </p>
                
                
                <form action="MainController" method="POST">
                
                <input type="hidden" name="courseID" value=${detail.courseID} />
                <input type="hidden" name="price" value=${detail.price} />
                <input type="hidden" name="userID" value=${sessionScope.LOGIN_USER.customer_id} />
                
                <button class="vnpay" type="submit" name="action" value="payment_online_course">
                    <a>
                        <p>
                            Continue with
                        </p>
                        <img src="img/vnpay.png">
                    </a>
                </button>
                    
                    </form>
            </div>
            <div class="col-xl-5">
                <p style="font-size: 4rem;font-weight: bolder;margin-bottom: 4rem">
                    Payment Details
                </p>
                <div class="payment-detail">
                    <div class="detail-content">
                        <div class="col-xl">
                            <img src="data:images/jpg;base64,${detail.image}" style="width: 30rem;height: 40rem">
                        </div>
                        <div class="col-xl detail">
                            <p>
                                Mastering Effective Communication: Unlocking the Power of Connection
                            </p>
                            <p>
                                £${detail.price}
                            </p>
                        </div>
                        <hr>
                    </div>

                    <hr style="margin-bottom: 5rem">
                    <div class="total">
                        <div class="col-xl-8">
                            <p>
                                <b>
                                    Total
                                </b>
                            </p>
                        </div>
                        <div class="col-xl-4">
                            <p>
                                <b>
                                    £${detail.price}
                                </b>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </c:if>
    <%@ include file="footer.jsp" %>
</body>
</html>
