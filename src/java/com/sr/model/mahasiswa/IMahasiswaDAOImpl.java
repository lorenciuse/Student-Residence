/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.mahasiswa;

import com.sr.model.pendaftaran.IPendaftaranDAO;
import com.sr.model.pendaftaran.Pendaftaran;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import oracle.jdbc.pool.OracleDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class IMahasiswaDAOImpl implements IMahasiswaDAO<Mahasiswa> {
    
    private final String GET_LIST_NAMA = "SELECT NAMA_MHS FROM MAHASISWA WHERE NAMA_MHS IS NOT NULL";
    private final String GET_NIM_BY_NAMA = "SELECT NIM FROM MAHASISWA WHERE NAMA_MHS = ?";
    private final String GET_LIST_NAMA_NOT_IN_KAMAR = "SELECT NAMA_MHS FROM MAHASISWA WHERE NIM NOT IN (SELECT NIM FROM RESIDENCE WHERE NIM IS NOT NULL) AND NAMA_MHS IS NOT NULL";
    
    @Autowired
    private IPendaftaranDAO<Pendaftaran> pendaftaran;
    
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(OracleDataSource oracleDataSource) {
        jdbcTemplate = new JdbcTemplate(oracleDataSource);
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }
    
    @Override
    public boolean validateLogin(String nomor) {
        return pendaftaran.findNomor(nomor);
    }

    @Override
    public List<String> getListNama() {
        List<String> listNama = new ArrayList<>();
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(GET_LIST_NAMA_NOT_IN_KAMAR);
        for (Map row : rows) {
            listNama.add(row.get("NAMA_MHS").toString());
        }
        return listNama;
    }

    @Override
    public String getNimByNama(String nama) {
        String nim = (String) getJdbcTemplate().queryForObject(
                GET_NIM_BY_NAMA, new Object[]{nama}, String.class);
        return nim;
    }
}
