<%--
    Document   : homepage
    Created on : May 30, 2023, 2:26:13 PM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/homepage.css" type="text/css">
        <jsp:useBean id="a" class="DAO.FeedbackDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="i" class="DAO.courseDAO" scope="request"></jsp:useBean>
            <title>Home</title>
        </head>
        <body style="margin:0">

            <!--            header-->
        <%@ include file="header.jsp" %>


        <!--            body-->
        <div class="home-container">
            <section class="section-head">
                <div class="image-container">
                    <img src="img/image 7.png" alt="" draggable="false"/>
                </div>
                <div class="content">
                    <h1>READY TO EXPLORE THE BEAUTY OF WONDERFUL WORLD</h1>
                    <p>
                        Welcome to the world of bird training! Bird Training Centers provide a unique and specialized environment where birds and their owners can come together to learn and develop essential skills. Whether you are a first-time bird owner or an experienced enthusiast, these centers offer a range of services to help you enhance your bond with your feathered companion and ensure their well-being.
                    </p>
                </div>
            </section>
            <%@ include file="Home_TopCourse.jsp" %>

            <section class="service-container">
                <div class="heading">
                    <h2>OUR AVAILABLE SERVICE</h2>
                    <div>
                        <h1>AREAS OF EXPERTISE</h1>
                    </div>
                </div>
                <div class="service-body">
                    <div class="row">
                        <div class="col-lg-3 image-container">
                            <img src="img/homeBirdCourse.png" alt="" draggable="false"/>
                        </div>
                        <div class="col-lg-3 description-container">
                            <div class="header">BIRD COURSE</div>
                            <div class="description">
                                On-demand, self paced courses and webinars on parrot training,
                                behaviour, husbandry, enrichment and more.
                            </div>
                            <div class="button-container">
                                <a href="birdcourse.jsp" style="text-decoration: none"><button>LEARN MORE</button></a>
                            </div>
                        </div>
                        <div class="col-lg-3 image-container">
                            <img src="img/homeWorkshops.png" alt="" draggable="false"/>
                        </div>
                        <div class="col-lg-3 description-container">
                            <div class="header">WORKSHOPS</div>
                            <div class="description">
                                Our unique Parrot Training Academy workshop series aimed at parrot
                                enthusiasts of all skill levels and knowledge! In-person, Virtual
                                and On Demand!
                            </div>
                            <div class="button-container">
                                <a href="workshop.jsp" style="text-decoration: none"><button>LEARN MORE</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 description-container">
                            <div class="header">ONLINE COURSE</div>
                            <div class="description">
                                Customised workshops/presentations or consulting services for
                                professional organisations such as vets, rescues, shelters, zoos
                                and other animal related businesses.
                            </div>
                            <div class="button-container">
                                <a href="online_course.jsp" style="text-decoration: none"><button>LEARN MORE</button></a>
                            </div>
                        </div>
                        <div class="col-lg-3 image-container">
                            <img src="img/homeOnlineCourse.png" alt="" draggable="false"/>
                        </div>
                        <div class="col-lg-3 description-container">
                            <div class="header">PRIVATE CONSULTANT</div>
                            <div class="description">
                                In-home and Online Consultations for all of your parrot related
                                questions or concerns including foundations, behaviour problems,
                                enrichment and more!
                            </div>
                            <div class="button-container">
                                <a href="private_consultation.jsp" style="text-decoration: none"><button>LEARN MORE</button></a>
                            </div>
                        </div>
                        <div class="col-lg-3 image-container">
                            <img src="img/homePrivateConsultant.png" alt="" draggable="false"/>
                        </div>
                    </div>
                </div>
            </section>
            <section class="service2-container">
                <div class="heading">
                    <h2>OUR AVAILABLE SERVICE</h2>
                    <div>
                        <h1>Building Lasting Bonds, Together</h1>
                    </div>
                </div>
                <div class="bottom-half-container">
                    <div class="left-side">
                        <div class="image-1">
                            <img src='./img/Rectangle 12.png' alt="" draggable="false"/>
                        </div>
                        <div class="image-2">
                            <img src='./img/Rectangle 13.png' alt="" draggable="false"/>
                        </div>
                    </div>
                    <div class="right-side">
                        <div class="header">
                            EFFECTIVE BIRD TRAINING, REAL BEHAVIOR SOLUTION
                        </div>
                        <p class="desc-container">
                            At our Effective Bird Training Center, we envision a world where birds and their human companions enjoy a fulfilling and loving bond. We are dedicated to making this vision a reality, one bird at a time. Come join our feathered family and experience the joy of training and understanding your avian companion like never before!
                        </p>
                        <div class="checkmark-container">
                            <div>
                                <img src='./img/349252734_479596974359728_5596993599118262797_n.png' alt="" draggable="false"/>
                                <b>Develop a clear and loving relationship</b>
                            </div>
                            <div>
                                <img src='./img/349252734_479596974359728_5596993599118262797_n.png' alt="" draggable="false"/>
                                <b>Being able to commutnicate with them</b>
                            </div>
                            <div>
                                <img src='./img/349252734_479596974359728_5596993599118262797_n.png' alt="" draggable="false"/>
                                <b>Always be eager to pelase</b>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section-results">
                <div class="heading">
                    <h2>OUR RESULTS</h2>
                    <div>
                        <h1>OUR DRESSAGE RESULTS ARE FANTASTIC</h1>
                    </div>
                </div>
                <div class="results-container">
                    <div class="result-container">
                        <div
                            style="
                            color: #e39c46;
                            font-weight: bold;
                            "
                            class="statistic"
                            >
                            20+
                        </div>
                        <div>
                            <h1>YEARS OF EXPERIENCE</h1>
                        </div>
                    </div>
                    <div class="result-container">
                        <div style=" color: #2f7cea"  class="statistic">
                            300K
                        </div>
                        <h1>TOTAL BIRDS TRAINED</h1>
                    </div>
                    <div class="result-container">
                        <div style=" color: #ef7b6b"  class="statistic">
                            12
                        </div>
                        <h1>BIRD TRAINERS</h1>
                    </div>
                    <div class="result-container">
                        <div style=" color: #977cf0"  class="statistic">
                            18
                        </div>
                        <h1>MONTHLY TRAINING</h1>
                    </div>
                </div>
            </section>
            <section class="section-testimonial">
                <div class="heading">
                    <h2>TESTIMONIAL</h2>
                    <div>
                        <h1>WHAT OUR CIENT SAY</h1>
                    </div>
                </div>
                <div class="image-container">
                    <div id="feedbacks-slider" class="image-slider">
                        <c:forEach items="${a.allFeeedBack}" var="i">
                            <div
                                style="margin: 1.5%; box-shadow: 0.1rem 0.1rem 0.1rem 0.1rem rgba(0, 0, 0, 0.3);"
                                class="image-wrapper"
                                >
                                <div>
                                    <img src="data:image/png;base64,${i.image}" draggable="false">
                                    <div class="desc">
                                        <div class="desc-container mb-5">
                                            ${i.comments}
                                        </div>
                                        <div class="m-auto" style="width: 90%">${i.fullname}</div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </section>
            <section class="section-foot">
                <div class="heading">
                    <div
                        style="
                        font-size: 4rem;
                        margin-top: 2%;
                        display: flex;
                        flex-direction: column;
                        "
                        >
                        <h1 style="text-align: center; align-self: center;">ANY BIRDS ANY SIZE ANY PROBLEM</h1>
                        <h1 style=" color: #617a55; text-align: center; align-self: center;" >GUARANTEED</h1>
                    </div>
                </div>
                <div class="desc-container">
                    <div>
                        So what are you waiting for? Contact us now!
                    </div>
                </div>
                <div class="button-container">
                    <a href="#contact-us">
                        <button>Let's Talk</button>
                    </a>
                </div>
            </section>
            <%@ include file="Home_ContactUs.jsp" %>
        </div>
        <!--    drag scroll-->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const ele = document.getElementById('feedbacks-slider');
                ele.style.cursor = 'grab';

                let pos = {top: 0, left: 0, x: 0, y: 0};

                const mouseDownHandler = function (e) {
                    ele.style.cursor = 'grabbing';
                    ele.style.userSelect = 'none';

                    pos = {
                        left: ele.scrollLeft,
                        top: ele.scrollTop,
                        // Get the current mouse position
                        x: e.clientX,
                        y: e.clientY
                    };

                    document.addEventListener('mousemove', mouseMoveHandler);
                    document.addEventListener('mouseup', mouseUpHandler);
                };

                const mouseMoveHandler = function (e) {
                    // How far the mouse has been moved
                    const dx = e.clientX - pos.x;
                    const dy = e.clientY - pos.y;

                    // Scroll the element
                    ele.scrollTop = pos.top - dy;
                    ele.scrollLeft = pos.left - dx;
                };

                const mouseUpHandler = function () {
                    ele.style.cursor = 'grab';
                    ele.style.removeProperty('user-select');

                    document.removeEventListener('mousemove', mouseMoveHandler);
                    document.removeEventListener('mouseup', mouseUpHandler);
                };

                // Attach the handler
                ele.addEventListener('mousedown', mouseDownHandler);
            });
        </script>
        <!--        footer-->
        <%@ include file="footer.jsp" %>
    </body>
</html>
