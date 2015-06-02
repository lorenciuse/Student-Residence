/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import com.sr.model.Aktivitas;
import com.sr.model.Inap;
import com.sr.model.Kamar;
import com.sr.model.Kedisiplinan;
import com.sr.model.Keluar;
import com.sr.model.Pamong;
import com.sr.model.Pendaftaran;
import com.sr.model.Penyakit;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Lorencius
 * @param <T>
 */
@Repository
public interface IPamongDAO<T> {
    public int validateLogin(String pUsername, String pPassword);
    public String findPamongNameById(String idPamong);
    public Pamong findByPamongId(String idPamong);
    public String getLocation(String idPamong);
    public String getProdi(String nim);
    public boolean insertPenyakit(String sakit, String tanggal, String nim);
    public boolean insertNomor(Pendaftaran pendaftaran);
    public List<Pendaftaran> getListNoNim(String idPamong);
    public List<Penyakit> getListPenyakit(String nim);
    public List<Kamar> getListNomorByStatus(String status);
    public List<String> getListNomor();
    public List<String> getIDByNomor(String nomor);
    public List<String> getNamaFromKamar(String kamar, String idPamong);
    public boolean addMahasiswa(String nim, String id);
    public boolean insertInap(Inap inap, String nim);
    public boolean insertKeluar(Keluar keluar, String nim);
    public boolean insertActivity(Aktivitas act, String nim);
    public boolean insertKedisiplinan(Kedisiplinan kedisiplinan, String nim);
    public int getJumlahPeringatanByJenis(String jenis, String nim);
}
