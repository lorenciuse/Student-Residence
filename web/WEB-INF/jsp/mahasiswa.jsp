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
                                        <div class="col-md-3">
                                            <h3 class="box-title"><b>Biodata Mahasiswa</b></h3>
                                            <form class="form-horizontal"role="form" action="biodata" method="post">
                                                <label class="control-label">NIM Mahasiswa</label>
                                                <div class="input-group">
                                                    <input type="text" name="nim" class="form-control" value="${nim}">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-primary btn-flat" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                                    </span>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="col-md-offset-2 col-md-8">
                                            <div id="formBiodata" class="form-horizontal">
                                                <div class="row">
                                                    <h4 class="page-header"><strong>DATA DIRI DAN ORANGTUA</strong></h4>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="col-sm-1 col-md-1">
                                                                <c:choose>
                                                                    <c:when test="${foto}">
                                                                        <img class="thumbnail" src="lihatfoto?nim=${nim}" alt="${nim}" style="width: 100px; height: auto">
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
                                                    <div class="form-group">
                                                        <div class="pull-right">
                                                            <form action="biodata-print" target="_blank" method="post">
                                                                <input type="hidden" name="nim" value="${nim}">
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
                        {"width": "20%"},
                        {"width": "80%"}
                    ],
                    autoWidth: false,
                    "pageLength": 10,
                    "lengthChange": false,
                    responsive: true
                });
                $(document.getElementById('mahasiswa')).addClass("active");
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
            });
        </script>
    </body>
</html>
