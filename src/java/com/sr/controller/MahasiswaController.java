/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.controller;

import com.sr.model.akademik.AkademikSR;
import com.sr.model.akademik.Prestasi;
import com.sr.model.mahasiswa.IMahasiswaDAO;
import com.sr.model.mahasiswa.Mahasiswa;
import com.sr.model.pendaftaran.IPendaftaranDAO;
import com.sr.model.pendaftaran.Pendaftaran;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Lorencius
 */
@Controller
public class MahasiswaController {

    @Autowired
    IMahasiswaDAO<Mahasiswa> mahasiswa;

    @Autowired
    IPendaftaranDAO<Pendaftaran> daftar;

    @RequestMapping("/daftar")
    public String daftar(HttpServletRequest request, ModelMap modelMap) {
        modelMap.addAttribute("nim", daftar.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()));
        Mahasiswa mhs = daftar.getBiodataByNim(daftar.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()));
        AkademikSR asr = daftar.getAkademikByNim(daftar.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()));
        List<Prestasi> kampus = daftar.getPrestasiByNimJenis(daftar.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()), "Kampus");
        List<Prestasi> luar = daftar.getPrestasiByNimJenis(daftar.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()), "Luar Kampus");
        if (mhs.getNamaMhs() != null) {
            modelMap.addAttribute("mhs", mhs);
            modelMap.addAttribute("asr", asr);
            modelMap.addAttribute("presK", kampus);
            modelMap.addAttribute("presL", luar);
            modelMap.addAttribute("terisi", true);
        }
        return "pendaftaran";
    }

    @RequestMapping("/logout")
    public String logout() {
        return "redirect:/logoutmonev/do";
    }

    @RequestMapping(value = "/isibiodata", method = {RequestMethod.GET, RequestMethod.POST})
    public String isi(HttpServletRequest request) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(factory);
        try {
            List items = sfu.parseRequest(request);
            FileItem foto = (FileItem) items.get(0);
            FileItem nama_lengkap = (FileItem) items.get(1);
            FileItem tempat_lahir = (FileItem) items.get(2);
            FileItem tanggal_lahir = (FileItem) items.get(3);
            FileItem agama = (FileItem) items.get(4);
            FileItem kelamin = (FileItem) items.get(5);
            FileItem alamat_asal = (FileItem) items.get(6);
            FileItem kabupaten = (FileItem) items.get(7);
            FileItem provinsi = (FileItem) items.get(8);
            FileItem no_telp = (FileItem) items.get(9);
            FileItem nama_ayah = (FileItem) items.get(10);
            FileItem nama_ibu = (FileItem) items.get(11);
            FileItem pend_ayah = (FileItem) items.get(12);
            FileItem pend_ibu = (FileItem) items.get(13);
            FileItem pekerjaan_ayah = (FileItem) items.get(14);
            FileItem pekerjaan_ibu = (FileItem) items.get(15);
            FileItem pendapatan_ortu = (FileItem) items.get(16);
            FileItem no_telp_rumah = (FileItem) items.get(17);
            FileItem no_telp_hp = (FileItem) items.get(18);
            FileItem alamat_keluarga_terdekat = (FileItem) items.get(19);
            FileItem no_telp_rumah_terdekat = (FileItem) items.get(20);
            FileItem no_telp_hp_terdekat = (FileItem) items.get(21);
            FileItem nim = (FileItem) items.get(22);
            FileItem prodi = (FileItem) items.get(23);
            FileItem jurusan = (FileItem) items.get(24);
            FileItem fakultas = (FileItem) items.get(25);
            FileItem semester = (FileItem) items.get(26);
            FileItem ipk_sr = (FileItem) items.get(27);
            FileItem rapor_smu = (FileItem) items.get(28);

            List<Prestasi> prestasi = new ArrayList();
            for (int i = 29; i < items.size() - 1; i += 2) {
                FileItem n = (FileItem) items.get(i);
                FileItem k = (FileItem) items.get(i + 1);
                Prestasi pres = new Prestasi();
                pres.setNim(nim.getString());
                pres.setNo_sertifikat(n.getString());
                pres.setNama_prestasi(k.getString());
                if (k.get() != null) {
                    if (n.getFieldName().equals("sertifikatkegiatan")) {
                        pres.setJenis_prestasi("Kampus");
                        prestasi.add(pres);
                    } else {
                        pres.setJenis_prestasi("Luar Kampus");
                        prestasi.add(pres);
                    }
                }
            }

            Mahasiswa mhs = new Mahasiswa();
            mhs.setNama_mhs(nama_lengkap.getString());
            mhs.setTempat_lahir(tempat_lahir.getString());
            mhs.setTanggal_lahir(tanggal_lahir.getString());
            mhs.setAgama(agama.getString());
            mhs.setKelamin(kelamin.getString());
            mhs.setAlamat_asal(alamat_asal.getString());
            mhs.setKab_kota_asal(kabupaten.getString());
            mhs.setProv_asal(provinsi.getString());
            mhs.setNo_hp_mhs(no_telp.getString());
            mhs.setNama_ayah(nama_ayah.getString());
            mhs.setNama_ibu(nama_ibu.getString());
            mhs.setPendidikan_ayah(pend_ayah.getString());
            mhs.setPendidikan_ibu(pend_ibu.getString());
            mhs.setPekerjaan_ayah(pekerjaan_ayah.getString());
            mhs.setPekerjaan_ibu(pekerjaan_ibu.getString());
            mhs.setPendapatan_ortu(pendapatan_ortu.getString());
            mhs.setNo_tel_ortu(no_telp_rumah.getString());
            mhs.setNo_hp_ortu(no_telp_hp.getString());
            mhs.setAlamat_keluarga(alamat_keluarga_terdekat.getString());
            mhs.setNo_tel_keluarga(no_telp_rumah_terdekat.getString());
            mhs.setNo_hp_keluarga(no_telp_hp_terdekat.getString());
            mhs.setNim(nim.getString());

            AkademikSR asr = new AkademikSR();
            asr.setProdi(prodi.getString());
            asr.setIpk_masuk(ipk_sr.getString());
            asr.setSemester(semester.getString());
            asr.setJurusan(jurusan.getString());
            asr.setFakultas(fakultas.getString());
            asr.setRapor_smu(rapor_smu.getString());
            asr.setNim(nim.getString());

            daftar.insertBiodata(mhs, asr, foto, prestasi);
        } catch (FileUploadException ex) {
            System.out.println(ex.getMessage());
        }
        return "redirect:/mahasiswa/daftar";
    }

    @RequestMapping("/lihatfoto")
    public void lihatfoto(@RequestParam("nim") String nim, HttpServletRequest request, HttpServletResponse response) {
        try {
            Blob blob = daftar.getFotoByNim(nim);
            response.setContentType("image/jpeg");
            response.setContentLength((int) blob.length());
            InputStream inputStream = blob.getBinaryStream();
            OutputStream os = response.getOutputStream();
            byte buf[] = new byte[(int) blob.length()];
            inputStream.read(buf);
            os.write(buf);
            os.close();
        } catch (IOException ex) {
            System.out.println("IOException " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("SQLException " + ex.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("NullPointerException " + ex.getMessage());
            //buat custom 404 kalau bisa hahahahaha
        }
    }

}
