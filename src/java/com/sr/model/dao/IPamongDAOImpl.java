/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import com.sr.model.Pamong;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
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
