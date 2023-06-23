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
            <title>JSP Page</title>
        </head>
        <body style="margin:0">

            <!--            header-->
        <%@ include file="header.jsp" %>


        <!--            body-->
        <div class="home-container">
            <section class="section-head">
                <img src="img/image 7.png" alt="" />
                <div>
                    <h1>READY TO EXPLORE THE BEAUTY OF WONDERFUL WORLD</h1>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime
                        commodi rem voluptatem assumenda? Expedita eveniet perspiciatis
                        consequatur nemo. In quae cum facilis asperiores ipsam possimus
                        nesciunt illo vitae quos ex?
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
                            <img src="img/homeBirdCourse.png" alt="" />
                        </div>
                        <div class="col-lg-3 description-container">
                            <div class="header">BIRD COURSE</div>
                            <div class="description">
                                On-demand, self paced courses and webinars on parrot training,
                                behaviour, husbandry, enrichment and more.
                            </div>
                            <div class="button-container">
                                <button><a href="birdcourse" style="text-decoration: none">LEARN MORE</a></button>
                            </div>
                        </div>
                        <div class="col-lg-3 image-container">
                            <img src="img/homeWorkshops.png" alt="" />
                        </div>
                        <div class="col-lg-3 description-container">
                            <div class="header">WORKSHOPS</div>
                            <div class="description">
                                Our unique Parrot Training Academy workshop series aimed at parrot
                                enthusiasts of all skill levels and knowledge! In-person, Virtual
                                and On Demand!
                            </div>
                            <div class="button-container">
                             <button><a href="workshop" style="text-decoration: none">LEARN MORE</a></button>

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
                          <button><a href="onlinecourse" style="text-decoration: none">LEARN MORE</a></button>
                            </div>
                        </div>
                        <div class="col-lg-3 image-container">
                            <img src="img/homeOnlineCourse.png" alt="" />
                        </div>
                        <div class="col-lg-3 description-container">
                            <div class="header">PRIVATE CONSULTANT</div>
                            <div class="description">
                                In-home and Online Consultations for all of your parrot related
                                questions or concerns including foundations, behaviour problems,
                                enrichment and more!
                            </div>
                            <div class="button-container">
                      <button><a href="privateconsultation" style="text-decoration: none">LEARN MORE</a></button>
                            </div>
                        </div>
                        <div class="col-lg-3 image-container">
                            <img src="img/homePrivateConsultant.png" alt="" />
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
                            <img src='./img/Rectangle 12.png' alt="" />
                        </div>
                        <div class="image-2">
                            <img src='./img/Rectangle 13.png' alt="" />
                        </div>
                    </div>
                    <div class="right-side">
                        <div class="header">
                            EFFECTIVE BIRD TRAINING, REAL BEHAVIOR SOLUTION
                        </div>
                        <p class="desc-container">
                            Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                            Reprehenderit possimus architecto velit quos? Ratione perferendis
                            laudantium dolor cumque repudiandae obcaecati?
                        </p>
                        <div class="checkmark-container">
                            <div>
                                <img src='./img/349252734_479596974359728_5596993599118262797_n.png' alt="" />
                                <b>Develop a clear and loving relationship</b>
                            </div>
                            <div>
                                <img src='./img/349252734_479596974359728_5596993599118262797_n.png' alt="" />
                                <b>Being able to commutnicate with them</b>
                            </div>
                            <div>
                                <img src='./img/349252734_479596974359728_5596993599118262797_n.png' alt="" />
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
                    <div class="image-slider">
                        <c:forEach items="${a.allFeeedBack}" var="i">
                            <div
                                style=" margin-left: 3%; box-shadow: 0.1rem 0.1rem 0.1rem 0.1rem rgba(0, 0, 0, 0.3);"
                                class="image-wrapper"
                                >
                                <div>
                                    <img src="data:image/png;base64,${i.image}">
                                    <div class="desc">
                                        <h1>${i.fullname}</h1>
                                        <div class="desc-container">
                                            <p>${i.comments}</p>
                                        </div>
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
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                        Exercitationem fugiat enim voluptatum molestias laboriosam
                        necessitatibus omnis totam, similique itaque ullam rerum dolores a
                        quisquam ipsa repudiandae? Aspernatur ducimus facilis sed.
                    </div>
                </div>
                <div class="button-container">
                    <button>Let's Talk</button>
                </div>
            </section>
            <%@ include file="Home_ContactUs.jsp" %>
        </div>

        <!--        footer-->
        <%@ include file="footer.jsp" %>
    </body>
</html>
