/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.dao;

import com.sr.model.AkademikSR;
import com.sr.model.Prestasi;
import com.sr.model.Mahasiswa;
import com.sr.model.Pendaftaran;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import oracle.jdbc.pool.OracleDataSource;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Repository;

@Repository
public class IPendaftaranDAOImpl implements IPendaftaranDAO<Pendaftaran> {

    private final String GET_LIST = "SELECT NO_PENDAFTARAN, NIM FROM DAFTAR WHERE ID_PAMONG = (?)";
    private final String INSERT_NIM = "INSERT INTO MAHASISWA (NIM) VALUES(?)";
    private final String INSERT_NIM_AKADEMIK = "INSERT INTO AKADEMIK (NIM) VALUES(?)";
    private final String INSERT_NOMOR = "INSERT INTO DAFTAR VALUES(?,?,?)";
    private final String FIND_NOMOR = "SELECT NO_PENDAFTARAN FROM DAFTAR";
    private final String GET_NIM_BY_NOMOR = "SELECT NIM FROM DAFTAR WHERE NO_PENDAFTARAN = ?";
    private final String INSERT_BIODATA = "UPDATE MAHASISWA SET NAMA_MHS = ?, TEMPAT_LAHIR = ?, TANGGAL_LAHIR = TO_DATE(?), AGAMA = ?, KELAMIN = ?,"
            + "ALAMAT_ASAL = ?, KAB_KOTA_ASAL = ?, PROV_ASAL = ?, NO_HP_MHS = ?, NAMA_AYAH = ?, NAMA_IBU = ?, PENDIDIKAN_AYAH = ?, PENDIDIKAN_IBU = ?,"
            + "PEKERJAAN_AYAH = ?, PEKERJAAN_IBU = ?, PENDAPATAN_ORTU = ?, NO_TEL_ORTU = ?, NO_HP_ORTU = ?, ALAMAT_KELUARGA = ?,"
            + "NO_TEL_KELUARGA = ?, NO_HP_KELUARGA = ?, FOTO_MHS = ? WHERE NIM = ?";
    private final String GET_BIODATA = "SELECT NIM, NAMA_MHS, TEMPAT_LAHIR, TO_CHAR(TANGGAL_LAHIR, 'DD Month YYYY'), AGAMA, KELAMIN, ALAMAT_ASAL, KAB_KOTA_ASAL, "
            + "PROV_ASAL, NO_HP_MHS, NAMA_AYAH, NAMA_IBU, PENDIDIKAN_AYAH, PENDIDIKAN_IBU, PEKERJAAN_AYAH, PEKERJAAN_IBU, PENDAPATAN_ORTU, "
            + "NO_TEL_ORTU, NO_HP_ORTU, ALAMAT_KELUARGA, NO_TEL_KELUARGA, NO_HP_KELUARGA FROM MAHASISWA WHERE NIM = ?";
    private final String INSERT_AKADEMIK = "UPDATE AKADEMIK SET PRODI = ?, IPK_MASUK = ?, SEMESTER = ?, RAPOR_SMA = ?, JURUSAN = ?, FAKULTAS = ? WHERE NIM = ?";
    private final String GET_AKADEMIK = "SELECT * FROM AKADEMIK WHERE NIM = ?";
    private final String GET_FOTO_MAHASISWA_BY_NIM = "SELECT FOTO_MHS FROM MAHASISWA WHERE NIM = ?";
    private final String INSERT_PRESTASI = "INSERT INTO PRESTASI_MHS (NO_SERTIFIKAT, NIM, NAMA_PRESTASI, JENIS_PRESTASI) VALUES(?,?,?,?)";
    private final String GET_PRESTASI = "SELECT NO_SERTIFIKAT, NAMA_PRESTASI FROM PRESTASI_MHS WHERE (NIM = ? AND JENIS_PRESTASI = ?)";

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(OracleDataSource oracleDataSource) {
        jdbcTemplate = new JdbcTemplate(oracleDataSource);
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    @Override
    public boolean insertNomor(Pendaftaran pendaftaran) {
        getJdbcTemplate().update(INSERT_NIM, new Object[]{pendaftaran.getNIM()});
        getJdbcTemplate().update(INSERT_NIM_AKADEMIK, new Object[]{pendaftaran.getNIM()});
        getJdbcTemplate().update(INSERT_NOMOR, new Object[]{pendaftaran.getNoPendaftaran(), pendaftaran.getIdPamong(), pendaftaran.getNIM()});
        return true;
    }

    @Override
    public boolean findNomor(String nomor) {
        try {
            List numb = getJdbcTemplate().queryForList(FIND_NOMOR, String.class);
            for (Object number : numb) {
                if (nomor.equals(number)) {
                    return true;
                }
            }
        } catch (NullPointerException ne) {
            return false;
        }
        return false;
    }

    @Override
    public String getNimByNomor(String nomor) {
        return getJdbcTemplate().queryForObject(GET_NIM_BY_NOMOR, String.class, new Object[]{nomor});
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
    public boolean insertBiodata(Mahasiswa mhs, AkademikSR aka, FileItem foto, List<Prestasi> prestasi) {
        try {
            LobHandler lobHandler = new DefaultLobHandler();
            getJdbcTemplate().update(INSERT_BIODATA, new Object[]{mhs.getNamaMhs(), mhs.getTempat_lahir(), mhs.getTanggal_lahir(),
                mhs.getAgama(), mhs.getKelamin(), mhs.getAlamat_asal(), mhs.getKab_kota_asal(), mhs.getProv_asal(),
                mhs.getNo_hp_mhs(), mhs.getNama_ayah(), mhs.getNama_ibu(), mhs.getPendidikan_ayah(), mhs.getPendidikan_ibu(),
                mhs.getPekerjaan_ayah(), mhs.getPekerjaan_ibu(), mhs.getPendapatan_ortu(), mhs.getNo_tel_ortu(),
                mhs.getNo_hp_ortu(), mhs.getAlamat_keluarga(), mhs.getNo_tel_keluarga(), mhs.getNo_hp_keluarga(), new SqlLobValue(foto.getInputStream(), (int) foto.getSize(), lobHandler), mhs.getNim()}, 
                    new int[]{Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
                    Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.NUMERIC, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.BLOB, Types.VARCHAR});
            getJdbcTemplate().update(INSERT_AKADEMIK, new Object[]{aka.getProdi(), aka.getIpk_masuk(), aka.getSemester(), aka.getRapor_smu(), aka.getJurusan(), aka.getFakultas(), aka.getNim()});
            for (Prestasi pres : prestasi) {
                getJdbcTemplate().update(INSERT_PRESTASI, new Object[]{pres.getNo_sertifikat(), pres.getNim(), pres.getNama_prestasi(), pres.getJenis_prestasi()});
            }
            return true;
        } catch (DataAccessException da) {
            System.out.println("DataAccessException" + da.getMessage());
        } catch (FileNotFoundException ex) {
            System.out.println("FileNotFoundException " + ex.getMessage());
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public Blob getFotoByNim(String nim) {
        try {
            return getJdbcTemplate().queryForObject(GET_FOTO_MAHASISWA_BY_NIM, new Object[]{nim}, new FotoMahasiswaRowMapper());
        } catch (EmptyResultDataAccessException er) {
            System.out.println("EmptyResultDataAccess " + er.getMessage());
            return null;
        }
    }

    @Override
    public AkademikSR getAkademikByNim(String nim) {
        AkademikSR asr = (AkademikSR) getJdbcTemplate().queryForObject(
                GET_AKADEMIK, new Object[]{nim}, new AkademikSRRowMapper());
        return asr;
    }

    @Override
    public List<Prestasi> getPrestasiByNimJenis(String nim, String jenis) {
        List<Prestasi> prestasi = getJdbcTemplate().query(
                GET_PRESTASI, new Object[]{nim, jenis}, new PrestasiRowMapper());
        return prestasi;
    }

    public class PrestasiRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int i) throws SQLException {
            Prestasi prestasi = new Prestasi();
            prestasi.setNo_sertifikat(rs.getString(1));
            prestasi.setNama_prestasi(rs.getString(2));
            return prestasi;
        }

    }

    public class FotoMahasiswaRowMapper implements ParameterizedRowMapper<Blob> {

        @Override
        public Blob mapRow(ResultSet rs, int i) throws SQLException {
            return rs.getBlob(1);
        }
    }

    public class AkademikSRRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int i) throws SQLException {
            AkademikSR asr = new AkademikSR();
            asr.setNim(rs.getString(1));
            asr.setProdi(rs.getString(2));
            asr.setJurusan(rs.getString(3));
            asr.setFakultas(rs.getString(4));
            asr.setSemester(rs.getString(5));
            asr.setIpk_masuk(rs.getString(6));
            asr.setRapor_smu(rs.getString(7));
            return asr;
        }
    }

