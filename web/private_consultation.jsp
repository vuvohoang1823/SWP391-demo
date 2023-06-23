<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/privateConsultation.css" type="text/css">
        <title>Document</title>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="body-container">
            <section class="section-head">
                <div class="desc-container">
                    <h2>PRIVATE CONSULTANT</h2>
                    <h1>Expert Guidance for Personal and Professional Success</h1>
                    <p>
                        Our Private Consultant UI offers personalized and tailored guidance
                        to help you achieve your personal and professional goals. Whether
                        you're seeking career advice, business strategy, or personal
                        development, our experienced consultants are here to provide
                        valuable insights and support.
                    </p>
                    <div class="button-container">
                        <button>Explore Choices</button>
                    </div>
                </div>
                <div class="img-container">
                    <div class="image1">
                        <img src="./img/pc.jpg" alt="" />
                    </div>
                </div>
            </section>
            <section class="section-services">
                <div class="heading">
                    <h2>CONSULTATION SERVICES</h2>
                    <div>
                        <h1>Available Consultations Service</h1>
                    </div>
                </div>
                <div
                    id="carouselContainer"
                    class="carousel slide"
                    data-bs-ride="carousel"
                    >
                    <div class="carousel-indicators">
                        <button
                            type="button"
                            data-bs-target="#carouselContainer"
                            data-bs-slide-to="0"
                            class="active"
                            aria-current="true"
                            aria-label="Slide 1"
                            ></button>
                        <button
                            type="button"
                            data-bs-target="#carouselContainer"
                            data-bs-slide-to="1"
                            aria-label="Slide 2"
                            ></button>
                        <button
                            type="button"
                            data-bs-target="#carouselContainer"
                            data-bs-slide-to="2"
                            aria-label="Slide 3"
                            ></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="./img/parrot.jpg" class="d-block w-100" alt="..." />
                            <div class="carousel-caption d-none d-md-block">
                                <h5 class="card-title">Foundation and Basic Training</h5>
                                <p class="card-text">
                                    Our Foundation and Basic Training service is designed to
                                    provide you with the fundamental skills and knowledge needed
                                    to excel in your personal and professional endeavors. Led by
                                    our expert consultants, this service focuses on establishing a
                                    solid framework that sets the stage for long-term success.
                                    During these sessions, you will dive into essential topics
                                    such as goal setting, effective communication, time
                                    management, and problem-solving techniques. Our consultants
                                    will guide you through practical exercises and provide
                                    valuable insights to help you develop a strong foundation for
                                    growth.
                                </p>
                                <div class="button-container">
                                    <a href="#consultation-form">
                                        <button class="card-contact">Contact us to book</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="./img/parrot.jpg" class="d-block w-100" alt="..." />
                            <div class="carousel-caption d-none d-md-block">
                                <h5 class="card-title">Behaviour Modification Sessions</h5>
                                <p class="card-text">
                                    Our Foundation and Basic Training service is designed to
                                    provide you with the fundamental skills and knowledge needed
                                    to excel in your personal and professional endeavors. Led by
                                    our expert consultants, this service focuses on establishing a
                                    solid framework that sets the stage for long-term success. Our
                                    Behavior Modification Sessions offer targeted support for
                                    individuals seeking to modify and transform their behaviors.
                                    Led by our skilled consultants, these sessions provide a safe
                                    and confidential space to address and modify negative
                                    patterns, fostering personal growth and empowering you to make
                                    lasting positive changes.
                                </p>

                                <div class="button-container">
                                    <a href="#consultation-form">
                                        <button class="card-contact">Contact us to book</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="./img/parrot.jpg" class="d-block w-100" alt="..." />
                            <div class="carousel-caption d-none d-md-block">
                                <h5 class="card-title">Novel / Trick Training Sessions</h5>
                                <p class="card-text">
                                    Our Novel/Trick Training Sessions offer a fun and innovative
                                    approach to training, allowing you to unlock your creativity
                                    and deepen the bond with your feathered friends. Led by our
                                    skilled consultants, these sessions focus on teaching your
                                    birds unique and engaging tricks that will leave everyone
                                    amazed. In these sessions, you will learn a variety of tricks
                                    and novel behaviors that go beyond the basics. From fetching
                                    objects to performing acrobatics, our consultants will guide
                                    you step-by-step, providing tips, techniques, and
                                    troubleshooting advice to help you achieve impressive results.
                                </p>
                                <div class="button-container">
                                    <a href="#consultation-form">
                                        <button class="card-contact">Contact us to book</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button
                        class="carousel-control-prev"
                        type="button"
                        data-bs-target="#carouselContainer"
                        data-bs-slide="prev"
                        >
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button
                        class="carousel-control-next"
                        type="button"
                        data-bs-target="#carouselContainer"
                        data-bs-slide="next"
                        >
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </section>
            <section class="section-consultants">
                <div class="heading">
                    <h2>OUR CONSULTANTS</h2>
                    <div>
                        <h1>Expert Guidance for Bird Training Success</h1>
                    </div>
                </div>
                <div class="cards-container row">
                    <div class="card-container">
                        <img src="./img/kygo.jpg" alt="" />
                        <div class="desc-container">
                            <div class="name">Kyrre Gørvell-Dahll</div>
                            <div class="skills">Avian Behaviour and Training Consultant</div>
                            <div class="button-container">
                                <a href="">
                                    <button>Book now</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- card end -->
                </div>
            </section>
            <section id="consultation-form">
                <div class="heading">
                    <h2>CONSULTATION FORM</h2>
                    <div>
                        <h1>We Know Our Customer Best</h1>
                    </div>
                </div>
                <%@include file="privateconsultationform.jsp" %>
            </section>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>