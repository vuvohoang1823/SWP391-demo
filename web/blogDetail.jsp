<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${BLOG_DETAIL.title}</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" type="text/css" href="../reset.css" />
        <link rel="stylesheet" href="css/blogDetail.css">
    </head>
    <body>
        <jsp:useBean id="blog" class="DAO.BlogDAO" scope="request"></jsp:useBean>

        <%@include file="header.jsp" %>
        <c:if test="${not empty sessionScope.BLOG_DETAIL}">
            <c:set var="detail" value="${sessionScope.BLOG_DETAIL}"/>
            <div class="body-container">
                <section class="section-head">
                    <a href="blogs.jsp">
                        <div style="
                             z-index: 1;
                             position: absolute;
                             top: 5rem;
                             left: 5rem;
                             font-size: 2.5rem;
                             color: white;
                             ">
                            &lt; Back
                        </div>
                    </a>
                    <img src="data:images/jpg;base64,${detail.thumbnail}" draggable="false"/>
                    <div class="desc-container">
                        <div class="date-time">
                            <span>${detail.date}</span>
                            <span>${detail.author}</span>
                            <span>10 minutes reading</span>
                        </div>
                        <h1>
                            ${detail.title}
                        </h1>
                    </div>
                </section>
                <section class="section-body">
                    <div class="upvote">
                        <a href="#" class="triangle-up"></a>
                        <span class="vote-count">+15</span>
                        <a href="#" class="triangle-down"></a>
                    </div>
                    <div class="content">
                        <div>
                            <!-- hard code -->
                            <h5 class="fw-bold">Introduction:</h5>
                            <!--------------->
                            ${detail.introduction}
                        </div>
                        <div>
                            <!-- hard code -->
                            <br />
                            <b>1. Understanding of the post:</b>
                            <!--------------->
                            ${detail.content1}
                            <!-- hard code -->
                            <div class="img-container">
                                <img src="data:images/jpg;base64,${detail.contentIMG}" draggable="false"/>
                            </div>
                            <!--------------->
                        </div>
                        <div>
                            <!-- hard code -->
                            <b>2. Building Trust and Partnership:</b>
                            <!--------------->
                            ${detail.content2}
                        </div>
                        <div>
                            <!-- hard code -->
                            <br />
                            <h5 class="fw-bold">Conclusion</h5>
                            <!--------------->
                            ${detail.inconclusion}
                        </div>
                    </div>
                </section>
                <section class="section-more">
                    <div class="heading">
                        <h2>MORE BLOGS & TIPS</h2>
                        <div>
                            <h1>Discover more valuable insights!</h1>
                        </div>
                    </div>

                    <div class="blogs-container">

                        <div id="blogs-slider" class="blogs-slider">
                            <c:forEach var="card" items="${blog.getLisofBlog('available')}">
                                <!-- start item -->
                                <div class="blog">
                                    <div class="img-container">
                                        <img style="" src="data:images/jpg;base64,${card.thumbnail}" draggable="false"/>
                                    </div>
                                    <div class="desc-container">
                                        <h5 class="blog-title">${card.title}</h5>
                                        <div class="date-write">
                                            <span>May, - ${card.date}</span>
                                            <span>${card.author}</span>
                                        </div>
                                        <div class="blog-description">
                                            ${card.briefinfo}
                                        </div>
                                        <div class="button-container">
                                            <a href="MainController?action=view_blog_detail&blog_id=${card.blogid}">
                                                <button>Read more</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- end item -->
                        </div>

                    </div>

                </section>
            </div>
        </c:if>
    </body>
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
    <!--    drag scroll-->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const ele = document.getElementById('blogs-slider');
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
    <!--footer-->
    <%@ include file="footer.jsp" %>
</body>
</html>