    public class MahasiswaRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            Mahasiswa mahasiswa = new Mahasiswa();
            mahasiswa.setNamaMhs(rs.getString(2));
            mahasiswa.setTempat_lahir(rs.getString(3));
            mahasiswa.setTanggal_lahir(rs.getString(4));
            mahasiswa.setAgama(rs.getString(5));
            mahasiswa.setKelamin(rs.getString(6));
            mahasiswa.setAlamat_asal(rs.getString(7));
            mahasiswa.setKab_kota_asal(rs.getString(8));
            mahasiswa.setProv_asal(rs.getString(9));
            mahasiswa.setNo_hp_mhs(rs.getString(10));
            mahasiswa.setNama_ayah(rs.getString(11));
            mahasiswa.setNama_ibu(rs.getString(12));
            mahasiswa.setPendidikan_ayah(rs.getString(13));
            mahasiswa.setPendidikan_ibu(rs.getString(14));
            mahasiswa.setPekerjaan_ayah(rs.getString(15));
            mahasiswa.setPekerjaan_ibu(rs.getString(16));
            mahasiswa.setPendapatan_ortu(rs.getString(17));
            mahasiswa.setNo_tel_ortu(rs.getString(18));
            mahasiswa.setNo_hp_ortu(rs.getString(19));
            mahasiswa.setAlamat_keluarga(rs.getString(20));
            mahasiswa.setNo_tel_keluarga(rs.getString(21));
            mahasiswa.setNo_hp_keluarga(rs.getString(22));
            return mahasiswa;
        }
    }

    @Override
    public Mahasiswa getBiodataByNim(String nim) {
        Mahasiswa mahasiswa = (Mahasiswa) getJdbcTemplate().queryForObject(
                GET_BIODATA, new Object[]{nim}, new MahasiswaRowMapper());
        return mahasiswa;
    }

}
