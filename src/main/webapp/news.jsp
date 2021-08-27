<%@ page import="java.util.regex.Pattern" %>
<%@ page import="okhttp3.*" %>
<%@ page import="org.jetbrains.annotations.NotNull" %>
<%@ page import="java.io.IOException" %>
<%@ page import="ir.sajjadsh.SajjadSH.StatusEnum" %>
<%@ page import="ir.sajjadsh.SajjadSH.Database.GetNews" %>
<%@ page import="ir.sajjadsh.SajjadSH.Model.NewsModel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="ir.sajjadsh.SajjadSH.GetValueInter" %>
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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->

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
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css'><link rel="stylesheet" href="./style.css">


    <!-- Main Stylesheet File -->
    <link href="resources/css/style.css" rel="stylesheet">
     <link href="resources/css/styleDate.css" rel="stylesheet">

    <!-- JavaScript Libraries -->
    <script src="resources/lib/jquery/jquery.min.js"></script>
    <script src="resources/lib/jquery/jquery-migrate.min.js"></script>
    <!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->
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
<%--    <script  src="resources/js/calendar.js"></script>--%>

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
    String strname = request.getParameter("Id");
    String date = (String) request.getAttribute("newsdate");

    List<NewsModel> list = new GetNews(request, response, "25", "0", date).getList();
    if (num == null) {
    }else {
        list = new GetNews(request, response, "25", num, date).getList();
    }
%>

<jsp:include page="Header.jsp"/>

