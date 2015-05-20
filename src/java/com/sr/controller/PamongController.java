/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.controller;

import com.sr.model.AkademikSR;
import com.sr.model.dao.IKamarDAO;
import com.sr.model.Kamar;
import com.sr.model.dao.IMahasiswaDAO;
import com.sr.model.Mahasiswa;
import com.sr.model.Pamong;
import com.sr.model.dao.IPendaftaranDAO;
import com.sr.model.Pendaftaran;
import com.sr.model.Penyakit;
import com.sr.model.Prestasi;
import com.sr.model.dao.IPamongDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Lorencius
 */
@Controller
@RequestMapping("/")
public class PamongController {

    @Autowired
    private IPendaftaranDAO<Pendaftaran> daftar;

    @Autowired
    private IKamarDAO<Kamar> kamar;

    @Autowired
    private IMahasiswaDAO<Mahasiswa> mhs;

    @Autowired
    private IPamongDAO<Pamong> pmg;

    @RequestMapping("/monev")
    public String home(HttpServletRequest request) {
        request.getSession().removeAttribute("nama");
        request.getSession().removeAttribute("maha");
        request.getSession().removeAttribute("nim");
        request.getSession().removeAttribute("prodi");
        request.getSession().removeAttribute("kamar");
        return "monev";
    }

    @RequestMapping("/akademik")
    public String akademik(HttpServletRequest request) {
        request.getSession().removeAttribute("nama");
        request.getSession().removeAttribute("maha");
        request.getSession().removeAttribute("nim");
        request.getSession().removeAttribute("prodi");
        request.getSession().removeAttribute("kamar");
        return "akademik";
    }

    @RequestMapping("/monitoring")
    public String monitoring(HttpServletRequest request, ModelMap modelMap) {
        List<Kamar> listNomorCowok = kamar.getListNomorByStatus("Cowok");
        List<Kamar> listNomorCewek = kamar.getListNomorByStatus("Cewek");
        modelMap.addAttribute("listCowok", listNomorCowok);
        modelMap.addAttribute("listCewek", listNomorCewek);

        if (request.getSession().getAttribute("nim") != null) {
            List<Penyakit> sakit = pmg.getListPenyakit(request.getSession().getAttribute("nim").toString());
            modelMap.addAttribute("sakit", sakit);
        }
        return "monitoring";
    }

    @RequestMapping("/logout")
    public String logout() {
        return "redirect:/logoutmonev/do";
    }

    @RequestMapping("/pendaftar")
    public String pendaftaran(HttpServletRequest request) {
        Pendaftaran pendaftaran = new Pendaftaran();
        pendaftaran.setNIM(request.getParameter("nim"));
        pendaftaran.setNoPendaftaran(request.getParameter("nomor_pendaftaran"));
        pendaftaran.setIdPamong(request.getSession().getAttribute("idPamong").toString());
        daftar.insertNomor(pendaftaran);
        return "redirect:/pamong/mahasiswa#tab_pendaftaran";
    }

    @RequestMapping("/kamar")
    public String kamar(HttpServletRequest request, ModelMap modelMap) {
        String[] nama = request.getParameterValues("nama[]");
        String no = request.getParameter("kamar");
        List<String> id = kamar.getIDByNomor(no);

        for (int i = 0; i < nama.length; i++) {
            kamar.addMahasiswa(mhs.getNimByNama(nama[i]), id.get(i));
        }
        return "redirect:/pamong/mahasiswa#tab_kamar";
    }

    @RequestMapping("/biodata")
    public String biodata(HttpServletRequest request, ModelMap modelMap) {
        modelMap.addAttribute("nim", request.getParameter("nim"));
        return "redirect:/pamong/mahasiswa#tab_biodata";
    }

