/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Lorencius
 * @param <T>
 */
@Repository
public interface IMahasiswaDAO<T> {
    public boolean validateLogin(String nomor);
    public List<String> getListNama();
    public String getNimByNama(String nama);
}
