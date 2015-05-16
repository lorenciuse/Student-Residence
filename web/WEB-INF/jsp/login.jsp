<%-- 
    Document   : loginmonev
    Created on : Mar 31, 2015, 5:17:43 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="${pageContext.request.contextPath}/resources/images/Monevs.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery-2.1.3.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#mahasiswa').hide();
                $('#tombolmahasiswa').click(function () {
                    $('#pamong').hide();
                    $('#mahasiswa').slideDown().show('slow');
                    $('#tombolpamong').removeClass('disabled');
                    $('#tombolmahasiswa').addClass('disabled');
                    $('#epmng').hide();
                    $('#emhs').show();
                });
                $('#tombolpamong').click(function () {
                    $('#pamong').slideDown().show('slow');
                    $('#mahasiswa').hide();
                    $('#tombolmahasiswa').removeClass('disabled');
                    $('#tombolpamong').addClass('disabled');
                    $('#emhs').hide();
                    $('#epmng').show();
                });
            });</script>
    </head>
    <body class="login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="/sisr/home"><b>SI</b>SR</a>
            </div>
            <div class="login-box-body">
                <div class="social-auth-links text-center">
                    <p>- Masuk Sebagai -</p>
                    <div class="btn-group-sm">
                        <button id="tombolpamong" class="btn btn-block btn-primary btn-flat disabled">Pamong</button>
                        <button id="tombolmahasiswa" class="btn btn-block btn-primary btn-flat">Mahasiswa</button>
                    </div>
                </div>
                <p class="login-box-msg">Masuk untuk memulai sesi Anda</p>
                <section id="pamong">
                    <form action="loginmonev/pamong" method="post">
                        <div class="form-group has-feedback">
                            <input type="text" name="username" class="form-control" placeholder="Username"/>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" name="password" class="form-control" placeholder="Password"/>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div class="row">
                            <div class="pull-right col-xs-4">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">Masuk</button>
                            </div>
                        </div>
                    </form>
                </section>
                <section id="mahasiswa">
                    <form action="loginmonev/mhs" method="post">
                        <div class="form-group has-feedback">
                            <input type="text" name="nomorpendaftaran" class="form-control" placeholder="Nomor Pendaftaran"/>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="row">
                            <div class="pull-right col-xs-4">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">Masuk</button>
                            </div>
                        </div>
                    </form>
                </section>
                <%
                    if (request.getParameter("error") != null) {
                        out.print("<h6 id=\"epmng\" style=\"color: red\">Username/Password salah</h6>");
                    } else if (request.getParameter("errorUn") != null) {
                        out.print("<h6 id=\"epmng\" style=\"color: red\">Username/Password tidak terdaftar</h6>");
                    } else if (request.getParameter("errorM") != null) {
                        out.print("<h6 id=\"emhs\" style=\"color: red\">Nomor Pendaftaran yang Anda masukkan salah</h6>");
                %>
                <script>
                    $(function () {
                        var emhs = document.getElementById("emhs");
                        if (emhs != null) {
                            $('#pamong').hide();
                            $('#mahasiswa').slideDown().show('slow');
                            $('#tombolpamong').removeClass('disabled');
                            $('#tombolmahasiswa').addClass('disabled');
                        }
                    });
                </script>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
