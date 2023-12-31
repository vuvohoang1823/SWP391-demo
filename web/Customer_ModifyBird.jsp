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
        <link rel="stylesheet" href="css/Customer_ModifyBird.css" />
    </head>
    <body>
        <jsp:useBean id="b" class="DAO.CustomerBirdDAO"></jsp:useBean>
        <c:set var="customerId" value="<%=customerID%>" />
        <%@ include file="header.jsp" %>
        <c:if test="${not empty sessionScope.Customer_Bird}">
            <c:set var="detail" value="${sessionScope.Customer_Bird}"></c:set>
                <section class="form-head">
                    <div class="profileHeading">
                        <p>Modify Bird Information</p>
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
                                         top: 38%;
                                         left: 5rem;
                                         ">
                                        <svg width="19" height="36" viewBox="0 0 19 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M17.9142 1.74339C16.9054 0.7346 15.2696 0.7346 14.2608 1.74339L1.63504 14.3818C-0.380997 16.3997 -0.380219 19.6697 1.63659 21.6867L14.2701 34.3201C15.2789 35.329 16.9147 35.329 17.9235 34.3201C18.9324 33.3113 18.9324 31.6756 17.9235 30.6667L7.11067 19.8538C6.10162 18.8451 6.10162 17.2093 7.11067 16.2005L17.9142 5.39674C18.9231 4.38795 18.9231 2.75244 17.9142 1.74339Z" fill="#0F0F0F"/>
                                        </svg>
                                    </div>
                                </a>
                            </div>
                            <b style="padding-left: 2rem">back</b></div>
                    </div>
                    <form id="birdForm" method="post" action="Bird_UpdateBirdByCustomerServlet" enctype="multipart/form-data">
                        <input type="hidden" name="bird_id" value="">
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
                                                name="birdName"
                                                value="${detail.name}"

                                                />
                                        </div>
                                    </div>
                                    <div>
                                        <input type="hidden" name="customerID"  value="${customerId}">
                                    </div>
                                    <div>
                                        <input type="hidden" name="birdId" value="${detail.bird_id}">
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label for="" class="form-label">Bird Birthday</label>
                                            <input
                                                type="text"
                                                class="form-control"
                                                id=""
                                                name="birdBirthday"
                                                placeholder="Bird Birthday"
                                                value="${detail.birdDate}"

                                                />
                                        </div>
                                    </div>
                                </div>
                                <!--                            <div class="row" style="margin-top: 2rem">
                                                                <div class="col-lg-6">
                                                                    <div class="mb-3">
                                                                        <label for="" class="form-label">Bird Age</label>
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
                                                    <option value="${type_list.type_id}"
                                                            <c:if test="${type_list.type_id eq detail.type_id}">
                                                                selected
                                                            </c:if>
                                                            >${type_list.type_name}

                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <!--                                <div class="col-lg-6">
                                                                        <div class="mb-3">
                                                                            <label for="trainername" class="form-label">Status</label>
                                                                            <div class="input-group">
                                                                                <input
                                                                                    id="trainername"
                                                                                    type="text"
                                                                                    class="form-control"
                                                                                    placeholder="None"
                                                                                    disabled
                                                                                    />
                                                                                only this gets submitted
                                                                                <input
                                                                                    id="hiddenTrainerName"
                                                                                    type="hidden"
                                                                                    />
                                                                                ------------------------
                                                                                <button
                                                                                    class="btn btn-primary"
                                                                                    type="button"
                                                                                    id="button-addon2"
                                                                                    data-bs-toggle="modal"
                                                                                    data-bs-target="#chooseTrainer"
                                                                                    >
                                                                                    Update Status
                                                                                </button>
                                                                                 Modal
                                                                                <div
                                                                                    class="modal fade"
                                                                                    id="chooseTrainer"
                                                                                    tabindex="-1"
                                                                                    data-bs-backdrop="static"
                                                                                    data-bs-keyboard="false"
                                                                                    >
                                                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header">
                                                                                                <h1 class="modal-title fs-5">Status</h1>
                                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                <div class="trainer-list">
                                                                                                    important: none needed for customers that didnt choose trainer (must change before submit form)
                                                                                                    <div class="trainer-item">
                                                                                                        <input class="trainer-input" type="radio" name="selected-trainer" value="none" id="trainer-none" checked>
                                                                                                        <label for="trainer-none">
                                                                                                            None
                                                                                                        </label>
                                                                                                    </div>
                                                                                                    start of trainer
                                        <div class="trainer-item">
                                            <img src="data:images/jpg;base64," alt="Trainer Avatar" class="trainer-avatar">
                                            <input class="trainer-input" type="radio" name="selected-trainer" value=" id="trainer1">
                                                   <label for="trainer1">
                                                <span class="trainer-name">Name: </span>
                                            </label>
                                        </div>
                                    end of trainer
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="saveTrainer" data-bs-dismiss="modal">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>-->
                                </div>
                                <div class="row" style="margin-top: 2rem">
                                    <div class="mb-3">
                                        <label for="" class="form-label">
                                            Bird Image
                                        </label>
                                    </div>
                                    <div class="mb-3">                           
                                        <img src="data:images/jpg;base64,${detail.bird_img}" alt="" width="300" height="300" id="image">
                                        <input type="file" name="birdImage" id="imageFile" accept="image/gif, image/jpeg, image/png" onchange="chooseFile(this)">                  
                                        <input type="hidden" name="birdIMGDATA" value="${detail.bird_img}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="forms-footer">

                                <div> 
                                    <button type="submit"  class="btn approve" style="margin-top: 4rem;">Update</button>
                                </div>

                                <div>
                                    <a href="BirdDeleteByCustomerIDServlet?id=${detail.bird_id}"><button type="button"  class="btn btn-danger" style="border-radius: 10px;margin-top: 4rem;">Delete</button></a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </c:if>
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