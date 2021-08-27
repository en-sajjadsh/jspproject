<%@ page import="ir.sajjadsh.SajjadSH.StatusEnum" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="ir.sajjadsh.SajjadSH.Model.NewsModel" %>
<%@ page import="java.util.List" %>
<%@ page import="ir.sajjadsh.SajjadSH.Database.GetNews" %>
<%@ page import="java.net.InetAddress" %>
<%@ page import="ir.sajjadsh.SajjadSH.Database.Visitor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.jetbrains.annotations.NotNull" %>
<%@ page import="okhttp3.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:setDataSource var="db1" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/SajjadSH" user="sajjad" password="32419"/>
<sql:query dataSource="${db1}" var="selectservice">
    SELECT * FROM services;
</sql:query>

<sql:query dataSource="${db1}" var="lengthuser">
    SELECT * FROM user;
</sql:query>
<sql:query dataSource="${db1}" var="lengthlearn">
    SELECT * FROM learn;
</sql:query>
<sql:query dataSource="${db1}" var="lengthvisitor">
    SELECT * FROM visitor;
</sql:query>

<%
    String computername= InetAddress.getLocalHost().getHostName();
    Visitor.getInstance().getandsaveInfo(computername);
//    int time = Integer.parseInt(dtft.format(now).split(":")[0]);
    //    if (time <= 6){
//        list = new GetNews(request, response, "10","1", dtfd.format(now)).getListInstance();
//    }else {
//    }
%>

<!DOCTYPE html>
<html>
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

    <link href="">

    <!-- Template Main Javascript File -->
    <script src="resources/js/main.js"></script>
    <!-- Scripts.js -->
    <script src="resources/js/scripts.js"></script>
</head>
<body onload="myFunction()">
<%
    if (request.getAttribute("load") == StatusEnum.Show || request.getAttribute("load") == null){
%>
    <div id="spinner">
        <div class="spinner-grow text-primary"></div>
    </div>
<%
    }else {}
    DateTimeFormatter dtfd = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    DateTimeFormatter dtft = DateTimeFormatter.ofPattern("HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();
    List<NewsModel> list =new GetNews(request, response, "5", dtfd.format(now)).getList();

%>



<jsp:include page="Header.jsp"/>

<section id="intro" class="clearfix">
    <div class="container">

        <div class="intro-img">
            <img src="resources/img/intro-img.svg" alt="" class="img-fluid">
        </div>

        <div class="intro-info">
            <h2>Start learn <br><span>Programming </span><br>for your business!</h2>
            <div>
                <a href="/learn" class="btn-get-started scrollto">Get Started</a>
            </div>
        </div>

    </div>
</section>
<div class="container">
    <div class="row ">
        <main id="main" class="col-lg-8 col-md-12 col-sm-12">

            <section id="main-page">
                <div class="container">
                    <c:forEach var="service" items="${selectservice.rows}">
                    <div class="row about-container">
                        <div class="col-lg-7 content order-lg-1 order-2">
                            <h4><c:out value="${service.name}"/></h4>
                            <p>
                                <c:out value="${fn:substring(service.discription,0 ,570 )}"/>...
                            </p>

                            <div>
                                <a class="dropdown-item btn btn-outline-primary scrollto text-primary" href="/home#<c:out value="${service.name}"/>" data-toggle="modal" data-target="#services" data-whatever="<c:out value="${service.name}"/>">Continue</a>
                            </div>

                        </div>
                        <div class="col-lg-5 background order-lg-2 order-1 wow fadeInUp">
                            <img class="fab" src="resources/img/<c:out value="${service.pic}"/>" title="<c:out value="${service.name}"/>" style="width: 250px">
                        </div>
                    </div>
                    <br>
                    </c:forEach>
                </div>
            </section>


            <section id="why-us" class="wow fadeIn">
                <div class="container">
                    <header class="section-header">
                        <h3>Web site Info</h3>
<%--                        <p>Laudem latine persequeris id sed, ex fabulas delectus quo. No vel partiendo abhorreant vituperatoribus.</p>--%>
                    </header>

                    <div class="row counters">

                        <div class="col-lg-4 col-6 text-center">
                            <span data-toggle="counter-up"><c:out value="${fn:length(lengthlearn.rows)}"/></span>
                            <p>Course</p>
                        </div>

                        <div class="col-lg-4 col-6 text-center">
                                <span data-toggle="counter-up"><c:out value="${fn:length(lengthuser.rows)}"/></span>
                            <p>Clients</p>
                        </div>

                        <div class="col-lg-4 col-6 text-center">
                            <span data-toggle="counter-up"><c:out value="${fn:length(lengthvisitor.rows)}"/></span>
                            <p>followers</p>
                        </div>

                    </div>

                </div>
            </section>

        </main>

        <aside id="aside" class="col-lg-4 col-md-12 col-sm-12">
            <div  class="news">
                <header class="section-header">
                    <h3>News</h3>
                </header>
                <div>
                    <%
                        if (list.size() > 5) {
                            for (int i=5;i<list.size();i++){
                                list.remove(i);
                            }
                        }
                        for (NewsModel model : list) {
                    %>
                    <div class="box">
                        <h4 class="title"><a href="/news?Id=<%= model.getId()%>"><%= model.getTitle()%>
                        </a></h4>
                        <p class="description"><%= model.getDescription().substring(0, 71)%>.... </p>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div>
                    <a href="news" class="btn btn-get-started text-primary scrollto">more</a>
                </div>
                <div class="align-end">
                    <jsp:useBean id="date" class="java.util.Date"/>
                    <fmt:formatDate value="${date}" type="date" pattern="dd/MM/yyyy"/>
                </div>
            </div>

<%--            <div class="services">--%>
<%--                <header class="section-header">--%>
<%--                    <h3>Services</h3>--%>
<%--                    <p>service</p>--%>
<%--                </header>--%>
<%--                <div>--%>
<%--                    <div class="box">--%>
<%--                        <h4 class="title"><a class="dropdown-item" href="#Java" data-toggle="modal" data-target="#services" data-whatever="Java">Sed ut perspiciatis</a></h4>--%>
<%--                        <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </aside>
    </div>
</div>


<jsp:include page="Footer.jsp"/>

<script>
    var myVar;

    function myFunction() {
        myVar = setTimeout(showPage, 5000);
    }

    function showPage() {
        document.getElementById("spinner").style.display = "none";
        document.getElementById("header").style.display = "block";
    }
</script>
<script>
    $('#services').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text(recipient)
        modal.find('.modal-body h1').text(recipient)
    })
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
<!--  <script src="js/bootstrap.min.js"></script>-->
<!-- jQuery -->
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