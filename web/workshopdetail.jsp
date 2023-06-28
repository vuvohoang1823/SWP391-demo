<%-- 
    Document   : workshopdetail.jsp
    Created on : Jun 14, 2023, 10:08:28 PM
    Author     : vuvoh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/workshopDetail.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="body-header">
            <p>
                WORKSHOP INFORMATION
            </p>
            <c:if test="${not empty sessionScope.workshop_detail}">
                <c:set var="detail" value="${sessionScope.workshop_detail}"/>
                <section class="section-workshops">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="row no-gutters">

                                        <div class="col-md-3">
                                            <img
                                                src="data:images/jpg;base64,${detail.image}"
                                                class="card-img"
                                                alt="Product Image 1"
                                                />
                                        </div>
                                        <div class="col-md-9">
                                            <div class="card-body">








                                                <h5 class="card-title">
                                                    ${detail.title}
                                                </h5>
                                                <div class="desc-text">
                                                    ${detail.content}
                                                </div>
                                                <div class="card-text">
                                                    <b>Starting date:</b> ${detail.start_date} <br />
                                                    <b>End enroll date:</b> ${detail.end_enroll_date} <br />
                                                    <b>Time:</b> 2:00 PM - 4:00 PM <br />
                                                    <b>Location/Venue:</b> Central Community Center <br />
                                                    <b>Target Audience:</b> Bird owners of all experience
                                                    levels
                                                </div>



                                                <c:set var="fullname" value="${sessionScope.LOGIN_USER.fullName}"></c:set>

                                                    <div class="extra-price">
                                                    <c:choose>
                                                        <c:when test="${empty fullname}">
                                                            <div class="button-container" style="width: 25vw">
                                                                <div class="button-container">
                                                                    <a href="signin.jsp">
                                                                        <button>BOOK NOW</button>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="button-container" style="width: 25vw">
                                                                <div class="button-container">
                                                                    <a href="#payment">
                                                                        <button><b>BOOK NOW</b></button>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </c:otherwise>

                                                    </c:choose>
                                                    <p>£${detail.price}</p>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <p id="payment" style="font-size: 3rem;font-weight: bolder;padding:5rem 5rem;background-color: white;color: black">
                SECURE CHECKOUT
            <hr style="margin: 0">
        </p>

        <section class="form-container" style="background-color: white">
        </c:if>
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
            



<!--                <input type="hidden" name="courseID" value=/>
                <input type="hidden" name="price" value= />
                <input type="hidden" name="userID" value= />-->

                <button  class="vnpay" >
                    <a href="MainController?action=payment_workshop&courseID=${detail.courseID}&price=${detail.price}&userID=${sessionScope.LOGIN_USER.customer_id}">
                        <p>
                            Continue with
                        </p>
                        <img src="img/vnpay.png">
                    </a>
                </button>
                
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
                            ${detail.title}
                        </p>
                        <p>
                            £${detail.price}
                        </p>
                    </div>
                    <hr>
                </div>
                <!--            <div class="price-content">
                                <div class="col-xl-8">
                                    <p>
                                        Subtotal
                                    </p>
                                    <p>
                                        Value-added tax
                                    </p>
                                </div>
                                <div class="col-xl-4">
                                    <p>
                                        £120.00
                                    </p>
                                    <p>
                                        £12.00
                                    </p>
                                </div>
                            </div>-->
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
    <%@include file="footer.jsp" %>
</body>
</html>