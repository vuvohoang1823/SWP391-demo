<%--
    Document   : FormDetails
    Created on : Jun 15, 2023, 1:14:29 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form List</title>
        <!-- bootstrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/staff_formBirdCourse_pending-detail.css" />
    </head>
    <body>

        <%--<%@ include file="header.jsp" %>--%>
        <jsp:useBean id="i" class="DAO.TrainerDAO" scope="request"></jsp:useBean>
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
                            <a href="<%= previousPage%>">
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
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Trainer_Tracking">Bird Course</a>
                                        </li>
                                        <li class="nav-item">
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
                    <div class="container-fluid" style="padding: 0 2.5%">
                        <div class="forms-container">
                            <div class="forms-header">
                                <div class="left-side"><b>Form Detail</b></div>
                                <div class="right-side">
                                    <!--                                    <span><b>ID : #??</b></span>-->
                                </div>
                            </div>
                            <form action="SetTrainerToBooking" method="post">
                                <input type="hidden" name="bird_id" value="${BookingInfo.birdID}">
                                <div class="form-customerDetails">
                                    <div class="form-name">
                                        <div class="name">Personal Information</div>
                                    </div>
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="" class="form-label">Customer Name</label>
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    id=""
                                                    placeholder="Fullname"
                                                    value="${BookingInfo.customerName}"
                                                    disabled
                                                    />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Bird Name</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="Bird name"
                                                        value="${BookingInfo.nameBird}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Bird Type</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="Type "
                                                        value="${BookingInfo.typeBird}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-formDetails">
                                    <div class="form-name">
                                        <div class="name">Course Information</div>
                                    </div>
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Preferred date</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="Preferred date"
                                                        value="${BookingInfo.preferred_date}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Total Price</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="Total Price"
                                                        value="${BookingInfo.coursePrice}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Bird Course Name</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="Bird Course Name"
                                                        value="${BookingInfo.courseName}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Trainer assigned</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="Bird Course Name"
                                                        value="${BookingInfo.trainerName}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Start date</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="N/A"
                                                        value="${BookingInfo.start_date}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">End date</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="N/A"
                                                        value="${BookingInfo.end_date}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Checkout date</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="N/A"
                                                        value="${BookingInfo.checkout_date}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <script>
            window.addEventListener('DOMContentLoaded', function () {
                var headerWidth = document.getElementById('headerPage').offsetWidth;
                var container = document.getElementById('containerPage');
                container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const saveButton = document.getElementById("saveTrainer");
                const inputTrainerName = document.getElementById("trainername");
                const hiddenTrainerName = document.getElementById("hiddenTrainerName");
                const modal = new bootstrap.Modal(document.getElementById("chooseTrainer"));

                saveButton.addEventListener("click", function () {
                    const selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                    if (selectedTrainer.value === "none") {
                        inputTrainerName.value = "";
                    } else {
                        const trainerLabel = selectedTrainer.nextElementSibling;
                        const trainerName = trainerLabel.querySelector(".trainer-name").textContent;
                        inputTrainerName.value = trainerName.split(": ")[1];
                    }
                });

                const form = document.querySelector("form");
                form.addEventListener("submit", function (event) {
                    const selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                    if (inputTrainerName.disabled && inputTrainerName.value.trim() === "") {
                        event.preventDefault();
                        // Display an error message or take any other necessary action
                        alert("Please select a trainer.");
                    }
                    if (inputTrainerName.value !== "") {
                        hiddenTrainerName.value = selectedTrainer.value;
                    }
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