    @RequestMapping("/mahasiswa")
    public String mahasiswa(HttpServletRequest request, ModelMap modelMap) {
        request.getSession().removeAttribute("nama");
        request.getSession().removeAttribute("maha");
        request.getSession().removeAttribute("nim");
        request.getSession().removeAttribute("prodi");
        request.getSession().removeAttribute("kamar");
        //Modul tampil nomor pendaftaran
        List<Pendaftaran> listNoNim = daftar.getListNoNim(request.getSession().getAttribute("idPamong").toString());

        //Modul pergantian nomor kamar
        List<String> listNama = mhs.getListNama();
        List<Kamar> listNomorCowok = kamar.getListNomorByStatus("Cowok");
        List<Kamar> listNomorCewek = kamar.getListNomorByStatus("Cewek");

        String k_nama = "";
        List<String> listNomor = kamar.getListNomor();
        for (int i = 0; i < listNomor.size(); i++) {
            k_nama += "<tr>\n"
                    + "<td>\n" + listNomor.get(i) + "</td>\n";
            List<String> listNam = kamar.getNamaFromKamar(listNomor.get(i), request.getSession().getAttribute("idPamong").toString());
            if (!listNam.isEmpty()) {
                if (listNam.size() == 3) {
                    k_nama += "<td>\n" + listNam.get(0) + "</td>\n";
                    k_nama += "</tr>\n"
                            + "<tr>\n"
                            + "<td>\n" + listNomor.get(i) + "</td>\n";
                    k_nama += "<td>\n" + listNam.get(1) + "</td>\n"
                            + "</tr>\n"
                            + "<tr>\n"
                            + "<td>\n" + listNomor.get(i) + "</td>\n"
                            + "<td>\n" + listNam.get(2) + "</td>\n"
                            + "</tr>\n";
                } else if (listNam.size() == 2) {
                    k_nama += "<td>\n" + listNam.get(0) + "</td>\n";
                    k_nama += "</tr>\n"
                            + "<tr>\n"
                            + "<td>\n" + listNomor.get(i) + "</td>\n";
                    k_nama += "<td>\n" + listNam.get(1) + "</td>\n"
                            + "</tr>\n";
                } else if (listNam.size() == 1) {
                    k_nama += "<td>\n" + listNam.get(0) + "</td>\n";
                    k_nama += "</tr>\n";
                }
            } else {
                k_nama += "<td>\n</td>\n"
                        + "</tr>\n";
            }
        }

        if (request.getParameter("nim") != null) {
            Mahasiswa maha = daftar.getBiodataByNim(request.getParameter("nim"));
            AkademikSR asr = daftar.getAkademikByNim(request.getParameter("nim"));
            List<Prestasi> kampus = daftar.getPrestasiByNimJenis(request.getParameter("nim"), "Kampus");
            List<Prestasi> luar = daftar.getPrestasiByNimJenis(request.getParameter("nim"), "Luar Kampus");
            modelMap.addAttribute("nim", request.getParameter("nim"));
            modelMap.addAttribute("mhs", maha);
            modelMap.addAttribute("asr", asr);
            modelMap.addAttribute("presK", kampus);
            modelMap.addAttribute("presL", luar);
            modelMap.addAttribute("foto", true);
        }

        //Menambahkan semua atribut ke dalam modelmap
        modelMap.addAttribute("listNoNim", listNoNim);
        modelMap.addAttribute("listNama", listNama);
        modelMap.addAttribute("listCowok", listNomorCowok);
        modelMap.addAttribute("listCewek", listNomorCewek);
        modelMap.addAttribute("kam", k_nama);
        return "mahasiswa";
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

    @RequestMapping("/biodata-print")
    public String biodataprint(HttpServletRequest request, ModelMap modelMap) {
        System.out.println("NIM " + request.getParameter("nim"));
        Mahasiswa maha = daftar.getBiodataByNim(request.getParameter("nim"));
        AkademikSR asr = daftar.getAkademikByNim(request.getParameter("nim"));
        List<Prestasi> kampus = daftar.getPrestasiByNimJenis(request.getParameter("nim"), "Kampus");
        List<Prestasi> luar = daftar.getPrestasiByNimJenis(request.getParameter("nim"), "Luar Kampus");
        modelMap.addAttribute("nim", request.getParameter("nim"));
        modelMap.addAttribute("mhs", maha);
        modelMap.addAttribute("asr", asr);
        modelMap.addAttribute("presK", kampus);
        modelMap.addAttribute("presL", luar);
        return "biodataprint";
    }

    @RequestMapping("/carimhs")
    public String cari(HttpServletRequest request, ModelMap modelMap) {
        request.getSession().removeAttribute("nim");
        request.getSession().removeAttribute("maha");
        request.getSession().removeAttribute("prodi");
        List<Kamar> listNomorCowok = kamar.getListNomorByStatus("Cowok");
        List<Kamar> listNomorCewek = kamar.getListNomorByStatus("Cewek");
        List<String> nama = kamar.getNamaFromKamar(request.getParameter("kamar"), request.getSession().getAttribute("idPamong").toString());
        modelMap.addAttribute("listCowok", listNomorCowok);
        modelMap.addAttribute("listCewek", listNomorCewek);
        modelMap.addAttribute("selectedk", true);
        modelMap.addAttribute("kamar", request.getParameter("kamar"));
        modelMap.addAttribute("nama", nama);
        return "monitoring";
    }

    @RequestMapping("/lihatmhs")
    public String lihat(HttpServletRequest request, ModelMap modelMap) {
        List<Kamar> listNomorCowok = kamar.getListNomorByStatus("Cowok");
        List<Kamar> listNomorCewek = kamar.getListNomorByStatus("Cewek");
        List<String> nama = kamar.getNamaFromKamar(request.getParameter("kam"), request.getSession().getAttribute("idPamong").toString());
        modelMap.addAttribute("listCowok", listNomorCowok);
        modelMap.addAttribute("listCewek", listNomorCewek);
        request.getSession().setAttribute("nama", nama);
        request.getSession().setAttribute("selectedk", true);
        request.getSession().setAttribute("selectedm", true);
        request.getSession().setAttribute("maha", request.getParameter("mhs"));
        request.getSession().setAttribute("nim", mhs.getNimByNama(request.getParameter("mhs")));
        request.getSession().setAttribute("prodi", pmg.getProdi(mhs.getNimByNama(request.getParameter("mhs"))));
        request.getSession().setAttribute("kamar", request.getParameter("kam"));
        List<Penyakit> sakit = pmg.getListPenyakit(mhs.getNimByNama(request.getParameter("mhs")));
        modelMap.addAttribute("sakit", sakit);
        return "monitoring";
    }

    @RequestMapping("/tambahpenyakit")
    public String penyakit(HttpServletRequest request, ModelMap modelMap) {
        String nim = request.getSession().getAttribute("nim").toString();
        String tanggal = request.getParameter("tanggal_sakit");
        String[] penyakit = request.getParameterValues("namapenyakit");
        for (String sakit : penyakit) {
            pmg.addPenyakit(sakit, tanggal, nim);
        }
        return "redirect:/pamong/monitoring#tab_kesehatan";
    }
}
