<%-- 
    Document   : home
    Created on : Mar 27, 2015, 9:38:37 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Akademik</title>
        <link href="${pageContext.request.contextPath}/resources/images/Monevs.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/sticky-footer-navbar.css" rel="stylesheet">
    </head>
    <body style="background-color: #d2d6de">
        <%@include file="menubar.jsp"%>
        <div class="container-fluid">
            <form class="form-horizontal" role="form" action="" method="">
                <div class="form-group">
                    <label for="NIM" class="col-sm-2 control-label">NIM</label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input type="text" name="NIM" class="form-control" placeholder="NIM">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-check  "></span></button>
                            </span>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-xs-12 col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Data Mahasiswa</h3>
                </div>
                <!-- Table -->
                <table class="panel-body table">
                    <tbody>
                        <tr>
                            <td><strong>Nama</strong></td>
                            <td>Thomas Wiga</td>
                        </tr>
                        <tr>
                            <td><strong>NIM</strong></td>
                            <td>125314074</td>
                        </tr>
                        <tr>
                            <td><strong>Prodi</strong></td>
                            <td>Teknik Informatika</td>
                        </tr>
                        <tr>
                            <td><strong>Fakultas</strong></td>
                            <td>Sains dan Teknologi</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Nilai Persemester</h3>
                </div>
                <!-- Table -->
                <table class="panel-body table">
                    <tbody>
                        <tr>
                            <td><strong>Semester 1</strong></td>
                            <td>xx.x</td>
                        </tr>
                        <tr>
                            <td><strong>Semester 2</strong></td>
                            <td>xx.x</td>
                        </tr>
                        <tr>
                            <td><strong>Semester 3</strong></td>
                            <td>xx.x</td>
                        </tr>
                        <tr>
                            <td><strong>Semester 4</strong></td>
                            <td>xx.x</td>
                        </tr>
                        <tr>
                            <td><strong>Semester 5</strong></td>
                            <td>xx.x</td>
                        </tr>
                        <tr>
                            <td><strong>Semester 6</strong></td>
                            <td>xx.x</td>
                        </tr>
                    </tbody>
                </table>
                <div class="panel-footer  ">
                    <table class="panel-body table  ">
                        <tbody>
                            <tr>
                                <td><strong>IPK &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                                <td>xx.xi</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Catatan</h3>
                </div>
                <div class="panel-body">
                    Data nilai akan diupdate secara otomatis setiap semesternya
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Grafik IPK</h3>
                </div>
                <div class="panel-body">
                    <table>
                        <tr>
                            <td valign=bottom><div style="width:10px; height:50px; background:#abc;"></td>
                            <td valign=bottom><div style="width:10px; height:50px; background:#abc;"></td>
                            <td valign=bottom><div style="width:10px; height:70.5px; background:#abc;"></td>
                            <td valign=bottom><div style="width:10px; height:100px; background:#abc;"></td>
                            <td valign=bottom><div style="width:10px; height:95.12px; background:#abc;"></td>
                        </tr>
                        <tr><th>Sem 1</th><th>Sem 2</th><th>Sem 3</th><th>Sem 4</th><th>Sem 5</th></tr>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery-2.1.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $(document.getElementById('akademik')).addClass("active");
        });
    </script>
</html>
