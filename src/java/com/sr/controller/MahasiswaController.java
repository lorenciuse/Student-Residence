/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.controller;

import com.sr.model.AkademikSR;
import com.sr.model.Prestasi;
import com.sr.model.dao.IMahasiswaDAO;
import com.sr.model.Mahasiswa;
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
    IMahasiswaDAO<Mahasiswa> mhs;

    @RequestMapping("/daftar")
    public String daftar(HttpServletRequest request, ModelMap modelMap) {
        modelMap.addAttribute("nim", mhs.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()));
        Mahasiswa maha = mhs.getBiodataByNim(mhs.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()));
        AkademikSR asr = mhs.getAkademikByNim(mhs.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()));
        List<Prestasi> kampus = mhs.getPrestasiByNimJenis(mhs.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()), "Kampus");
        List<Prestasi> luar = mhs.getPrestasiByNimJenis(mhs.getNimByNomor(request.getSession().getAttribute("noDaftar").toString()), "Luar Kampus");
        if (maha.getNamaMhs() != null) {
            modelMap.addAttribute("mhs", maha);
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
            List<FileItem> items = sfu.parseRequest(request);
            FileItem foto = items.get(0);
            FileItem nama_lengkap = items.get(1);
            FileItem tempat_lahir = items.get(2);
            FileItem tanggal_lahir = items.get(3);
            FileItem agama = items.get(4);
            FileItem kelamin = items.get(5);
            FileItem alamat_asal = items.get(6);
            FileItem kabupaten = items.get(7);
            FileItem provinsi = items.get(8);
            FileItem no_telp = items.get(9);
            FileItem nama_ayah = items.get(10);
            FileItem nama_ibu = items.get(11);
            FileItem pend_ayah = items.get(12);
            FileItem pend_ibu = items.get(13);
            FileItem pekerjaan_ayah = items.get(14);
            FileItem pekerjaan_ibu = items.get(15);
            FileItem pendapatan_ortu = items.get(16);
            FileItem no_telp_rumah = items.get(17);
            FileItem no_telp_hp = items.get(18);
            FileItem alamat_keluarga_terdekat = items.get(19);
            FileItem no_telp_rumah_terdekat = items.get(20);
            FileItem no_telp_hp_terdekat = items.get(21);
            FileItem nim = items.get(22);
            FileItem prodi = items.get(23);
            FileItem jurusan = items.get(24);
            FileItem fakultas = items.get(25);
            FileItem semester = items.get(26);
            FileItem ipk_sr = items.get(27);
            FileItem rapor_smu = items.get(28);

            for (FileItem item : items) {
                if (item.isFormField()) {
                    System.out.println("FieldName: " + item.getFieldName() + " value: " + item.getString());
                }
            }

            List<Prestasi> prestasi = new ArrayList();
            for (int i = 29; i < items.size() - 1; i += 2) {
                FileItem n = items.get(i);
                FileItem k = items.get(i + 1);
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

            Mahasiswa maha = new Mahasiswa();
            maha.setNama_mhs(nama_lengkap.getString());
            maha.setTempat_lahir(tempat_lahir.getString());
            maha.setTanggal_lahir(tanggal_lahir.getString());
            maha.setAgama(agama.getString());
            maha.setKelamin(kelamin.getString());
            maha.setAlamat_asal(alamat_asal.getString());
            maha.setKab_kota_asal(kabupaten.getString());
            maha.setProv_asal(provinsi.getString());
            maha.setNo_hp_mhs(no_telp.getString());
            maha.setNama_ayah(nama_ayah.getString());
            maha.setNama_ibu(nama_ibu.getString());
            maha.setPendidikan_ayah(pend_ayah.getString());
            maha.setPendidikan_ibu(pend_ibu.getString());
            maha.setPekerjaan_ayah(pekerjaan_ayah.getString());
            maha.setPekerjaan_ibu(pekerjaan_ibu.getString());
            maha.setPendapatan_ortu(pendapatan_ortu.getString());
            maha.setNo_tel_ortu(no_telp_rumah.getString());
            maha.setNo_hp_ortu(no_telp_hp.getString());
            maha.setAlamat_keluarga(alamat_keluarga_terdekat.getString());
            maha.setNo_tel_keluarga(no_telp_rumah_terdekat.getString());
            maha.setNo_hp_keluarga(no_telp_hp_terdekat.getString());
            maha.setNim(nim.getString());

            AkademikSR asr = new AkademikSR();
            asr.setProdi(prodi.getString());
            asr.setIpk_masuk(ipk_sr.getString());
            asr.setSemester(semester.getString());
            asr.setJurusan(jurusan.getString());
            asr.setFakultas(fakultas.getString());
            asr.setRapor_smu(rapor_smu.getString());
            asr.setNim(nim.getString());
            mhs.insertBiodata(maha, asr, foto, prestasi);
        } catch (FileUploadException ex) {
            System.out.println(ex.getMessage());
        }
        return "redirect:/mahasiswa/daftar";
    }

    @RequestMapping("/lihatfoto")
    public void lihatfoto(@RequestParam("nim") String nim, HttpServletRequest request, HttpServletResponse response) {
        try {
            Blob blob = mhs.getFotoByNim(nim);
            response.setContentType("image/jpg");
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
