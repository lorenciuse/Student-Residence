/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function () {
    $('#datetimepicker2').datetimepicker({
        locale: 'id',
        format: 'DD MMMM YYYY'
    });
});

$('#butt').click(function () {
    $('#nonbutt').click();
});

//script untuk melakukan edit biodata
function editfield() {
    var nama = $('#nama').text();
    var ttl = $('#ttl').text();
    var split = ttl.split(", ");
    var tempatlahir = split[0];
    var tanggallahir = split[1];
    var day = tanggallahir.split(/[\s,]+/)[0];
    var month = tanggallahir.split(/[\s,]+/)[1];
    var year = tanggallahir.split(/[\s,]+/)[2];

    var agama = $('#agama').text();
    var kelamin = $('#kelamin').text();
    var asal = $('#asal').text();
    var kabupaten = $('#kabupaten').text();
    var provinsi = $('#provinsi').text();
    var hp = $('#hp').text();
    var namaayah = $('#namaayah').text();
    var pendayah = $('#pendayah').text();
    var pekayah = $('#pekayah').text();
    var namaibu = $('#namaibu').text();
    var pendibu = $('#pendibu').text();
    var pekibu = $('#pekibu').text();
    var penda = $('#penda').text().substring(3);
    var telp = $('#telp').text();
    var hportu = $('#hportu').text();
    var keluarga = $('#keluarga').text();
    var telpkeluarga = $('#telpkeluarga').text();
    var hpkeluarga = $('#hpkeluarga').text();
    var nim = $('#nim').text();
    var prodi = $('#prog').text();
    var jurusan = $('#jurus').text();
    var fakultas = $('#fakul').text();
    var semester = $('#semes').text();
    var ipk = $('#ipk').text();
    var rapor = $('#rata').text();

    $('#nl').attr("value", nama);
    $('#tl').attr("value", tempatlahir);
    $('#tll').attr("value", day + " " + month + " " + year);
    $('select[name=agama]').val(agama).change();
    if (kelamin === "Pria") {
        $('#pria').attr("checked", "checked");
    } else {
        $('#wanita').attr("checked", "checked");
    }
    $('#asl').val(asal);
    $('#kab').attr("value", kabupaten);
    $('#prov').attr("value", provinsi);
    $('#nomhs').attr("value", hp);
    $('#nayah').attr("value", namaayah);
    $('#nibu').attr("value", namaibu);
    $('#penayah').attr("value", pendayah);
    $('#penibu').attr("value", pendibu);
    $('#keayah').attr("value", pekayah);
    $('#keibu').attr("value", pekibu);
    $('#pend').attr("value", penda);
    $('#tel').attr("value", telp);
    $('#hpor').attr("value", hportu);
    $('#almter').val(keluarga);
    $('#tlpter').attr("value", telpkeluarga);
    $('#hpter').attr("value", hpkeluarga);
    $('#nimmhs').attr("value", nim);
    $('#studi').attr("value", prodi);
    $('#jur').attr("value", jurusan);
    $('#fak').attr("value", fakultas);
    $('#sem').attr("value", semester);
    $('#ip').attr("value", ipk);
    $('#rap').attr("value", rapor);
}

//script untuk back to top
$(document).ready(function () {
    var offset = 220;
    var duration = 500;
    $(window).scroll(function () {
        if ($(this).scrollTop() > offset) {
            $('.back-to-top').fadeIn(duration);
        } else {
            $('.back-to-top').fadeOut(duration);
        }
    });

    $('.back-to-top').click(function (event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, duration);
        return false;
    });
});

//script untuk menampilkan preview foto saat pemilihan foto
$("#foto").change(function (event) {
    $("#preview").fadeIn("fast").attr('src', URL.createObjectURL(event.target.files[0]));
});

//script untuk validasi input angka
function validate(evt) {
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode(key);
    var regex = /[0-9]/;
    if (!regex.test(key)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault)
            theEvent.preventDefault();
    }
}

//script untuk menambahkan field kegiatan kampus
$(function () {
    var counter = 2;

    $('#addbtn').click(function () {
        var elems =
                '<div class="input-group" style="margin-bottom: 1em" id="childkegiatan' + (counter) + '">' +
                '<input type="text" class="form-control" name="sertifikatkegiatan" placeholder="Nomor Sertifikat">' +
                '<input type="text" class="form-control" name="kegiatan" placeholder="Nama Kegiatan">' +
                '<a class="input-group-addon btn btn-default" onclick="removeElement(\'parentkegiatan\',\'childkegiatan' + (counter) + '\')"> - </a>' +
                '</div>';
        $('#parentkegiatan').append(elems);
        counter++;
    });
});

//script untuk menambahkan field kegiatan luar kampus
$(function () {
    var counter = 2;

    $('#addbtnluar').click(function () {
        var elems =
                '<div class="input-group" style="margin-bottom: 1em" id="childkegiatanluar' + (counter) + '">' +
                '<input type="text" class="form-control" name="sertifikatkegiatanluar" placeholder="Nomor Sertifikat">' +
                '<input type="text" class="form-control" name="kegiatanluar" placeholder="Nama Kegiatan">' +
                '<a class="input-group-addon btn btn-default" onclick="removeElement(\'parentkegiatanluar\',\'childkegiatanluar' + (counter) + '\')"> - </a>' +
                '</div>';
        $('#parentkegiatanluar').append(elems);
        counter++;
    });
});

//script untuk menghapus field kegiatan kampus dan luar kampus
function removeElement(parentDiv, childDiv) {
    if (childDiv === parentDiv) {
        alert("The parent div cannot be removed.");
    }
    else if (document.getElementById(childDiv)) {
        var child = document.getElementById(childDiv);
        var parent = document.getElementById(parentDiv);
        parent.removeChild(child);
    }
    else {
        alert("Child div has already been removed or does not exist.");
        return false;
    }
}

//script untuk validasi field
$(document).ready(function () {
    $('#simpan').click(function (event) {
        $('#formBiodata').preventDefault().smkValidate();
    });
});
