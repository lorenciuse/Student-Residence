/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import com.sr.model.Kamar;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Lorencius
 * @param <T>
 */
@Repository
public interface IKamarDAO<T> {
    public List<Kamar> getListNomorByStatus(String status);
    public List<String> getListNomor();
    public List<String> getIDByNomor(String nomor);
    public List<String> getNamaFromKamar(String kamar, String idPamong);
    public boolean addMahasiswa(String nim, String id);
}
