/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import com.sr.model.Inap;
import com.sr.model.Kamar;
import com.sr.model.Keluar;
import com.sr.model.Pamong;
import com.sr.model.Pendaftaran;
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
    private final String GET_LIST_NOMOR_BY_STATUS = "SELECT DISTINCT NO_KAMAR FROM RESIDENCE WHERE STATUS = ? ORDER BY NO_KAMAR ASC";
    private final String GET_LIST_NOMOR = "SELECT DISTINCT NO_KAMAR FROM RESIDENCE ORDER BY NO_KAMAR ASC";
    private final String ADD_MAHASISWA = "UPDATE RESIDENCE SET NIM = ? WHERE K_NO = ?";
    private final String GET_REMAINING_ID_BY_NOMOR = "SELECT K_NO FROM RESIDENCE WHERE NO_KAMAR = ? AND NIM IS NULL";
    private final String GET_NAMA_MHS_FROM_KAMAR = "SELECT NAMA_MHS FROM MAHASISWA WHERE NIM IN (SELECT NIM FROM RESIDENCE WHERE NO_KAMAR = ?) AND NIM IN (SELECT NIM FROM DAFTAR WHERE ID_PAMONG = ?)";
    private final String GET_LIST = "SELECT NO_PENDAFTARAN, NIM FROM DAFTAR WHERE ID_PAMONG = (?)";
    private final String INSERT_NIM = "INSERT INTO MAHASISWA (NIM) VALUES(?)";
    private final String INSERT_NIM_AKADEMIK = "INSERT INTO AKADEMIK (NIM) VALUES(?)";
    private final String INSERT_NOMOR = "INSERT INTO DAFTAR VALUES(?,?,?)";
    private final String INSERT_INAP = "INSERT INTO IZIN_INAP(NAMA_DITUJU, ALAMAT_TUJUAN, MO_TELPON_DITUJU, KEPERLUAN, TANGGAL_PERGI, TANGGAL_KEMBALI, WAKTU_KELUAR, WAKTU_KEMBALI, NIM) VALUES (?,?,?,?,?,?,?,?,?)";
    private final String INSERT_KELUAR = "INSERT INTO IZIN_KELUAR(ALAMAT_TUJUAN, KEPERLUAN, TANGGAL_IJIN_KELUAR, WAKTU_KELUAR, WAKTU_KEMBALI, NIM) VALUES(?,?,?,?,?,?)";
    private final String INSERT_ACTIVITY = "";

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
    public boolean insertPenyakit(String sakit, String tanggal, String nim) {
        getJdbcTemplate().update(ADD_PENYAKIT, new Object[]{sakit, tanggal, nim});
        return true;
    }
    
    @Override
    public List<Penyakit> getListPenyakit(String nim) {
        List<Penyakit> penyakit = getJdbcTemplate().query(
                GET_LIST_PENYAKIT, new Object[]{nim}, new PenyakitRowMapper());
        return penyakit;
    }

    @Override
    public boolean insertNomor(Pendaftaran pendaftaran) {
        getJdbcTemplate().update(INSERT_NIM, new Object[]{pendaftaran.getNIM()});
        getJdbcTemplate().update(INSERT_NIM_AKADEMIK, new Object[]{pendaftaran.getNIM()});
        getJdbcTemplate().update(INSERT_NOMOR, new Object[]{pendaftaran.getNoPendaftaran(), pendaftaran.getIdPamong(), pendaftaran.getNIM()});
        return true;
    }

    @Override
    public List<Pendaftaran> getListNoNim(String idPamong) {
        List<Pendaftaran> listDaftar = new ArrayList<>();
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(GET_LIST, new Object[]{idPamong});
        for (Map row : rows) {
            Pendaftaran pendaftaran = new Pendaftaran();
            pendaftaran.setNoPendaftaran(row.get("NO_PENDAFTARAN").toString());
            pendaftaran.setNIM((String) row.get("NIM"));
            listDaftar.add(pendaftaran);
        }
        return listDaftar;
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
    public List<String> getListNomor() {
        List<String> listNomor = new ArrayList<>();
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(GET_LIST_NOMOR);
        for (Map row : rows) {
            listNomor.add(row.get("NO_KAMAR").toString());
        }
        return listNomor;
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
    public boolean addMahasiswa(String nim, String id) {
        getJdbcTemplate().update(ADD_MAHASISWA, new Object[]{nim, id});
        return true;
    }

    @Override
    public boolean insertInap(Inap inap, String nim) {
        getJdbcTemplate().update(INSERT_INAP, new Object[]{inap.getNama_tujuan(), inap.getAlamat(), inap.getTelp(), 
            inap.getKeperluan(), inap.getBerangkat(), inap.getKembali(), inap.getWaktu_berangkat(), inap.getWaktu_kembali(), nim});
        return true;
    }

    @Override
    public boolean insertKeluar(Keluar keluar, String nim) {
        getJdbcTemplate().update(INSERT_KELUAR, new Object[]{keluar.getAlamat(), keluar.getKeperluan(), keluar.getTanggal_keluar(),
        keluar.getWaktu_keluar(), keluar.getWaktu_kembali(), nim});
        return true;
    }

    @Override
    public boolean insertActivity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
