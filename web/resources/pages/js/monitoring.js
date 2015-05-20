/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function transform(dateInputId, dateOutputId) {
    var tgl = document.getElementById(dateInputId);
    var tgl1 = document.getElementById(dateOutputId);
    tgl1.value = tgl.valueAsNumber;
}

$(function () {
    $('#kamar').on('change', function () {
        $('#form-kamar').submit();
    });
    $('#mhs').on('change', function () {
        $('#form-mhs').submit();
    });
});

$(function () {
    $('#datetimepicker2').datetimepicker({
        locale: 'id',
        format: 'DD MMMM YYYY'
    });
    $('#datetimepicker3').datetimepicker({
        locale: 'id',
        format: 'DD MMMM YYYY'
    });
});

//script untuk menambahkan field kegiatan kampus
$(function () {
    var counter = 2;

    $('#addbtn').click(function () {
        var elems =
                '<div class = "input-group" style="margin-bottom: 1em" id = "childpenyakit' + (counter) + '">' +
                '<input type = "text" class = "form-control" name = "namapenyakit" placeholder = "Masukkan nama penyakit">' +
                '<a class = "input-group-addon btn btn-default" onclick="removeElement(\'parentpenyakit\',\'childpenyakit' + (counter) + '\')"><span class = "glyphicon glyphicon-minus"></span></a>' +
                '</div>';
        $('#parentpenyakit').append(elems);
        counter++;
    });
});

//script untuk menghapus field kegiatan kampus dan luar kampus
function removeElement(parentDiv, childDiv) {
    if (childDiv == parentDiv) {
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

$(document).ready(function () {
    $('.selectpicker').selectpicker();
    $('#kamar').selectpicker('val', "");
    $('#mhs').selectpicker('val', "");
    $('#select-all').click(function () {
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck('check');
    });

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

    $('#myTable').dataTable({
        "pageLength": 8,
        "lengthChange": false,
        responsive: true
    });
});

$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
    checkboxClass: 'icheckbox_minimal-blue',
    radioClass: 'iradio_minimal-blue'
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

