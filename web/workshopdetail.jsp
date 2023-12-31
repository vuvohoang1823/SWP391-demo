<%--
    Document   : workshopdetail.jsp
    Created on : Jun 14, 2023, 10:08:28 PM
    Author     : vuvoh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap@5.3.0 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!--<link href="assets/bootstrap.min.css" rel="stylesheet"/>-->
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <!--<link href="assets/jumbotron-narrow.css" rel="stylesheet">-->
        <script src="assets/jquery-1.11.3.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/workshopDetail.css" type="text/css">
        <title>${workshop_detail.title}</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="body-header">
            <div style="position: relative">
                <p>
                    WORKSHOP INFORMATION
                </p>
                <a href="<%= previousPage%>">
                    <div style="
                         z-index: 1;
                         position: absolute;
                         top: 5rem;
                         left: 10rem;
                         font-size: 2.5rem;
                         color: black;
                         ">
                        &lt; Back
                    </div>
                </a>
            </div>

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
                                                    ${detail.title}<br/>
                                                </h5>
                                                <div class="desc-text">
                                                    <p>${detail.sub_content_1}</p>
                                                    <br />
                                                    <p>${detail.sub_content_2}</p>
                                                    <br/>
                                                    <p>${detail.sub_content_3}</p>
                                                    <br/>
                                                    <p>${detail.sub_content_4}</p>
                                                    <br/>

                                                </div>
                                                <div class="card-text">
                                                    <b>Starting date:</b>
                                                    <c:choose>
                                                        <c:when test="${detail.tracking_status eq 'Started'}">
                                                            <!-- Content to be rendered/executed when condition1 is true -->
                                                            ${detail.tracking_status}
                                                        </c:when>
                                                        <c:when test="${detail.tracking_status eq 'Ended'}">
                                                            <!-- Content to be rendered/executed when condition2 is true -->
                                                            ${detail.tracking_status}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <!-- Content to be rendered/executed if none of the above conditions are true -->
                                                            ${detail.start_date}
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <br />
                                                    <b>End enroll date:</b> ${detail.end_enroll_date} <br />
                                                    <b>Time:</b> 2:00 PM - 4:00 PM <br />
                                                    <b>Location/Venue:</b> Central Community Center <br />
                                                    <b>Target Audience:</b> Bird owners of all experience
                                                    levels
                                                </div>



                                                <c:set var="fullname" value="${sessionScope.LOGIN_USER.fullName}"></c:set>

                                                    <div class="extra-price">
                                                    <c:if test="${empty detail.tracking_status}">
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
                                                    </c:if>
                                                    <div class="d-flex align-items-center" style="justify-content: space-around; flex-grow: 1">
                                                        <div class="price">£${detail.price}</div>
                                                        <div class="close-date">
                                                            <div>Close registration</div>
                                                            <div class="date">${detail.end_enroll_date}</div>
                                                        </div>
                                                    </div>
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


            <form action="PaymentOfWorkshopServlet" method="POST" id="frmCreateOrder">

                <input type="hidden" name="courseID" value="${detail.courseID}"/>
                <input type="hidden" name="price" value="${detail.price}" />
                <input type="hidden" name="userID" value="${sessionScope.LOGIN_USER.customer_id}" />
                <div>
                    <input  value="${detail.price}000" class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="hidden"  />
                </div>
                <!--- phuong thuc thanh toan---->
                <input type="hidden"  id="bankCode" name="bankCode" value="">
                <!--- phuong thuc thanh toan---->
                <!-- language--->
                <div>
                    <input type="hidden" id="language"  name="language" value="vn">
                </div>
                <!-- language--->
                <button class="vnpay" type="submit">
                    <p>
                        Continue with
                    </p>
                    <img src="img/vnpay.png">

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
    <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
    <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    <script type="text/javascript">
        $("#frmCreateOrder").submit(function () {
            var postData = $("#frmCreateOrder").serialize();
            var submitUrl = $("#frmCreateOrder").attr("action");
            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (x) {
                    if (x.code === '00') {
                        if (window.vnpay) {
                            vnpay.open({width: 768, height: 600, url: x.data});
                        } else {
                            location.href = x.data;
                        }
                        return false;
                    } else {
                        alert(x.Message);
                    }
                }
            });
            return false;
        });
    </script>
</body>
</html>