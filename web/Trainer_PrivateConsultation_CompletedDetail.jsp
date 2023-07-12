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
        <link rel="stylesheet" href="css/Staff_ConsultationForm_FormDetail.css" />
    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-nowrap">
                <!--            header-->
                <%@ include file="header.jsp" %>
                <jsp:useBean id="f" class="DAO.FormApppointmentDAO"></jsp:useBean>
                <jsp:useBean id="t" class="DAO.TrainerDAO" ></jsp:useBean>
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
                                     top: 35%;
                                     left: 5rem;
                                     font-size: 1.5rem;
                                     color: #617a55;
                                     ">
                                    &lt; Back
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
                    <c:if test="${not empty sessionScope.Appointment_Detail_History}">
                        <c:set var="detail" value="${sessionScope.Appointment_Detail_History}"/>
                        <c:set var="trainerID" value="${detail.request_trainer_id}"></c:set>
                        <c:set var="trainer" value="${t.getTrainerByID(trainerID)}"></c:set>
                            <div class="container-fluid" style="padding: 0 2.5%">
                                <div class="forms-container">
                                    <div class="forms-header">
                                        <div class="left-side"><b>Services</b></div>
                                        <div class="right-side">
                                            <span>Submitted: <b>${detail.dateSubmit}</b></span>
                                        <span><b>ID : #${detail.consultation_id}</b></span>
                                        <span class="<c:out value="${fn:toLowerCase(detail.type)}"/>">Type : ${detail.type}</span>
                                    </div>
                                </div>
                                <form method="post">
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
                                                            value="${detail.fullname}"
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
                                                        <label for="formtitle" class="form-label"
                                                               >Date & Time request</label
                                                        >
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="formtitle"
                                                            placeholder="Form title"
                                                            value="${detail.date} - from ${detail.duration}"                                                            disabled
                                                            />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="mb-5">
                                                        <label for="formtitle" class="form-label"
                                                               >Total price</label
                                                        >
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="formtitle"
                                                            placeholder="Form title"
                                                            value="$${detail.amount}"
                                                            disabled
                                                            />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="mb-5">
                                                        <label for="formtitle" class="form-label"
                                                               >Request title</label
                                                        >
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="formtitle"
                                                            placeholder="Form title"
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
                                                        >${detail.note}
                                                    </textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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

            document.getElementById("formtitle").value = '${detail.date} - from ' + duration;
        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
