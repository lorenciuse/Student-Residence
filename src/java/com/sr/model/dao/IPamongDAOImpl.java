/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import com.sr.model.Pamong;
import com.sr.model.Penyakit;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import oracle.jdbc.pool.OracleDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

@Repository
public class IPamongDAOImpl implements IPamongDAO<Pamong> {

    private final String FIND_PAMONG_NAME_BY_ID = "SELECT NAMA_PAMONG FROM PAMONG WHERE ID_PAMONG = ?";
    private final String FIND_BY_PAMONG_ID = "SELECT * FROM LOGIN WHERE ID_PAMONG = ?";
    private final String GET_LOCATION = "SELECT LOKASI FROM PAMONG WHERE ID_PAMONG = ?";
    private final String GET_PRODI = "SELECT PRODI FROM AKADEMIK WHERE NIM = ?";
    private final String ADD_PENYAKIT = "INSERT INTO KESEHATAN (PENYAKIT, TANGGAL_SAKIT, NIM) VALUES(?,?,?)";
    private final String GET_LIST_PENYAKIT = "SELECT PENYAKIT, TO_CHAR(TANGGAL_SAKIT, 'DD Month YYYY') FROM KESEHATAN WHERE NIM = ?";

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(OracleDataSource oracleDataSource) {
        jdbcTemplate = new JdbcTemplate(oracleDataSource);
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    @Override
    public int validateLogin(String pUsername, String pPassword) {
        Pamong pamong = findByPamongId(pUsername);
        if (pamong != null) {
            if (pUsername.equals(pamong.getUsername()) && pPassword.equals(pamong.getPassword())) {
                return 0;
            } else {
                return 1;
            }
        } else {
            return 2;
        }
    }

    @Override
    public String findPamongNameById(String idPamong) {
        String name = (String) getJdbcTemplate().queryForObject(
                FIND_PAMONG_NAME_BY_ID, new Object[]{idPamong}, String.class);
        return name;
    }

    @Override
    public String getLocation(String idPamong) {
        String lokasi = (String) getJdbcTemplate().queryForObject(
                GET_LOCATION, new Object[]{idPamong}, String.class);
        return lokasi;
    }

    @Override
    public String getProdi(String nim) {
        return (String) getJdbcTemplate().queryForObject(GET_PRODI, new Object[]{nim}, String.class);
    }

    @Override
    public boolean addPenyakit(String sakit, String tanggal, String nim) {
        getJdbcTemplate().update(ADD_PENYAKIT, new Object[]{sakit, tanggal, nim});
        return true;
    }
    
    @Override
    public List<Penyakit> getListPenyakit(String nim) {
        List<Penyakit> penyakit = getJdbcTemplate().query(
                GET_LIST_PENYAKIT, new Object[]{nim}, new PenyakitRowMapper());
        return penyakit;
    }

    public class PenyakitRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int i) throws SQLException {
            Penyakit penyakit = new Penyakit();
            penyakit.setNama_penyakit(rs.getString(1));
            penyakit.setTanggal_sakit(rs.getString(2));
            return penyakit;
        }

    }

    public class PamongRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            Pamong pamong = new Pamong();
            pamong.setUsername(rs.getString("ID_PAMONG"));
            pamong.setPassword(rs.getString("PASSWORD"));
            return pamong;
        }
    }

    @Override
    public Pamong findByPamongId(String idPamong) {
        try {
            Pamong pamong = (Pamong) getJdbcTemplate().queryForObject(
                    FIND_BY_PAMONG_ID, new Object[]{idPamong}, new PamongRowMapper());
            return pamong;
        } catch (IncorrectResultSizeDataAccessException in) {
            return null;
        }
    }
}
