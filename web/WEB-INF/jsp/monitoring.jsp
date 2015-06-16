<%-- 
    Document   : kedisiplinan
    Created on : Mar 28, 2015, 2:01:23 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="session_checker.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monitoring</title>
        <link href="${pageContext.request.contextPath}/resources/images/Monevs.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/sticky-footer-navbar.css" rel="stylesheet">
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
                                    <div class="row">
                                        <div class="col-md-12">
                                            <form class="form-horizontal" role="form" action="aktivitas" method="post">
                                                <div class="col-sm-12 col-md-4">
                                                    <div class="form-group">
                                                        <label class="control-label">Tanggal Aktivitas</label>
                                                        <div class='input-group date' id='datetimepicker2'>
                                                            <input type="text" class="form-control" name="tanggal_aktivitas" readonly required>
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <button id="btnaktiv" class="btn btn-primary btn-flat">Simpan</button>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-offset-1 col-md-5">
                                                    <div class="form-group">
                                                        <label class="control-label">Aktivitas</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <input class="minimal" type="checkbox" name="bangun" value="ya" required>
                                                            </span>
                                                            <input type="text" class="form-control" value="Bangun Pagi" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <input class="minimal" type="checkbox" name="opera_pagi" value="ya">
                                                            </span>
                                                            <input type="text" class="form-control" value="Opera Pagi" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <input class="minimal" type="checkbox" name="doa_pagi" value="ya">
                                                            </span>
                                                            <input type="text" class="form-control" value="Doa Pagi" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <input class="minimal" type="checkbox" name="studi" value="ya">
                                                            </span>
                                                            <input type="text" class="form-control" value="Studi" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <input class="minimal" type="checkbox" name="gebyur_wc" value="ya">
                                                            </span>
                                                            <input type="text" class="form-control" value="Gebyur WC" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <input class="minimal" type="checkbox" name="doa_malam" value="ya">
                                                            </span>
                                                            <input type="text" class="form-control" value="Doa Malam" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <input class="minimal" type="checkbox" name="tidur_malam" value="ya">
                                                            </span>
                                                            <input type="text" class="form-control" value="Tidur Malam" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-btn">
                                                                <a class="btn btn-default" id="select-all">Ya</a>
                                                            </span>
                                                            <input type="text" class="form-control" value="Semua Terlaksana" readonly>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="kedisiplinan" aria-labelledBy="kedisiplinan-tab">
                                    <h3 class="page-header"><span class="glyphicon glyphicon-th"></span> Catatan Peringatan Mahasiswa</h3>
                                    <div class="form-horizontal">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <th>Lisan</th>
                                                        <td>
                                                            <input type="hidden" id="total_lisan" value="${lisan}">
                                                            <div class="btn-group" role="group" aria-label="...">
                                                                <button class="btn btn-default btn-flat" id="l1">Lisan 1</button>
                                                                <button class="btn btn-default btn-flat" id="l2">Lisan 2</button>
                                                                <button class="btn btn-default btn-flat" id="l3">Lisan 3</button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Tertulis</th>
                                                        <td>
                                                            <input type="hidden" id="total_tertulis" value="${tertulis}">
                                                            <div class="btn-group" role="group" aria-label="...">
                                                                <button class="btn btn-default btn-flat" id="tl1">SP 1</button>
                                                                <button class="btn btn-default btn-flat" id="tl2">SP 2</button>
                                                                <button class="btn btn-default btn-flat" id="tl3">SP 3</button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div id='keterangan_lisan'>
                                                    <form role="form" action="kedisiplinan" method="post">
                                                        <h3 class="page-header text-center"><small>Peringatan Lisan</small></h3>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="control-label">Tanggal Peringatan</label>
                                                                <div class='input-group date' id='datetimepicker7'>
                                                                    <input type="text" class="form-control" name="tanggal_peringatan" id="tanggal_peringatan" readonly required>
                                                                    <span class="input-group-addon">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-offset-1 col-md-7">
                                                            <div class="form-group">
                                                                <label class="control-label">Keterangan</label>
                                                                <textarea class="form-control" rows="2" name="keterangan" required></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="submit" id="btnlisan" onclick="log()" class="btn btn-primary btn-flat" value="Simpan">
                                                            </div>
                                                        </div>
                                                        <input type="hidden" name="jenis_peringatan" value="Lisan">
                                                    </form>
                                                </div>
                                                <div id='keterangan_tertulis'>
                                                    <form role="form" action="kedisiplinan" method="post">
                                                        <h3 class="page-header text-center"><small>Peringatan Tertulis</small></h3>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="control-label">Tanggal Peringatan</label>
                                                                <div class='input-group date' id='datetimepicker8'>
                                                                    <input type="text" class="form-control" name="tanggal_peringatan" readonly required>
                                                                    <span class="input-group-addon">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-offset-1 col-md-7">
                                                            <div class="form-group">
                                                                <label class="control-label">Keterangan</label>
                                                                <textarea class="form-control" rows="2" name="keterangan" required></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="submit" id="btntertulis" class="btn btn-primary btn-flat" value="Simpan">
                                                            </div>
                                                        </div>
                                                        <input type="hidden" name="jenis_peringatan" value="Tertulis">
                                                    </form>
                                                </div>
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
                                                            <input type="text" class="form-control" name="tanggal_sakit" readonly required>
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
                                                                <input type="text" class="form-control" name="namapenyakit" placeholder="Masukkan nama penyakit" required>
                                                                <a class="input-group-addon btn btn-default" id="addbtn"><span class="glyphicon glyphicon-plus"></span></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div class="form-group">
                                                        <input type="submit" id="btnsehat" class="btn btn-primary btn-flat" value="Simpan">
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
                                            <input type="text" class="form-control" name="nama_dituju" required>
                                        </div>
                                        <label for="nomor_telp" class="col-sm-2 col-md-2 control-label">Nomor Telepon</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="text" class="form-control" name="nomor_telepon_dituju" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="alamat_inap" class="col-sm-2 col-md-2 control-label">Alamat Inap</label>
                                        <div class="col-sm-4 col-md-4">
                                            <textarea rows="2" class="form-control" name="alamat_inap" required></textarea>
                                        </div>
                                        <label for="keperluan_inap" class="col-sm-2 col-md-2 control-label">Keperluan Inap</label>
                                        <div class="col-sm-4 col-md-4">
                                            <textarea rows="2" class="form-control" name="keperluan_inap" required></textarea>
                                        </div>
                                    </div> 
                                    <h3 class="page-header text-center"><small>Waktu</small></h3>
                                    <div class="form-group">
                                        <label for="tanggal_berangkat" class="col-sm-2 col-md-2 control-label">Tanggal Berangkat</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class='input-group date' id='datetimepicker4'>
                                                <input type="text" class="form-control" name="tanggal_berangkat" id='tanggal_berangkat' readonly required>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <label for="tanggal_kembali" class="col-sm-2 col-md-2 control-label">Tanggal Kembali</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class='input-group date' id='datetimepicker5'>
                                                <input type="text" class="form-control" name="tanggal_kembali" id='tanggal_kembali' readonly required>
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
                                                <input id="jam_berangkat" name="jam_berangkat" type="text" class="form-control" readonly onchange="transform('jam_berangkat', 'jam_brkt')" required>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <input type='hidden' name='jam_brkt' id='jam_brkt'>
                                        </div>
                                        <label for="jam_kembali" class="col-sm-2 col-md-2 control-label">Jam Kembali</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="input-group clockpicker">
                                                <input id="jam_kembali" name="jam_kembali" type="text" class="form-control" readonly onchange="transform('jam_kembali', 'jam_kbl')" required>
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
                                            <button type="submit" id="btninap" class="btn btn-primary btn-flat">
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
                                            <textarea rows="2" class="form-control" name="alamat_keluar" required></textarea>
                                        </div>
                                        <label for="keperluan_keluar" class="col-sm-2 col-md-2 control-label">Keperluan Keluar</label>
                                        <div class="col-sm-4 col-md-4">
                                            <textarea rows="2" class="form-control" name="keperluan_keluar" required></textarea>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label for="tanggal_keluar" class="col-sm-2 col-md-2 control-label">Hari/Tanggal</label>
                                        <div class=" col-sm-4 col-md-4">
                                            <div class='input-group date' id='datetimepicker6'>
                                                <input type="text" class="form-control" name="tanggal_keluar" id='tanggal_keluar' readonly required>
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
                                                <input id="jam_keluar" name="jam_keluar" type="text" class="form-control" readonly onchange="transform('jam_keluar', 'jamKeluar')" required>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <input type="hidden" name='jamKeluar' id='jamKeluar'>
                                        </div>
                                        <label for="jam_kembali" class="col-sm-2 col-md-2 control-label">Jam Kembali</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="input-group clockpicker">
                                                <input id="jam_kmbli" name="jam_kmbli" type="text" class="form-control" readonly onchange="transform('jam_kmbli', 'jamKembali')" required>
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
                                            <button type="submit" id="btnkeluar" class="btn btn-primary btn-flat">
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
    <script src="${pageContext.request.contextPath}/resources/plugins/js/bootstrap-clockpicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pages/js/monitoring.js"></script>
    <script>
        $(document).ready(function () {
            var btnid = ["btnaktiv", "btnlisan", "btntertulis", "btnsehat", "btninap", "btnkeluar"];
            for (var i = 0; i < btnid.length; i++) {
                $(document.getElementById(btnid[i])).addClass("disabled");
}

        <c:if test="${nim!=null}">
             for (var i = 0; i < btnid.length; i++) {
                $(document.getElementById(btnid[i])).removeClass("disabled");
}   
        </c:if>
        
        $('.clockpicker').clockpicker({
            donetext: 'Ya',
            autoclose: true,
            placement: 'top'
        });
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