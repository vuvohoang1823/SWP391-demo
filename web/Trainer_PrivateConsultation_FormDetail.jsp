<%--
    Document   : Trainer_PrivateConsultation
    Created on : Jun 21, 2023, 8:03:02 AM
    Author     : thang
--%>
<%@page import="entity.Trainer"%>
<%@page import="DAO.AppointmentDAO"%>
<%@page import="entity.TrainerDTO"%>
<%@page import="DAO.TrainerDAO1"%>
<%@page import="entity.UserDTO"%>
<%@page import="entity.TrainerSP"%>

<%
    // Retrieve the UserDTO object from the session
    TrainerSP user = (TrainerSP) session.getAttribute("LOGIN_USER");

    // Create an instance of the CustomerDAO
    TrainerDAO1 trainerDAO = new TrainerDAO1();

    // Get the customer ID using the user ID
    int trainerID = trainerDAO.getTrainerID(user.getUserID());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- boostrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- w3Table -->
        <jsp:useBean id="f" class="DAO.FormApppointmentDAO" scope="request"></jsp:useBean>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
            <!-- css -->
            <link rel="stylesheet" href="css/reset.css" />
            <link rel="stylesheet" href="css/Trainer_PrivateConsultation_FormDetail.css" />
        </head>
        <body>
            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <!--            header-->
                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                            <svg width="40" height="40" viewBox="0 0 19 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6 10H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                            <path d="M1 5.22222C1 3.23185 1 2.23666 1.6224 1.61833C2.24479 1 3.24653 1 5.25 1H13.75C15.7534 1 16.7552 1 17.3776 1.61833C18 2.23666 18 3.23185 18 5.22222V13.6667C18 16.6522 18 18.145 17.0664 19.0725C16.1328 20 14.6302 20 11.625 20H7.375C4.36979 20 2.8672 20 1.9336 19.0725C1 18.145 1 16.6522 1 13.6667V5.22222Z" stroke="#33363F" stroke-width="2"/>
                            <path d="M13 17V20M6 17V20" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                            <path d="M6 6H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                            </svg>
                            <span style="padding-left: 2rem">Services</span>
                        </div>
                        <div class="navbar navbar-expand-lg navbar-light">
                            <a href="Trainer_PrivateConsultation_List.jsp">
                                <div style="
                                     position: absolute;
                                     top: 21%;
                                     left: 5rem;
                                     ">
                                    <svg width="19" height="36" viewBox="0 0 19 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M17.9142 1.74339C16.9054 0.7346 15.2696 0.7346 14.2608 1.74339L1.63504 14.3818C-0.380997 16.3997 -0.380219 19.6697 1.63659 21.6867L14.2701 34.3201C15.2789 35.329 16.9147 35.329 17.9235 34.3201C18.9324 33.3113 18.9324 31.6756 17.9235 30.6667L7.11067 19.8538C6.10162 18.8451 6.10162 17.2093 7.11067 16.2005L17.9142 5.39674C18.9231 4.38795 18.9231 2.75244 17.9142 1.74339Z" fill="#0F0F0F"/>
                                    </svg>
                                </div>
                            </a>

                            <div class="container-fluid">
                                <div class="" id="navbarSupportedContent">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Bird Course</a>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Trainer_PrivateConsultation_List.jsp">Private Consultant</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Trainer_Workshop_FormList.jsp">Workshop</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="form-body container-fluid">
                        <div class="row">
                            <div class="col-lg-12 fs-1 fw-bold" style="margin: 0 0 2rem 2rem">
                                Trainer: ${sessionScope.LOGIN_USER.fullName}
                            </div>
                            <hr>
                        </div>
                    </section>

                    <c:set var="trainerId" value="<%=trainerID%>"></c:set>
                    <c:set var="detail" value="${sessionScope.Appointment_Detail_ByTrainer}"></c:set>
                    <c:if test="${not empty sessionScope.Appointment_Detail_ByTrainer}">

                        <!--must be complete to open payment-->
                        <input id="checkComplete" value="${detail.trackingcourse}" hidden>
                        <!-------------------------------------------------->

                        <div class="container-fluid" style="padding: 2.5%">
                            <div class="forms-container">
                                <div class="accordion" id="accordionExample">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                <div class="forms-header">
                                                    <div class="left-side"><b>Form Detail</b></div>
                                                    <div class="right-side">
                                                        <span>Submitted: <b>${detail.dateSubmit}</b></span>
                                                        <span><b>ID : #${detail.consultation_id}</b></span>
                                                        <span class="<c:out value="${fn:toLowerCase(detail.type)}"/>">Type : ${detail.type}</span>
                                                        <input type="hidden" id="formType" value="<c:out value="${fn:toLowerCase(detail.type)}"/>">
                                                    </div>
                                                </div>
                                            </button>
                                        </h2>
                                        <div id="collapseOne" class="accordion-collapse collapse show">
                                            <div class="accordion-body">
                                                <!--                            start of form-->
                                                <form  method="post" action="MainController" id="myForm">
                                                    <div class="form-customerDetails">
                                                        <div class="form-name">
                                                            <div class="name">Customer Details</div>
                                                        </div>
                                                        <div class="form-body">
                                                            <div class="row">
                                                                <div class="col-lg-7">
                                                                    <div class="mb-3">
                                                                        <label for="fullname" class="form-label">Full name</label>
                                                                        <input
                                                                            type="text"
                                                                            class="form-control"
                                                                            id="fullname"
                                                                            placeholder="Full name"
                                                                            value="${detail.fullname}"
                                                                            disabled
                                                                            />
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-5">
                                                                    <div class="mb-3">
                                                                        <label for="phonenumber" class="form-label"
                                                                               >Phone number</label
                                                                        >
                                                                        <input
                                                                            type="text"
                                                                            class="form-control"
                                                                            id="phonenumber"
                                                                            placeholder="Phone number"
                                                                            value="${detail.contact}"
                                                                            disabled
                                                                            />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="mb-5">
                                                                    <label for="email" class="form-label">Email</label>
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        id="email"
                                                                        placeholder="Email"
                                                                        value="${detail.gmail}"
                                                                        disabled
                                                                        />
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
                                                                        value="${detail.address}"
                                                                        disabled
                                                                        />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-formDetails">
                                                        <div class="form-name">
                                                            <div class="name">Request Information</div>
                                                        </div>
                                                        <div class="form-body">
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="mb-5">
                                                                        <label for="dateRequested" class="form-label"
                                                                               >Date & Time request</label
                                                                        >
                                                                        <input
                                                                            type="text"
                                                                            class="form-control"
                                                                            id="dateRequested"
                                                                            placeholder="Form title"
                                                                            value="${detail.date} - from ${detail.duration}"
                                                                            disabled
                                                                            />
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="mb-5">
                                                                        <label for="priceHour" class="form-label"
                                                                               >Pricing</label
                                                                        >
                                                                        <input
                                                                            type="text"
                                                                            class="form-control"
                                                                            id="priceHour"
                                                                            placeholder="Form title"
                                                                            disabled
                                                                            />
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
                                                                        >${detail.note}
                                                                    </textarea>
                                                                </div>
                                                            </div>
                                                            <!-- take consulttationid id--->
                                                            <input type="hidden" name="consultationID" value="${detail.consultation_id}" />
                                                            <!-- take consulttationid id--->
                                                            <!-- take trainer id--->
                                                            <input type="hidden" name="TrainerCode" value="${trainerId}" />
                                                            <!-- take trainer id--->
                                                        </div>
                                                    </div>

                                                    <div class="forms-footer m-auto" id="completeButton">
                                                        <!-- Button trigger modal -->
                                                        <button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmComplete">
                                                            Complete
                                                        </button>
                                                        <button type="button"  class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#confirmCancel">
                                                            Cancel
                                                        </button>
                                                    </div>

                                                    <!--complete modal-->
                                                    <div class="modal fade" id="confirmComplete" tabindex="-1" aria-labelledby="confirmCompleteLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5">Complete</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Mark this consultation as complete?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    <button type="submit" name="action" value="updateby" class="btn btn-primary" data-bs-dismiss="modal">Yes</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!--cancel modal-->
                                                    <div class="modal fade" id="confirmCancel" tabindex="-1" aria-labelledby="confirmCompleteLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5">Cancel</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Cancel this consultation?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    <button type="submit" name="action" value="updateby"  class="btn btn-primary" data-bs-dismiss="modal">Yes</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button id="payment-accordionButton" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                                                <div class="forms-header">
                                                    <div class="left-side"><b>Payment Checklist</b></div>
                                                </div>
                                            </button>
                                        </h2>
                                        <div id="collapseTwo" class="accordion-collapse collapse">
                                            <div class="accordion-body">
                                                <form method="post" action="updateAmount">
                                                    <input type="hidden" name="consultationId" value="${detail.consultation_id}" />

                                                    <div class="form-paymentChecklist">
                                                        <div class="form-name">
                                                            <div class="name">Payment Details</div>
                                                        </div>
                                                        <div class="row payment-form mb-5 d-flex align-items-center" style="position: relative">
                                                            <div class="d-flex col-lg-2 justify-content-center align-items-center">Calculate payment:</div>
                                                            <div class="input-group w-auto">
                                                                <input
                                                                    id="trainername"
                                                                    type="text"
                                                                    name="number"
                                                                    class="form-control"
                                                                    placeholder="Enter number of hours"
                                                                    required
                                                                    />
                                                                <!---------------->
                                                                <button
                                                                    class="btn btn-primary"
                                                                    type="button"
                                                                    id="button-addon2"
                                                                    style="font-size: 1.5rem; border: 0; background-color: #617a55; border-radius: 0 4px 4px 0"
                                                                    onclick="calculate()"
                                                                    >
                                                                    Calculate
                                                                </button>
                                                                <!---------------->
                                                            </div>
                                                            <div id="errorMessage" class="color-red" style="position: absolute;
                                                                 width: fit-content; right: 15%; color: red; font-size: 1.5rem" hidden></div>
                                                        </div>
                                                        <div class="info mb-5">
                                                            <h1 id="result"></h1>
                                                            <input type="hidden" id="typeChoose" value="${detail.type}" >
                                                            <input type="hidden" name="price" id="hiddenPrice">
                                                            <div>
                                                                <b>Trainer name: </b>  ${sessionScope.LOGIN_USER.fullName}
                                                            </div>
                                                            <div>
                                                                <b>Trainer ID: </b> ${trainerId}
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="forms-footer justify-content-center">
                                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmPayment">
                                                            Confirm
                                                        </button>
                                                    </div>
                                                    <div class="modal fade" id="confirmPayment" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5">Complete</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Confirm payment?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    <button type="submit"  name="amount" value="yes" class="btn btn-primary" data-bs-dismiss="modal">Yes</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--                                            change end-->
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <script>
            window.addEventListener('DOMContentLoaded', function () {
                var headerWidth = document.getElementById('headerPage').offsetWidth;
                var container = document.getElementById('containerPage');
                container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
            });
        </script>
        <!--change price hour-->
        <script>
            const formType = document.getElementById("formType").value;
            const priceHour = document.getElementById("priceHour");
            if (formType === "online") {
                priceHour.value = "$100/hour";
            }
            if (formType === "offline") {
                priceHour.value = "$150/hour";
            }
        </script>
        <!--        calculate-->
        <script>
            function calculate() {
                var mode = document.getElementById("typeChoose").value;
                var number = document.querySelector('input[name="number"]').value;
                const errorMessage = document.getElementById("errorMessage");

                if (number === "" || parseInt(number) <= 0 || parseFloat(number) > 24) {
                    errorMessage.textContent = "Invalid number of hour";
                    errorMessage.removeAttribute("hidden"); // Remove the "hidden" attribute
                } else {
                    errorMessage.setAttribute("hidden", ""); // Add the "hidden" attribute
                    var result = 0;

                    if (mode === "online") {
                        result = parseInt(number) * 100;
                    } else if (mode === "offline") {
                        result = parseInt(number) * 150;
                    }

                    document.getElementById("result").textContent = "Result: " + result;
                    document.getElementById("hiddenPrice").value = result;
                }
            }

        </script>
        <!--    check complete -->
        <script>
            var checkCompleteValue = document.getElementById("checkComplete").value;
            var completeButton = document.getElementById("completeButton");
            var paymentAccordionButton = document.getElementById("payment-accordionButton");

            if (checkCompleteValue !== "complete") {
                // Set show for accordion one
                document.getElementById("collapseOne").classList.add("show");

                // Remove show for accordion two
                document.getElementById("collapseTwo").classList.remove("show");

                //disable accordion 2
                paymentAccordionButton.disabled = true;
                paymentAccordionButton.removeAttribute("data-bs-toggle");
                paymentAccordionButton.removeAttribute("data-bs-target");
                paymentAccordionButton.classList.remove("collapsed");
                paymentAccordionButton.style.backgroundColor = "gray";
                paymentAccordionButton.querySelector(".left-side").style.color = "#e2e8e7";
            } else {
                // Set show for accordion two
                document.getElementById("collapseTwo").classList.add("show");

                // Remove show for accordion one
                document.getElementById("collapseOne").classList.remove("show");

                //remove complete button for accordion 1
                completeButton.style.display = "none";
            }
        </script>
        <script>
            var duration = '${detail.duration}'; // Assuming the format is HH:mm:ss

            var durationParts = duration.split(":");
            var hours = parseInt(durationParts[0], 10);
            var minutes = parseInt(durationParts[1], 10);
            var seconds = parseInt(durationParts[2], 10);

            hours += 2;

            if (hours > 23) {
                hours -= 24;
            }

            var soonDuration = hours.toString().padStart(2, "0") + ":" + minutes.toString().padStart(2, "0") + ":" + seconds.toString().padStart(2, "0");

        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
