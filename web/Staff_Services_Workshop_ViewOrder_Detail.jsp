<%--
    Document   : FormDetails
    Created on : Jun 15, 2023, 1:14:29 PM
    Author     : thang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/Staff_ConsultationForm_FormDetail.css" />
        <jsp:useBean id="f" class="DAO.FormApppointmentDAO"></jsp:useBean>
        <jsp:useBean id="t" class="DAO.TrainerDAO" ></jsp:useBean>
        </head>
        <body>
            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <!--            header-->
                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                            <svg
                                width="40"
                                height="40"
                                viewBox="0 0 19 19"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                >
                            <path
                                fill-rule="evenodd"
                                clip-rule="evenodd"
                                d="M18.136 1.91515C18.136 1.57682 17.9538 1.25189 17.6299 1.01251C17.3061 0.773121 16.8665 0.638428 16.4087 0.638428C13.0993 0.638428 5.90001 0.638428 2.59055 0.638428C2.13283 0.638428 1.69323 0.773121 1.36937 1.01251C1.04551 1.25189 0.863281 1.57682 0.863281 1.91515C0.863281 5.12099 0.863281 13.4995 0.863281 16.9715C0.863281 17.2294 1.07401 17.4624 1.39615 17.5613C1.71915 17.6596 2.09051 17.6054 2.33751 17.4228C2.81855 17.0672 3.32637 16.6919 3.70724 16.4104C4.04405 16.1614 4.5916 16.1614 4.92842 16.4104C5.34124 16.7155 5.88533 17.1177 6.29814 17.4228C6.63496 17.6718 7.18251 17.6718 7.51933 17.4228C7.93387 17.1164 8.48056 16.7123 8.89425 16.4065C9.22934 16.1589 9.77255 16.1569 10.1102 16.4027C10.5343 16.711 11.0974 17.1202 11.5223 17.4286C11.8617 17.675 12.4058 17.6724 12.7409 17.4228C13.1485 17.1196 13.684 16.7206 14.0933 16.4155C14.2557 16.2948 14.4759 16.2272 14.7065 16.2272C14.9362 16.2265 15.1573 16.2948 15.3188 16.4155C15.6936 16.6938 16.1885 17.0628 16.6592 17.4132C16.9062 17.5971 17.2776 17.652 17.6014 17.5537C17.9253 17.4554 18.136 17.2224 18.136 16.9632C18.136 13.4873 18.136 5.11843 18.136 1.91515Z"
                                fill="white"
                                />
                            <path
                                fill-rule="evenodd"
                                clip-rule="evenodd"
                                d="M4.31818 16.8616L5.68791 17.8741C6.36241 18.3726 7.45577 18.3726 8.13027 17.8741L9.50519 16.8578L10.9172 17.8836C11.5952 18.3765 12.6842 18.3713 13.3544 17.8728L14.7069 16.8655L16.0472 17.8632C16.5404 18.2303 17.2839 18.3407 17.9308 18.1441C18.5777 17.9468 19 17.4808 19 16.9631V1.91508C19 1.40694 18.7271 0.919874 18.2409 0.561116C17.7555 0.20172 17.0965 0 16.4091 0C13.0996 0 5.90036 0 2.59091 0C1.90345 0 1.2445 0.20172 0.759134 0.561116C0.272907 0.919874 0 1.40694 0 1.91508V16.9714C0 17.4879 0.420578 17.9532 1.06658 18.1511C1.71171 18.3484 2.45446 18.2392 2.94846 17.8741L4.31818 16.8616ZM17.2727 16.9638L15.9324 15.9654C15.6076 15.7241 15.1663 15.5881 14.706 15.5887C14.2457 15.5887 13.8044 15.7247 13.4805 15.966L12.128 16.9733L10.716 15.9475C10.0398 15.456 8.95419 15.4598 8.28401 15.9552L6.90909 16.9714L5.53936 15.959C4.86486 15.4604 3.7715 15.4604 3.097 15.959L1.72727 16.9714C1.72727 13.4994 1.72727 5.12092 1.72727 1.91508C1.72727 1.74591 1.81795 1.58313 1.98032 1.46376C2.14182 1.34375 2.36205 1.27672 2.59091 1.27672H16.4091C16.638 1.27672 16.8582 1.34375 17.0197 1.46376C17.182 1.58313 17.2727 1.74591 17.2727 1.91508V16.9638ZM4.31818 12.7672H5.18182C5.65855 12.7672 6.04545 12.4812 6.04545 12.1288C6.04545 11.7765 5.65855 11.4905 5.18182 11.4905H4.31818C3.84145 11.4905 3.45455 11.7765 3.45455 12.1288C3.45455 12.4812 3.84145 12.7672 4.31818 12.7672ZM8.63636 12.7672H14.6818C15.1585 12.7672 15.5455 12.4812 15.5455 12.1288C15.5455 11.7765 15.1585 11.4905 14.6818 11.4905H8.63636C8.15964 11.4905 7.77273 11.7765 7.77273 12.1288C7.77273 12.4812 8.15964 12.7672 8.63636 12.7672ZM4.31818 8.93703H5.18182C5.65855 8.93703 6.04545 8.65105 6.04545 8.29867C6.04545 7.9463 5.65855 7.66031 5.18182 7.66031H4.31818C3.84145 7.66031 3.45455 7.9463 3.45455 8.29867C3.45455 8.65105 3.84145 8.93703 4.31818 8.93703ZM8.63636 8.93703H14.6818C15.1585 8.93703 15.5455 8.65105 15.5455 8.29867C15.5455 7.9463 15.1585 7.66031 14.6818 7.66031H8.63636C8.15964 7.66031 7.77273 7.9463 7.77273 8.29867C7.77273 8.65105 8.15964 8.93703 8.63636 8.93703ZM4.31818 5.10687H5.18182C5.65855 5.10687 6.04545 4.82089 6.04545 4.46852C6.04545 4.11614 5.65855 3.83016 5.18182 3.83016H4.31818C3.84145 3.83016 3.45455 4.11614 3.45455 4.46852C3.45455 4.82089 3.84145 5.10687 4.31818 5.10687ZM8.63636 5.10687H14.6818C15.1585 5.10687 15.5455 4.82089 15.5455 4.46852C15.5455 4.11614 15.1585 3.83016 14.6818 3.83016H8.63636C8.15964 3.83016 7.77273 4.11614 7.77273 4.46852C7.77273 4.82089 8.15964 5.10687 8.63636 5.10687Z"
                                fill="black"
                                />
                            </svg>
                            <span style="padding-left: 2rem">Form List</span>
                        </div>
                        <div class="navbar navbar-expand-lg navbar-light">
                            <a href="Staff_OrderList_Workshop_Completed.jsp">
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
                            <div class="container-fluid" style="visibility: hidden">
                                <div class="" id="navbarSupportedContent">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item">
                                            <a class="nav-link" href="Staff_ConsultationForm_Pending.jsp">Bird Course</a>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Staff_ConsultationForm_Pending.jsp">Private Consultant</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <c:if test="${not empty sessionScope.detail_order_workshop}">
                        <c:set var="detail" value="${sessionScope.detail_order_workshop}"/>
                        <div class="container-fluid" style="padding: 0 2.5%">
                            <div class="forms-container">

                                <div class="forms-header">
                                    <div class="left-side"><b>Order Detail</b></div>
                                    <div class="right-side">
                                        <span>Checkout Date: <b>${detail.dateCheck}</b></span>
                                        <span><b>ID : #${detail.attendance_id}</b></span>
                                    </div>
                                </div>



                                <div class="form-customerDetails">
                                    <div class="form-name">
                                        <div class="name">Customer Information</div>
                                    </div>
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <div class="mb-5">
                                                    <label for="fullname" class="form-label">Full name</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="fullname"
                                                        placeholder="Full name"
                                                        value="${detail.customer_fullname}"

                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="mb-5">
                                                    <label for="phonenumber" class="form-label"
                                                           >Phone number</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="phonenumber"
                                                        placeholder="Phone number"
                                                        value="${detail.customer_contact}"
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
                                                    value="${detail.customer_gmail}"
                                                    disabled
                                                    />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-5">
                                                    <label for="requestTitle" class="form-label"
                                                           >Attendance status</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control attendancestatus"
                                                        id="requestTitle"
                                                        placeholder="${detail.attendance}"
                                                        value="${not empty detail.attendance ? detail.attendance : 'Not yet'}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-5">
                                                    <label for="requestTitle" class="form-label"
                                                           >Certificate status</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="requestTitle"
                                                        placeholder="${detail.certificate_status}"
                                                        value="${not empty detail.certificate_status ? detail.certificate_status : 'N/A'}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                        <%--
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
                                        --%>

                                    </div>
                                </div>
                                <div class="form-formDetails">
                                    <div class="form-name">
                                        <div class="name">Workshop Information</div>
                                    </div>
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-5">
                                                    <label for="requestTitle" class="form-label"
                                                           >Workshop name</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="requestTitle"
                                                        placeholder="${detail.title}"
                                                        value="${detail.title}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-5">
                                                    <label for="requestTitle" class="form-label"
                                                           >Complete Date</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="requestTitle"
                                                        placeholder="${detail.complete_date}"
                                                        value="${not empty detail.complete_date ? detail.complete_date : 'N/A'}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="mb-5">
                                                    <label for="requestTitle" class="form-label"
                                                           >Location/Venue</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="requestTitle"
                                                        placeholder=""
                                                        value="Central Community Center"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-5">
                                                    <label for="dateRequested" class="form-label"
                                                           >Date & Time</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="dateRequested"
                                                        placeholder="Form title"
                                                        value="2:00 PM - 4:00 PM"
                                                        disabled
                                                        />
                                                </div>
                                            </div>


                                            <div class="col-lg-4">
                                                <div class="mb-5">
                                                    <label for="priceHour" class="form-label"
                                                           >Pricing</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="priceHour"
                                                        placeholder="Form title"
                                                        value="$${detail.amount}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">




                                        </div>
                                        <div class="row">


                                            <div class="col-lg-6">
                                                <div class="mb-5">
                                                    <label for="requestTitle" class="form-label"
                                                           >Trainer</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="requestTitle"
                                                        placeholder=""
                                                        value="${detail.trainer_fullname}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-5">
                                                    <label for="requestTitle" class="form-label"
                                                           >Workshop status</label
                                                    >
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="workshopstatus"
                                                        placeholder=""
                                                        value="${detail.status}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">



                                        </div>

                                    </div>

                                </div>
                                <%--
                <input type="hidden" name="consultationId" value="${detail.consultation_id}" />
                <input type="hidden" name="email_email" value="${detail.gmail}" />
                <input type="hidden" name="fullname" value="${detail.customer_fullname}" />
                <input type="hidden" name="date" value="${detail.date}" />
                <input type="hidden" name="duration" value="${detail.duration}" />
                                --%>
                                <div class="forms-footer">
                                    <c:set var="certificateStatus" value="${detail.certificate_status}" />
                                    <form action="Staff_Workshop_Award_CertificateServlet" method="POST">
                                        <div>
                                            <input type="hidden" name="attendance_id" value="${detail.attendance_id}" />
                                            <input type="hidden" name="gmail" value="${detail.customer_gmail}" />
                                            <input type="hidden" name="customer_fullname" value="${detail.customer_fullname}" />
                                            <input type="hidden" name="workshop_title" value="${detail.title}" />

                                            <c:if test="${certificateStatus ne 'Awarded' && detail.status eq 'End' && detail.attendance eq 'Present'}">
                                                <button type="submit" name="action" value="approve" class="btn approve p-3" style="height: 100px; width: fit-content; font-size: 3rem">Award Certificate</button>
                                            </c:if>
                                        </div>
                                    </form>


                                </div>
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
        <!--                change price hour-->
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
        <!--                check empty trainer-->
        <!--        <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        const inputTrainerName = document.getElementById("trainername");
                        const hiddenTrainerName = document.getElementById("hiddenTrainerName");
                        const modal = new bootstrap.Modal(document.getElementById("chooseTrainer"));

                        const selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                        if (selectedTrainer.value === "none") {
                            inputTrainerName.value = "";
                        } else {
                            const trainerLabel = selectedTrainer.nextElementSibling;
                            const trainerName = trainerLabel.querySelector(".trainer-name").textContent;
                            inputTrainerName.value = trainerName.split(": ")[1];
                        }

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
                </script>-->
        <!--        save trainer-->
        <script>
            function saveTrainer() {
                const inputTrainerName = document.getElementById("trainername");
                const selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                if (selectedTrainer.value === "none") {
                    inputTrainerName.value = "";
                } else {
                    const trainerLabel = selectedTrainer.nextElementSibling;
                    const trainerName = trainerLabel.querySelector(".trainer-name").textContent;
                    inputTrainerName.value = trainerName.split(": ")[1];
                }
            }
        </script>
        <!--        time-->
        <!--        <script>
                    var duration = ''; // Assuming the format is HH:mm:ss

                    var durationParts = duration.split(":");
                    var hours = parseInt(durationParts[0], 10);
                    var minutes = parseInt(durationParts[1], 10);
                    var seconds = parseInt(durationParts[2], 10);

                    hours += 2;

                    if (hours > 23) {
                        hours -= 24;
                    }

                    var soonDuration = hours.toString().padStart(2, "0") + ":" + minutes.toString().padStart(2, "0") + ":" + seconds.toString().padStart(2, "0");

                    document.getElementById("dateRequested").value = ' - from ' + duration + ' to ' + soonDuration;
                </script>-->
        <!--        change color-->
        <script>
            const attendanceStatusElements = document.querySelectorAll('.attendancestatus');

            attendanceStatusElements.forEach(element => {
                const statusText = element.value.trim().toLowerCase();
                if (statusText === 'absent') {
                    element.style.color = 'red';
                } else if (statusText === 'present') {
                    element.style.color = 'green';
                } else {
                    // If the text doesn't match "green" or "red", you can set a default color here
                    element.style.color = 'black';
                }
            });
        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
