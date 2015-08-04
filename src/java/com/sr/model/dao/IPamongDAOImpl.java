/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import com.sr.model.Akademik;
import com.sr.model.Aktivitas;
import com.sr.model.Inap;
import com.sr.model.Kamar;
import com.sr.model.Kedisiplinan;
import com.sr.model.Keluar;
import com.sr.model.Pamong;
import com.sr.model.Pendaftaran;
import com.sr.model.Penyakit;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import oracle.jdbc.pool.OracleDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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
    private final String INSERT_ACTIVITY = "INSERT INTO AKTIFITAS_MHS(BANGUN_PAGI, OPERA_PAGI, MANDI, DOA_PAGI, STUDY, DOA_MALAM, TIDUR_MALAM, TANGGAL_AKTIFITAS, NIM) VALUES(?,?,?,?,?,?,?,?,?)";
    private final String INSERT_KEDISIPLINAN = "INSERT INTO PERINGATAN(JENIS_PERINGATAN, KETERANGAN, TANGGAL_PERINGATAN, NIM) VALUES(?,?,?,?)";
    private final String GET_JUMLAH_PERINGATAN = "SELECT COUNT(NIM) FROM PERINGATAN WHERE JENIS_PERINGATAN = ? AND NIM = ?";
    private final String INSERT_AKADEMIK = "INSERT INTO AKADEMIK_MHS(NIM, SEMESTER, BANYAK_SKS_DIAMBIL, IPS) VALUES (?,?,?,?)";
    private final String GET_AKADEMIK = "SELECT SEMESTER, BANYAK_SKS_DIAMBIL, IPS FROM AKADEMIK_MHS WHERE NIM = ? ORDER BY SEMESTER ASC";
    private final String GET_NAMA_BY_NIM = "SELECT NAMA_MHS FROM MAHASISWA WHERE NIM = ?";
    private final String GET_FACULTY_BY_NIM = "SELECT FAKULTAS FROM AKADEMIK WHERE NIM = ?";
    private final String GET_KUMULATIF = "SELECT SUM(BANYAK_SKS_DIAMBIL) AS SKS, SUM(IPS*BANYAK_SKS_DIAMBIL)/SUM(BANYAK_SKS_DIAMBIL) AS IPK FROM AKADEMIK_MHS WHERE NIM = ?";
    private final String GET_PERCENTAGE = "select (((count(bangun_pagi))/count(nim))*100) \"bangun pagi\",\n"
            + "(((count(opera_pagi))/count(nim))*100) \"opera pagi\",\n"
            + "(((count(mandi))/count(nim))*100) \"mandi\",\n"
            + "(((count(doa_pagi))/count(nim))*100) \"doa pagi\",\n"
            + "(((count(study))/count(nim))*100) \"study\",\n"
            + "(((count(doa_malam))/count(nim))*100) \"doa malam\",\n"
            + "(((count(tidur_malam))/count(nim))*100) \"tidur malam\"\n"
            + "from aktifitas_mhs where nim = ?";
    private final String GET_IZIN_INAP = "select (count(nim)) \"Banyak Izin Inap\" from Izin_inap  where  nim = ?";
    private final String GET_IZIN_KELUAR = "select (count(nim)) \"Banyak Izin Inap\" from Izin_keluar  where  nim = ?";
    private final String GET_LATEST = "SELECT JENIS_PERINGATAN, KETERANGAN FROM peringatan where no_peringatan=\n"
            + "(select max(no_peringatan)\"No Peringatan\" from peringatan where nim = ?)";
    private final String GET_COUNT_SURAT = "select count(jenis_peringatan) from peringatan  where nim = ? and jenis_peringatan =\n"
            + "(select jenis_peringatan from peringatan where no_peringatan= \n"
            + "(select max(no_peringatan)\"No Peringatan\" from peringatan where nim = ?))";
    private final String GET_COUNT_PERINGATAN = "SELECT COUNT(JENIS_PERINGATAN) FROM PERINGATAN WHERE NIM = ?";

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
        try {
            return (String) getJdbcTemplate().queryForObject(GET_PRODI, new Object[]{nim}, String.class);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
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
    public boolean insertActivity(Aktivitas act, String nim) {
        getJdbcTemplate().update(INSERT_ACTIVITY, new Object[]{act.getBangun_pagi(), act.getOpera_pagi(), act.getGebyur_wc(), act.getDoa_pagi(), act.getStudi(), act.getDoa_malam(), act.getTidur_malam(), act.getTanggal_aktivitas(), nim});
        return true;
    }

    @Override
    public boolean insertKedisiplinan(Kedisiplinan kedisiplinan, String nim) {
        getJdbcTemplate().update(INSERT_KEDISIPLINAN, new Object[]{kedisiplinan.getJenis(), kedisiplinan.getKeterangan(), kedisiplinan.getTanggal_peringatan(), nim});
        return true;
    }

    @Override
    public int getJumlahPeringatanByJenis(String jenis, String nim) {
        return (int) getJdbcTemplate().queryForObject(GET_JUMLAH_PERINGATAN, new Object[]{jenis, nim}, Integer.class);
    }

    @Override
    public boolean insertAkademik(Akademik aca, String nim) {
        getJdbcTemplate().update(INSERT_AKADEMIK, new Object[]{nim, aca.getSemester(), aca.getBanyak_sks(), aca.getIps()},
                new int[]{Types.VARCHAR, Types.VARCHAR, Types.DECIMAL, Types.DECIMAL});
        return true;
    }

    @Override
    public List<Akademik> getAkademik(String nim) {
        List<Akademik> aka = getJdbcTemplate().query(GET_AKADEMIK, new Object[]{nim}, new AkademikRowMapper());
        return aka;
    }

    @Override
    public String getNamaByNim(String nim) {
        try {
            return (String) getJdbcTemplate().queryForObject(GET_NAMA_BY_NIM, new Object[]{nim}, String.class);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public String getFacultyByNim(String nim) {
        try {
            return (String) getJdbcTemplate().queryForObject(GET_FACULTY_BY_NIM, new Object[]{nim}, String.class);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public Akademik getKumulatif(String nim) {
        return (Akademik) getJdbcTemplate().queryForObject(GET_KUMULATIF, new Object[]{nim}, new KumulatifRowMapper());
    }

    @Override
    public Aktivitas getPercentage(String nim) {
        return (Aktivitas) getJdbcTemplate().queryForObject(GET_PERCENTAGE, new Object[]{nim}, new AktivitasRowMapper());
    }

    @Override
    public String getIzinInap(String nim) {
        return (String) getJdbcTemplate().queryForObject(GET_IZIN_INAP, new Object[]{nim}, String.class);
    }

    @Override
    public String getIzinKeluar(String nim) {
        return (String) getJdbcTemplate().queryForObject(GET_IZIN_KELUAR, new Object[]{nim}, String.class);
    }

    @Override
    public Kedisiplinan getLatest(String nim) {
        
        try{
        return (Kedisiplinan) getJdbcTemplate().queryForObject(GET_LATEST, new Object[]{nim}, new KedisiplinanRowMapper());}
        catch(EmptyResultDataAccessException e){
            Kedisiplinan k = new Kedisiplinan();
            k.setJenis("Belum mendapatkan peringatan");
            return k;
        }
    }

    @Override
    public String getCountSurat(String nim) {
        return (String) getJdbcTemplate().queryForObject(GET_COUNT_SURAT, new Object[]{nim, nim}, String.class);
    }

    @Override
    public String getCountPeringatan(String nim) {
        return (String) getJdbcTemplate().queryForObject(GET_COUNT_PERINGATAN, new Object[]{nim}, String.class);
    }

    public class KedisiplinanRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int i) throws SQLException {
            Kedisiplinan kedisiplinan = new Kedisiplinan();
            kedisiplinan.setJenis(rs.getString("JENIS_PERINGATAN"));
            return kedisiplinan;
        }

    }

    public class KumulatifRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int i) throws SQLException {
            Akademik akademik = new Akademik();
            akademik.setBanyak_sks(rs.getInt("SKS"));
            akademik.setIpk(rs.getDouble("IPK"));
            return akademik;
        }

    }

    public class AkademikRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int i) throws SQLException {
            Akademik akademik = new Akademik();
            akademik.setSemester(rs.getString(1));
            akademik.setBanyak_sks(rs.getInt(2));
            akademik.setIps(rs.getDouble(3));
            return akademik;
        }

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

    public class AktivitasRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            Aktivitas aktivitas = new Aktivitas();
            aktivitas.setBangun_pagi(rs.getString("BANGUN PAGI"));
            aktivitas.setOpera_pagi(rs.getString("OPERA PAGI"));
            aktivitas.setDoa_pagi(rs.getString("DOA PAGI"));
            aktivitas.setStudi(rs.getString("STUDY"));
            aktivitas.setGebyur_wc(rs.getString("MANDI"));
            aktivitas.setDoa_malam(rs.getString("DOA MALAM"));
            aktivitas.setTidur_malam(rs.getString("TIDUR MALAM"));
            return aktivitas;
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
