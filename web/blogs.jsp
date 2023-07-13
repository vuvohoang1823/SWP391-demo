<%--
    Document   : blogs
    Created on : Jun 23, 2023, 11:37:59 PM
    Author     : thang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <jsp:useBean id="blog" class="DAO.BlogDAO" scope="request"></jsp:useBean>
        </head>
        <body>
        <%@include file="header.jsp" %>
        <section class="blogs-header">
            <div id="carouselExampleCaptions" class="carousel slide" style="z-index: 0">
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
                            draggable="false"
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
                            draggable="false"
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
                            draggable="false"
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
                <c:forEach var="card" items="${blog.getLisofBlog('available')}">
                    <div class="blog-container">
                        <img src="data:images/jpg;base64,${card.thumbnail}" draggable="false"/>
                        <div class="desc-container">
                            <h5 class="blog-title">${card.title}</h5>
                            <div class="date-write">
                                <span>${card.date}</span>
                                <span style="float: right">${card.author}</span>
                            </div>
                            <div class="blog-description">
                                ${card.briefinfo}
                            </div>
                        </div>
                        <div class="button-container">
                            <a href="MainController?action=view_blog_detail&blog_id=${card.blogid}">
                                <button>Read more</button>
                            </a>
                        </div>
                    </div>
                </c:forEach>
                <!-- end of card -->
            </div>
        </section>
        <!--        trim title-->
        <script>
            // Get all question message elements
            var blogTitle = document.getElementsByClassName("blog-title");

            // Loop through each question message element
            for (var i = 0; i < blogTitle.length; i++) {
                var title = blogTitle[i].textContent.trim();

                // Remove any leading or trailing spaces and invisible characters
                title = title.replace(/^\s+|\s+$/g, "");

                // Remove non-printable characters using regular expression
                title = title.replace(/[^ -~]+/g, "");

                const titleLength = 30;

                // Check if the title length is greater than 10
                if (title.length > titleLength) {
                    // Truncate the title and append "..."
                    var truncatedMessage = title.substring(0, titleLength) + "...";
                    blogTitle[i].textContent = truncatedMessage;
                }
            }
        </script>
        <!--        trim description-->
        <script>
            // Get all question message elements
            var blogDescription = document.getElementsByClassName("blog-description");

            // Loop through each question message element
            for (var i = 0; i < blogDescription.length; i++) {
                var description = blogDescription[i].textContent.trim();

                // Remove any leading or trailing spaces and invisible characters
                description = description.replace(/^\s+|\s+$/g, "");

                // Remove non-printable characters using regular expression
                description = description.replace(/[^ -~]+/g, "");

                const descriptionLength = 200;

                // Check if the description length is greater than 10
                if (description.length > descriptionLength) {
                    // Truncate the description and append "..."
                    var truncatedMessage = description.substring(0, descriptionLength) + "...";
                    blogDescription[i].textContent = truncatedMessage;
                }
            }
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
