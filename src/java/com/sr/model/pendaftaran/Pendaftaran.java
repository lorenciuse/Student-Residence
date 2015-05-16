/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.pendaftaran;

import java.io.Serializable;

/**
 *
 * @author Lorencius
 */
public class Pendaftaran implements Serializable{
    private String noPendaftaran;
    private String nim;
    private String idPamong;

    public String getNoPendaftaran() {
        return noPendaftaran;
    }

    public void setNoPendaftaran(String noPendaftaran) {
        this.noPendaftaran = noPendaftaran;
    }

    public String getNIM() {
        return nim;
    }

    public void setNIM(String nim) {
        this.nim = nim;
    }

    public String getIdPamong() {
        return idPamong;
    }

    public void setIdPamong(String idPamong) {
        this.idPamong = idPamong;
    }
}
