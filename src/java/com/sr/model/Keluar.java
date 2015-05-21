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
public class Keluar {
        
    private String alamat;
    private String keperluan;
    private String no_ijin;
    private String tanggal_keluar;
    private String waktu_keluar;
    private String waktu_kembali;

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getKeperluan() {
        return keperluan;
    }

    public String getNo_ijin() {
        return no_ijin;
    }

    public void setNo_ijin(String no_ijin) {
        this.no_ijin = no_ijin;
    }
  
    public void setKeperluan(String keperluan) {
        this.keperluan = keperluan;
    }

    public String getTanggal_keluar() {
        return tanggal_keluar;
    }

    public void setTanggal_keluar(String tanggal_keluar) {
        this.tanggal_keluar = tanggal_keluar;
    }

    public String getWaktu_keluar() {
        return waktu_keluar;
    }

    public void setWaktu_keluar(String waktu_keluar) {
        this.waktu_keluar = waktu_keluar;
    }

    public String getWaktu_kembali() {
        return waktu_kembali;
    }

    public void setWaktu_kembali(String waktu_kembali) {
        this.waktu_kembali = waktu_kembali;
    }
    
    
}
