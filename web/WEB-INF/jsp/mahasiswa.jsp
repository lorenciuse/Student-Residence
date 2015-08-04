<%-- 
    Document   : mahasiswa
    Created on : Apr 26, 2015, 2:01:11 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="session_checker.jspf" %>
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
        <link href="${pageContext.request.contextPath}/resources/plugins/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/dataTables.responsive.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/bootstrap-duallistbox.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/bootstrap-select.min.css" rel="stylesheet">
        <style>
            select {
                visibility: hidden;
            }
            select[multiple] {
                visibility: visible;
            }
        </style>
    </head>
    <body style="background-color: #d2d6de;">
        <%@include file="menubar.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12 col-md-4">
                    <div class="box box-info">
                        <div class="box-header">
                            <h3 class="box-title"><span class="glyphicon glyphicon-file"></span> Data Mahasiswa</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-5 col-md-5">
                                    <form id="form-kamar" method="post" action="mcarimhs">
                                        <label class="control-label">Nomor Kamar</label>
                                        <%--cowok: 1-4, 13-16 cewek: 5-12--%>
                                        <select id="dkamar" name="kamar" class="selectpicker show-menu-arrow" data-width="100%" data-size="5">
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
                                    <form id="form-mhs" method="post" action="mlihatmhs">
                                        <input type="hidden" name="kam" id="kam" value="${mkamar}">
                                        <label class="control-label">Nama Mahasiswa</label>
                                        <%--cowok: 1-4, 13-16 cewek: 5-12--%>
                                        <select id="mhs" name="mhs" class="selectpicker show-menu-arrow" data-width="100%" data-size="5">
                                            <c:forEach items="${mnama}" var="nama">
                                                <option><c:out value="${nama}"></c:out></option>
                                            </c:forEach>
                                        </select>
                                    </form>
                                </div>
                                <input type="hidden" name="maha" id="maha" value="${mmaha}">
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-12">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <th>Nama</th>
                                                <td><c:out value="${mmaha}"></c:out></td>
                                                </tr>
                                                <tr>
                                                    <th>NIM</th>
                                                    <td><c:out value="${mnim}"></c:out></td>
                                                </tr>
                                                <tr>
                                                    <th>Prodi</th>
                                                    <td><c:out value="${mprodi}"></c:out></td>
                                                </tr>
                                                <tr>
                                                    <th>Fakultas</th>
                                                    <td><c:out value="${mfakultas}"></c:out></td>
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
                                            <div class="col-sm-12 col-md-4">
                                                <h6 class="page-header">Tambah Nomor</h6>
                                                <form class="form-horizontal" role="form" action="pendaftar" method="post">
                                                    <input type="hidden" name="idPamong" value="${idPamong}">
                                                <div class="col-sm-12 col-md-12">
                                                    <label class="control-label">Nomor Pendaftaran</label>
                                                    <input type="text" class="form-control" name="nomor_pendaftaran" required>
                                                </div>
                                                <div class="col-sm-12 col-md-12">
                                                    <label class="control-label">NIM</label>
                                                    <input type="text" class="form-control" name="nim" required>
                                                </div>
                                                <div class="col-sm-1 col-md-1" style="margin-top: 1em">
                                                    <input type="submit" class="btn btn-primary btn-flat" value="Simpan">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-sm-8 col-md-8">
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
                                                            <c:forEach items="${listNama}" var="namak">
                                                                <option value="${namak}">${namak}</option>    
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-sm-3 col-md-3">
                                                        <label class="control-label">Nomor Kamar</label>
                                                        <br><br>
                                                        <%--cowok: 1-4, 13-16 cewek: 5-12--%>
                                                        <select id="no" name="kamar" class="selectpicker show-menu-arrow" data-width="100%" data-size="5">
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
                                                    <c:out value="${kam}" escapeXml="false"/>
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
                                        <div class="col-sm-5 col-md-5">
                                            <h6 class="page-header">Predikat Aktivitas</h6>
                                            <div class="row">
                                                <!--                                                <div class="col-sm-5 col-md-5">
                                                                                                    <form class="form-horizontal form-group"role="form" action="aktivitasrep" method="post">
                                                                                                        <label class="control-label">NIM Mahasiswa</label>
                                                                                                        <div class="input-group">
                                                                                                            <input type="text" name="nim" class="form-control" value="${nimarep}" required>
                                                                                                            <span class="input-group-btn">
                                                                                                                <button class="btn btn-primary btn-flat" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </form>
                                                                                                </div>-->
                                                <div class="col-sm-12 col-md-12">
                                                    <i>Keterangan :<br> A = Amat Baik, B = Baik, C = Cukup, D = Kurang,<br> E = Buruk</i>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <!--                                                <div class="col-sm-5 col-md-5">
                                                                                                    <table class="panel-body table table-striped">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td><strong>Nama</strong></td>
                                                                                                                <td>${arepnama}</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td><strong>NIM</strong></td>
                                                                                                                <td>${nimarep}</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td><strong>Prodi</strong></td>
                                                                                                                <td>${arepprodi}</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td><strong>Fakultas</strong></td>
                                                                                                                <td>${arepfakultas}</td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </div>-->
                                                <div class="col-sm-5 col-md-5">
                                                    <table class="panel-body table table-striped">
                                                        <tbody>
                                                            <tr>
                                                                <td><strong>Bangun Pagi</strong></td>
                                                                <td id="vbangun"></td>
                                                            </tr>
                                                            <tr>
                                                                <td><strong>Opera Pagi</strong></td>
                                                                <td id="vopera"></td>
                                                            </tr>
                                                            <tr>
                                                                <td><strong>Doa Pagi</strong></td>
                                                                <td id="vdoapagi"></td>
                                                            </tr>
                                                            <tr>
                                                                <td><strong>Studi</strong></td>
                                                                <td id="vstudi"></td>
                                                            </tr>
                                                            <tr>
                                                                <td><strong>Gebyur WC</strong></td>
                                                                <td id="vgebyur"></td>
                                                            </tr>
                                                            <tr>
                                                                <td><strong>Doa Malam</strong></td>
                                                                <td id="vdoamalam"></td>
                                                            </tr>
                                                            <tr>
                                                                <td><strong>Tidur Malam</strong></td>
                                                                <td id="vtidur"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 col-md-7">
                                            <h6 class="page-header">Grafik Aktivitas</h6>
                                            <canvas id="actChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade in" id="biodata" aria-labelledBy="biodata-tab">
                                <div class="box box-info">
                                    <!--                                    <div class="box-header">
                                                                            <div class="col-md-3">
                                                                                <h3 class="box-title"><b>Biodata Mahasiswa</b></h3>
                                                                                <form class="form-horizontal"role="form" action="biodata" method="post">
                                                                                    <label class="control-label">NIM Mahasiswa</label>
                                                                                    <div class="input-group">
                                                                                        <input type="text" name="nim" class="form-control" value="${nim}" required>
                                                                                        <span class="input-group-btn">
                                                                                            <button class="btn btn-primary btn-flat" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                                                                        </span>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>-->
                                    <div class="box-body">
                                        <div class="col-md-12">
                                            <div id="formBiodata" class="form-horizontal">
                                                <div class="row">
                                                    <h4 class="page-header"><strong>DATA DIRI DAN ORANGTUA</strong></h4>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="col-sm-1 col-md-1">
                                                                <c:choose>
                                                                    <c:when test="${foto}">
                                                                        <img class="thumbnail" src="lihatfoto?nim=${mnim}" alt="${mnim}" style="width: 100px; height: auto">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img class="thumbnail text-center" alt="FOTO" style="width: 100px; height: auto">
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="nama_lengkap" class="col-sm-5 col-md-5">Nama Lengkap</label>
                                                            <div class="col-sm-7 col-md-7" id="nama"><c:out value="${mhs.getNamaMhs()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="tempat_lahir" class="col-sm-5 col-md-5">Tempat, tanggal lahir</label>
                                                                <div class="col-sm-7 col-md-7" id="ttl"><c:out value="${mhs.getTempat_lahir()}"></c:out>, <c:out value="${mhs.getTanggal_lahir()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agama" class="col-sm-5 col-md-5">Agama</label>
                                                                    <div class="col-sm-7 col-md-7" id="agama"><c:out value="${mhs.getAgama()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Jenis Kelamin</label>
                                                                <div class="col-sm-7 col-md-7" id="kelamin"><c:out value="${mhs.getKelamin()}"></c:out></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="alamat_asal" class="col-sm-5 col-md-5">Alamat Asal</label>
                                                                <div class="col-sm-7 col-md-7" id="asal"><c:out value="${mhs.getAlamat_asal()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="kabupaten_kota" class="col-sm-5 col-md-5">Kabupaten/Kota</label>
                                                                <div class="col-sm-7 col-md-7" id="kabupaten"><c:out value="${mhs.getKab_kota_asal()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="kabupaten_kota" class="col-sm-5 col-md-5">Provinsi</label>
                                                                <div class="col-sm-7 col-md-7" id="provinsi"><c:out value="${mhs.getProv_asal()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Nomor Telepon</label>
                                                                <div class="col-sm-7 col-md-7" id="hp"><c:out value="${mhs.getNo_hp_mhs()}"></c:out></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="col-sm-12 col-md-12 page-header"><h5><b>Data Orangtua Ayah</b></h5></label>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Nama</label>
                                                                <div class="col-sm-7 col-md-7" id="namaayah"><c:out value="${mhs.getNama_ayah()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Pendidikan</label>
                                                                <div class="col-sm-7 col-md-7" id="pendayah"><c:out value="${mhs.getPendidikan_ayah()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Pekerjaan </label>
                                                                <div class="col-sm-7 col-md-7" id="pekayah"><c:out value="${mhs.getPekerjaan_ayah()}"></c:out></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="col-sm-12 col-md-12 page-header"><h5><b>Data Orangtua Ibu</b></h5></label>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Nama</label>
                                                                <div class="col-sm-7 col-md-7" id="namaibu"><c:out value="${mhs.getNama_ibu()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Pendidikan</label>
                                                                <div class="col-sm-7 col-md-7" id="pendibu"><c:out value="${mhs.getPendidikan_ibu()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Pekerjaan </label>
                                                                <div class="col-sm-7 col-md-7" id="pekibu"><c:out value="${mhs.getPekerjaan_ibu()}"></c:out></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="col-sm-12 col-md-12 page-header"><h5><b>Data Lainnya</b></h5></label>
                                                            <div class="form-group">
                                                                <label for="pendapatan_ortu" class="col-sm-5 col-md-5">Pendapatan Orangtua</label>
                                                                <div class="col-sm-7 col-md-7" id="penda">Rp. <c:out value="${mhs.getPendapatan_ortu()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Nomor Telepon Rumah</label>
                                                                <div class="col-sm-7 col-md-7" id="telp"><c:out value="${mhs.getNo_tel_ortu()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Nomor HP Ortu</label>
                                                                <div class="col-sm-7 col-md-7" id="hportu"><c:out value="${mhs.getNo_hp_ortu()}"></c:out></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="col-sm-12 col-md-12 page-header"><h5><b>Data Lainnya</b></h5></label>
                                                            <div class="form-group">
                                                                <label for="alamat_keluarga_terdekat" class="col-sm-5 col-md-5">Alamat Keluarga Terdekat</label>
                                                                <div class="col-sm-7 col-md-7" id="keluarga"><c:out value="${mhs.getAlamat_keluarga()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Nomor Telepon Rumah Keluarga Terdekat</label>
                                                                <div class="col-sm-7 col-md-7" id="telpkeluarga"><c:out value="${mhs.getNo_tel_keluarga()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Nomor HP Keluarga Terdekat</label>
                                                                <div class="col-sm-7 col-md-7" id="hpkeluarga"><c:out value="${mhs.getNo_hp_keluarga()}"></c:out></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <h4 class="page-header"><strong>DATA AKADEMIK</strong></h4>
                                                            <div class="form-group">
                                                                <label for="nim" class="col-sm-5 col-md-5">NIM</label>
                                                                <div class="col-sm-7 col-md-7" id="nim"><c:out value="${asr.getNim()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="program_studi" class="col-sm-5 col-md-5">Program Studi</label>
                                                                <div class="col-sm-7 col-md-7" id="prog"><c:out value="${asr.getProdi()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="jurusan" class="col-sm-5 col-md-5">Jurusan</label>
                                                                <div class="col-sm-7 col-md-7" id="jurus"><c:out value="${asr.getJurusan()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="fakultas" class="col-sm-5 col-md-5">Fakultas</label>
                                                                <div class="col-sm-7 col-md-7" id="fakul"><c:out value="${asr.getFakultas()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="semester" class="col-sm-5 col-md-5">Semester</label>
                                                                <div class="col-sm-7 col-md-7" id="semes"><c:out value="${asr.getSemester()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="ipk" class="col-sm-5 col-md-5">IPK s/d semester ganjil (Mhs. smt III ke atas)</label>
                                                                <div class="col-sm-7 col-md-7" id="ipk"><c:out value="${asr.getIpk_masuk()}"></c:out></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="rapor" class="col-sm-5 col-md-5">Rata-rata nilai Rapor SMU Kelas XII Smt 1 (Mhs. Baru)</label>
                                                                <div class="col-sm-7 col-md-7" id="rata"><c:out value="${asr.getRapor_smu()}"></c:out></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <h4 class="page-header"><strong>DATA NON AKADEMIK</strong></h4>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 col-md-5">Kegiatan Non Akademik di Kampus</label>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-md-5">Nomor Sertifikat</div>
                                                                <div class="col-sm-7 col-md-7">Nama Kegiatan</div>
                                                            </div>
                                                            <div class="form-group">
                                                            <c:forEach items="${presK}" var="kamp">
                                                                <div class="col-md-5"><c:out value="${kamp.getNo_sertifikat()}"></c:out></div>
                                                                <div class="col-sm-7 col-md-7"><c:out value="${kamp.getNama_prestasi()}"></c:out></div>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 col-md-5">Kegiatan Non Akademik di Luar Kampus</label>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-md-5">Nomor Sertifikat</div>
                                                            <div class="col-sm-7 col-md-7">Nama Kegiatan</div>
                                                        </div>
                                                        <div class="form-group">
                                                            <c:forEach items="${presL}" var="luar">
                                                                <div class="col-md-5"><c:out value="${luar.getNo_sertifikat()}"></c:out></div>
                                                                <div class="col-sm-7 col-md-7"><c:out value="${luar.getNama_prestasi()}"></c:out></div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">      
                                                    <div class="col-md-1">
                                                        <div class="form-group">
                                                            <form action="biodata-print" target="_blank" method="post">
                                                                <input type="hidden" name="nim" value="${mnim}">
                                                                <button class="btn btn-default"><i class="glyphicon glyphicon-print"></i> Print</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
                                        <div class="col-sm-12 col-md-12">
                                            <!--                                            <div class="row">
                                                                                            <div class="col-sm-3 col-md-3">
                                                                                                <form class="form-horizontal form-group"role="form" action="kedisiplinanrep" method="post">
                                                                                                    <label class="control-label">NIM Mahasiswa</label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" name="nim" class="form-control" value="${nimkrep}"required>
                                                                                                        <span class="input-group-btn">
                                                                                                            <button class="btn btn-primary btn-flat" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </form>
                                                                                            </div>
                                                                                        </div>-->
                                            <div class="row">
                                                <!--                                                <div class="col-sm-3 col-md-3">
                                                                                                    <table class="panel-body table table-striped">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td><strong>Nama</strong></td>
                                                                                                                <td>${krepnama}</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td><strong>NIM</strong></td>
                                                                                                                <td>${nimkrep}</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td><strong>Prodi</strong></td>
                                                                                                                <td>${krepprodi}</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td><strong>Fakultas</strong></td>
                                                                                                                <td>${krepfakultas}</td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </div>-->
                                                <div class="col-sm-5 col-md-5">
                                                    <h6 class="page-header">Peringatan Terakhir</h6>
                                                    <c:choose>
                                                        <c:when test="${krepcount!='0'}">
                                                        <label class="page-header">Peringatan : ${krepdis.getJenis()} ${krepcount}</label>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label class="page-header">Peringatan : ${krepdis.getJenis()}</label>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    
                                                </div>  
                                                <div class="col-sm-7 col-md-7">
                                                    <h6 class="page-header">Grafik Peringatan</h6>
                                                    <canvas id="disiplinChart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade in" id="kesehatan" aria-labelledBy="kesehatan-tab">
                                <div class="box box-info">
                                    <!--                                    <div class="box-header">
                                                                            <div class="col-md-3">
                                                                                <h3 class="box-title"><b>Daftar Rekap Kesehatan Mahasiswa</b></h3>
                                                                                <form class="form-horizontal"role="form" action="riwayat" method="post">
                                                                                    <label class="control-label">NIM Mahasiswa</label>
                                                                                    <div class="input-group">
                                                                                        <input type="text" name="nim" class="form-control" value="${nim}">
                                                                                        <span class="input-group-btn">
                                                                                            <button class="btn btn-primary btn-flat" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                                                                        </span>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>-->
                                    <div class="box-body">
                                        <div class="col-md-offset-2 col-md-8">
                                            <h6 class="page-header text-center">Daftar Riwayat Sakit</h6>
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
                                        <div class="col-sm-12 col-md-12">
                                            <!--                                            <div class="row">
                                                                                            <div class="col-md-3">
                                                                                                <form class="form-horizontal"role="form" action="perizinanrep" method="post">
                                                                                                    <label class="control-label">NIM Mahasiswa</label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" name="nim" class="form-control" value="${nimprep}" required>
                                                                                                        <span class="input-group-btn">
                                                                                                            <button class="btn btn-primary btn-flat" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </form>
                                                                                            </div>
                                                                                        </div>-->
                                            <div class="row">
                                                <!--                                                <div class="col-sm-3 col-md-3">
                                                                                                    <table class="panel-body table table-striped">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td><strong>Nama</strong></td>
                                                                                                                <td>${prepnama}</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td><strong>NIM</strong></td>
                                                                                                                <td>${nimprep}</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td><strong>Prodi</strong></td>
                                                                                                                <td>${prepprodi}</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td><strong>Fakultas</strong></td>
                                                                                                                <td>${prepfakultas}</td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </div>-->
                                                <div class="col-sm-5 col-md-5">
                                                    <h6 class="page-header">Total Jumlah Izin</h6>
                                                    <table class="panel-body table table-striped">
                                                        <tbody>
                                                            <tr>
                                                                <td><strong>Jumlah Izin Keluar</strong></td>
                                                                <td>${keluar}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><strong>Jumlah Izin Inap</strong></td>
                                                                <td>${inap}</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-sm-7 col-md-7">
                                                    <h6 class="page-header">Grafik Perizinan</h6>
                                                    <canvas id="pChart"></canvas>
                                                </div>
                                            </div>
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
        <script src="${pageContext.request.contextPath}/resources/plugins/js/dataTables.bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/dataTables.responsive.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery.bootstrap-duallistbox.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/bootstrap-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/Chart.min.js"></script>
        <script>
            $(function () {
                $('#dkamar').on('change', function () {
                    $('#form-kamar').submit();
                });
                $('#mhs').on('change', function () {
                    $('#form-mhs').submit();
                });
            });
            $(document).ready(function () {
                $('select[name="nama[]"]').bootstrapDualListbox();
                $('.selectpicker').selectpicker();
                $('#no').selectpicker('val', "");
                $('#dkamar').selectpicker('val', "");
                $('#mhs').selectpicker('val', "");
                $('#myTable').dataTable({
                    "pageLength": 5,
                    "lengthChange": false,
                    responsive: true
                });
                $('#myKamar').dataTable({
                    "columns": [
                        {"width": "20%"},
                        {"width": "80%"}
                    ],
                    autoWidth: false,
                    "pageLength": 10,
                    "lengthChange": false,
                    responsive: true
                });
                $(document.getElementById('mahasiswa')).addClass("active");
            <c:choose>
                <c:when test = "${selectedkm}">
                $('#dkamar').selectpicker('val', document.getElementById("kam").value);
                </c:when>
            </c:choose>
            <c:choose >
                <c:when test = "${selectedmm}">
                $('#mhs').selectpicker('val', document.getElementById("maha").value);
                </c:when>
            </c:choose>
                Chart.defaults.global.responsive = true;
                var ctx = document.getElementById("actChart").getContext("2d");
                var ctx2 = document.getElementById("pChart").getContext("2d");
                var ctx3 = document.getElementById("disiplinChart").getContext("2d");
            <c:if test="${achart != null}">
                var data = [
                    {
                        value: <c:out value="${achart.getBangun_pagi()}"></c:out>,
                        color: "#F7464A",
                        highlight: "#FF5A5E",
                        label: "Bangun Pagi"
                    },
                    {
                        value: <c:out value="${achart.getOpera_pagi()}"></c:out>,
                        color: "#46BFBD",
                        highlight: "#5AD3D1",
                        label: "Opera Pagi"
                    },
                    {
                        value: <c:out value="${achart.getDoa_pagi()}"></c:out>,
                        color: "#FDB45C",
                        highlight: "#FFC870",
                        label: "Doa Pagi"
                    },
                    {
                        value: <c:out value="${achart.getStudi()}"></c:out>,
                        color: "#949FB1",
                        highlight: "#A8B3C5",
                        label: "Studi"
                    },
                    {
                        value: <c:out value="${achart.getGebyur_wc()}"></c:out>,
                        color: "#4D5360",
                        highlight: "#616774",
                        label: "Gebyur WC"
                    },
                    {
                        value: <c:out value="${achart.getDoa_malam()}"></c:out>,
                        color: "#4D5360",
                        highlight: "#616774",
                        label: "Doa Malam"
                    },
                    {
                        value: <c:out value="${achart.getTidur_malam()}"></c:out>,
                        color: "#4D5360",
                        highlight: "#616774",
                        label: "Tidur Malam"
                    }

                ];
                new Chart(ctx).PolarArea(data, {
                    animationEasing: "easeOutBounce"
                });
            </c:if>
            <c:if test="${inap != null}">
                var data1 = [
                    {
                        value: <c:out value="${inap}"></c:out>,
                        color: "#F7464A",
                        highlight: "#FF5A5E",
                        label: "Izin Inap"
                    },
                    {
                        value: <c:out value="${keluar}"></c:out>,
                        color: "#46BFBD",
                        highlight: "#5AD3D1",
                        label: "Izin Keluar"
                    }
                ];
                new Chart(ctx2).PolarArea(data1, {
                    animationEasing: "easeOutBounce"
                });
            </c:if>
            <c:if test="${krepcountp!=null}">
                var labelp = ["Lisan 1", "Lisan 2", "Lisan 3", "Tertulis 1", "Tertulis 2", "Tertulis 3"];
                var valp = [6, 5, 4, 3, 2, 1];
                var lab = [], val = [];
                for (var i = 0; i < <c:out value="${krepcountp}"></c:out>; i++) {
                    lab[i] = labelp[i];
                    val[i] = valp[i];
                }
                console.log(val);
                var data2 = {
                    labels: lab,
                    datasets: [
                        {
                            label: "Rekam Peringatan",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: val
                        }
                    ]
                };
                new Chart(ctx3).Line(data2, {
                    animationEasing: "easeOutBounce"
                });
            </c:if>
                var poin = [<c:out value="${achart.getBangun_pagi()}"></c:out>,<c:out value="${achart.getOpera_pagi()}"></c:out>,
            <c:out value="${achart.getDoa_pagi()}"></c:out>,<c:out value="${achart.getStudi()}"></c:out>,
            <c:out value="${achart.getGebyur_wc()}"></c:out>,<c:out value="${achart.getDoa_malam()}"></c:out>,
            <c:out value="${achart.getTidur_malam()}"></c:out>];
                var elemen = ["#vbangun", "#vopera", "#vdoapagi", "#vstudi", "#vgebyur", "#vdoamalam", "#vtidur"], i;
                for (i = 0; i < elemen.length; i++) {
                    $(elemen[i]).append((convert(poin[i])));
                }
                function convert(poin) {
                    if (poin > 80) {
                        return "A";
                    }
                    else if (poin > 60 && poin <= 80) {
                        return "B";
                    }
                    else if (poin > 40 && poin <= 60) {
                        return "C";
                    }
                    else if (poin > 20 && poin <= 40) {
                        return "D";
                    }
                    else if (poin <= 20) {
                        return "E";
                    }
                }
            });
            // Javascript to enable link to tab
            var hash = document.location.hash;
            var prefix = "tab_";
            if (hash) {
                $('.nav-tabs a[href=' + hash.replace(prefix, "") + ']').tab('show');
            }
            // Change hash for page-reload
            $('.nav-tabs a').on('shown.bs.tab', function (e) {
                window.location.hash = e.target.hash.replace("#", "#" + prefix);
                window.dispatchEvent(new Event('resize'));
            });
        </script>
    </body>
</html>
