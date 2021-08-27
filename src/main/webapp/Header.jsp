<%@ page import="ir.sajjadsh.SajjadSH.StatusEnum" %>
<%@ page import="ir.sajjadsh.SajjadSH.Model.ModelUser" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.InetAddress" %>
<%@ page import="ir.sajjadsh.SajjadSH.Database.Visitor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost/SajjadSH" user="sajjad" password="32419"/>
<sql:query dataSource="${db}" var="selectabout">
    SELECT * FROM info_personal AS p  WHERE p.idinfo = '1'
</sql:query>
<sql:query dataSource="${db}" var="selectwhat">
    SELECT * FROM what_info AS w WHERE w.idperson = '1'
</sql:query>
<sql:query dataSource="${db}" var="selectskill1">
    SELECT * FROM skill_info as s where idperson = '1' and typeskill = '1';
</sql:query>
<sql:query dataSource="${db}" var="selectskill2">
    SELECT * FROM skill_info as s where idperson = '1' and typeskill = '2';
</sql:query>
<sql:query dataSource="${db}" var="selectskill3">
    SELECT * FROM skill_info as s where idperson = '1' and typeskill = '3';
</sql:query>
<sql:query dataSource="${db}" var="selectexperience">
    SELECT * FROM experience_info as ex where idperson = '1' order by dateStartexperience desc;
</sql:query>
<sql:query dataSource="${db}" var="selecteducation">
    SELECT * FROM education_info where idperson = '1' order by dataStarteducation desc;
</sql:query>
<sql:query dataSource="${db}" var="selectentertainment">
    SELECT * FROM entertainment_info where idperson ='1';
</sql:query>

<sql:query dataSource="${db}" var="selectservice1">
    SELECT * FROM services;
</sql:query>
<sql:query dataSource="${db}" var="selectservice1tech">
    SELECT * FROM tech;
</sql:query>
<sql:query dataSource="${db}" var="selectservice1frame">
    SELECT * FROM framework;
</sql:query>

<html>
<head>

</head>
<body>
<%
    String url = request.getServletPath();
    DateTimeFormatter dtfd = DateTimeFormatter.ofPattern("DD");
    LocalDateTime now = LocalDateTime.now();
    HttpSession session1 = request.getSession();
    ModelUser model = null;
    if (session1.getAttribute("account") != null){
        model = (ModelUser) session1.getAttribute("account");
        if (model.getTimeDay() < Integer.parseInt(dtfd.format(now))){
            session.removeAttribute("account");
            session.invalidate();
            PrintWriter outp = response.getWriter();
            outp.print("<script language='JavaScript'>alert('Your session is over');</script>");
        }
    }
%>

