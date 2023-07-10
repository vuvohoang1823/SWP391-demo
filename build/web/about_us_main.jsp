<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
                      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
                 bootstrap@4.5.2
                <link
                    rel="stylesheet"
                    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
                    />-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="css/aboutUs.css">
        <title>Document</title>
    </head>

    <body>
        <!--        header-->
        <%@ include file="header.jsp" %>
        <!--        body-->
        <div class="container-fluid">
            <div class="row body-intro">
                <div class="col-lg-5 img-section">
                    <img src="img/trainer1.jpg" alt="" class="img1">
                    <img src="img/bird.jpg" alt="" class="img2">
                </div>
                <div class="col-lg-7 content-section">
                    <p class="title">OUR MISSION</p>
                    <p class="sub-title">Our Mission Is To Create a Partnership
                        Between Birds and Owner
                    </p>
                    <p class="content">
                        At Bird Training Center, we are driven to cultivate a
                        strong and harmonious bond <br />between birds and their owners.
                        Creating a genuine partnership between humans <br /> and birds is
                        the key to nurturing a thriving relationship filled with
                        understanding, trust.
                    </p>
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
            </div>
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
                    <img src="./img/trainer2.jpg" alt="">
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
        </div>
        <%@ include file="footer.jsp" %>
        <script src="js/about_us.js"></script>
    </body>

</html>