<%-- 
    Document   : home
    Created on : Mar 28, 2015, 10:37:31 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="${pageContext.request.contextPath}/resources/images/Monevs.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/sticky-footer-navbar.css" rel="stylesheet">
    </head>
    <body style="background-color: #d2d6de">
        <%@include file="menubar.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="page-header text-center">
                        <img src="${pageContext.request.contextPath}/resources/images/LOGO.png" alt="logo SR">
                        <h1>Selamat Datang di Sistem Informasi Monitoring dan Evaluasi Student Residence</h1>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery-2.1.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
</html>
