<%-- 
    Document   : pendaftaran
    Created on : Apr 17, 2015, 8:06:53 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pendaftaran</title>
        <link href="${pageContext.request.contextPath}/resources/images/Monevs.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/bootstrapValidator.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/sticky-footer-navbar.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/back-to-top.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="pendaftaran">Pendaftaran</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Keluar <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li class="divider"></li>
                                <li><a href="logout">Keluar</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-4 col-md-4 control-label">Nomor Pendaftaran</label>
                            <div class="col-sm-8 col-md-8">
                                <div class="well well-sm form-control" id="nomor_pendaftaran">${noDaftar}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6">
                    <div class="col-md-offset-3">
                        <h4 class="page-header text-center"><strong>BIODATA LENGKAP</strong></h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <form id="formBiodata" enctype="multipart/form-data" class="form-horizontal" action="isibiodata" method="post" role="form">
                        <h4 class="page-header"><strong>DATA DIRI DAN ORANGTUA</strong></h4>
                        <div class="form-group">
                            <label for="foto" class="col-sm-4 col-md-4 control-label">Foto</label>
                            <div class="col-sm-8 col-md-8">
                                <img class="thumbnail" src="" id="preview" style="width: 100px; height: auto; display: none">
                                <input type="file" name="foto" id="foto">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nama_lengkap" class="col-sm-4 col-md-4 control-label">Nama Lengkap</label>
                            <div class="col-sm-8 col-md-8">
                                <input type="text" class="form-control" name="nama_lengkap" id="nl">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tempat_lahir" class="col-sm-4 col-md-4 control-label">Tempat, tanggal lahir</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" name="tempat_lahir" id="tl" placeholder="Tempat Lahir">
                            </div>
                            <div class=" col-sm-4 col-md-4">
                                <div class='input-group date' id='datetimepicker2'>
                                    <input type="text" class="form-control" name="tanggal_lahir" id="tll" readonly>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="agama" class="col-sm-4 col-md-4 control-label">Agama</label>
                            <div class="col-sm-4 col-md-4">
                                <select name="agama" class="form-control" id="ag">
                                    <option value=""></option>
                                    <option value="Buddha">Buddha</option>
                                    <option value="Hindu">Hindu</option>
                                    <option value="Islam">Islam</option>
                                    <option value="Kristen Katolik">Kristen Katolik</option>
                                    <option value="Kristen Protestan">Kristen Protestan</option>
                                    <option value="Konghucu">Konghucu</option>
                                </select>
                            </div>
                            <label class="col-sm-2 col-md-2 control-label">Jenis Kelamin</label>
                            <div class="col-sm-2 col-md-2">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="kelamin" value="Pria" id="pria">
                                        Pria
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="kelamin" value="Wanita" id="wanita">
                                        Wanita
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="alamat_asal" class="col-sm-4 col-md-4 control-label">Alamat Asal</label>
                            <div class="col-sm-8 col-md-8">
                                <textarea class="form-control" name="alamat_asal" rows="3" id="asl"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="kabupaten_kota" class="col-sm-4 col-md-4 control-label">Kabupaten/Kota & Provinsi</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" name="kabupaten_kota" id="kab" placeholder="Kabupaten/Kota">
                            </div>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" name="provinsi" id="prov" placeholder="Provinsi">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 col-md-4 control-label">Nomor Telepon</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" name="hp" id="nomhs" placeholder="HP" onkeypress='validate(event)'>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 col-md-4 control-label">Nama Orangtua</label>
                            <div class="col-sm-8 col-md-8">
                                <label for="nama_ayah" class="control-label">Ayah</label>
                                <input type="text" class="form-control" name="nama_ayah" id="nayah">
                                <label for="nama_ibu" class="control-label">Ibu</label>
                                <input type="text" class="form-control" name="nama_ibu" id="nibu">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 col-md-4 control-label">Tingkat Pendidikan Orangtua</label>
                            <div class="col-sm-4 col-md-4">
                                <label for="pend_ayah" class="control-label">Ayah</label>
                                <input type="text" class="form-control" name="pend_ayah" id="penayah">
                            </div>
                            <div class="col-sm-4 col-md-4">
                                <label for="pend_ibu" class="control-label">Ibu</label>
                                <input type="text" class="form-control" name="pend_ibu" id="penibu">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 col-md-4 control-label">Pekerjaan Orangtua</label>
                            <div class="col-sm-4 col-md-4">
                                <label for="kerja_ayah" class="control-label">Ayah</label>
                                <input type="text" class="form-control" name="kerja_ayah" id="keayah">
                            </div>
                            <div class="col-sm-4 col-md-4">
                                <label for="kerja_ibu" class="control-label">Ibu</label>
                                <input type="text" class="form-control" name="kerja_ibu" id="keibu">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pendapatan_ortu" class="col-sm-4 col-md-4 control-label">Pendapatan Orangtua</label>
                            <div class="col-sm-8 col-md-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rp</span>
                                    <input type="text" class="form-control" name="pendapatan_ortu" onkeypress='validate(event)' id="pend">
                                    <span class="input-group-addon">,00</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 col-md-4 control-label">Nomor Telepon Orangtua</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" name="telepon_rumah_ortu" placeholder="Rumah" onkeypress='validate(event)' id="tel">
                            </div>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" name="hp_ortu" placeholder="HP" onkeypress='validate(event)' id="hpor">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="alamat_keluarga_terdekat" class="col-sm-4 col-md-4 control-label">Alamat Keluarga Terdekat</label>
                            <div class="col-sm-8 col-md-8">
                                <textarea class="form-control" rows="3" name="alamat_keluarga_terdekat" id="almter"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 col-md-4 control-label">Nomor Telepon Keluarga Terdekat</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" name="telepon_rumah_terdekat" placeholder="Rumah" id="tlpter" onkeypress='validate(event)'>
                            </div>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" name="hp_terdekat" placeholder="HP" id="hpter" onkeypress='validate(event)'>
                            </div>
                        </div>
                        <h4 class="page-header"><strong>DATA AKADEMIK</strong></h4>
                        <div class="form-group">
                            <label for="nim" class="col-sm-4 col-md-4 control-label">NIM</label>
                            <div class="col-sm-8 col-md-8">
                                <c:choose>
                                    <c:when test="${terisi}">
                                        <input type="text" class="form-control" name="nim" value="" id="nimmhs">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" name="nim" value="${nim}" id="nimmhs" readonly>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="program_studi" class="col-sm-4 col-md-4 control-label">Program Studi</label>
                            <div class="col-sm-8 col-md-8">
                                <input type="text" class="form-control" name="program_studi" id="studi">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="jurusan" class="col-sm-4 col-md-4 control-label">Jurusan</label>
                            <div class="col-sm-8 col-md-8">
                                <input type="text" class="form-control" name="jurusan" id="jur">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="fakultas" class="col-sm-4 col-md-4 control-label">Fakultas</label>
                            <div class="col-sm-8 col-md-8">
                                <input type="text" class="form-control" name="fakultas" id="fak">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="semester" class="col-sm-4 col-md-4 control-label">Semester</label>
                            <div class="col-sm-8 col-md-8">
                                <input type="text" class="form-control" name="semester" id="sem" onkeypress='validate(event)'>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ipk" class="col-sm-4 col-md-4 control-label">IPK s/d semester ganjil (Mhs. smt III ke atas)</label>
                            <div class="col-sm-8 col-md-8">
                                <input type="text" class="form-control" name="ipk" id="ip">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rapor" class="col-sm-4 col-md-4 control-label">Rata-rata nilai Rapor SMU Kelas XII Smt 1 (Mhs. Baru)</label>
                            <div class="col-sm-8 col-md-8">
                                <input type="text" class="form-control" name="rapor" id="rap">
                            </div>
                        </div>
                        <h4 class="page-header"><strong>DATA NON AKADEMIK</strong></h4>
                        <div class="form-group">
                            <label class="col-sm-4 col-md-4 control-label">Kegiatan Non Akademik di Kampus</label>
                            <div class="col-sm-8 col-md-8">
                                <div id="parentkegiatan" style="margin-top: 1em">
                                    <div class="input-group" style="margin-bottom: 1em"  id="childkegiatan1">
                                        <input type="text" class="form-control" name="sertifikatkegiatan" placeholder="Nomor Sertifikat">
                                        <input type="text" class="form-control" name="kegiatan" placeholder="Nama Kegiatan">
                                        <a class="input-group-addon btn btn-default" id="addbtn"> + </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 col-md-4 control-label">Kegiatan Non Akademik di Luar Kampus</label>
                            <div class="col-sm-8 col-md-8">
                                <div id="parentkegiatanluar" style="margin-top: 1em">
                                    <div class="input-group" style="margin-bottom: 1em"  id="childkegiatanluar1">
                                        <input type="text" class="form-control" name="sertifikatkegiatanluar" placeholder="Nomor Sertifikat">
                                        <input type="text" class="form-control" name="kegiatanluar" placeholder="Nama Kegiatan">
                                        <a class="input-group-addon btn btn-default" id="addbtnluar"> + </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-md-offset-4 col-sm-2 col-md-2">
                                <input type="submit" class="btn btn-default" value="Simpan">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-sm-12 col-md-6">
                    <div class="col-md-offset-3">
                        <div id="formBiodata" class="form-horizontal">
                            <h4 class="page-header"><strong>DATA DIRI DAN ORANGTUA</strong></h4>
                            <div class="form-group">
                                <div class="col-sm-1 col-md-1">
                                    <img class="thumbnail" src="lihatfoto?nim=${nim}" alt="${nim}" style="width: 100px; height: auto">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="nama_lengkap" class="col-sm-4 col-md-4">Nama Lengkap</label>
                                <div class="col-sm-8 col-md-8" id="nama"><c:out value="${mhs.getNamaMhs()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="tempat_lahir" class="col-sm-4 col-md-4">Tempat, tanggal lahir</label>
                                    <div class="col-sm-8 col-md-8" id="ttl"><c:out value="${mhs.getTempat_lahir()}"></c:out>, <c:out value="${mhs.getTanggal_lahir()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="agama" class="col-sm-4 col-md-4">Agama</label>
                                        <div class="col-sm-8 col-md-8" id="agama"><c:out value="${mhs.getAgama()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Jenis Kelamin</label>
                                    <div class="col-sm-8 col-md-8" id="kelamin"><c:out value="${mhs.getKelamin()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="alamat_asal" class="col-sm-4 col-md-4">Alamat Asal</label>
                                    <div class="col-sm-8 col-md-8" id="asal"><c:out value="${mhs.getAlamat_asal()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="kabupaten_kota" class="col-sm-4 col-md-4">Kabupaten/Kota</label>
                                    <div class="col-sm-8 col-md-8" id="kabupaten"><c:out value="${mhs.getKab_kota_asal()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="kabupaten_kota" class="col-sm-4 col-md-4">Provinsi</label>
                                    <div class="col-sm-8 col-md-8" id="provinsi"><c:out value="${mhs.getProv_asal()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Nomor Telepon</label>
                                    <div class="col-sm-8 col-md-8" id="hp"><c:out value="${mhs.getNo_hp_mhs()}"></c:out></div>
                                </div>
                                <label class="col-sm-12 col-md-12 page-header"><h5><b>Data Orangtua Ayah</b></h5></label>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Nama</label>
                                    <div class="col-sm-8 col-md-8" id="namaayah"><c:out value="${mhs.getNama_ayah()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Pendidikan</label>
                                    <div class="col-sm-8 col-md-8" id="pendayah"><c:out value="${mhs.getPendidikan_ayah()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Pekerjaan </label>
                                    <div class="col-sm-8 col-md-8" id="pekayah"><c:out value="${mhs.getPekerjaan_ayah()}"></c:out></div>
                                </div>
                                <label class="col-sm-12 col-md-12 page-header"><h5><b>Data Orangtua Ibu</b></h5></label>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Nama</label>
                                    <div class="col-sm-8 col-md-8" id="namaibu"><c:out value="${mhs.getNama_ibu()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Pendidikan</label>
                                    <div class="col-sm-8 col-md-8" id="pendibu"><c:out value="${mhs.getPendidikan_ibu()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Pekerjaan </label>
                                    <div class="col-sm-8 col-md-8" id="pekibu"><c:out value="${mhs.getPekerjaan_ibu()}"></c:out></div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="pendapatan_ortu" class="col-sm-4 col-md-4">Pendapatan Orangtua</label>
                                    <div class="col-sm-8 col-md-8" id="penda">Rp. <c:out value="${mhs.getPendapatan_ortu()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Nomor Telepon Rumah</label>
                                    <div class="col-sm-8 col-md-8" id="telp"><c:out value="${mhs.getNo_tel_ortu()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Nomor HP Ortu</label>
                                    <div class="col-sm-8 col-md-8" id="hportu"><c:out value="${mhs.getNo_hp_ortu()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="alamat_keluarga_terdekat" class="col-sm-4 col-md-4">Alamat Keluarga Terdekat</label>
                                    <div class="col-sm-8 col-md-8" id="keluarga"><c:out value="${mhs.getAlamat_keluarga()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Nomor Telepon Rumah Keluarga Terdekat</label>
                                    <div class="col-sm-8 col-md-8" id="telpkeluarga"><c:out value="${mhs.getNo_tel_keluarga()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Nomor HP Keluarga Terdekat</label>
                                    <div class="col-sm-8 col-md-8" id="hpkeluarga"><c:out value="${mhs.getNo_hp_keluarga()}"></c:out></div>
                                </div>
                                <h4 class="page-header"><strong>DATA AKADEMIK</strong></h4>
                                <div class="form-group">
                                    <label for="nim" class="col-sm-4 col-md-4">NIM</label>
                                    <div class="col-sm-8 col-md-8" id="nim"><c:out value="${asr.getNim()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="program_studi" class="col-sm-4 col-md-4">Program Studi</label>
                                    <div class="col-sm-8 col-md-8" id="prog"><c:out value="${asr.getProdi()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="jurusan" class="col-sm-4 col-md-4">Jurusan</label>
                                    <div class="col-sm-8 col-md-8" id="jurus"><c:out value="${asr.getJurusan()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="fakultas" class="col-sm-4 col-md-4">Fakultas</label>
                                    <div class="col-sm-8 col-md-8" id="fakul"><c:out value="${asr.getFakultas()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="semester" class="col-sm-4 col-md-4">Semester</label>
                                    <div class="col-sm-8 col-md-8" id="semes"><c:out value="${asr.getSemester()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="ipk" class="col-sm-4 col-md-4">IPK s/d semester ganjil (Mhs. smt III ke atas)</label>
                                    <div class="col-sm-8 col-md-8" id="ipk"><c:out value="${asr.getIpk_masuk()}"></c:out></div>
                                </div>
                                <div class="form-group">
                                    <label for="rapor" class="col-sm-4 col-md-4">Rata-rata nilai Rapor SMU Kelas XII Smt 1 (Mhs. Baru)</label>
                                    <div class="col-sm-8 col-md-8" id="rata"><c:out value="${asr.getRapor_smu()}"></c:out></div>
                                </div>
                                <h4 class="page-header"><strong>DATA NON AKADEMIK</strong></h4>
                                <div class="form-group">
                                    <label class="col-sm-4 col-md-4">Kegiatan Non Akademik di Kampus</label>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4">Nomor Sertifikat</div>
                                    <div class="col-sm-8 col-md-8">Nama Kegiatan</div>
                                </div>
                                <div class="form-group">
                                <c:forEach items="${presK}" var="kamp">
                                    <div class="col-md-4"><c:out value="${kamp.getNo_sertifikat()}"></c:out></div>
                                    <div class="col-sm-8 col-md-8"><c:out value="${kamp.getNama_prestasi()}"></c:out></div>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 col-md-4">Kegiatan Non Akademik di Luar Kampus</label>
                            </div>
                            <div class="form-group">
                                <div class="col-md-4">Nomor Sertifikat</div>
                                <div class="col-sm-8 col-md-8">Nama Kegiatan</div>
                            </div>
                            <div class="form-group">
                                <c:forEach items="${presL}" var="luar">
                                    <div class="col-md-4"><c:out value="${luar.getNo_sertifikat()}"></c:out></div>
                                    <div class="col-sm-8 col-md-8"><c:out value="${luar.getNama_prestasi()}"></c:out></div>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-1 col-md--1 col-sm-2 col-md-2">
                                    <c:choose>
                                        <c:when test="${terisi}">
                                            <button class="btn btn-default" onclick="editfield()">Edit</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn btn-default" onclick="editfield()" disabled>Edit</button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" class="back-to-top"><span class="glyphicon glyphicon-arrow-up"></span>&nbsp;&nbsp;Kembali ke Atas</a>
        <%@include file="footer.jsp"%>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery-2.1.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/bootstrapValidator.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/moment-with-locales.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/bootstrap-datetimepicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/pages/js/pendaftaran.js"></script>
    </body>
</html>
