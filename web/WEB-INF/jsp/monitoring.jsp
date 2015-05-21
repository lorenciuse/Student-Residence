<%-- 
    Document   : kedisiplinan
    Created on : Mar 28, 2015, 2:01:23 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monitoring</title>
        <link href="${pageContext.request.contextPath}/resources/images/Monevs.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/sticky-footer-navbar.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/blue.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/dataTables.responsive.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/bootstrap-clockpicker.min.css" rel="stylesheet">
        <style>
            select {
                visibility: hidden;
            }
        </style>
    </head>
    <body style="background-color: #d2d6de">
        <%@include file="menubar.jsp"%>
        <div class="container-fluid">
            <div class="row" style="margin-bottom: 1em">
                <div class="col-sm-12 col-md-4">
                    <div class="box box-info">
                        <div class="box-header">
                            <h3 class="box-title"><span class="glyphicon glyphicon-file"></span> Data Mahasiswa</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-5 col-md-5">
                                    <form id="form-kamar" method="post" action="carimhs">
                                        <label class="control-label">Nomor Kamar</label>
                                        <%--cowok: 1-4, 13-16 cewek: 5-12--%>
                                        <select id="kamar" name="kamar" class="selectpicker show-menu-arrow" data-width="100%" data-size="5">
                                            <optgroup label="Laki-laki">
                                                <c:forEach items="${listCowok}" var="cowok">
                                                    <option><c:out value="${cowok.getNomor()}"></c:out></option>
                                                </c:forEach>
                                            </optgroup>
                                            <optgroup label="Perempuan">
                                                <c:forEach items="${listCewek}" var="cewek">
                                                    <option><c:out value="${cewek.getNomor()}"></c:out></option>
                                                </c:forEach>
                                            </optgroup>
                                        </select>
                                    </form>
                                </div>
                                <div class="col-sm-7 col-md-7">
                                    <form id="form-mhs" method="post" action="lihatmhs">
                                        <input type="hidden" name="kam" id="kam" value="${kamar}">
                                        <label class="control-label">Nama Mahasiswa</label>
                                        <%--cowok: 1-4, 13-16 cewek: 5-12--%>
                                        <select id="mhs" name="mhs" class="selectpicker show-menu-arrow" data-width="100%" data-size="5">
                                            <c:forEach items="${nama}" var="nama">
                                                <option><c:out value="${nama}"></c:out></option>
                                            </c:forEach>
                                        </select>
                                    </form>
                                </div>
                                <input type="hidden" name="maha" id="maha" value="${maha}">
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-12">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <th>Nama</th>
                                                <td><c:out value="${maha}"></c:out></td>
                                                </tr>
                                                <tr>
                                                    <th>NIM</th>
                                                    <td><c:out value="${nim}"></c:out></td>
                                                </tr>
                                                <tr>
                                                    <th>Prodi</th>
                                                    <td><c:out value="${prodi}"></c:out></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-8">
                        <div class="nav-tabs-custom" role="tabpanel" data-example-id="togglable-tabs">
                            <ul id="myTab" class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#aktivitas" id="aktivitas-tab" role="tab" data-toggle="tab" aria-controls="aktivitas" aria-expanded="true">Aktivitas</a></li>
                                <li role="presentation"><a href="#kedisiplinan" role="tab" id="kedisiplinan-tab" data-toggle="tab" aria-controls="kedisiplinan">Kedisiplinan</a></li>
                                <li role="presentation"><a href="#kesehatan" id="kesehatan-tab" role="tab" data-toggle="tab" aria-controls="kesehatan">Kesehatan</a></li>
                                <li role="presentation"><a href="#perizinan" role="tab" id="perizinan-tab" data-toggle="tab" aria-controls="perizinan">Perizinan</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="aktivitas" aria-labelledBy="aktivitas-tab">
                                    <h3 class="page-header"><span class="glyphicon glyphicon-list-alt"></span> Catatan Aktivitas Harian</h3>
                                    <form class="form-inline" role="form" action="aktivitas" method="post">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Tanggal Aktivitas</label>
                                                    <div class='input-group date' id='datetimepicker2'>
                                                        <input type="text" class="form-control" name="tanggal_aktivitas" readonly>
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <label class="control-label">Aktivitas</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label><input class="minimal form-control" type="checkbox" name="checkboxes" value="bangun"> Bangun</label>
                                                </div>
                                                <div class="form-group">
                                                    <label><input class="minimal form-control" type="checkbox" name="checkboxes" value="opera_pagi"> Opera Pagi</label>
                                                </div>
                                                <div class="form-group">
                                                    <label><input class="minimal form-control" type="checkbox" name="checkboxes" value="doa_pagi"> Doa Pagi</label>
                                                </div>
                                                <div class="form-group">
                                                    <label><input class="minimal form-control" type="checkbox" name="checkboxes" value="studi"> Studi</label>
                                                </div>
                                                <div class="form-group">
                                                    <label><input class="minimal form-control" type="checkbox" name="checkboxes" value="gebyur_wc"> Gebyur WC</label>
                                                </div>
                                                <div class="form-group">
                                                    <label><input class="minimal form-control" type="checkbox" name="checkboxes" value="doa_malam"> Doa Malam</label>
                                                </div>
                                                <div class="form-group">
                                                    <label><input class="minimal form-control" type="checkbox" name="checkboxes" value="tidur_malam"> Tidur Malam</label>
                                                </div>
                                                <div class="form-group">
                                                    <a class="btn btn-default btn-sm" id="select-all"> Semua Diikuti</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-1">
                                                <div class="form-group">
                                                    <input type="submit" class="btn btn-primary btn-flat" value="Simpan">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="kedisiplinan" aria-labelledBy="kedisiplinan-tab">
                                    <h3 class="page-header"><span class="glyphicon glyphicon-th"></span> Catatan Peringatan Mahasiswa</h3>
                                    <div class="form-inline">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <th>Lisan</th>
                                                        <td>
                                                            <div class="btn-group" role="group" aria-label="...">
                                                                <button type="button" class="btn btn-default btn-flat">Lisan 1</button>
                                                                <button type="button" class="btn btn-default btn-flat">Lisan 2</button>
                                                                <button type="button" class="btn btn-default btn-flat">Lisan 3</button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Tertulis</th>
                                                        <td>
                                                            <div class="btn-group" role="group" aria-label="...">
                                                                <button type="button" class="btn btn-default btn-flat">SP 1</button>
                                                                <button type="button" class="btn btn-default btn-flat">SP 2</button>
                                                                <button type="button" class="btn btn-default btn-flat">SP 3</button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="kesehatan" aria-labelledBy="kesehatan-tab">
                                    <h3 class="page-header"><span class="glyphicon glyphicon-plus"></span> Data Riwayat Penyakit</h3>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-4">
                                            <form class="form-horizontal" role="form" action="tambahpenyakit" method="post">
                                                <div class="col-sm-12 col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label">Tanggal Sakit</label>
                                                        <div class='input-group date' id='datetimepicker3'>
                                                            <input type="text" class="form-control" name="tanggal_sakit" readonly>
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label">Nama Penyakit</label>
                                                        <div id="parentpenyakit">
                                                            <div class="input-group" style="margin-bottom: 1em" id="childpenyakit">
                                                                <input type="text" class="form-control" name="namapenyakit" placeholder="Masukkan nama penyakit">
                                                                <a class="input-group-addon btn btn-default" id="addbtn"><span class="glyphicon glyphicon-plus"></span></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div class="form-group">
                                                        <input type="submit" class="btn btn-primary btn-flat" value="Simpan">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-sm-12 col-md-8">
                                            <table id="myTable" class="table table-striped display" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Tanggal Sakit</th>
                                                        <th>Nama Penyakit</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${sakit}" var="sakit">
                                                    <tr>
                                                        <td><c:out value="${sakit.getTanggal_sakit()}"></c:out></td>
                                                        <td><c:out value="${sakit.getNama_penyakit()}"></c:out></td>
                                                        </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="perizinan" aria-labelledBy="perizinan-tab">
                                <h3 class="page-header">
                                    <span class="glyphicon glyphicon-envelope"></span> Surat Izin
                                    <div class="btn-group" role="group">
                                        <button id="tombolIzinKeluar" class="btn btn-file btn-flat">Keluar</button>
                                        <button id="tombolIzinInap" class="btn btn-file btn-flat">Inap</button>
                                    </div>
                                </h3>
                                <h1 id="labelIzinKeluar" class="text-center"><small>Surat Izin Keluar</small></h1>
                                <h1 id="labelIzinInap" class="text-center"><small>Surat Izin Menginap</small></h1>
                                <!-- -->
                                <form id="IzinInap" class="form-horizontal" role="form" action="perizinan" method="post">
                                    <input type='hidden' name='tipe' value='inap'/>
                                    <h3 class="page-header text-center"><small>Data Tempat Inap</small></h3>
                                    <div class="form-group">
                                        <!--TODO: ambil NIM dari session-->
                                        <label for="nama_dituju" class="col-sm-2 col-md-2 control-label">Nama Dituju</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="text" class="form-control" name="nama_dituju">
                                        </div>
                                        <label for="nomor_telp" class="col-sm-2 col-md-2 control-label">Nomor Telepon</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="text" class="form-control" name="nomor_telepon_dituju">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="alamat_inap" class="col-sm-2 col-md-2 control-label">Alamat Inap</label>
                                        <div class="col-sm-4 col-md-4">
                                            <textarea rows="2" class="form-control" name="alamat_inap"></textarea>
                                        </div>
                                        <label for="keperluan_inap" class="col-sm-2 col-md-2 control-label">Keperluan Inap</label>
                                        <div class="col-sm-4 col-md-4">
                                            <textarea rows="2" class="form-control" name="keperluan_inap"></textarea>
                                        </div>
                                    </div> 
                                    <h3 class="page-header text-center"><small>Waktu</small></h3>
                                    <div class="form-group">
                                        <label for="tanggal_berangkat" class="col-sm-2 col-md-2 control-label">Tanggal Berangkat</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class='input-group date' id='datetimepicker4'>
                                                <input type="text" class="form-control" name="tanggal_berangkat" id='tanggal_berangkat' readonly>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <label for="tanggal_kembali" class="col-sm-2 col-md-2 control-label">Tanggal Kembali</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class='input-group date' id='datetimepicker5'>
                                                <input type="text" class="form-control" name="tanggal_kembali" id='tanggal_kembali' readonly>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="jam_berangkat" class="col-sm-2 col-md-2 control-label">Jam Berangkat</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="input-group clockpicker">
                                                <input id="jam_berangkat" name="jam_berangkat" type="text" class="form-control" readonly onchange="transform('jam_berangkat', 'jam_brkt')">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <input type='hidden' name='jam_brkt' id='jam_brkt'>
                                        </div>
                                        <label for="jam_kembali" class="col-sm-2 col-md-2 control-label">Jam Kembali</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="input-group clockpicker">
                                                <input id="jam_kembali" name="jam_kembali" type="text" class="form-control" readonly onchange="transform('jam_kembali', 'jam_kbl')">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <input type='hidden' name='jam_kbl' id='jam_kbl'>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-1">
                                            <button type="submit" class="btn btn-primary btn-flat">
                                                Izinkan Menginap
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                <form id="IzinKeluar" class="form-horizontal" role="form" action="perizinan" method="post">
                                    <input type='hidden' name='tipe' value='keluar'/>
                                    <div class="form-group">
                                        <label for="alamat_keluar" class="col-sm-2 col-md-2 control-label">Alamat Keluar</label>
                                        <div class="col-sm-4 col-md-4">
                                            <textarea rows="2" class="form-control" name="alamat_keluar"></textarea>
                                        </div>
                                        <label for="keperluan_keluar" class="col-sm-2 col-md-2 control-label">Keperluan Keluar</label>
                                        <div class="col-sm-4 col-md-4">
                                            <textarea rows="2" class="form-control" name="keperluan_keluar"></textarea>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label for="tanggal_keluar" class="col-sm-2 col-md-2 control-label">Hari/Tanggal</label>
                                        <div class=" col-sm-4 col-md-4">
                                            <div class='input-group date' id='datetimepicker6'>
                                                <input type="text" class="form-control" name="tanggal_keluar" id='tanggal_keluar' readonly>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="jam_keluar" class="col-sm-2 col-md-2 control-label">Jam Keluar</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="input-group clockpicker">
                                                <input id="jam_keluar" name="jam_keluar" type="text" class="form-control" readonly onchange="transform('jam_keluar', 'jamKeluar')">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <input type="hidden" name='jamKeluar' id='jamKeluar'>
                                        </div>
                                        <label for="jam_kembali" class="col-sm-2 col-md-2 control-label">Jam Kembali</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="input-group clockpicker">
                                                <input id="jam_kmbli" name="jam_kmbli" type="text" class="form-control" readonly onchange="transform('jam_kmbli', 'jamKembali')">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <input type='hidden' id='jamKembali' name='jamKembali'>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-1">
                                            <button type="submit" class="btn btn-primary btn-flat">
                                                Izinkan Keluar
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery-2.1.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/moment-with-locales.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/js/bootstrap-clockpicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pages/js/monitoring.js"></script>
    <script>
        $('.clockpicker').clockpicker({
            donetext: 'Ya',
            autoclose: true,
            placement: 'top'
        });
        
        $(document).ready(function () {
                <c:choose>
                    <c:when test = "${selectedk}">
                        $('#kamar').selectpicker('val', document.getElementById("kam").value);
                    </c:when>
                </c:choose>
        <c:choose >
            <c:when test = "${selectedm}">
                $('#mhs').selectpicker('val', document.getElementById("maha").value);
            </c:when>
        </c:choose>});
    </script>
</html>