<%--
    Document   : FormDetails
    Created on : Jun 15, 2023, 1:14:29 PM
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form List</title>        <title>Courses</title>

        <!-- bootstrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Customer_AddBird.css" />
        <jsp:useBean id="b" class="DAO.CustomerBirdDAO" ></jsp:useBean>
        </head>
        <body>
        <%@ include file="header.jsp" %>
        <c:set var="customerId" value="<%=customerID%>" />
        <section class="form-head">
            <div class="profileHeading">
                <p>Add New Bird</p>
            </div>
        </section>
        <div class="container-fluid" style="padding: 0 2.5%">
            <div class="forms-container">
                <div class="forms-header">
                    <div class="left-side">
                        <div>
                            <a href="<%= previousPage%>">
                                <div style="
                                     position: absolute;
                                     top: 37%;
                                     left: 5rem;
                                     ">
                                    <svg width="19" height="36" viewBox="0 0 19 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M17.9142 1.74339C16.9054 0.7346 15.2696 0.7346 14.2608 1.74339L1.63504 14.3818C-0.380997 16.3997 -0.380219 19.6697 1.63659 21.6867L14.2701 34.3201C15.2789 35.329 16.9147 35.329 17.9235 34.3201C18.9324 33.3113 18.9324 31.6756 17.9235 30.6667L7.11067 19.8538C6.10162 18.8451 6.10162 17.2093 7.11067 16.2005L17.9142 5.39674C18.9231 4.38795 18.9231 2.75244 17.9142 1.74339Z" fill="#0F0F0F"/>
                                    </svg>
                                </div>
                            </a>
                        </div>
                        <b style="padding-left: 2rem;">back</b></div>
                </div>
                <form method="post" action="Bird_AddANewBirdByCustomerServlet" enctype="multipart/form-data">
                    <div>
                        <div class="form-customerDetails">
                            <div class="form-body">
                                <div class="row" style="margin-top: 2rem">
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label for="" class="form-label">Bird Name</label>
                                            <input
                                                type="text"
                                                class="form-control"
                                                id=""
                                                placeholder="Bird Name"
                                                value=""
                                                required
                                                name="birdName"
                                                />
                                        </div>
                                    </div>
                                    <div>
                                        <input type="hidden" name="customerID"  value="${customerId}">
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label for="" class="form-label">Bird Birthday</label>
                                            <input
                                                type="date"
                                                class="form-control"
                                                id=""
                                                placeholder="Bird Birthday"
                                                value=""
                                                required
                                                name="birdBirthday"

                                                />
                                        </div>
                                    </div>
                                </div>
                                <!--                            <div class="row" style="margin-top: 2rem">
                                                                <div class="col-lg-6">
                                                                    <div class="mb-3">
                                                                        <label for="" class="form-label">Bird Type</label>
                                                                        <input
                                                                            type="text"
                                                                            class="form-control"
                                                                            id=""
                                                                            placeholder="Bird Age"
                                                                            value=""
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
                                                                            value=""
                                                                            disabled
                                                                            />
                                                                    </div>
                                                                </div>
                                                            </div>-->
                            </div>
                        </div>
                        <div class="form-formDetails">
                            <div class="form-body">
                                <div class="row" style="margin-top: -2rem">
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <select name="birdType" style="width: 67.8rem;height: 4rem">
                                                <c:forEach var="type_list" items="${b.lisofType_of_Bird}">
                                                    <option value="${type_list.type_id}">${type_list.type_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 2rem">
                                    <div class="mb-3">
                                        <label for="" class="form-label">
                                            Bird Image
                                        </label>
                                    </div>
                                    <div class="mb-3">
                                        <form action="">
                                            <img src="" alt="" width="300" height="300" id="image">
                                            <input type="file" name="birdImage" id="imageFile" accept="image/gif, image/jpeg, image/png" required>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="forms-footer">

                                <div> <button type="submit" class="btn approve" style="margin-top: 4rem; background: #617255">ADD</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    window.addEventListener('DOMContentLoaded', function () {
        var headerWidth = document.getElementById('headerPage').offsetWidth;
        var container = document.getElementById('containerPage');
        container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
    });
    function chooseFile(fileInput) {
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#image').attr('src', e.target.result);
            }
            reader.readAsDataURL(fileInput.files[0]);
        }
    }
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</body>
</html>