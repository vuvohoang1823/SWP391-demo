<%--
    Document   : FormDetails
    Created on : Jun 15, 2023, 1:14:29 PM
    Author     : thang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- bootstrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/ConsultationForm_FormDetail.css" />
        <jsp:useBean id="t" class="DAO.TrainerDAO"></jsp:useBean>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <a href="ConsultationForm_Processing.jsp">
            <div style="
                 position: absolute;
                 top: 10rem;
                 left: 5rem;
                 font-size: 2rem;
                 color: #617a55;
                 ">
                &lt; Back
            </div>
        </a>
        <div class="heading">Consultation Form</div>
        <div class="container-fluid" style="padding: 0 2.5%">
            <div class="forms-container">
                <div class="forms-header">
                    <div class="left-side"><b>Form Detail</b></div>
                    <div class="right-side">
                        <span>Submitted: <b   id="currentday"></b></span>
                        <span><b>#id: ${appointment.consultation_id}</b></span>
                        <span class="online">${appointment.type}</span>
                    </div>
                </div>
                <div>
                    <c:set var="trainerID" value="${appointment.request_trainer_id}"></c:set>
                    <c:set var="trainer" value="${t.getTrainerByID(trainerID)}"></c:set>
                    <div class="form-customerDetails">
                        <div class="form-name">
                            <div class="name">Customer Details</div>
                        </div>
                        <div class="form-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label for="fullname" class="form-label">Full name</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="fullname"
                                            placeholder="Full name"
                                            value="${appointment.customer_fullname}"
                                            disabled
                                            />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label for="phonenumber" class="form-label" ></label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="phonenumber"
                                            placeholder="Phone number"
                                            value=""
                                            disabled
                                            />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="address"
                                        placeholder="Address"
                                        value="${appointment.address}"
                                        disabled
                                        />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-formDetails">
                        <div class="form-name">
                            <div class="name">Form Details</div>
                        </div>
                        <div class="form-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label for="formtitle" class="form-label"
                                               >Request title</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="formtitle"
                                            placeholder="Request title"
                                            value="Basic Consultation Request"
                                            disabled
                                            />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label for="trainername" class="form-label"
                                               >Trainer requested</label
                                        >
                                        <div class="input-group">
                                            <input
                                                id="trainername"
                                                type="text"
                                                class="form-control"
                                                placeholder="Trainer name"
                                                value="${trainer.fullName}"
                                                disabled
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-3">
                                    <label for="customernotes" class="form-label"
                                           >Customer's note</label
                                    >
                                    <textarea
                                        class="form-control"
                                        id="customernotes"
                                        placeholder="Notes"
                                        style="height: 100px"
                                        disabled
                                        >${appointment.note}
                                    </textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="forms-footer">
                        <div>Checkout this form?</div>
                        <div>
                            <a href="orderlist.jsp">
                                <button type="button" class="btn btn-primary">Checkout</button>
                            </a>
                        </div>
                        <div>
                            <a href="ConsultationForm_Processing.jsp">
                                <button type="button" class="btn btn-secondary">Cancel</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
        
        
            
           <script>
    window.onload = function() {
        // Generate current date
        var currentDate = new Date();
        var currentDay = currentDate.getDate();
        var currentMonth = currentDate.getMonth() + 1; // Months are zero-based, so we add 1
        var currentYear = currentDate.getFullYear();
        
        // Format the current day, month, and year
        var formattedDate = currentDay + '/' + currentMonth + '/' + currentYear;

        // Update the HTML content with the current day
        document.getElementById("currentday").innerHTML = formattedDate;

        // Generate random phone number
        var phoneNumber = generateRandomPhoneNumber();
        document.getElementById("phonenumber").value = phoneNumber;
    };

    function generateRandomPhoneNumber() {
        var phoneNumber = "";
        for (var i = 0; i < 9; i++) {
            phoneNumber += Math.floor(Math.random() * 10);
        }
        return phoneNumber;
    }
</script>
    </body>
</html>
