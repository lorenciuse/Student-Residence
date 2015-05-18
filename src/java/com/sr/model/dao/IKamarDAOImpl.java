/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import com.sr.model.Kamar;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import oracle.jdbc.pool.OracleDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class IKamarDAOImpl implements IKamarDAO<Kamar> {

    private final String GET_LIST_NOMOR_BY_STATUS = "SELECT DISTINCT NO_KAMAR FROM RESIDENCE WHERE STATUS = ? ORDER BY NO_KAMAR ASC";
    private final String GET_LIST_NOMOR = "SELECT DISTINCT NO_KAMAR FROM RESIDENCE ORDER BY NO_KAMAR ASC";
    private final String ADD_MAHASISWA = "UPDATE RESIDENCE SET NIM = ? WHERE K_NO = ?";
    private final String GET_REMAINING_ID_BY_NOMOR = "SELECT K_NO FROM RESIDENCE WHERE NO_KAMAR = ? AND NIM IS NULL";
    private final String GET_NAMA_MHS_FROM_KAMAR = "SELECT NAMA_MHS FROM MAHASISWA WHERE NIM IN (SELECT NIM FROM RESIDENCE WHERE NO_KAMAR = ?) AND NIM IN (SELECT NIM FROM DAFTAR WHERE ID_PAMONG = ?)";
    private final String RESET_KAMAR = "";

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(OracleDataSource oracleDataSource) {
        jdbcTemplate = new JdbcTemplate(oracleDataSource);
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    @Override
    public List<Kamar> getListNomorByStatus(String status) {
        List<Kamar> listNomor = new ArrayList<>();
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(GET_LIST_NOMOR_BY_STATUS, new Object[]{status});
        for (Map row : rows) {
            Kamar kamar = new Kamar();
            kamar.setNomor(row.get("NO_KAMAR").toString());
            listNomor.add(kamar);
        }
        return listNomor;
    }

    @Override
    public boolean addMahasiswa(String nim, String id) {
        getJdbcTemplate().update(ADD_MAHASISWA, new Object[]{nim, id});
        return true;
    }

    @Override
    public List<String> getIDByNomor(String nomor) {
        List<String> listID = new ArrayList<>();
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(GET_REMAINING_ID_BY_NOMOR, new Object[]{nomor});
        for (Map row : rows) {
            listID.add(row.get("K_NO").toString());
        }
        return listID;
    }

    @Override
    public List<String> getNamaFromKamar(String kamar, String idPamong) {
        List<String> listNama = new ArrayList<>();
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(GET_NAMA_MHS_FROM_KAMAR, new Object[]{kamar, idPamong});
        for (Map row : rows) {
            listNama.add(row.get("NAMA_MHS").toString());
        }
        return listNama;
    }

    @Override
    public List<String> getListNomor() {
        List<String> listNomor = new ArrayList<>();
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(GET_LIST_NOMOR);
        for (Map row : rows) {
            listNomor.add(row.get("NO_KAMAR").toString());
        }
        return listNomor;
    }

}
