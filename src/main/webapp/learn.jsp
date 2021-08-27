<%@ page import="java.util.List" %>
<%@ page import="ir.sajjadsh.SajjadSH.Model.ModelLearn" %>
<%@ page import="ir.sajjadsh.SajjadSH.Database.GetLearnVideos" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ir.sajjadsh.SajjadSH.Model.ModelVideo" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/SajjadSH" user="sajjad" password="32419"/>
<sql:query dataSource="${db}" var="selectservice">
    SELECT * FROM services;
</sql:query>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>SajjadSH</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link href="resources/img/logo.jpg" rel="icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.6.0/dist/leaflet.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/python-visualization/folium/folium/templates/leaflet.awesome.rotate.min.css"/>
<%--    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css'><link rel="stylesheet" href="./style.css">--%>


    <!-- Main Stylesheet File -->
    <link href="resources/css/style.css" rel="stylesheet">

    <!-- JavaScript Libraries -->
    <script src="resources/lib/jquery/jquery.min.js"></script>
    <script src="resources/lib/jquery/jquery-migrate.min.js"></script>
    <script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/lib/easing/easing.min.js"></script>
    <script src="resources/lib/mobile-nav/mobile-nav.js"></script>
    <script src="resources/lib/wow/wow.min.js"></script>
    <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
    <script src="resources/lib/waypoints/waypoints.min.js"></script>
    <script src="resources/lib/counterup/counterup.min.js"></script>
    <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="resources/lib/lightbox/js/lightbox.min.js"></script>
    <!-- Contact Form JavaScript File -->
    <script src="resources/contactform/contactform.js"></script>
    <script src="resources/js/FontAwesome.js" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/leaflet@1.6.0/dist/leaflet.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.js"></script>

    <script>
        L_NO_TOUCH = false;
        L_DISABLE_3D = false;
    </script>

    <!-- Template Main Javascript File -->
    <script src="resources/js/main.js"></script>
    <!-- Scripts.js -->
    <script src="resources/js/scripts.js"></script>
</head>

<body>
<%
    String num = request.getParameter("page");
    String code = (String) request.getAttribute("code");
    String titlelearn = (String) request.getAttribute("learnurl");
    List<ModelLearn> list = new ArrayList<>();
    List<ModelVideo> list1 = new ArrayList<>();
    list.clear();
    list1.clear();
    list =  new GetLearnVideos().getInfo(titlelearn,num);

%>

<jsp:include page="Header.jsp"/>


<section id="intro" class="clearfix">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/home">Home</a></li>
                <%
                    if (titlelearn == null ){
                %>
                <li class="breadcrumb-item active">Learn</li>
                <%
                    }else if (titlelearn != null ){
                %>
                <li class="breadcrumb-item"><a href="/learn">Learn</a></li>
                <li class="breadcrumb-item active" aria-current="page"><%=titlelearn%></li>
                <%
                    }
                %>
            </ol>
        </nav>
    </div>
</section>
<div class="container">
    <div class="row " dir="rtl">
        <aside id="aside" class="col-lg-4 col-md-12 col-sm-12">
            <div class="search">
