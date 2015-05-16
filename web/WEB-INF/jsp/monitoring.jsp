<%-- 
    Document   : kedisiplinan
    Created on : Mar 28, 2015, 2:01:23 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                    <form role="form" action="" method="">
                                        <label class="control-label">Nomor Kamar</label>
                                        <div class="input-group">
                                            <input type="text" name="nomor_kamar" class="form-control">
                                            <span class="input-group-btn">
                                                <button class="btn btn-primary btn-flat" type="button"><span class="glyphicon glyphicon-search"></span></button>
                                            </span>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-sm-7 col-md-7">
                                    <label class="control-label">Nama Mahasiswa</label>
                                    <select class="form-control" name="nama_mhs">
                                        <option value=""></option>
                                        <option value=""></option>
                                        <option value=""></option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-12">
                                    <table class="table table-hover">
                                        <tbody>
                                            <tr>
                                                <th>Nama</th>
                                                <td>Lorencius Echo Sujianto Putera</td>
                                            </tr>
                                            <tr>
                                                <th>NIM</th>
                                                <td>125314085</td>
                                            </tr>
                                            <tr>
                                                <th>Prodi</th>
                                                <td>Teknik Informatika</td>
                                            </tr>
                                            <tr>
                                                <th>Kamar</th>
                                                <td>311</td>
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
                            <li role="presentation" class="active"><a href="#aktivitastab" id="aktivitas-tab" role="tab" data-toggle="tab" aria-controls="aktivitas" aria-expanded="true">Aktivitas</a></li>
                            <li role="presentation"><a href="#kedisiplinantab" role="tab" id="kedisiplinan-tab" data-toggle="tab" aria-controls="kedisiplinan">Kedisiplinan</a></li>
                            <li role="presentation"><a href="#kesehatantab" id="kesehatan-tab" role="tab" data-toggle="tab" aria-controls="kesehatan">Kesehatan</a></li>
                            <li role="presentation"><a href="#perizinantab" role="tab" id="perizinan-tab" data-toggle="tab" aria-controls="perizinan">Perizinan</a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="aktivitastab" aria-labelledBy="aktivitas-tab">
                                <h3 class="page-header"><span class="glyphicon glyphicon-list-alt"></span> Catatan Aktivitas Harian</h3>
                                <form class="form-inline" role="form" action="" method="">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Tanggal Aktivitas</label>
                                                <input type="date" class="form-control" name="tanggal_aktivitas" placeholder="Tanggal Aktivitas" required>
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
                                                <label><input class="minimal" type="checkbox" name="checkboxes" value="bangun"> Bangun</label>
                                            </div>
                                            <div class="form-group">
                                                <label><input class="minimal" type="checkbox" name="checkboxes" value="opera_pagi"> Opera Pagi</label>
                                            </div>
                                            <div class="form-group">
                                                <label><input class="minimal" type="checkbox" name="checkboxes" value="doa_pagi"> Doa Pagi</label>
                                            </div>
                                            <div class="form-group">
                                                <label><input class="minimal" type="checkbox" name="checkboxes" value="studi"> Studi</label>
                                            </div>
                                            <div class="form-group">
                                                <label><input class="minimal" type="checkbox" name="checkboxes" value="gebyur_wc"> Gebyur WC</label>
                                            </div>
                                            <div class="form-group">
                                                <label><input class="minimal" type="checkbox" name="checkboxes" value="doa_malam"> Doa Malam</label>
                                            </div>
                                            <div class="form-group">
                                                <label><input class="minimal" type="checkbox" name="checkboxes" value="tidur_malam"> Tidur Malam</label>
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
                            <div role="tabpanel" class="tab-pane fade" id="kedisiplinantab" aria-labelledBy="kedisiplinan-tab">
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
                            <div role="tabpanel" class="tab-pane fade" id="kesehatantab" aria-labelledBy="kesehatan-tab">
                                <h3 class="page-header"><span class="glyphicon glyphicon-plus"></span> Data Riwayat Penyakit</h3>
                                <div class="row">
                                    <div class="col-sm-12 col-md-4">
                                        <form class="form-horizontal" role="form" action="" method="">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Tanggal Sakit</label>
                                                    <input type="date" class="form-control" name="tanggal_sakit" placeholder="Tanggal Sakit">    
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Nama Penyakit</label>
                                                    <div id="parentpenyakit">
                                                        <div class="input-group" id="childpenyakit">
                                                            <input type="text" class="form-control" name="namapenyakit1" placeholder="Masukkan nama penyakit">
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
                                        <table class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <td><strong>Tanggal Sakit</strong></td>
                                                    <td><strong>Nama Penyakit</strong></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>01/02/2015</td>
                                                    <td>Kepo</td>
                                                </tr>
                                                <tr>
                                                    <td>14/02/2015</td>
                                                    <td>Kepo</td>
                                                </tr>
                                                <tr>
                                                    <td>23/02/2015</td>
                                                    <td>Kepo</td>
                                                </tr>
                                                <tr>
                                                    <td>404</td>
                                                    <td>au ah gelap</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="perizinantab" aria-labelledBy="perizinan-tab">
                                <h3 class="page-header">
                                    <span class="glyphicon glyphicon-envelope"></span> Surat Izin
                                    <div class="btn-group" role="group">
                                        <button id="tombolIzinKeluar" class="btn btn-file btn-flat">Keluar</button>
                                        <button id="tombolIzinInap" class="btn btn-file btn-flat">Inap</button>
                                    </div>
                                </h3>
                                <h1 id="labelIzinKeluar" class="text-center"><small>Surat Izin Keluar</small></h1>
                                <h1 id="labelIzinInap" class="text-center"><small>Surat Izin Menginap</small></h1>
                                <form id="IzinInap" class="form-horizontal" role="form" action="" method="post">
                                    <h3 class="page-header text-center"><small>Data Tempat Inap</small></h3>
                                    <div class="form-group">
                                        <label for="nama_dituju" class="col-sm-2 col-md-2 control-label">Nama</label>
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
                                            <input type="date" class="form-control" name="tanggal_berangkat">
                                        </div>
                                        <label for="tanggal_kembali" class="col-sm-2 col-md-2 control-label">Tanggal Kembali</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="date" class="form-control" name="tanggal_kembali">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="jam_berangkat" class="col-sm-2 col-md-2 control-label">Jam Berangkat</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="time" class="form-control" name="jam_berangkat">
                                        </div>
                                        <label for="jam_kembali" class="col-sm-2 col-md-2 control-label">Jam Kembali</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="time" class="form-control" name="jam_kembali">
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
                                <form id="IzinKeluar" class="form-horizontal" role="form" action=" " method="post">
                                    <div class="form-group">
                                        <label for="nim" class="col-sm-2 col-md-2 control-label">NIM</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="text" class="form-control" name="nim">
                                        </div>
                                        <label for="nomor_kamar" class="col-sm-2 col-md-2 control-label">Nomor Kamar</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="text" class="form-control" name="nomor_kamar">
                                        </div>
                                    </div> 
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
                                            <input type="date" class="form-control" name="tanggal_keluar">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="jam_keluar" class="col-sm-2 col-md-2 control-label">Jam Keluar</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="time" class="form-control" name="jam_keluar">
                                        </div>
                                        <label for="jam_kembali" class="col-sm-2 col-md-2 control-label">Jam Kembali</label>
                                        <div class="col-sm-4 col-md-4">
                                            <input type="time" class="form-control" name="jam_kembali">
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
    <script src="${pageContext.request.contextPath}/resources/plugins/js/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $(document.getElementById('monitoring')).addClass("active");
            $('#labelIzinInap').hide();
            $('#IzinInap').hide();
            $('#tombolIzinKeluar').addClass('disabled');
            $('#tombolIzinKeluar').click(function () {
                $('#labelIzinInap').hide();
                $('#labelIzinKeluar').show();
                $('#IzinInap').hide();
                $('#IzinKeluar').show();
                $('#tombolIzinInap').removeClass('disabled');
                $('#tombolIzinKeluar').addClass('disabled');
            });
            $('#tombolIzinInap').click(function () {
                $('#labelIzinInap').show();
                $('#labelIzinKeluar').hide();
                $('#IzinInap').show();
                $('#IzinKeluar').hide();
                $('#tombolIzinKeluar').removeClass('disabled');
                $('#tombolIzinInap').addClass('disabled');
            });
            $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                checkboxClass: 'icheckbox_minimal-blue',
                radioClass: 'iradio_minimal-blue'
            });
        });
    </script>
</html>