<%--
    Document   : viewBookedService
    Created on : Jul 3, 2023, 1:10:32 AM
    Author     : thang
--%>
<%@page import="entity.CustomerDTO"%>
<%@page import="DAO.CustomerDAO"%>
<%@page import="entity.UserDTO"%>
<%
    // Retrieve the UserDTO object from the session
    CustomerDTO user = (CustomerDTO) session.getAttribute("LOGIN_USER");

    // Create an instance of the CustomerDAO
    CustomerDAO customerDAO = new CustomerDAO();

    // Get the customer ID using the user ID
    int customerID = customerDAO.getCustomerID(user.getUser_id());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/onlinecourseDetail.css" type="text/css">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/onlinecourseDetail.css" type="text/css">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/reset.css">
        <jsp:useBean id="f" class="DAO.FormApppointmentDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="t"  class="DAO.TrainerDAO"></jsp:useBean>
            <link rel="stylesheet" href="css/viewBookedService_PrivateConsult.css">
        </head>
        <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <%@include file="viewBookedService_Head.jsp" %>
            <div class="filter-search">
                <div class="filter-side">
                    <p>Service status: </p>
                    <ul class="filter-option">
                        <li><a href="viewBookedService_PrivateConsult.jsp">Upcoming</a></li>
                        <li class="active"><a href="viewBookedService_PrivateConsult_complete.jsp">Completed</a></li>
                    </ul>
                </div>
                <div class="search-side">
                    <input type="text" class="search-bar" placeholder="Search by item name">
                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20.8335 21.083L26.5002 26.7497" stroke="#323232" stroke-width="2" stroke-linecap="round"
                          stroke-linejoin="round" />
                    <path
                        d="M23.6667 12.5833C23.6667 18.8426 18.5926 23.9167 12.3333 23.9167C6.0741 23.9167 1 18.8426 1 12.5833C1 6.3241 6.0741 1.25 12.3333 1.25C18.5926 1.25 23.6667 6.3241 23.6667 12.5833Z"
                        stroke="#323232" stroke-width="2" />
                    </svg>
                </div>
            </div>

            <c:set var="customerId" value="<%=customerID%>"></c:set>
                <p class="search-result">Currently showing <span class="search-counter">2</span> available item(s)</p>
                <div class="result-container">
                <c:forEach var="list" items="${f.getAppointmentFormHistorybyCustomerID(customerId)}">
                    <c:set var="trainerID" value="${list.request_trainer_id}"></c:set>
                    <c:set  var="trainer" value="${t.getrainerbyIDCUstomerField(trainerID)}"></c:set>
                        <div class="card-container">    
                            <div class="card-detail">
                                <div class="col-lg-4 d-flex align-items-center">
                                    <img src="data:images/jpg;base64,${trainer.img}"/>
                            </div>
                            <div class="description col-lg-8">
                                <p class="course-title">Basic Consult</p>
                                <div class="course-desc">
                                    <p><b>Customer:</b${list.customer_fullname}</p>
                                    <p><b>Time:</b>${list.duration}</p>
                                    <p><b>Date:</b>${list.date}</p>
                                    <p><b>Trainer name:</b>${trainer.fullName}</p>
                                    <p><b>Consultation fee:</b> $100/hour</p>
                                    <p><b>Total fee:</b> ${list.amount}</p>
                                </div>
                            </div>
                            <c:if test="${list.history eq 'yes'}">
                                <form action="CustomerPaymentVNPAY" id="frmCreateOrder" method="post"> 

                                    <div>
                                        <input  value="100000" class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="hidden"  />
                                    </div>
                                    <!--- phuong thuc thanh toan---->             
                                    <input type="hidden"  id="bankCode" name="bankCode" value="">
                                    <!--- phuong thuc thanh toan---->
                                    <!-- language--->
                                    <div >           
                                        <input type="hidden" id="language"  name="language" value="vn">                        
                                    </div>
                                    <!-- language--->

                                    <button class="vnpay" class="btn btn-default" type="submit" >

                                        <a>
                                            <p>
                                                Continue with
                                            </p>

                                        </a>
                                    </button>

                                </form>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>


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