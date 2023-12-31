<%--
    Document   : about_us
    Created on : Jun 1, 2023, 10:47:03 AM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="css/aboutUs.css" type="text/css">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <title>About us</title>
    </head>
    <body style='margin:0'>
        <%@ include file="header.jsp" %>
        <section class="section-head">
            <div class="img-container">
                <div class="image2">
                    <img src="img/trainer1.jpg" alt="" class="img1">
                </div>
                <div class="image1">
                    <img src="img/bird.jpg" alt="" class="img2">
                </div>
            </div>
            <div class="desc-container">
                <div style="height: 70%; overflow-y: hidden">
                    <h2>OUR MISSION</h2>
                    <h1>Our Mission Is To Create a Partnership
                        Between Birds and Owner</h1>
                    <p>
                        At Bird Training Center, we are driven to cultivate a
                        strong and harmonious bond between birds and their owners.
                        Creating a genuine partnership between humans and birds is
                        the key to nurturing a thriving relationship filled with
                        understanding, trust.
                    </p>
                </div>
                <div class="bullet-point">
                    <div class="top">
                        <img src="img/check.jpg" alt="">
                        <p>Develop a clear and loving relationshiprelationship</p>
                    </div>
                    <div class="bottom">
                        <img src="img/check.jpg" alt="">
                        <p>Being able to communicate with them</p>
                    </div>
                </div>
            </div>
        </section>
        <div class="body-ourteam">
            <p class="title">OUR TEAM</p>
            <p class="sub-title">Professional Trainers Guiding
                Your <br />Bird Training Journey
            </p>
        </div>
        <div class="row body-showcase">
            <div class="col-lg-3 trainer">
                <img src="img/armin.jpg" alt="">
                <p class="name">Armin V.</p>
                <p class="role">Trainer</p>
            </div>
            <div class="col-lg-3 trainer">
                <img src="img/kygo.jpg" alt="">
                <p class="name">Kyrre G.</p>
                <p class="role">Trainer</p>
            </div>
            <div class="col-lg-3 trainer">
                <img src="img/martin.jpg" alt="">
                <p class="name">Martin G.</p>
                <p class="role">Trainer</p>
            </div>
            <div class="col-lg-3 trainer">
                <img src="img/tiesto.jpg" alt="">
                <p class="name">Tiesto</p>
                <p class="role">Trainer</p>
            </div>
        </div>
        <div class="row body-why">
            <div class="col-lg-6 why-content">
                <p class="title">WHY CHOOSE US</p>
                <p class="sub-title">Unlock the Best in <br />Bird Training with <br />Our Expertise</p>
                <p class="content">Choose us to embark on an enriching journey
                    of bird training, where expertise, positive reinforcement,
                    personalized programs, and a<br /> supportive community converge
                    to help you unlock the best in your<br /> feathered companion.
                    Together, let's create a bond that will last a lifetime.
                </p>
                <div class="percentage">
                    <div class="goal">
                        <p>Training goal</p>
                        <div class="shape1">
                            <div class="fill-75">
                                <p>75%</p>
                            </div>
                        </div>
                    </div>
                    <div class="guarantee">
                        <p>Training guarantee</p>
                        <div class="shape2">
                            <div class="fill-100">
                                <p>100%</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 why-images">
                <img src="img/trainer2.jpg" alt="">
                <div class="commitment">
                    <div class="check">
                        <img src="img/check.jpg" alt="">
                        <p>Individual Position</p>
                    </div>
                    <div class="check">
                        <img src="img/check.jpg" alt="">
                        <p>Relationship</p>
                    </div>
                    <div class="check">
                        <img src="img/check.jpg" alt="">
                        <p>Behavior</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="body-result">
            <p class="title">OUR RESULTS</p>
            <p class="sub-title">Our Dressage Results Are Fantastic</p>
        </div>
        <div class="row result-showcase">
            <div class="card">
                <p class="number">20+</p>
                <div class="desc">YEARS OF EXPERIENCE</div>
            </div>
            <div class="card">
                <p class="number">300K</p>
                <div class="desc">TOTAL BIRDS TRAINED</div>
            </div>
            <div class="card">
                <p class="number">12</p>
                <div class="desc">BIRD TRAINER</div>
            </div>
            <div class="card">
                <p class="number">18</p>
                <div class="desc">MONTHLY TRAINING</div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>