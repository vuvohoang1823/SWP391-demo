<%--
    Document   : blogs
    Created on : Jun 23, 2023, 11:37:59 PM
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
        <link rel="stylesheet" href="css/blogs.css" />
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section class="blogs-header">
            <div id="carouselExampleCaptions" class="carousel slide">
                <div class="carousel-indicators">
                    <button
                        type="button"
                        data-bs-target="#carouselExampleCaptions"
                        data-bs-slide-to="0"
                        class="active"
                        aria-current="true"
                        aria-label="Slide 1"
                        ></button>
                    <button
                        type="button"
                        data-bs-target="#carouselExampleCaptions"
                        data-bs-slide-to="1"
                        aria-label="Slide 2"
                        ></button>
                    <button
                        type="button"
                        data-bs-target="#carouselExampleCaptions"
                        data-bs-slide-to="2"
                        aria-label="Slide 3"
                        ></button>
                </div>
                <div class="search-bar">
                    <form onsubmit="event.preventDefault();" role="search">
                        <label for="search">Search for stuff</label>
                        <input
                            id="search"
                            type="search"
                            placeholder="Search for Blogs, User, Hashtags..."
                            autofocus
                            required
                            />
                        <button type="submit">Go</button>
                    </form>
                </div>
                <!-- slides -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img
                            src="./img/blogHeader1.png"
                            class="d-block w-100"
                            alt="..."
                            />
                        <div class="carousel-caption d-none d-md-block">
                            <div>
                                <span>19/05/2023</span>
                                <span>Mike Wazaoski</span>
                            </div>
                            <h5>
                                The Art of Imitation: How Mockingbirds Master the Art of Mimicry
                            </h5>
                            <div class="button-container">
                                <a href="#">
                                    <button>Read more</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img
                            src="./img/blogHeader1.png"
                            class="d-block w-100"
                            alt="..."
                            />
                        <div class="carousel-caption d-none d-md-block">
                            <div>
                                <span>19/05/2023</span>
                                <span>Mike Wazaoski</span>
                            </div>
                            <h5>
                                The Art of Imitation: How Mockingbirds Master the Art of Mimicry
                            </h5>
                            <div class="button-container">
                                <a href="#">
                                    <button>Read more</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img
                            src="./img/blogHeader1.png"
                            class="d-block w-100"
                            alt="..."
                            />
                        <div class="carousel-caption d-none d-md-block">
                            <div>
                                <span>19/05/2023</span>
                                <span>Mike Wazaoski</span>
                            </div>
                            <h5>
                                The Art of Imitation: How Mockingbirds Master the Art of Mimicry
                            </h5>
                            <div class="button-container">
                                <a href="#">
                                    <button>Read more</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <button
                    class="carousel-control-prev"
                    type="button"
                    data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="prev"
                    >
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button
                    class="carousel-control-next"
                    type="button"
                    data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="next"
                    >
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
        <section class="blogs-body">
            <div class="heading">
                <h2>OUR BLOGS & TIPS</h2>
                <div>
                    <h1>Stay Informed, Discover Inspiration</h1>
                </div>
            </div>
            <div class="blogs-container row">
                <!-- start of card -->
                <div class="blog-container">
                    <img src="./img/Rectangle 12.png" alt="" />
                    <div class="desc-container">
                        <h5>
                            Mastering the Skies: Training Eagles to Soar with Strength and
                            Grace
                        </h5>
                        <div class="date-write">
                            <span>May, 22, 2023</span>
                            <span>Mike Wazaoski</span>
                        </div>
                        <div>
                            A diam sollicitudin tempor id eu nisl nunc mi. Elit ullamcorper
                            dignissim cras tincidunt. Sed euismod nisi porta lorem. Semper
                            risus in hendrerit gravida rutrum
                        </div>
                    </div>
                    <div class="button-container">
                        <a href="blogDetail.jsp">
                            <button>Read more</button>
                        </a>
                    </div>
                </div>
                <!-- end of card -->
            </div>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>