<section id="intro" class="clearfix">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/home">Home</a></li>
                <li class="breadcrumb-item"><a href="/news">News</a></li>
                <%
                    if (strname== null){
                %>
                <li class="breadcrumb-item active" aria-current="page">
                    <%= date%>
                </li>
                <%
                }else if (strname != null){
                %>
                <li class="breadcrumb-item " aria-current="page"><a href="/news">
                    <%= date%></a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                    <%= strname%>
                </li>
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
            <div  class="date">
                <header class="section-header">
                    <h3>Date</h3>
                </header>
                <div class="yellow">
                    <div id="calendar">
                        <div id="toolbar"></div>
                        <div id="color-picker" class="show"></div>
                        <div id="dates" class="show">
                            <div id="lastMt">&lsaquo;</div>
                            <div id="nextMt">&rsaquo;</div>
                            <div id="months-cont">
                                <div id="months">
                                    <span class="active month">January</span><span class="month">February</span><span class="month">March</span><span class="month">April</span><span class="month">May</span><span class="month">June</span><span class="month">July</span><span class="month">August</span><span class="month">September</span><span class="month">October</span><span class="month">November</span><span class="month">December</span>
                                </div>
                            </div>
                            <div id="daysotweek">
                                <div class="day">S</div>
                                <div class="day">M</div>
                                <div class="day">T</div>
                                <div class="day">W</div>
                                <div class="day">T</div>
                                <div class="day">F</div>
                                <div class="day">S</div>
                            </div>
                            <div id="days">
                            </div>
                        </div>
                        <div id="info" class="hide">
                            <div id="actual-date"></div>
                            <div id="back"><</div>
                            <div id="month-name"></div>
                            <div id="weather">
                                <div id="sun"></div>
                                <div id="mountains"></div>
                                <div id="rain">
                                    <div class="raindrop" id="drop-1"></div>
                                    <div class="raindrop center" id="drop-2"></div>
                                    <div class="raindrop center" id="drop-3"></div>
                                    <div class="raindrop" id="drop-4"></div>
                                </div>
                                <div id="temp">57&deg;<span>F</span></div>
                            </div>
                            <div id="bg-card">
                                <div class="content"></div>
                            </div>
                            <div id="card">
                                <div class="content">
                                    <div id="event-name"></div>
                                    <div id="event-details">
                                        <div class="col-3">
                                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                                            <h3>Location</h3>
                                            <p>12345 Generic Ave., Some City, Some State, 12345
                                        </div>
                                        <div class="col-3">
                                            <i class="fa fa-clock-o" aria-hidden="true"></i>
                                            <h3>Time</h3>
                                            <p> 12:00 AM </p>
                                        </div>
                                        <div class="col-3">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                            <h3>Attendee</h3>
                                            <p>Me, You, and 2+</p>
                                        </div>
                                        <div style="clear: both"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div id="colors" class="hide">
                            <div id="close">&times;</div>
                            <p>Choose theme color</p>
                            <div class="color" id="salmon"></div>
                            <div class="color" id="dkpink"></div>
                            <div class="color" id="red"></div>
                            <div class="color" id="redorg"></div>
                            <div class="color" id="orange"></div>
                            <div class="color" id="orgylw"></div>
                            <div class="color active" id="yellow"></div>
                            <div class="color" id="green"></div>
                            <div class="color" id="aqua"></div>
                            <div class="color" id="teal"></div>
                            <div class="color" id="sltbl"></div>
                            <div class="color" id="pwdbl"></div>
                            <div class="color" id="blue"></div>
                            <div class="color" id="purple"></div>
                            <div class="color" id="dkprpl"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="services">
                <heer class="section-he400ader">
                    <h3 class="titles">Services</h3>
<%--                    <p>service</p>--%>
                </heer>
                <div>
                    <c:forEach var="service" items="${selectservice.rows}">
                    <div class="box">
                        <h4 class="title"><a class="dropdown-item" href="/home#<c:out value="${service.name}"/>" data-toggle="modal" data-target="#services" data-whatever="<c:out value="${service.name}"/>"><c:out value="${service.name}"/></a></h4>
                        <p class="description"><c:out value="${fn:substring(service.discription,0 ,100 )}"/> ...</p>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </aside>

        <main id="main" class="col-lg-8 col-md-12 col-sm-12">
            <section id="main-page">
                <header class="section-header">
                    <h3>News</h3>
                    <p></p>
                </header>

                <%
                    if (strname == null){
                %>
                <div class="container mb-2">
                    <%
                        for (int i=0; i< list.size();i++){
                           NewsModel model = list.get(i);
                    %>
                    <div class="card rounded-top rounded-bottom rounded-left rounded-right">
                        <div class="card-body row">
                            <div class="col-xl-8 col-lg-8 col-md-8">
                                <h5 class="card-title"><a href="/news?Id=<%= model.getId()%>"><%= model.getTitle()%></a></h5>
                                <p class="card-text"><%= model.getDescription().substring(0,100)%>.... </p>
                            </div>
                            <%
                                if (model.getImage() == null){
                            %>
                            <img src="resources/img/about-extra-1.svg" class="card-img-top col-xl-3 col-lg-3 col-md-3 mb-2" style="width: 150px;height: 150px" alt="<%= model.getTitle()%>">
                            <%
                                }else {
                            %>
                            <img src="<%= model.getImage()%>" class="card-img-top col-xl-3 col-lg-3 col-md-3 mb-2" style="width: 150px;height: 150px" alt="<%= model.getTitle()%>">
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <%
                            int length = 400;
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
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number-1%>">Previous</a></li>
                        <%
                                    }
                                    for (int i = 0; i < length; i++){
                        %>
                        <li class="page-item"><a class="page-link" href="/news?date=<%=date.replace("/","-")%>&page=<%=i%>"><%= i+1%></a></li>
                        <%
                                    }
                                    if (Integer.parseInt(num) == length) {
                        %>
                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                        <%
                                    } else if (num == null || Integer.parseInt(num) != length){
                                        number=Integer.parseInt(num);
                        %>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number+1%>">Next</a></li>
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
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number-1%>">Previous</a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <%
                                    }
                        %>
                        <li class="page-item"><a class="page-link" href="/news?date=<%=date.replace("/","-")%>&page=<%=0%>">1</a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=1%>">2</a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=2%>">3</a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=3%>">4</a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=4%>">5</a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number+1%>">Next</a></li>
                        <%
                                }
                            }else if (Integer.parseInt(num) > 2 && Integer.parseInt(num) <= length -2) {
                                number = Integer.parseInt(num);
                        %>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number-1%>">Previous</a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number-2%>"><%=number-1%></a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number-1%>"><%=number%></a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number%>"><%=number+1%></a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number+1%>"><%=number+2%></a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number+2%>"><%=number+3%></a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number+1%>">Next</a></li>
                        <%
                            } else if (Integer.parseInt(num) >= length -1) {
                                number = Integer.parseInt(num);
                        %>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=number-1%>">Previous</a></li>
                        <li class="page-item disabled"><a class="page-link" >...</a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=length-5%>"><%=length-4%></a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=length-4%>"><%=length-3%></a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=length-3%>"><%=length-2%></a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=length-2%>"><%=length-1%></a></li>
                        <li class="page-item"><a class="page-link" href="/news?date=<%= date.replace("/","-")%>&page=<%=length-1%>"><%=length%></a></li>
                        <li class="page-item disabled" hidden><a class="page-link" >...</a></li>
                        <li class="page-item disabled"><a class="page-link" >Next</a></li>
                        <%
                            }
                        %>
                    </ul>
                </nav>
                <%
                    }else {
                        for (NewsModel model :list) {
                            if (strname == String.valueOf(model.getId())){
                %>
                 <div class="container mt-5">
                     <div class="text-box wow fadeInUp">
                         <p class="description"><%= model.getDate()%>-<%= model.getTime()%></p>
                     </div>
                     <br>
                    <div class="row about-container mt-3">
                        <div class="col-lg-7 content order-lg-1 order-2">
                            <h5 class="card-title"><a href="/news?code=<%= model.getId()%>"><%= model.getTitle()%></a></h5>
                        </div>
                        <div class="col-lg-5 background order-lg-2 order-1 wow fadeInUp">
                            <%
                                if (model.getImage() == null){
                            %>
                            <img src="resources/img/about-extra-1.svg" class="card-img-top " alt="<%= model.getTitle()%>">
                            <%
                                }else {
                            %>
                            <img src="<%= model.getImage()%>" class="card-img-top " alt="<%= model.getTitle()%>">
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="content text-new">
                        <div class="text-box wow fadeInUp">
                            <p class="description"><%= model.getDescription()%></p>
                        </div>
                        <br>
                        <div class="text-box wow fadeInUp">
                            <a class="description" href="<%= model.getUrl()%>" >Go to Website </a>
                        </div>
                        <br>
                        <div class="text-box wow fadeInUp">
                            <%
                                if (model.getAuthor() == null) {
                            %>
                            <p class="description">Auther : -----</p>
                            <%
                                }else {
                            %>
                            <p class="description">Auther : <%= model.getAuthor()%></p>
                            <%
                                }
                            %>
                        </div>
                        <br>

                        <div>Category :
                            <span class="badge badge-pill badge-info"><%= model.getCategory()%></span>
                        </div>

                    </div>
                </div>
                <%
                            }
                        }
                    }
                %>
            </section>
        </main>
    </div>
</div>


<jsp:include page="Footer.jsp"/>

<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.2/TweenMax.min.js'></script>
<script  src="resources/js/calendar.js"></script>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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