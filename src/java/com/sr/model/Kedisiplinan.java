/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model;

/**
 *
 * @author Lorencius
 */
public class Kedisiplinan {
    private String tanggal_peringatan;
    private String keterangan;
    private String jenis;

    public String getTanggal_peringatan() {
        return tanggal_peringatan;
    }

    public void setTanggal_peringatan(String tanggal_peringatan) {
        this.tanggal_peringatan = tanggal_peringatan;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }

    public String getJenis() {
        return jenis;
    }

    public void setJenis(String jenis) {
        this.jenis = jenis;
    }
}
