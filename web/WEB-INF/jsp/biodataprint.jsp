<%-- 
    Document   : biodataprint
    Created on : May 18, 2015, 12:40:48 AM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biodata Print</title>
        <link href="${pageContext.request.contextPath}/resources/images/Monevs.png" rel="icon" type="image/png">
        <link href="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/css/bootstrap.min.cerulean.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/plugins/css/AdminLTE.min.css" rel="stylesheet">
    </head>
    <body onload="window.print();">
        <div class="col-md-offset-2 col-md-8">
            <div id="formBiodata" class="form-horizontal">
                <div class="row">
                    <h4 class="page-header"><strong>DATA DIRI DAN ORANGTUA</strong></h4>
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <div class="col-sm-6 col-md-6">
                                <img class="thumbnail" src="lihatfoto?nim=${nim}" alt="${nim}" style="width: 100px; height: auto">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-md-6">
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
                        <div class="col-xs-6 col-md-6">
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
                        <div class="col-xs-6 col-md-6">
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
                        <div class="col-xs-6 col-md-6">
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
                        <div class="col-xs-6 col-md-6">
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
                        <div class="col-xs-6 col-md-6">
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
                        <h4 class="page-header"><strong>DATA AKADEMIK</strong></h4>
                        <div class="col-xs-6 col-md-6">
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
                        </div>
                        <div class="col-xs-6 col-md-6">
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
                    </div>
                    <div class="row">
                        <h4 class="page-header"><strong>DATA NON AKADEMIK</strong></h4>
                        <div class="col-xs-12 col-md-12">
                            <div class="form-group">
                                <label class="col-sm-5 col-md-5">Kegiatan Non Akademik di Kampus</label>
                            </div>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="col-md-5">Nomor Sertifikat</th>
                                        <th class="col-sm-7 col-md-7">Nama Kegiatan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${presK}" var="kamp">
                                    <tr>
                                        <td class="col-md-5"><c:out value="${kamp.getNo_sertifikat()}"></c:out></td>
                                        <td class="col-sm-7 col-md-7"><c:out value="${kamp.getNama_prestasi()}"></c:out></td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="form-group">
                            <label class="col-sm-5 col-md-5">Kegiatan Non Akademik di Luar Kampus</label>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th class="col-md-5">Nomor Sertifikat</th>
                                    <th class="col-sm-7 col-md-7">Nama Kegiatan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${presL}" var="luar">
                                    <tr>
                                        <td class="col-md-5"><c:out value="${luar.getNo_sertifikat()}"></c:out></td>
                                        <td class="col-sm-7 col-md-7"><c:out value="${luar.getNama_prestasi()}"></c:out></td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/resources/plugins/js/jquery-2.1.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    </body>
</html>
