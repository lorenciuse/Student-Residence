/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.controller;

import com.sr.model.Akademik;
import com.sr.model.AkademikSR;
import com.sr.model.Aktivitas;
import com.sr.model.Inap;
import com.sr.model.Kamar;
import com.sr.model.Kedisiplinan;
import com.sr.model.Keluar;
import com.sr.model.dao.IMahasiswaDAO;
import com.sr.model.Mahasiswa;
import com.sr.model.Pamong;
import com.sr.model.Pendaftaran;
import com.sr.model.Penyakit;
import com.sr.model.Prestasi;
import com.sr.model.dao.IPamongDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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
@RequestMapping("/")
public class PamongController {

    @Autowired
    private IMahasiswaDAO<Mahasiswa> mhs;

    @Autowired
    private IPamongDAO<Pamong> pmg;

    @RequestMapping("/monev")
    public String home(HttpServletRequest request) {
        Enumeration attr = request.getSession().getAttributeNames();
        while (attr.hasMoreElements()) {
            String attrs = attr.nextElement().toString();
            if (!attrs.equals("idPamong")) {
                request.getSession().removeAttribute(attrs);
            }
        }
        return "monev";
    }

    @RequestMapping(value = "/akademik", method = {RequestMethod.POST, RequestMethod.GET})
    public String akademik(HttpServletRequest request, ModelMap modelMap) {
        Enumeration attr = request.getSession().getAttributeNames();
        while (attr.hasMoreElements()) {
            String attrs = attr.nextElement().toString();
            if (!attrs.equals("idPamong")&&!attrs.equals("akademik")&&!attrs.equals("anama")&&
                    !attrs.equals("fakultas")&&!attrs.equals("aprodi")&&!attrs.equals("kumulatif")&&
                    !attrs.equals("aca")) {
                request.getSession().removeAttribute(attrs);
            }
        }
        if (request.getParameter("aca") != null) {
            String nim = request.getParameter("aca");
            List<Akademik> akademik = pmg.getAkademik(nim);
            String nama = pmg.getNamaByNim(nim);
            String fakultas = pmg.getFacultyByNim(nim);
            String prodi = pmg.getProdi(nim);
            Akademik aca = pmg.getKumulatif(nim);
            request.getSession().setAttribute("akademik", akademik);
            request.getSession().setAttribute("anama", nama);
            request.getSession().setAttribute("fakultas", fakultas);
            request.getSession().setAttribute("aprodi", prodi);
            request.getSession().setAttribute("kumulatif", aca);
            request.getSession().setAttribute("aca", nim);
        }
        if (request.getSession().getAttribute("aca") != null && request.getParameter("IPS") != null) {
            Akademik acad = new Akademik();
            acad.setBanyak_sks(Integer.parseInt(request.getParameter("banyakSKSambil")));
            acad.setIps(Double.parseDouble(request.getParameter("IPS")));
            acad.setSemester(request.getParameter("semester"));
            pmg.insertAkademik(acad, request.getSession().getAttribute("aca").toString());
            List<Akademik> akademik = pmg.getAkademik(request.getSession().getAttribute("aca").toString());
            Akademik aca = pmg.getKumulatif(request.getSession().getAttribute("aca").toString());
            request.getSession().setAttribute("akademik", akademik);
            request.getSession().setAttribute("kumulatif", aca);
            return "redirect:/pamong/akademik";
        }
        return "akademik";
    }

