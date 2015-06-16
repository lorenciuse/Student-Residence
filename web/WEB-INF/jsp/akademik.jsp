<%-- 
    Document   : home
    Created on : Mar 27, 2015, 9:38:37 PM
    Author     : Lorencius
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session_checker.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Akademik</title>
        <link href="${pageContext.request.contextPath}/resources/images/Monevs.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/smoke.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/sticky-footer-navbar.css" rel="stylesheet">
    </head>
    <body style="background-color: #d2d6de">
        <%@include file="menubar.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12 col-md-offset-1 col-md-4">
                    <form class="form-horizontal form-group" id="cari" role="form" action="akademik" method="post">
                        <label class="control-label">NIM Mahasiswa</label>
                        <div class="input-group">
                            <input type="text" name="aca" id="aca" class="form-control" placeholder="NIM" value="${aca}" required>
                            <span class="input-group-btn">
                                <button class="btn btn-primary btn-flat" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-offset-1 col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Data Mahasiswa</h3>
                        </div>
                        <table class="panel-body table table-striped">
                            <tbody>
                                <tr>
                                    <td><strong>Nama</strong></td>
                                    <td>${anama}</td>
                                </tr>
                                <tr>
                                    <td><strong>NIM</strong></td>
                                    <td>${aca}</td>
                                </tr>
                                <tr>
                                    <td><strong>Prodi</strong></td>
                                    <td>${aprodi}</td>
                                </tr>
                                <tr>
                                    <td><strong>Fakultas</strong></td>
                                    <td>${fakultas}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Tambah Data </h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" id="nilai" action="akademik" method="post">
                                <div class="form-group">
                                    <label for="Semester" class="col-sm-3 col-md-3 control-label">Semester</label>
                                    <div class="col-sm-3 col-md-3">
                                        <input type="text" class="form-control" name="semester" id="nl">
                                    </div>
                                    <label for="banyakSKSambil" class="col-sm-3 col-md-3 control-label">Jumlah SKS</label>
                                    <div class="col-sm-3 col-md-3">
                                        <input type="text" class="form-control" name="banyakSKSambil" id="nl">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="IPS" class="col-sm-3 col-md-3 control-label">Nilai IPS</label>
                                    <div class="col-sm-3 col-md-3">
                                        <input type="text" class="form-control" name="IPS" id="nl">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-4 col-md-offset-4 col-sm-2 col-md-2">
                                        <input type="submit" id="simpan" name="tambah" class="btn btn-default" value="Simpan" onclick="prevent()">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-offset-1 col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Nilai Persemester</h3>
                        </div>
                        <table class="panel-body table table-striped" id='nilai_semester'>
                            <tbody>
                                <tr>
                                    <th><strong>Semester</strong></th>
                                    <th><strong>SKS</strong></th>
                                    <th><strong>IPS</strong></th>
                                </tr> 
                                <c:forEach items="${akademik}" var="akademik">
                                    <tr>
                                        <td><strong><c:out value="${akademik.getSemester()}"></c:out></strong></td>
                                        <td><c:out value="${akademik.getBanyak_sks()}"></c:out></td>
                                        <td><c:out value="${akademik.getIps()}"></c:out></td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot class="panel-footer">
                                <tr>
                                    <td><strong>Kumulatif &nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;</strong></td>
                                    <td><c:out value="${kumulatif.getBanyak_sks()}"></c:out></td>
                                    <td><c:out value="${kumulatif.getIpk()}"></c:out></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Predikat Mahasiswa</h3>
                            </div>
                            <div class="panel-body">
                                <div id="status"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6">          
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Grafik IPK</h3>
                            </div>
                            <canvas id="ipsChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        <%@include file="footer.jsp"%>
    </body>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery-2.1.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/smoke.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/Chart.min.js"></script>
    <script>
        Chart.defaults.global.responsive = true;
        var ctx = document.getElementById("ipsChart").getContext("2d");
        
        $(document).ready(function () {
        $(document.getElementById("simpan")).addClass("disabled");
            $(document.getElementById('akademik')).addClass("active");
            <c:if test="${aca!=null}">
                    $(document.getElementById('simpan')).removeClass("disabled");
            </c:if>
            $("#status").append(statush(<c:out value="${kumulatif.getIpk()}"></c:out>));
            function statush(ipk){
                if(ipk >= 3.5 && ipk <= 4.0){
                    return "Istimewa";
                }else if(ipk >= 2.99 && ipk <= 3.4){
                    return "Sangat Memuaskan";
                }else if(ipk >= 2.5 && ipk <= 2.98){
                    return "Cukup Memuaskan";
                }else if(ipk >= 2.0 && ipk <= 2.4){
                    return "Kurang Memuaskan";
                }else if(ipk >= 0 && ipk <= 1.99){
                    return "Tidak Memuaskan";
                }
            }
            var i = [
                    <c:forEach items="${akademik}" var="akademik">
                            "Semester ${akademik.getSemester()}",
                    </c:forEach>
            ];
            var j = [
                    <c:forEach items="${akademik}" var="akademik">
                            ${akademik.getIps()},
                    </c:forEach>
            ];
            var data = {
                labels: i,
                datasets: [
                    {
                        label: "Indeks Prestasi Semester",
                        fillColor: "rgba(220,220,220,0.2)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: j
                    }
                ]
            };
            new Chart(ctx).Line(data);
        });
    </script>
</html>