<%--                    <header class="section-header">--%>
<%--                        <h3>Search</h3>--%>
<%--                    </header>--%>
                <label class="form-check-label" >
                    Title
                </label>
                <div class="form-check mx-4 mr-sm-3" dir="ltr">
                    <label class="form-check-label">
                        <a href="/learn">All Courses</a>
                    </label>
                    <hr>
                    <%
                        List<String> listTitle = (List<String>) request.getAttribute("learntitle");
                        for (String title : listTitle){
                    %>
                    <label class="form-check-label">
                        <a href="/learn?name=<%= title%>"><%= title%></a>
                    </label>
                    <%
                        }
                    %>
                </div>
            </div>

            <div class="services">
                <header class="section-header">
                    <h3>Services</h3>
                </header>
                <div>
                    <c:forEach var="service" items="${selectservice.rows}">
                        <div class="box">
                            <h4 class="title"><a class="dropdown-item" href="/home#<c:out value="${service.name}"/>" data-toggle="modal" data-target="#services" data-whatever="<c:out value="${service.name}"/>"><c:out value="${service.name}"/></a></h4>
                            <p class="description"><c:out value="${fn:substring(service.discription,0 ,100 )}"/></p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </aside>

        <main id="main" class="col-lg-8 col-md-12 col-sm-12">
            <section id="main-page" class="container main">
                <header class="section-header">
                    <h3>Learn</h3>
                    <p></p>
                </header>

                <%
                    if (code != null) {
                        for (ModelLearn model : list) {
                            if (model.getId() == Integer.parseInt(code)) {
                %>
                <div class="container mt-5">
                    <div class="card text-center">
                        <div class="card-header">
                            <img src="resources/img/<%= model.getPic()%>" class="card-img-top" alt="<%= model.getName()%>">
                        </div>
                        <div class="card-body">
                            <div class="card card-width">
                                <div class="card-body">
                                    <p class="card-text"><%= model.getText()%></p>
                                </div>
                            </div>
                            <div class="accordion card-width" id="accordionExample">
                                <%
                                    list1 = new GetLearnVideos().getVideo(model.getId());
                                    for (ModelVideo model1 : list1) {
                                %>
                                <div class="card">
                                    <div class="card-header" id="headingOne">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                <%= model1.getName()%>
                                            </button>
                                        </h2>
                                    </div>

                                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <video width="320" height="240" controls autoplay loop>
                                                <source src="resources/video/<%= model1.getVideo()%>" type="video/mp4">
                                                Your browser does not support the html video tag.
                                            </video>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            Student : <span class="badge badge-pill badge-info"><%= model.getStudent()%></span>
                        </div>
                        <div class="card-footer text-muted">
                            Teacher : <span class="badge badge-pill badge-info"><%= model.getTeacher()%></span>
                        </div>
                    </div>
                </div>
                <%
                                break;
                            }
                        }
                    }else {
                %>
                <div class="row">
                    <%
                        for (ModelLearn model : list){
                    %>
                    <div class="card col-xl-4 col-lg-4" >
                        <div class="card-header">
                            <img src="resources/img/<%= model.getPic()%>" class="card-img-top" alt="<%=model.getName()%>">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">
                                <%
                                    if (titlelearn == null){
                                %>
                                <a href="/learn?code=<%=model.getId()%>"><%= model.getName()%></a>
                                <%
                                }else {
                                %>
                                <a href="/learn?name=<%= titlelearn%>code=<%=model.getId()%>"><%= model.getName()%></a>
                                <%
                                    }
                                %>
                            </h5>
                            <p class="card-text">Teacher : <%= model.getTeacher()%></p>
                        </div>
                        <div class="card-footer text-muted">
                            student : <%= model.getStudent()%>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <%
                            int length = new GetLearnVideos().getLength();
                            int number = 0;
                            if (num == null || Integer.parseInt(num) <= 2){
                                if (length <= 4){
                                    if (num == null || Integer.parseInt(num) == 0 ) {
                        %>
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <%
                        } else if (Integer.parseInt(num) != 0){
                            number=Integer.parseInt(num);
                        %>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number-1%>">Previous</a></li>
                        <%
                            }
                            for (int i = 0; i < length; i++){
                        %>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%=titlelearn%>&page=<%=i%>"><%= i+1%></a></li>
                        <%
                            }
                            if (Integer.parseInt(num) == length) {
                        %>
                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                        <%
                        } else if (num == null || Integer.parseInt(num) != length){
                            number=Integer.parseInt(num);
                        %>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number+1%>">Next</a></li>
                        <%
                            }
                        }else {
                            if (num == null || Integer.parseInt(num) == 0 ) {
                        %>
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item disabled" hidden><a class="page-link" >...</a></li>
                        <%
                        } else if (Integer.parseInt(num) != 0){
                            number=Integer.parseInt(num);
                        %>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number-1%>">Previous</a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <%
                            }
                        %>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%=titlelearn%>&page=<%=0%>">1</a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=1%>">2</a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=2%>">3</a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=3%>">4</a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=4%>">5</a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number+1%>">Next</a></li>
                        <%
                            }
                        }else if (Integer.parseInt(num) > 2 && Integer.parseInt(num) <= length-3) {
                            number = Integer.parseInt(num);
                        %>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number-1%>">Previous</a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number-2%>"><%=number-1%></a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number-1%>"><%=number%></a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number%>"><%=number+1%></a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number+1%>"><%=number+2%></a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number+2%>"><%=number+3%></a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number+1%>">Next</a></li>
                        <%
                        } else if (Integer.parseInt(num) >= length -2 || Integer.parseInt(num) <= length) {
                            number = Integer.parseInt(num);
                        %>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=number-1%>">Previous</a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=length-5%>"><%=length-4%></a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=length-4%>"><%=length-3%></a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=length-3%>"><%=length-2%></a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=length-2%>"><%=length-1%></a></li>
                        <li class="page-item"><a class="page-link" href="/learn?name=<%= titlelearn%>&page=<%=length-1%>"><%=length%></a></li>
                        <li class="page-item disabled" hidden><a class="page-link" >...</a></li>
                        <li class="page-item disabled"><a class="page-link" >Next</a></li>
                        <%
                            }
                        %>
                    </ul>
                </nav>
                <%
                    }
                %>
            </section>
        </main>
    </div>
</div>


<jsp:include page="Footer.jsp"/>

<script>
    var myVar;

    function myFunction() {
        myVar = setTimeout(showPage, 3000);
    }

    function showPage() {
        document.getElementById("spinner").style.display = "none";
        document.getElementById("header").style.display = "block";
    }
</script>
<script>

    var map_440021db84dc4c32909dc62f23690747 = L.map(
        "map_440021db84dc4c32909dc62f23690747",
        {
            center: [35.69766,51.40837],
            crs: L.CRS.EPSG3857,
            zoom: 12,
            zoomControl: true,
            preferCanvas: false,
        }
    );





    var tile_layer_47729b19ba454c83a44f98ebed6ce0ef = L.tileLayer(
        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        {"attribution": "Data by \u0026copy; \u003ca href=\"http://openstreetmap.org\"\u003eOpenStreetMap\u003c/a\u003e, under \u003ca href=\"http://www.openstreetmap.org/copyright\"\u003eODbL\u003c/a\u003e.", "detectRetina": false, "maxNativeZoom": 18, "maxZoom": 18, "minZoom": 0, "noWrap": false, "opacity": 1, "subdomains": "abc", "tms": false}
    ).addTo(map_440021db84dc4c32909dc62f23690747);

</script>
<!-- jQuery -->
<!--  <script src="js/jquery-1.11.2.min.js"></script>-->
<!-- Inview -->
<script src="resources/js/jquery.inview.min.js"></script>
<!-- SmoothScroll -->
<script src="resources/js/smoothscroll.js"></script>
<!-- jQuery Knob -->
<script src="resources/js/jquery.knob.min.js"></script>
<!-- google maps -->
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>

</body>
</html>