    @RequestMapping("/monitoring")
    public String monitoring(HttpServletRequest request, ModelMap modelMap) {
        Enumeration attr = request.getSession().getAttributeNames();
        while (attr.hasMoreElements()) {
            String attrs = attr.nextElement().toString();
            if (!attrs.equals("idPamong") && !attrs.equals("nim")
                    && !attrs.equals("nama") && !attrs.equals("selectedk")
                    && !attrs.equals("selectedm") && !attrs.equals("maha")
                    && !attrs.equals("prodi") && !attrs.equals("kamar")) {
                request.getSession().removeAttribute(attrs);
            }
        }
        List<Kamar> listNomorCowok = pmg.getListNomorByStatus("Cowok");
        List<Kamar> listNomorCewek = pmg.getListNomorByStatus("Cewek");
        modelMap.addAttribute("listCowok", listNomorCowok);
        modelMap.addAttribute("listCewek", listNomorCewek);

        if (request.getSession().getAttribute("nim") != null) {
            List<Penyakit> sakit = pmg.getListPenyakit(request.getSession().getAttribute("nim").toString());
            modelMap.addAttribute("sakit", sakit);
            int lisan = pmg.getJumlahPeringatanByJenis("Lisan", request.getSession().getAttribute("nim").toString());
            int tertulis = pmg.getJumlahPeringatanByJenis("Tertulis", request.getSession().getAttribute("nim").toString());
            modelMap.addAttribute("lisan", lisan);
            modelMap.addAttribute("tertulis", tertulis);
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
        pmg.insertNomor(pendaftaran);
        return "redirect:/pamong/mahasiswa#tab_pendaftaran";
    }

    @RequestMapping("/kamar")
    public String kamar(HttpServletRequest request, ModelMap modelMap) {
        String[] nama = request.getParameterValues("nama[]");
        String no = request.getParameter("kamar");
        List<String> id = pmg.getIDByNomor(no);

        for (int i = 0; i < nama.length; i++) {
            pmg.addMahasiswa(mhs.getNimByNama(nama[i]), id.get(i));
        }
        return "redirect:/pamong/mahasiswa#tab_kamar";
    }

    @RequestMapping("/biodata")
    public String biodata(HttpServletRequest request, ModelMap modelMap) {
        modelMap.addAttribute("nim", request.getParameter("nim"));
        return "redirect:/pamong/mahasiswa#tab_biodata";
    }

    @RequestMapping("/mahasiswa")
    public String mahasiswa(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
//        final HttpSession session = request.getSession();
        Enumeration attr = request.getSession().getAttributeNames();
        while (attr.hasMoreElements()) {
            String attrs = attr.nextElement().toString();
            if (!attrs.equals("idPamong")&&!attrs.equals("listCowok")&&!attrs.equals("listCewek")&&
                    !attrs.equals("selectedkm")&&!attrs.equals("selectedmm")&&!attrs.equals("mkamar")&&
                    !attrs.equals("mnama")&&!attrs.equals("mmaha")&&!attrs.equals("mnim")&&!attrs.equals("mprodi")&&
                    !attrs.equals("mfakultas")) {
                request.getSession().removeAttribute(attrs);
            }
        }

//        if (request.getSession().getAttribute("idPamong") == null) {
//            try {
//                response.sendRedirect("login");
//            } catch (IOException ex) {
//            }
//        }
//        
        //Modul tampil nomor pendaftaran
        List<Pendaftaran> listNoNim = pmg.getListNoNim(request.getSession().getAttribute("idPamong").toString());

        //Modul pergantian nomor kamar
        List<String> listNama = mhs.getListNama();
        List<Kamar> listNomorCowok = pmg.getListNomorByStatus("Cowok");
        List<Kamar> listNomorCewek = pmg.getListNomorByStatus("Cewek");

        String k_nama = "";
        List<String> listNomor = pmg.getListNomor();
        for (int i = 0; i < listNomor.size(); i++) {
            k_nama += "<tr>\n"
                    + "<td>\n" + listNomor.get(i) + "</td>\n";
            List<String> listNam = pmg.getNamaFromKamar(listNomor.get(i), request.getSession().getAttribute("idPamong").toString());
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

        if (request.getSession().getAttribute("mnim") != null) {
            String nim = request.getSession().getAttribute("mnim").toString();
            Mahasiswa maha = mhs.getBiodataByNim(nim);
            AkademikSR asr = mhs.getAkademikByNim(nim);
            List<Prestasi> kampus = mhs.getPrestasiByNimJenis(nim, "Kampus");
            List<Prestasi> luar = mhs.getPrestasiByNimJenis(nim, "Luar Kampus");
            modelMap.addAttribute("mhs", maha);
            modelMap.addAttribute("asr", asr);
            modelMap.addAttribute("presK", kampus);
            modelMap.addAttribute("presL", luar);
            modelMap.addAttribute("foto", true);
            Aktivitas achart = pmg.getPercentage(nim);
            request.getSession().setAttribute("achart", achart);
            String count = pmg.getCountSurat(nim);
            String countPeringatan = pmg.getCountPeringatan(nim);
            request.getSession().setAttribute("krepcount", count);
            request.getSession().setAttribute("krepcountp", countPeringatan);
            Kedisiplinan kedisiplinan = pmg.getLatest(nim);
            request.getSession().setAttribute("krepdis", kedisiplinan);
            String inap = pmg.getIzinInap(nim);
            String keluar = pmg.getIzinKeluar(nim);
            request.getSession().setAttribute("inap", inap);
            request.getSession().setAttribute("keluar", keluar);
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

    @RequestMapping("/biodata-print")
    public String biodataprint(HttpServletRequest request, ModelMap modelMap) {
        System.out.println("NIM " + request.getParameter("nim"));
        Mahasiswa maha = mhs.getBiodataByNim(request.getParameter("nim"));
        AkademikSR asr = mhs.getAkademikByNim(request.getParameter("nim"));
        List<Prestasi> kampus = mhs.getPrestasiByNimJenis(request.getParameter("nim"), "Kampus");
        List<Prestasi> luar = mhs.getPrestasiByNimJenis(request.getParameter("nim"), "Luar Kampus");
        modelMap.addAttribute("nim", request.getParameter("nim"));
        modelMap.addAttribute("mhs", maha);
        modelMap.addAttribute("asr", asr);
        modelMap.addAttribute("presK", kampus);
        modelMap.addAttribute("presL", luar);
        return "biodataprint";
    }

    @RequestMapping("/carimhs")
    public String cari(HttpServletRequest request, ModelMap modelMap) {
        Enumeration attr = request.getSession().getAttributeNames();
        while (attr.hasMoreElements()) {
            String attrs = attr.nextElement().toString();
            if (!attrs.equals("idPamong")) {
                request.getSession().removeAttribute(attrs);
            }
        }
        List<Kamar> listNomorCowok = pmg.getListNomorByStatus("Cowok");
        List<Kamar> listNomorCewek = pmg.getListNomorByStatus("Cewek");
        List<String> nama = pmg.getNamaFromKamar(request.getParameter("kamar"), request.getSession().getAttribute("idPamong").toString());
        modelMap.addAttribute("listCowok", listNomorCowok);
        modelMap.addAttribute("listCewek", listNomorCewek);
        modelMap.addAttribute("selectedk", true);
        modelMap.addAttribute("kamar", request.getParameter("kamar"));
        modelMap.addAttribute("nama", nama);
        return "monitoring";
    }

    @RequestMapping("/lihatmhs")
    public String lihat(HttpServletRequest request, ModelMap modelMap) {
        List<Kamar> listNomorCowok = pmg.getListNomorByStatus("Cowok");
        List<Kamar> listNomorCewek = pmg.getListNomorByStatus("Cewek");
        List<String> nama = pmg.getNamaFromKamar(request.getParameter("kam"), request.getSession().getAttribute("idPamong").toString());
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
        int lisan = pmg.getJumlahPeringatanByJenis("Lisan", request.getSession().getAttribute("nim").toString());
        int tertulis = pmg.getJumlahPeringatanByJenis("Tertulis", request.getSession().getAttribute("nim").toString());
        modelMap.addAttribute("lisan", lisan);
        modelMap.addAttribute("tertulis", tertulis);
        return "monitoring";
    }

    @RequestMapping("/mcarimhs")
    public String mcari(HttpServletRequest request, ModelMap modelMap) {
        Enumeration attr = request.getSession().getAttributeNames();
        while (attr.hasMoreElements()) {
            String attrs = attr.nextElement().toString();
            if (!attrs.equals("idPamong")) {
                request.getSession().removeAttribute(attrs);
            }
        }
        List<Kamar> listNomorCowok = pmg.getListNomorByStatus("Cowok");
        List<Kamar> listNomorCewek = pmg.getListNomorByStatus("Cewek");
        List<String> nama = pmg.getNamaFromKamar(request.getParameter("kamar"), request.getSession().getAttribute("idPamong").toString());
        request.getSession().setAttribute("listCowok", listNomorCowok);
        request.getSession().setAttribute("listCewek", listNomorCewek);
        request.getSession().setAttribute("selectedkm", true);
        request.getSession().setAttribute("mkamar", request.getParameter("kamar"));
        request.getSession().setAttribute("mnama", nama);
        return "redirect:/pamong/mahasiswa";
    }

    @RequestMapping("/mlihatmhs")
    public String mlihat(HttpServletRequest request, ModelMap modelMap) {
        request.getSession().setAttribute("selectedmm", true);
        request.getSession().setAttribute("mmaha", request.getParameter("mhs"));
        request.getSession().setAttribute("mnim", mhs.getNimByNama(request.getParameter("mhs")));
        request.getSession().setAttribute("mprodi", pmg.getProdi(mhs.getNimByNama(request.getParameter("mhs"))));
        request.getSession().setAttribute("mfakultas", pmg.getFacultyByNim(mhs.getNimByNama(request.getParameter("mhs"))));
        return "redirect:/pamong/mahasiswa";
    }

    @RequestMapping("/tambahpenyakit")
    public String penyakit(HttpServletRequest request, ModelMap modelMap) {
        String nim = request.getSession().getAttribute("nim").toString();
        String tanggal = request.getParameter("tanggal_sakit");
        String[] penyakit = request.getParameterValues("namapenyakit");
        for (String sakit : penyakit) {
            pmg.insertPenyakit(sakit, tanggal, nim);
        }
        return "redirect:/pamong/monitoring#tab_kesehatan";
    }

    @RequestMapping("/perizinan")
    public String perizinan(HttpServletRequest request) {
        String tipeIzin = request.getParameter("tipe");
        switch (tipeIzin) {
            case "inap":
                Inap inap = new Inap();
                inap.setNama_tujuan(request.getParameter("nama_dituju"));
                inap.setTelp(request.getParameter("nomor_telepon_dituju"));
                inap.setKeperluan(request.getParameter("keperluan_inap"));
                inap.setAlamat(request.getParameter("alamat_inap"));
                inap.setBerangkat(request.getParameter("tanggal_berangkat"));
                inap.setKembali(request.getParameter("tanggal_kembali"));
                inap.setWaktu_berangkat(request.getParameter("jam_brkt"));
                inap.setWaktu_kembali(request.getParameter("jam_kbl"));
                System.out.println("Tanggal Berangkat " + inap.getBerangkat());
                System.out.println("Tanggal Kembali " + inap.getKembali());
                System.out.println("Jam Berangkat " + inap.getWaktu_berangkat());
                System.out.println("Jam Kembali " + inap.getWaktu_kembali());
                pmg.insertInap(inap, request.getSession().getAttribute("nim").toString());
                break;
            case "keluar":
                Keluar keluar = new Keluar();
                keluar.setAlamat(request.getParameter("alamat_keluar"));
                keluar.setKeperluan(request.getParameter("keperluan_keluar"));
                keluar.setTanggal_keluar(request.getParameter("tanggal_keluar"));
                keluar.setWaktu_keluar(request.getParameter("jamKeluar"));
                keluar.setWaktu_kembali(request.getParameter("jamKembali"));
                System.out.println("Tanggal Keluar " + keluar.getTanggal_keluar());
                System.out.println("Jam Keluar " + keluar.getWaktu_keluar());
                System.out.println("Jam Kembali " + keluar.getWaktu_kembali());
                pmg.insertKeluar(keluar, request.getSession().getAttribute("nim").toString());
                break;
        }
        return "redirect:/pamong/monitoring#tab_perizinan";
    }

    @RequestMapping("/aktivitas")
    public String aktivitas(HttpServletRequest request) {
        Aktivitas act = new Aktivitas();
        act.setBangun_pagi(request.getParameter("bangun"));
        act.setOpera_pagi(request.getParameter("opera_pagi"));
        act.setGebyur_wc(request.getParameter("doa_pagi"));
        act.setDoa_pagi(request.getParameter("studi"));
        act.setStudi(request.getParameter("gebyur_wc"));
        act.setDoa_malam(request.getParameter("doa_malam"));
        act.setTidur_malam(request.getParameter("tidur_malam"));
        act.setTanggal_aktivitas(request.getParameter("tanggal_aktivitas"));
        pmg.insertActivity(act, request.getSession().getAttribute("nim").toString());
        return "redirect:/pamong/monitoring#tab_aktivitas";
    }

    @RequestMapping("/kedisiplinan")
    public String kedisiplinan(HttpServletRequest request) {
        Kedisiplinan kedisiplinan = new Kedisiplinan();
        kedisiplinan.setJenis(request.getParameter("jenis_peringatan"));
        kedisiplinan.setKeterangan(request.getParameter("keterangan"));
        kedisiplinan.setTanggal_peringatan(request.getParameter("tanggal_peringatan"));
        pmg.insertKedisiplinan(kedisiplinan, request.getSession().getAttribute("nim").toString());
        return "redirect:/pamong/monitoring#tab_kedisiplinan";
    }

//    @RequestMapping("/aktivitasrep")
//    public String aktivitasrep(HttpServletRequest request, ModelMap modelMap) {
//        String nim = request.getParameter("nim");
//        String prodi = pmg.getProdi(nim);
//        String nama = pmg.getNamaByNim(nim);
//        String fakultas = pmg.getFacultyByNim(nim);
//        Aktivitas achart = pmg.getPercentage(nim);
//        request.getSession().setAttribute("nimarep", nim);
//        request.getSession().setAttribute("arepprodi", prodi);
//        request.getSession().setAttribute("arepnama", nama);
//        request.getSession().setAttribute("arepfakultas", fakultas);
//        request.getSession().setAttribute("achart", achart);
//        return "redirect:/pamong/mahasiswa#tab_aktivitas";
//    }

//    @RequestMapping("/perizinanrep")
//    public String perizinanrep(HttpServletRequest request) {
//        String nim = request.getParameter("nim");
//        String prodi = pmg.getProdi(nim);
//        String nama = pmg.getNamaByNim(nim);
//        String fakultas = pmg.getFacultyByNim(nim);
//        String inap = pmg.getIzinInap(nim);
//        String keluar = pmg.getIzinKeluar(nim);
//        request.getSession().setAttribute("nimprep", nim);
//        request.getSession().setAttribute("prepprodi", prodi);
//        request.getSession().setAttribute("prepnama", nama);
//        request.getSession().setAttribute("prepfakultas", fakultas);
//        request.getSession().setAttribute("inap", inap);
//        request.getSession().setAttribute("keluar", keluar);
//        return "redirect:/pamong/mahasiswa#tab_perizinan";
//    }

//    @RequestMapping("/kedisiplinanrep")
//    public String kedisiplinanrep(HttpServletRequest request, ModelMap modelMap) {
//        String nim = request.getParameter("nim");
//        String prodi = pmg.getProdi(nim);
//        String nama = pmg.getNamaByNim(nim);
//        String fakultas = pmg.getFacultyByNim(nim);
//        String count = pmg.getCountSurat(nim);
//        String countPeringatan = pmg.getCountPeringatan(nim);
//        request.getSession().setAttribute("nimkrep", nim);
//        request.getSession().setAttribute("krepprodi", prodi);
//        request.getSession().setAttribute("krepnama", nama);
//        request.getSession().setAttribute("krepfakultas", fakultas);
//        request.getSession().setAttribute("krepcount", count);
//        request.getSession().setAttribute("krepcountp", countPeringatan);
//        Kedisiplinan kedisiplinan = pmg.getLatest(request.getParameter("nim"));
//        request.getSession().setAttribute("krepdis", kedisiplinan);
//        return "redirect:/pamong/mahasiswa#tab_kedisiplinan";
//    }
}
