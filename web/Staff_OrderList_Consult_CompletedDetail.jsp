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
        <link rel="stylesheet" href="css/Staff_OrderList_Consult_CompletedDetail.css" />
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
                                d="M0.0323278 5.34888C0.0323278 4.37211 0.798042 3.61578 1.95122 3.61578C3.10439 3.61578 5.47032 3.58959 5.47032 3.58959C5.47032 3.58959 5.43422 2.776 5.43422 1.74125C5.43422 0.706744 6.37266 0 7.49776 0C8.62308 0 14.1976 0.0466741 14.7446 0.0466741C15.2915 0.0466741 15.7353 0.246755 16.3484 0.706628C16.9615 1.16673 17.8884 1.93575 18.3473 2.44811C18.8063 2.96048 19 3.25961 19 3.68236C19 4.10521 19 12.6279 18.9929 13.6154C18.986 14.603 18.0636 15.333 16.9714 15.3475C15.8792 15.3619 13.5339 15.3619 13.5339 15.3619C13.5339 15.3619 13.5889 16.0923 13.5889 17.1253C13.5889 18.1583 12.6325 18.9656 11.5458 18.9941C10.4591 19.0226 3.05755 18.9371 2.00278 18.9656C0.948 18.9941 0 18.1748 0 17.1705C0 16.1663 0.0323278 6.32555 0.0323278 5.34888ZM2.00667 5.80817L1.87075 16.6157C1.86994 16.6767 1.88142 16.7373 1.90452 16.7939C1.92762 16.8505 1.96188 16.902 2.00533 16.9455C2.04877 16.9889 2.10052 17.0234 2.15758 17.0469C2.21464 17.0705 2.27588 17.0826 2.33773 17.0827L11.0583 17.1083C11.1197 17.109 11.1807 17.0975 11.2376 17.0744C11.2944 17.0513 11.3459 17.017 11.389 16.9738C11.4321 16.9305 11.4659 16.8792 11.4883 16.8227C11.5107 16.7662 11.5214 16.7059 11.5196 16.6453L11.4939 15.6103C11.4933 15.5797 11.4866 15.5495 11.4742 15.5214C11.4617 15.4934 11.4438 15.468 11.4213 15.4469C11.3988 15.4257 11.3724 15.4092 11.3434 15.3982C11.3144 15.3873 11.2835 15.3821 11.2525 15.383C11.2525 15.383 8.67264 15.4575 7.50448 15.4171C6.3362 15.3766 5.53745 14.6248 5.5371 13.6111C5.53675 12.5974 5.53745 5.5634 5.53745 5.5634C5.53752 5.53278 5.53142 5.50245 5.51953 5.47417C5.50763 5.44589 5.49016 5.42022 5.46814 5.39865C5.44612 5.37708 5.41997 5.36003 5.39123 5.34849C5.36248 5.33695 5.3317 5.33115 5.30066 5.33142L2.48427 5.34097C2.35856 5.34184 2.2382 5.39121 2.14894 5.47853C2.05967 5.56585 2.00861 5.68418 2.00667 5.80817ZM14.5729 1.70436C14.3763 1.53559 14.2171 1.60659 14.2171 1.86405V3.87243C14.2171 4.00116 14.3225 4.10603 14.4527 4.10673L16.9148 4.11848C17.1748 4.11976 17.2263 3.98393 17.0299 3.81516L14.5729 1.70436ZM7.77632 1.80294C7.74526 1.80267 7.71445 1.80844 7.68565 1.81992C7.65686 1.83141 7.63064 1.84838 7.6085 1.86987C7.58637 1.89137 7.56874 1.91695 7.55664 1.94517C7.54454 1.9734 7.5382 2.00369 7.53799 2.03433L7.46413 13.242C7.46368 13.2878 7.47244 13.3332 7.48991 13.3755C7.50738 13.4179 7.5332 13.4564 7.56589 13.4889C7.59858 13.5213 7.63747 13.5471 7.68032 13.5646C7.72317 13.5821 7.76911 13.591 7.81549 13.5909L16.6879 13.5692C16.7511 13.5689 16.8117 13.5443 16.8567 13.5005C16.9018 13.4568 16.9277 13.3974 16.929 13.335L17.0786 6.0696C17.0795 6.03917 17.0741 6.00889 17.0628 5.98055C17.0516 5.95222 17.0347 5.9264 17.0131 5.90464C16.9915 5.88288 16.9657 5.86562 16.9373 5.85389C16.9088 5.84216 16.8782 5.83619 16.8474 5.83634C16.8474 5.83634 13.7595 5.84123 13.2155 5.84123C12.6715 5.84123 12.3265 5.5826 12.3265 5.08676C12.3265 4.59093 12.3161 2.0646 12.3161 2.0646C12.3156 2.0025 12.2905 1.94308 12.246 1.89914C12.2015 1.85519 12.1413 1.83026 12.0784 1.82971L7.7762 1.80294H7.77632Z"
                                fill="black"
                                />
                            </svg>
                            <span style="padding-left: 2rem">Order List</span>
                        </div>
                        <div class="navbar navbar-expand-lg navbar-light">
                            <a href="Staff_OrderList_Consult_Completed.jsp">
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
                                            <a class="nav-link" href="Staff_OrderList_Consult_Completed">Private Consultant</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <c:if test="${not empty sessionScope.Appointment_Detail_Completed}">
                        <c:set var="detail" value="${sessionScope.Appointment_Detail_Completed}"/>
                        <c:set var="trainerID" value="${detail.request_trainer_id}"></c:set>
                        <c:set var="trainer" value="${t.getTrainerByID(trainerID)}"></c:set>
                            <div class="container-fluid" style="padding: 0 2.5%">
                                <div class="forms-container">
                                    <div class="forms-header">
                                        <div class="left-side"><b>Form Detail</b></div>
                                        <div class="right-side">
                                            <span>Submitted: <b>${detail.dateSubmit}</b></span>
                                        <span><b>ID : #${detail.consultation_id}</b></span>
                                        <span class="<c:out value="${fn:toLowerCase(detail.type)}"/>">Type : ${detail.type}</span>
                                    </div>
                                </div>
                                <form method="post" action="MainController">
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
                                    <input type="hidden" name="consultationId" value="${detail.consultation_id}" />
                                    <input type="hidden" name="email_email" value="${detail.gmail}" />
                                    <input type="hidden" name="fullname" value="${detail.fullname}" />
                                    <div class="forms-footer">
                                        <button type="submit" name="action" value="checkout" class="btn approve">Checkout form</button>
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
        <!--        <script>
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

                    document.getElementById("dateRequested").value = '${detail.date} - from ' + duration;
                </script>-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
