<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/orderList.css" type="text/css">
        <title>Bird Course - Checkout</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <jsp:useBean id="a" class="DAO.BookingDAO" scope="request"></jsp:useBean>
            <div class="title">
                <p>
                    Bird Course - Checkout
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
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Course name</th>
                            <th>Customer</th>
                            <th>Purchase date</th>
                            <th>Price</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${a.completedOrder}" var="order" varStatus="counter">
                    <tr>
                    <form action="CheckOutBirdCourse">
                        <input type="hidden" name="bird_id" value="${order.birdID}">
                        <td>${counter.count}</td>s
                        <td>${order.courseName}</td>
                        <td>${order.customerName}</td>
                        <td>${order.start_date}</td>
                        <td>£${order.coursePrice}</td>
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
                                            Complete this purchase ?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="footer-item" name="action" value="deny"
                                                    style="background-color: #617A55;width: 10rem;font-size: 2rem;border-radius: 3rem; height: 4rem; color: white; font-weight: bolder">
                                                Deny
                                            </button>
                                            <button type="submit" class="footer-item" name="action" value="approve"
                                                    style="background-color: #617A55;width: 10rem;font-size: 2rem;border-radius: 3rem; height: 4rem; color: white; font-weight: bolder">
                                                Approve
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>



