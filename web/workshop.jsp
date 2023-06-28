<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <!-- bootstrap@5.3.0 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- datepicker -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
            />
        <!-- css -->

        <link rel="stylesheet" type="text/css" href="css/workshop.css" />
        <link rel="stylesheet" type="text/css" href="css/reset.css" />
        <jsp:useBean id="i" class="DAO.courseDAO" scope="request"></jsp:useBean>



        </head>
        <body>
        <%@ include file="header.jsp" %>
        <!-- end of header -->
        <div class="body-container">
            <section class="section-head">
                <div class="desc-container">
                    <h2>WORKSHOPS</h2>
                    <h1>Hands-on Learning to Unleash Your Bird's Potential"</h1>
                    <p>
                        Our Bird Training Workshops offer an immersive and interactive
                        experience for bird owners who are eager to take their training
                        skills to the next level. Led by our expert trainers, these
                        workshops provide a unique opportunity to learn and practice
                        advanced techniques in a supportive and engaging environment.
                    </p>
                    <div class="button-container">
                        <button>Explore Workshops</button>
                    </div>
                </div>
                <div class="img-container">
                    <div class="image1">
                        <img src="./img/bluebirdgirl.png" alt="" />
                    </div>
                    <div class="image2">
                        <img src="./img/flyheader3pics.png" alt="" />
                    </div>
                </div>
            </section>
            <section class="section-body">
                <div class="heading">
                    <div>
                        <h1>Featured Workshops</h1>
                    </div>
                </div>
                <div class="container searchbar-container">
                    <form id="searchForm" action="/SWP391_MiniCapstone/workshop.jsp?">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="input-group">
                                    <input
                                        type="text"
                                        class="form-control"
                                        placeholder="Search for Bird Course"
                                        />
                                    <div class="input-group-append">
                                        <button>
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
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="input-group">
                                    <input
                                        type="text"
                                        class="form-control datepicker"
                                        placeholder="Select date"
                                        />
                                    <div class="input-group-append">
                                        <button>
                                            <span class="input-group-text" style="height: 100%">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16"
                                                    height="16"
                                                    fill="currentColor"
                                                    class="bi bi-calendar4-week"
                                                    viewBox="0 0 16 16"
                                                    >
                                                <path
                                                    d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"
                                                    />
                                                <path
                                                    d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"
                                                    />
                                                </svg>
                                            </span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <select class="custom-select" onchange="submitForm()" name="filterChose">
                                    <option hidden value="1" ${!filterChose ? "selected" : ""}>Other filter</option>
                                    <option value="1" ${filterChose eq "1" ? "selected" : ""}>Price (low to high)</option>
                                    <option value="2" ${filterChose eq "2" ? "selected" : ""}>Price (high to low)</option>
                                    <option value="3" ${filterChose eq "3" ? "selected" : ""}>Duration (long to short)</option>
                                    <option value="4" ${filterChose eq "4" ? "selected" : ""}>Duration (short to long)</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <section class="section-workshops">
                <div class="container">
                    <div class="row">
                        <c:forEach items="${i.allCourseWorkshop}" var="workshop" >
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="row no-gutters">
                                        <div class="col-md-3">
                                            <img
                                                src="data:images/jpg;base64,${workshop.image}"
                                                class="card-img"
                                                alt="Product Image 1"
                                                />
                                        </div>
                                        <div class="col-md-9">
                                            <div class="card-body">
                                                <h5 class="card-title">
                                                    ${workshop.title}
                                                </h5>
                                                <div class="desc-text">
                                                    ${workshop.content}
                                                </div>
                                                <div class="card-text">
                                                    <b>End enroll date:</b> ${workshop.end_enroll_date} <br />
                                                    <b>Time:</b> 2:00 PM - 4:00 PM <br />
                                                    <b>Location/Venue:</b> Central Community Center <br />
                                                    <b>Target Audience:</b> Bird owners of all experience
                                                    levels
                                                </div>
                                                <div class="extra-price">
                                                    <div class="button-container">
                                                        <a href="MainController?action=view_workshop_detail&courseID=${workshop.courseID}">
                                                            <button>More Information</button> 
                                                        </a>
                                                        
                                                    </div>
                                                    <p>£${workshop.price}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                       </c:forEach>
                    </div>
                </div>
            </section>
        </div>
        <!--        footer-->
        <%@ include file="footer.jsp" %>
        <!-- end of footer -->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        <script>
                                    $(document).ready(function () {
                                        $(".datepicker").datepicker({
                                            format: "yyyy-mm-dd",
                                            autoclose: true,
                                        });
                                    });
        </script>
        <script>
            function submitForm() {
                document.getElementById("searchForm").submit();
            }
        </script>
    </body>
</html>
