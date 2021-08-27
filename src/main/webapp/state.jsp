<%@ page import="ir.sajjadsh.SajjadSH.StatusEnum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

  <style>

  </style>

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
<body>
<jsp:include page="Header.jsp"/>

<section id="intro">
  <div class="page-wrap d-flex flex-row align-items-center">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-12 text-center">
        <%
          if (request.getAttribute("status") == StatusEnum.Success){
        %>
        <span class="display-1 d-block" style="color: #41e713"><%= request.getAttribute("status")%></span>
        <div class="mb-4 lead"><%= request.getAttribute("textsate")%></div>
        <%
          }else if (request.getAttribute("status") == StatusEnum.Error){
        %>
        <span class="display-1 d-block" style="color: red"><%= request.getAttribute("status")%></span>
        <div class="mb-4 lead"><%= request.getAttribute("textsate")%></div>
        <%
          }else if (request.getAttribute("status") == StatusEnum.EnterError){
        %>
        <span class="display-1 d-block" style="color: red"><%= request.getAttribute("status")%></span>
        <div class="mb-4 lead"><%= request.getAttribute("textsate")%></div>
        <br>
        <a class="nav-link" href="#" data-toggle="modal" data-target="#sign-in">Sing in again</a>
        <%
        }else if (request.getAttribute("status") == StatusEnum.SubError){
        %>
        <span class="display-1 d-block" style="color: red"><%= request.getAttribute("status")%></span>
        <div class="mb-4 lead"><%= request.getAttribute("textsate")%></div>
        <br>
        <a class="nav-link" href="#" data-toggle="modal" data-target="#sign-up">Sing up again</a>
        <%
          }
        %>
        <a href="home" class="btn btn-link" style="margin-top: 30px">Back to Home</a>
      </div>
    </div>
  </div>
</div>
</section>

<jsp:include page="Footer.jsp"/>


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
