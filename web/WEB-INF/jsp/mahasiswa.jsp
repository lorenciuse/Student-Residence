<%-- 
    Document   : mahasiswa
    Created on : Apr 26, 2015, 2:01:11 PM
    Author     : Lorencius
--%>

<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mahasiswa</title>
        <link href="${pageContext.request.contextPath}/resources/images/Monevs.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/sticky-footer-navbar.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/dataTables.bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/dataTables.responsive.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/bootstrap-duallistbox.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/bootstrap-select.min.css" rel="stylesheet">
        <style>
            .scrollable-menu {
                height: auto;
                max-height: 150px;
                overflow-x: hidden;
            }
        </style>
    </head>
    <body class="skin-blue fixed" style="background-color: #d2d6de;">
        <%@include file="menubar.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <div class="nav-tabs-custom" role="tabpanel" data-example-id="togglable-tabs" style="margin-top: 1em;">
                        <ul class="nav nav-tabs" role="tablist" id='myTabs'>
                            <li class="active">
                                <a href="#pendaftaran" id="pendaftaran-tab" role="tab" data-toggle="tab" aria-controls="pendaftaran" aria-expanded="true">Pendaftaran</a>
                            </li>
                            <li>
                                <a href="#kamar" id="kamar-tab" role="tab" data-toggle="tab" aria-controls="kamar">Kamar</a>
                            </li>
                            <li>
                                <a href="#biodata" id="biodata-tab" role="tab" data-toggle="tab" aria-controls="biodata">Biodata</a>
                            </li>
                            <li>
                                <a href="#aktivitas" id="aktivitas-tab" role="tab" data-toggle="tab" aria-controls="aktivitas">Aktivitas</a>
                            </li>
                            <li>
                                <a href="#kedisiplinan" role="tab" id="kedisiplinan-tab" data-toggle="tab" aria-controls="kedisiplinan">Kedisiplinan</a>
                            </li>
                            <li>
                                <a href="#kesehatan" id="kesehatan-tab" role="tab" data-toggle="tab" aria-controls="kesehatan">Kesehatan</a>
                            </li>
                            <li>
                                <a href="#perizinan" role="tab" id="perizinan-tab" data-toggle="tab" aria-controls="perizinan">Perizinan</a>
                            </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="pendaftaran" aria-labelledBy="pendaftaran-tab">
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title"><b>Pendaftaran Mahasiswa Baru</b></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Tambah Nomor Pendaftaran</h6>
                                            <form class="form-horizontal" role="form" action="pendaftar" method="post">
                                                <input type="hidden" name="idPamong" value="${idPamong}">
                                                <div class="col-sm-6 col-md-6">
                                                    <label class="control-label">Nomor Pendaftaran</label>
                                                    <input type="text" class="form-control" name="nomor_pendaftaran">
                                                </div>
                                                <div class="col-sm-6 col-md-6">
                                                    <label class="control-label">NIM</label>
                                                    <input type="text" class="form-control" name="nim">
                                                </div>
                                                <div class="col-sm-1 col-md-1" style="margin-top: 1em">
                                                    <input type="submit" class="btn btn-primary btn-flat" value="Simpan">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Daftar Nomor Pendaftaran</h6>
                                            <table id="myTable" class="table table-striped display" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <td>No Pendaftaran</td>
                                                        <td>NIM</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listNoNim}" var="list">
                                                        <tr>
                                                            <td>
                                                                <c:out value="${list.getNoPendaftaran()}"></c:out>
                                                                </td>
                                                                <td>
                                                                <c:out value="${list.getNIM()}"></c:out>
                                                                </td>
                                                            </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade in" id="kamar" aria-labelledBy="kamar-tab">
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title"><b>Pengaturan Nomor Kamar</b></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="col-sm-12 col-md-12">
                                            <h6 class="page-header">Pergantian Penghuni Kamar</h6>
                                            <form class="form-horizontal" role="form" action="kamar" method="post">
                                                <input type="hidden" name="idPamong" value="${idPamong}">
                                                <div class="form-group">
                                                    <div class="col-sm-9 col-md-9">
                                                        <label class="control-label">Daftar Nama Mahasiswa</label>
                                                        <select multiple="multiple" size="10" name="nama[]">
                                                            <c:forEach items="${listNama}" var="nama">
                                                                <option value="${nama}">${nama}</option>    
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-sm-3 col-md-3">
                                                        <label class="control-label">Nomor Kamar</label>
                                                        <br><br>
                                                        <%--cowok: 1-4, 13-16 cewek: 5-12--%>
                                                        <select name="kamar" class="selectpicker show-menu-arrow" data-width="100%" data-size="5">
                                                            <optgroup label="Cowok">
                                                                <c:forEach items="${listCowok}" var="cowok">
                                                                    <option><c:out value="${cowok.getNomor()}"></c:out></option>
                                                                </c:forEach>
                                                            </optgroup>
                                                            <optgroup label="Cewek">
                                                                <c:forEach items="${listCewek}" var="cewek">
                                                                    <option><c:out value="${cewek.getNomor()}"></c:out></option>
                                                                </c:forEach>
                                                            </optgroup>
                                                        </select>
                                                        <!--<input type="hidden" name="kamar" id="kamar">-->
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-sm-1 col-md-1" style="margin-top: 1em">
                                                        <input type="submit" class="btn btn-primary btn-flat" value="Simpan">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-sm-12 col-md-12">
                                            <h6 class="page-header">Daftar Penghuni Kamar</h6>
                                            <table id="myKamar" class="table table-striped display" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <td>Kamar</td>
                                                        <td>Nama</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        out.print(request.getSession().getAttribute("kam"));
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade in" id="aktivitas" aria-labelledBy="aktivitas-tab">
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title"><b>Daftar Rekap Aktivitas Mahasiswa</b></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Tambah Nomor Pendaftaran</h6>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Daftar Nomor Pendaftaran</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade in" id="biodata" aria-labelledBy="biodata-tab">
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title"><b>Biodata Mahasiswa</b></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Tambah Nomor Pendaftaran</h6>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Daftar Nomor Pendaftaran</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade in" id="kedisiplinan" aria-labelledBy="kedisiplinan-tab">
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title"><b>Daftar Rekap Kedisiplinan Mahasiswa</b></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Tambah Nomor Pendaftaran</h6>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Daftar Nomor Pendaftaran</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade in" id="kesehatan" aria-labelledBy="kesehatan-tab">
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title"><b>Daftar Rekap Kesehatan Mahasiswa</b></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Tambah Nomor Pendaftaran</h6>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Daftar Nomor Pendaftaran</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade in" id="perizinan" aria-labelledBy="perizinan-tab">
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title"><b>Daftar Rekap Perizinan Mahasiswa</b></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Tambah Nomor Pendaftaran</h6>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <h6 class="page-header">Daftar Nomor Pendaftaran</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        <%@include file="footer.jsp"%>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery-2.1.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/dataTables.responsive.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery.bootstrap-duallistbox.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/bootstrap-select.min.js"></script>
        <script>
            $(document).ready(function () {
                var nama = $('select[name="nama[]"]').bootstrapDualListbox();
                $('.selectpicker').selectpicker();
                $('#myTable').dataTable({
                    "pageLength": 5,
                    "lengthChange": false,
                    responsive: true
                });
                $('#myKamar').dataTable({
                    "columns": [
                        null,
                        null
//                        {"width": "100%"}
                    ],
                    autoWidth: true,
                    "pageLength": 10,
                    "lengthChange": false,
                    responsive: true
                });
                $(document.getElementById('mahasiswa')).addClass("active");
            });
        </script>
        <script>
            $('#myTabs a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });

            // store the currently selected tab in the hash value
            $("ul.nav-tabs > li > a").on("shown.bs.tab", function (e) {
                var id = $(e.target).attr("href").substr(1);
                window.location.hash = id;
            });

            // on load of the page: switch to the currently selected tab
            var hash = window.location.hash;
            $('#myTabs a[href="' + hash + '"]').tab('show');
        </script>
    </body>
</html>
