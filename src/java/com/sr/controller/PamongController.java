/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.controller;

import com.sr.model.kamar.IKamarDAO;
import com.sr.model.kamar.Kamar;
import com.sr.model.mahasiswa.IMahasiswaDAO;
import com.sr.model.mahasiswa.Mahasiswa;
import com.sr.model.pendaftaran.IPendaftaranDAO;
import com.sr.model.pendaftaran.Pendaftaran;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping("/monev")
    public String home() {
        return "monev";
    }

    @RequestMapping("/akademik")
    public String akademik() {
        return "akademik";
    }

    @RequestMapping("/monitoring")
    public String monitoring() {
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
        return "redirect:/pamong/mahasiswa#pendaftaran";
    }

    @RequestMapping("/kamar")
    public String kamar(HttpServletRequest request, ModelMap modelMap) {
        String[] nama = request.getParameterValues("nama[]");
        String no = request.getParameter("kamar");
        List<String> id = kamar.getIDByNomor(no);

        for (int i = 0; i < nama.length; i++) {
            kamar.addMahasiswa(mhs.getNimByNama(nama[i]), id.get(i));
        }
        return "redirect:/pamong/mahasiswa#kamar";
    }

    @RequestMapping("/mahasiswa")
    public String biodata(HttpServletRequest request, ModelMap modelMap) {
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
            List<String> listNam = kamar.getNamaFromKamar(listNomor.get(i));
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
        //Menambahkan semua atribut ke dalam modelmap
        modelMap.addAttribute("listNoNim", listNoNim);
        modelMap.addAttribute("listNama", listNama);
        modelMap.addAttribute("listCowok", listNomorCowok);
        modelMap.addAttribute("listCewek", listNomorCewek);
        request.getSession().setAttribute("kam", k_nama);
        return "mahasiswa";
    }
}
