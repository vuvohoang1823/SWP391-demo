<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/orderList.css" type="text/css">
        <jsp:useBean id="order" class="DAO.FormApppointmentDAO"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
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
        <div class="title">
            <p>
                Pending Orders
            </p>
        </div>
        <div class="container searchbar-container" style="padding-top: 5rem">
            <div class="row">
                <div class="col-lg-12">
                    <div class="input-group">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="Search for Order ID"
                            />
                        <div class="input-group-append">
                            <span class="input-group-text" style="height: 100%">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="16"
                                    height="16"
                                    fill="currentColor"
                                    class="bi bi-search"
                                    viewBox="0 0 16 16"
                                    >
                                <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
                                    />
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="w3-container" style="padding-top: 5rem">

            <table class="w3-table-all w3-large">
                <tr>
                    <th>ID</th>
                    <th>Service type</th>
                    <th>Detail</th>
                    <th>Purchase date</th>
                    <th>Price</th>
                    <th>Customer</th>
                    <th></th>
                </tr>
                <tr>
                    <c:forEach var="list" items="${order.appointmentFormProcessing}">
                    <td>1</td>
                    <td>Basic Private Consultation </td>
                    <td>Speak human language</td>
                    <td>11-6-2023</td>
                    <td>£120.00</td>
                    <td>Namvippro</td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: #617A55;width: 10rem;font-size: 2rem">
                            Edit
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Complete this purchase
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <button type="button" class="btn btn-primary">Confirm</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                </c:forEach>
<!--                <tr>
                    <td>3</td>
                    <td>Private Consultant</td>
                    <td>Basic Consultation...</td>
                    <td>11-6-2023</td>
                    <td>£120.00</td>
                    <td>Namvippro</td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: #617A55;width: 10rem;font-size: 2rem">
                            Edit
                        </button>

                         Modal 
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Complete this purchase
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <button type="button" class="btn btn-primary">Confirm</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Bird Course</td>
                    <td>Speak human language</td>
                    <td>11-6-2023</td>
                    <td>£120.00</td>
                    <td>Namvippro</td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: #617A55;width: 10rem;font-size: 2rem">
                            Edit
                        </button>

                         Modal 
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Complete this purchase
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <button type="button" class="btn btn-primary">Confirm</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>-->
            </table>
        </div>
    </body>
</html>