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
public class Akademik implements Serializable{
    private String semester;
    private int banyak_sks;
    private double ips;
    private double ipk;

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public int getBanyak_sks() {
        return banyak_sks;
    }

    public void setBanyak_sks(int banyak_sks) {
        this.banyak_sks = banyak_sks;
    }

    public double getIps() {
        return ips;
    }

    public void setIps(double ips) {
        this.ips = ips;
    }

    public double getIpk() {
        return (double)Math.round(ipk*100)/100;
    }

    public void setIpk(double ipk) {
        this.ipk = ipk;
    }
}
