/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import com.sr.model.Pamong;
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
    public boolean addPenyakit(String sakit, String tanggal, String nim);
    public List<Penyakit> getListPenyakit(String nim);
}
