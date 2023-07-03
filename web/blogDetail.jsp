<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
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
                    <img src="data:images/jpg;base64,${detail.thumbnail}"/>
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
                            <h5>Introduction:</h5>
                            <!--------------->
                            ${detail.introduction}
                        </div>
                        <div>
                            <!-- hard code -->
                            <br />
                            <b>1. Understanding of the post Blog Detail</b>
                            <!--------------->
                            ${detail.content1}
                            <!-- hard code -->
                            <div class="img-container">
                                <img src="data:images/jpg;base64,${detail.contentIMG}"/>
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
                            <h5>Conclusion</h5>
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
                        
                        <div class="blogs-slider">
                             <c:forEach var="card" items="${blog.lisofBlog}">
                            <!-- start item -->
                            <div class="blog">
                                <div class="img-container">
                                    <img style="" src="data:images/jpg;base64,${card.thumbnail}"/>
                                </div>
                                <div class="desc-container">
                                    <h5>
                                         ${card.title}
                                    </h5>
                                    <div class="date-time">
                                        <span>May, - ${card.date}</span>
                                        <span>${card.author}</span>
                                    </div>
                                    <div>
                                         ${card.briefinfo}
                                    </div>
                                    <div class="button-container">
                                        <button>Read more</button>
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
    <!--footer-->
    <%@ include file="footer.jsp" %>
</body>
</html>