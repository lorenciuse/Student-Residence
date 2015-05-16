<%-- 
    Document   : homesistem
    Created on : Mar 30, 2015, 12:26:22 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Residence</title>
        <link href="${pageContext.request.contextPath}/resources/images/favicon.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/one-page-wonder.css" rel="stylesheet">
        <style>
            .header-image{
                background: url(${pageContext.request.contextPath}/resources/images/cloud.jpg) no-repeat center center scroll;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Student Residence</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Student Residence</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a id="inv" href="#inventory">Inventaris</a>
                        </li>
                        <li>
                            <a id="mon" href="#monitoring">Monitoring</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <header class="header-image">
            <div class="headline">
                <div class="container">
                    <h1>Sistem Informasi</h1>
                    <h2>Student Residence</h2>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="featurette" id="inventory">
                <hr class="featurette-divider">
                <img class="featurette-image img-circle img-responsive pull-right" src="${pageContext.request.contextPath}/resources/images/Inven500.png">
                <h2 class="featurette-heading">Inventaris
                    <span class="text-muted">Student Residence</span>
                </h2>
                <p class="lead">Sistem Inventaris berguna untuk </p>
                <a href="#" class="btn btn-primary btn-flat btn-lg" rel="tooltip" title="Klik Masuk"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;Masuk</a>
            </div>
            <div class="featurette" id="monitoring">
                <hr class="featurette-divider">
                <img class="featurette-image img-circle img-responsive pull-left" src="${pageContext.request.contextPath}/resources/images/Monev500.png">
                <h2 class="featurette-heading">Monitoring dan Evaluasi
                    <span class="text-muted">Mahasiswa</span>
                </h2>
                <p class="lead">Sistem Monitoring dan Evaluasi berguna untuk mencatat seluruh aktivitas mahasiswa baik akademik maupun non-akademik. </p>
                <a href="login" class="btn btn-primary btn-flat btn-lg" rel="tooltip" title="Klik Masuk"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;Masuk</a>
            </div>
            <hr class="featurette-divider">
            <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p>Sanata Dharma Student Residence 2015</p>
                    </div>
                </div>
            </footer>
        </div>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery-2.1.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <script>
            $('a[href^="#"]').on('click', function (event) {

                var target = $($(this).attr('href'));

                if (target.length) {
                    event.preventDefault();
                    $('html, body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                } else {
                    event.preventDefault();
                    $('html, body').animate({scrollTop: 0}, 1000);
                }

            });
        </script>
    </body>
</html>
