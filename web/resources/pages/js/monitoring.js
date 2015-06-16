/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function transform(dateInputId, dateOutputId) {
    var tgl = document.getElementById(dateInputId);
    var tgl1 = document.getElementById(dateOutputId);
    tgl1.value = tgl.value;
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
    var datetime = ['2', '3', '4', '5', '6', '7', '8'],
            d = datetime.length, h;
    for (h = 0; h < d; h++)$("#datetimepicker"+datetime[h]).datetimepicker({locale: 'id',format: 'DD MMMM YYYY'});
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

function log(){
    console.log(document.getElementById("tanggal_peringatan").value);
}

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

$(document).ready(function () {
    $('.selectpicker').selectpicker();
    $('#kamar').selectpicker('val', "");
    $('#mhs').selectpicker('val', "");
    $(document).ready(function () {
        $('#select-all').click(function (event) {
            $('.minimal').each(function () { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class minimal              
            });
        });

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
    $('#keterangan_lisan').hide();
    $('#keterangan_tertulis').hide();
    var lisan = ['#l1', '#l2', '#l3'],
            l = lisan.length, i;
    for (i = 0; i < l; i++)$(lisan[i]).click(function (){$('#keterangan_tertulis').hide();$('#keterangan_lisan').slideDown().show('slow');});
    var tertulis = ['#tl1', '#tl2', '#tl3'],
            t = tertulis.length, j;
    for (j = 0; j < t; j++)$(tertulis[j]).click(function (){$('#keterangan_lisan').hide();$('#keterangan_tertulis').slideDown().show('slow');});
    
    var buttlisan = ['#l1', '#l2', '#l3'], k;
    var count_lisan = document.getElementById("total_lisan").value;
    for (k = 0; k < count_lisan; k++)$(buttlisan[k]).addClass("disabled");
    var butttertulis = ['#tl1', '#tl2', '#tl3'], l;
    var count_tertulis = document.getElementById("total_tertulis").value;
    for (l = 0; l < count_tertulis; l++)$(butttertulis[l]).addClass("disabled");
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

