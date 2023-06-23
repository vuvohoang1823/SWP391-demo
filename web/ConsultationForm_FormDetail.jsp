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
        <link rel="stylesheet" href="css/ConsultationForm_FormDetail.css" />
        <jsp:useBean id="f" class="DAO.FormApppointmentDAO"></jsp:useBean>
        <jsp:useBean id="t" class="DAO.TrainerDAO" ></jsp:useBean>
        </head>
        <body>
        <%@ include file="header.jsp" %>
        <a href="ConsultationForm_Pending.jsp">
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
                  <c:if test="${not empty sessionScope.appointment_detail_NOTCHOOSE}">
                    <c:set var="detail" value="${sessionScope.appointment_detail_NOTCHOOSE}"/>
                <div class="forms-header">
                    <div class="left-side"><b>Form Detail</b></div>
                    <div class="right-side">
                        <span>Submitted: <b id="currentday"></b></span>
                        <span><b>${detail.consultation_id}</b></span>
                        <span class="online">${detail.type}</span>
                    </div>
                </div>
              

                    <form  action="ConsultationNotChooseCOntroller" method="post"  >
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
                                                value="${detail.customer_fullname}"
                                                disabled
                                                />
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label for="phonenumber" class="form-label"
                                                   >Phone number</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="phonenumber"
                                                placeholder=""
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
                                            value="${detail.address}"
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
                                                placeholder="Form title"
                                                value="Basic Consultation Request"
                                                disabled
                                                />
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                               <c:set var="RequestTrainerid" value="${detail.request_trainer_id}"/> 
                                 <c:choose> 
                                     <c:when test="${not empty RequestTrainerid}">
                                         <c:set var="g" value="${t.getTrainerByID(RequestTrainerid)}"/>
                                         <div class="mb-3">
                                            <label for="trainername" class="form-label"
                                                   >Trainer requested</label
                                            >
                                            <div class="input-group">
                                                <input
                                                    id="trainername"
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="${g.fullName}"
                                                    disabled
                                                    />
                                                <!--only this gets submitted-->
                                                <input
                                                    id="hiddenTrainerName"
                                                    type="hidden" value="${g.fullName}"
                                                    />
                                                <!---------------------------->
                                                <button
                                                    class="btn btn-primary"
                                                    type="button"
                                                    id="button-addon2"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#chooseTrainer"
                                                    >
                                                    Select Trainer
                                                </button>
                                                <!-- Modal -->
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
                                                                <h1 class="modal-title fs-5">Trainers:</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                
                                                                <div class="trainer-list">
                                                                    <!--important: none needed for customers that didnt choose trainer (must change before submit form)-->
                                                                    <div class="trainer-item">
                                                                        <input class="trainer-input" type="radio" name="selected-trainer" value="none" id="trainer-none">
                                                                        <label for="trainer-none">
                                                                            None
                                                                        </label>
                                                                    </div>
                                                                    <!--start of trainer -->
                                                                    <c:forEach items="${t.trainerUnavailableWithfullSkill}" var="trainerinfo">
                                                                    <div class="trainer-item">
                                                                        <img src="data:images/jpg;base64,${trainerinfo.img}" alt="Trainer Avatar" class="trainer-avatar">
                                                                        <input class="trainer-input" type="radio" name="selected-trainer" value="${trainerinfo.trainerID}" id="trainer1" check>
                                                                        <label for="trainer1">
                                                                            <span class="trainer-name">Name: ${trainerinfo.fullName}</span>
                                                                            <span> - </span>
                                                                            <span class="trainer-skill">Skill: ${trainerinfo.skill_name}</span>
                                                                            <span> - </span>
                                                                            <span class="trainer-skill">Contact: ${trainerinfo.contact}</span>
                                                                        </label>
                                                                    </div>
                                                                    </c:forEach>
                                                                    <!--end of trainer-->
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
                                     </c:when>
                                      <c:otherwise> 
                                        <div class="mb-3">
                                            <label for="trainername" class="form-label"
                                                   >Trainer requested</label
                                            >
                                            <div class="input-group">
                                                <input
                                                    id="trainername"
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="None"
                                                    disabled
                                                    />
                                                <!--only this gets submitted-->
                                                <input
                                                    id="hiddenTrainerName"
                                                    type="hidden"
                                                    />
                                                <!---------------------------->
                                                <button
                                                    class="btn btn-primary"
                                                    type="button"
                                                    id="button-addon2"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#chooseTrainer"
                                                    >
                                                    Select Trainer
                                                </button>
                                                <!-- Modal -->
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
                                                                <h1 class="modal-title fs-5">Trainers:</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                
                                                                <div class="trainer-list">
                                                                    <!--important: none needed for customers that didnt choose trainer (must change before submit form)-->
                                                                    <div class="trainer-item">
                                                                        <input class="trainer-input" type="radio" name="selected-trainer" value="none" id="trainer-none" checked>
                                                                        <label for="trainer-none">
                                                                            None
                                                                        </label>
                                                                    </div>
                                                                    <!--start of trainer -->
                                                                    <c:forEach items="${t.trainerUnavailableWithfullSkill}" var="trainerinfo">
                                                                    <div class="trainer-item">
                                                                        <img src="data:images/jpg;base64,${trainerinfo.img}" alt="Trainer Avatar" class="trainer-avatar">
                                                                        <input class="trainer-input" type="radio" name="selected-trainer" value="${trainerinfo.trainerID}" id="trainer1">
                                                                        <label for="trainer1">
                                                                            <span class="trainer-name">Name: ${trainerinfo.fullName}</span>
                                                                            <span> - </span>
                                                                            <span class="trainer-skill">Skill: ${trainerinfo.skill_name}</span>
                                                                            <span> - </span>
                                                                            <span class="trainer-skill">Contact: ${trainerinfo.contact}</span>
                                                                        </label>
                                                                    </div>
                                                                    </c:forEach>
                                                                    <!--end of trainer-->
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
                                      </c:otherwise>
                                 </c:choose>
                                  
              <!-- close c:if---->   
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

                        <div class="forms-footer">
                            <div>Form Status:</div>
                            <div>
                                <button type="submit"   name="action" value="approve" class="btn btn-primary">Approve</button>
                            </div>
                            <div>
                                <button type="submit" name="action" value="deny" class="btn btn-secondary">Decline</button>
                            </div>
                        </div>
                    </form>
                </c:if>
                </div>
            </div>
            <%@ include file="footer.jsp" %>
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
