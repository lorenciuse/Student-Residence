/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model;

import java.io.Serializable;

/**
 *
 * @author Lorencius
 */
public class Penyakit implements Serializable{
    
    private String nama_penyakit;
    private String tanggal_sakit;

    public String getNama_penyakit() {
        return nama_penyakit;
    }

    public void setNama_penyakit(String nama_penyakit) {
        this.nama_penyakit = nama_penyakit;
    }

    public String getTanggal_sakit() {
        return tanggal_sakit;
    }

    public void setTanggal_sakit(String tanggal_sakit) {
        this.tanggal_sakit = tanggal_sakit;
    }  
}