<header id="header" class="fixed-top">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light ">
            <div class="logo float-right">
                <a href="home" class="scrollto"><h3> SajjadSH
                    <img src="resources/img/logo.jpg" alt="SajjadSH" class="img-fluid"></h3></a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link
                        <%
                            if (url.equals("/index.jsp")){
                        %>
                            <%="active"%>
                        <%
                            }
                        %>
                             " href="home">Home <span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarServices" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Services
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarServices">
                            <a class="dropdown-item disabled" href="#">programming languages</a>
                            <c:forEach var="item1" items="${selectservice1.rows}">
                                <c:if test="${item1.type == 1}">
                                    <a class="dropdown-item" href="/home#<c:out value="${item1.name}"/>" onclick="serviceFunc(<c:out value="${item1.id}"/>)" data-toggle="modal" data-target="#services" data-whatever="<c:out value="${item1.name}"/>">
                                        <c:out value="${item1.name}"/>
                                    </a>
                                    <p id="text-id" hidden><c:out value="${item1.id}"/></p>
                                </c:if>
                            </c:forEach>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item disabled" href="#">programming platforms</a>
                            <c:forEach var="item2" items="${selectservice1.rows}">
                                <c:if test="${item2.type == 2}">
                                    <a class="dropdown-item" href="/home#<c:out value="${item2.name}"/>" data-toggle="modal" data-target="#services" data-whatever="<c:out value="${item2.name}"/>">
                                        <c:out value="${item2.name}"/>
                                    </a>
                                </c:if>
                            </c:forEach>
                            <div class="dropdown-divider"></div>
                            <c:forEach var="item3" items="${selectservice1.rows}">
                                <c:if test="${item3.type == 3}">
                                    <a class="dropdown-item" href="/home#<c:out value="${item3.name}"/>" data-toggle="modal" data-target="#services" data-whatever="<c:out value="${item3.name}"/>">
                                        <c:out value="${item3.name}"/>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle
                         <%
                            if (url.equals("/learn.jsp")){
                        %>
                            <%="active"%>
                        <%
                            }
                        %>
                        " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Learn
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:forEach var="title" items="${selectservice1.rows}">
                                <a class="dropdown-item" href="/learn?name=<c:out value="${title.name}"/>">Java</a>
                            </c:forEach>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/learn">Learns</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link
                        <%
                            if (url.equals("/news.jsp")){
                        %>
                            <%="active"%>
                        <%
                            }
                        %>
                        " href="news" >News</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#about-me">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#contact-us">Contact us</a>
                    </li>
                    <%
                        if (session1.getAttribute("account") == null){
                    %>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#sign-in">Sing in</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#sign-up">Sing up</a>
                        </li>
                    <%
                        }else {
                            ModelUser modelu = (ModelUser) session1.getAttribute("account");
                    %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarAccount" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <%= modelu.getUser()%>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarAccount">
                                <a class="dropdown-item" href="#"></a>
                                <a class="dropdown-item" href="#"></a>
                                <a class="dropdown-item" href="#"></a>
                                <div class="dropdown-divider"></div>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/exit">Exit</a>
                            </div>
                        </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </nav>
    </div>
</header>


<!--Modal dialod-->
<div class="modal fade" id="services" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content container">
            <div class="modal-header" >
                <button type="button" class="close float-right" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title float-left">Service</h4>
            </div>
            <div class="modal-body row">
                <p id="service-id" hidden name="service-id"></p>

                <c:forEach items="${selectservice1.rows}" var="service">
                    <c:if test="${service.id == 1}">
                        <div class="about">
                            <h2 class="titles"><c:out value="${service.name}"/></h2>
                            <img src="resources/img/<c:out value="${service.pic}"/>" class="card-img-top " alt="<c:out value="${service.name}"/>" >
                            <p><c:out value="${service.discription}"/></p>
                        </div>
                    </c:if>
                </c:forEach>

                <div class="about">
                    <h2 class="titles">Technology</h2>
                    <c:forEach items="${selectservice1tech.rows}" var="teach">
                        <c:if test="${teach.id_servives == 1}">

                            <h2 class="titlesright"><c:out value="${teach.name}"/></h2>
                            <p><c:out value="${teach.dicription}"/></p>
                            <br>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="about">
                    <h2 class="titles">Framework</h2>
                    <c:forEach items="${selectservice1frame.rows}" var="frame">
                        <c:if test="${frame.id_servives == 1}">

                            <h2 class="titlesright"><c:out value="${frame.name}"/></h2>
                            <p><c:out value="${frame.dicription}"/></p>
                            <br>
                        </c:if>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="about-me" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">About us</h4>
            </div>
            <div class="modal-body">
                <div class="sections">
                    <div class="sections-wrapper clearfix">
                        <section id="section2">
                                <div class="container-fluid">
                                    <c:forEach var="about" items="${selectabout.rows}">
                                    <div class="about">
                                        <h2 class="titles">About me</h2>
                                        <h3 class="small-margin-bottom">
                                            <c:out value="${about.lnameinfo}"/>
                                            <c:out value="${about.fnameinfo}"/></h3>
                                        <h5><c:out value="${about.specialtyinfo}"/></h5>
                                        <p class="titlesright"><c:out value="${about.aboutinfo}"/></p>
                                    </div>
                                    <div class="signature"></div>
                                    <div class="signature"></div>
                                    <ul class="list-unstyled ">
                                        <li><b>Date of birth:</b> <c:out value="${about.databorninfo}"/></li>
                                        <li><b>Phone:</b> <c:out value="${about.phoneinfo}"/></li>
                                        <li><b>Email:</b> <c:out value="${about.emailinfo}"/></li>
                                        <li><b>Address</b> <c:out value="${about.addressinfo}"/></li>
                                        <li><b>Web site:</b><a title="sajjadsh" href="http://<c:out value="${about.websiteinfo}"/>"> <c:out value="${about.websiteinfo}"/></a></li>
                                    </ul>
                                    <br class="spacer">
                                    <h3 class="titles">What do I do?</h3>
                                    <div class="row">
                                        <c:forEach var="what" items="${selectwhat.rows}">
                                            <div class="col-sm-4">
                                                <div class="service">
                                                    <div class="icon"><i class="ion-monitor"></i></div>
                                                    <h5><c:out value="${what.specialwhat}"/></h5>
                                                    <h6><c:out value="${what.aboutwhat}"/></h6>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    </c:forEach>
                                </div>
                        </section>
                        <section id="section3">
                            <div class="container-fluid">
                                <div class="row skill">
                                    <h2 class="titles1">My Skills Values</h2>
                                    <div class="col-lg-12 col-sm-12 ">
                                        <h4>Technical skills</h4>
                                        <c:forEach var="skill1" items="${selectskill1.rows}">
                                            <label class="progress-bar-label"><c:out value="${skill1.nameskill}"/></label>
                                            <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="<c:out value="${skill1.valueskill}"/>" aria-valuemin="0" aria-valuemax="100" style="width: <c:out value="${skill1.valueskill}"/>%;">
                                                <span><c:out value="${skill1.valueskill}"/>%</span>
                                            </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="col-lg-12 col-sm-12">
                                        <h4>Individual knowledge</h4>
                                        <div class="row align1">
                                            <c:forEach var="skill2" items="${selectskill2.rows}">
                                                <div class="col-md-6 col-lg-6 col-xl-5 align2">
                                                    <ul class="list-icons bold-list">
                                                        <li><i class="md-arrow-forward"></i><c:out value="${skill2.nameskill}"/></li>
                                                    </ul>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <br>
                                    <br><br>
                                    <h4>Language skills</h4>
                                    <c:forEach var="skill3" items="${selectskill3.rows}">
                                        <label class="progress-bar-label width-progerss"><h4><c:out value="${skill3.nameskill}"/></h4></label>
                                        <div class="progress width-progerss1">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="<c:out value="${skill3.valueskill}"/>" aria-valuemin="0" aria-valuemax="100" style="width: <c:out value="${skill3.valueskill}"/>%;">
                                                <span><c:out value="${skill3.valueskill}"/>%</span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </section>
                        <section id="section4">
                            <div class="container-fluid">
                                <h2 class="titles">Experience</h2>
                                <h5 class="titles"></h5>
                                <div>
                                    <c:forEach var="exper" items="${selectexperience.rows}">
                                        <div class="experience-block clearfix">
                                            <div class="meta">
                                                <span class="year"><c:out value="${exper.dateStartexperience}"/> - <c:out value="${exper.dataEndexperience}"/></span>
                                                <span class="company"><c:out value="${exper.experience}"/></span>
                                            </div> <!-- end .meta -->
                                            <div class="content">
                                                <h5><c:out value="${exper.titleexperience}"/></h5>
                                                <p><c:out value="${exper.textexperience}"/></p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion-compose"></i>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                             </div>
                        </section>
                        <section id="section5">
                            <div class="container-fluid">
                            <h2 class="titles">Education rate</h2>
                            <div class="education clearfix ">
                                <c:forEach var="edu" items="${selecteducation.rows}">
                                    <div class="item">
                                        <div class="marker"></div>
                                        <div class="content">
                                            <span><c:out value="${edu.unieducation}"/></span>
                                            <h4><c:out value="${edu.majoreducation}"/></h4>
                                        </div>
                                        <div class="year"><c:out value="${edu.dataStarteducation}"/> - <c:out value="${edu.dataEndeducation}"/></div>
                                    </div>
                                </c:forEach>
                                <div class="line"></div>
                            </div>

                            <h2 class="titles">Entertainment and hobbies</h2>
                            <div class="favorites row">
                                <c:forEach var="ent" items="${selectentertainment.rows}">
                                    <div class="item col-lg-3 col-md-4 col-sm-5">
                                        <div class="icon-box">
                                            <div class="icon"><i class="<c:out value="${ent.picEntertainment}"/>"></i></div>
                                            <h6><c:out value="${ent.valueEntertainment}"/></h6>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class ="container">
                    <div class="titles1">
                        Designed by <a href="home">SajjadSH</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="contact-us" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Contact Us</h4>
            </div>
            <div class="modal-body">
                <section id="section8">
                    <div class="container">
                        <h2>Get in contact with me</h2>
                        <div class="row">
                            <div class="col-lg-5 col-md-12 col-sm-12">
                                <div>
                                    <c:forEach var="contact" items="${selectabout.rows}">
                                        <ul class="list-icons list-unstyled">
                                            <li><i class="ion-ios-location-outline"></i>Address: <c:out value="${contact.addressinfo}"/></li>
                                            <li><i class="ion-iphone"></i>Phone: <c:out value="${contact.phoneinfo}"/></li>
                                            <li><i class="ion-ios-email-outline"></i>Email: <a href="mailto:<c:out value="${contact.emailinfo}"/>"><c:out value="${contact.emailinfo}"/></a></li>
                                            <li><i class="ion-ios-world-outline"></i>Website: <a href="http://<c:out value="${contact.websiteinfo}"/>"><c:out value="${contact.websiteinfo}"/></a></li>
                                        </ul>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-12 col-sm-12">
                                <h5>Contact Form </h5>
                                <form name="form" action="home" method="post" class="form-horizontal contact-form" onsubmit="return validateForm()">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Name</label>
                                        <div class="col-sm-10 input-text">
                                            <input type="text" class="contact-name" name="contact-name" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10 input-text">
                                            <input type="email" class="contact-email" name="contact-email" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Text</label>
                                        <div class="col-sm-10 input-text">
                                            <textarea name="contact-message" class="contact-message" rows="3"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-10 col-sm-offset-2">
                                            <button type="submit" id="btn" class="btn btn-primary">send</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="sign-in" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Sign in</h4>
            </div>
            <div class="modal-body">
                <div class="col-lg-6 col-md-12 col-sm-12 sign">
                    <form name="formsignin" action="signin" method="post" class="form-horizontal contact-form" onsubmit="return validateFormSignin()">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">username</label>
                            <div class="col-sm-10 input-text">
                                <input type="text" class="contact-name" name="username" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">password</label>
                            <div class="col-sm-10 input-text">
                                <input type="password" class="contact-email" name="password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10 col-sm-offset-2">
                                <button type="submit" id="btn_signin" class="btn btn-primary">sign in</button>
                            </div>
                        </div>
                        <div class="form-check">
                            I'm don't have Account.
                            <a href="#" data-dismiss="modal" data-toggle="modal" id="signup" data-target="#sign-up" class="form-check-label">Sign up</a>
                            <br><br>
                        </div>
                        <div class="form-check">
                            <a href="#" data-dismiss="modal" data-toggle="modal" id="forgotPassword" data-target="#forget" class="form-check-label">Forget password</a>
                            <br><br>
                        </div>
                    </form>
            </div>
        </div>
        </div>
    </div>
</div>
<div class="modal fade" id="sign-up" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" >
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Sign up</h4>
            </div>
            <div class="modal-body">
                <div class="col-lg-6 col-md-12 col-sm-12 sign">
                    <form name="form-signup" action="signup" method="post" class="form-horizontal contact-form" onsubmit="return validateFormSignup()">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">name</label>
                            <div class="col-sm-10 input-text">
                                <input type="text" class="contact-name" name="signup-name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">username</label>
                            <div class="col-sm-10 input-text">
                                <input type="text" class="contact-name" name="signup-username" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="signup-password">password</label>
                            <div class="col-sm-10 input-text">
                                <input type="password" class="contact-name" id="signup-password" name="signup-password" />
                            </div>
                        </div>
                        <div id="message">
                            <h3>Password must contain the following:</h3>
                            <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                            <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                            <p id="number" class="invalid">A <b>number</b></p>
                            <p id="length" class="invalid">Minimum <b>8 characters</b></p>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="confirm-password">check password</label>
                            <div class="col-sm-10 input-text">
                                <input type="password" class="contact-name" id="confirm-password" name="confrim-password" />
                            </div>
                            <span id="msg-confrim"></span>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10 input-text">
                                <input type="email" class="contact-name" name="signup-email" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10 col-sm-offset-2">
                                <button type="submit" id="btn_signup" class="btn btn-primary">sign in</button>
                            </div>
                        </div>
                        <div class="form-check">
                            I have Account.
                            <a href="#" data-dismiss="modal" data-toggle="modal" id="signin" data-target="#sign-in" class="form-check-label">Sign in</a>
                            <br><br>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="forget" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" >
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Forget Password</h4>
            </div>
            <div class="modal-body">
                <div class="col-lg-6 col-md-12 col-sm-12 sign">
                    <form name="formforget" action="forget" method="post" class="form-horizontal contact-form" onsubmit="return validateFormForget()">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10 input-text">
                                <input type="email" class="contact-name" name="email1" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10 col-sm-offset-2">
                                <button type="submit" id="btn_forget" class="btn btn-primary">send request</button>
                            </div>
                        </div>
                        <div class="form-check">
                            <a href="#" data-dismiss="modal" data-toggle="modal" id="sign" data-target="#sign-up" class="form-check-label">Sign up</a>
                            <br><br>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    $('#signup-password, #confirm-password').on('keyup', function () {
        if ($('#signup-password').val() === $('#confirm-password').val()) {
            $('#msg-confrim').html('Matching').css('color', 'green');
        } else
            $('#msg-confrim').html('Not Matching').css('color', 'red');
    });
</script>
<script>
    function validateForm() {
        var x = document.forms["form"]["contact-name"].value;
        if (x === "") {
            alert("Name must not be empty.");
            return false;
        }

        var y = document.forms["form"]["contact_email"].value;
        if (y === "") {
            alert("Email must not be empty.");
            return false;
        }

        var z = document.forms["form"]["contact_message"].value;
        if (z === "") {
            alert("Message must not be empty.");
            return false;
        }
    }
</script>
<script>
    function validateFormSignin() {

        var user = document.forms["formsignin"]["username"].value;
        if (user === "") {
            alert("Username must not be empty.");
            return false;
        }

        var pass = document.forms["formsignin"]["password"].value;
        if (pass === "") {
            alert("Password must not be empty.");
            return false;
        }
    }
</script>
<script>
    function validateFormSignup() {
        var sn = document.forms["form-signup"]["signup-name"].value;
        if (sn === "") {
            alert("Name must not be empty.");
            return false;
        }
        var su = document.forms["form-signup"]["signup-username"].value;
        if (su === "") {
            alert("Username must not be empty.");
            return false;
        }
        var zs = document.forms["form-signup"]["signup-password"].value;
        if (zs === "") {
            alert("Password must not be empty.");
            return false;
        }
        var zs1 = document.forms["form-signup"]["confirm-password"].value;
        if (zs1 === "") {
            alert("Confrim Password must not be empty.");
            return false;
        }
        var se = document.forms["form-signup"]["signup-email"].value;
        if (se === "" || se === null) {
            alert("Email must not be empty.");
            return false;
        }
    }
</script>
<script>
    function validateFormForget() {
        // var xf = document.forms["formforget"]["name"].value;
        // if (xf === "") {
        //     alert("Name must not be empty.");
        //     return false;
        // }
        var yf = document.forms["formforget"]["email1"].value;
        if (yf === "") {
            alert("Email must not be empty.");
            return false;
        }
    }
</script>
<script>
    var myInput = document.getElementById("signup-password");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");

    // When the user clicks on the password field, show the message box
    myInput.onfocus = function() {
        document.getElementById("message").style.display = "block";
    }

    // When the user clicks outside of the password field, hide the message box
    myInput.onblur = function() {
        document.getElementById("message").style.display = "none";
    }

    // When the user starts to type something inside the password field
    myInput.onkeyup = function() {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if(myInput.value.match(lowerCaseLetters)) {
            letter.classList.remove("invalid");
            letter.classList.add("valid");
        } else {
            letter.classList.remove("valid");
            letter.classList.add("invalid");
        }

        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if(myInput.value.match(upperCaseLetters)) {
            capital.classList.remove("invalid");
            capital.classList.add("valid");
        } else {
            capital.classList.remove("valid");
            capital.classList.add("invalid");
        }

        // Validate numbers
        var numbers = /[0-9]/g;
        if(myInput.value.match(numbers)) {
            number.classList.remove("invalid");
            number.classList.add("valid");
        } else {
            number.classList.remove("valid");
            number.classList.add("invalid");
        }

        // Validate length
        if(myInput.value.length >= 8) {
            length.classList.remove("invalid");
            length.classList.add("valid");
        } else {
            length.classList.remove("valid");
            length.classList.add("invalid");
        }
    }
</script>
<script>
    function serviceFunc(id) {
        document.getElementById('service-id').innerHTML = id;
    }
</script>


</body>
</html>