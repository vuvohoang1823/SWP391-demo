<%--
    Document   : FormDetails
    Created on : Jun 15, 2023, 1:14:29 PM
    Author     : thang
--%>

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
        <link rel="stylesheet" href="css/staff_formBirdCourse_detail.css" />
    </head>
    <body>

        <%--<%@ include file="header.jsp" %>--%>
        <jsp:useBean id="i" class="DAO.TrainerDAO" scope="request"></jsp:useBean>
            <%--<a href="staff_formBirdCourse_processing.jsp">
                <div style="
                     position: absolute;
                     top: 10rem;
                     left: 5rem;
                     font-size: 2rem;
                     color: #617a55;
                     ">
                    &lt; Back
                </div>
            </a> --%>
            <div class="heading">/*bird course detail form list*/</div>
            <div class="container-fluid" style="padding: 0 2.5%">
                <div class="forms-container">
                    <div class="forms-header">
                        <div class="left-side"><b>Form Detail</b></div>
                        <div class="right-side">
                            <span>Submitted: <b>${BookingInfo.create_date}</b></span>
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
                                        placeholder="Address"
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
                                            placeholder="Full name"
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
                                            placeholder="Phone number"
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
                                        <label for="" class="form-label">Status</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id=""
                                            placeholder="Total Price"
                                            value="${BookingInfo.status}"
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
                </form>
            </div>
        </div>
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