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
import java.sql.Blob;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Lorencius
 * @param <T>
 */
@Repository
public interface IPendaftaranDAO<T> {
    public boolean insertNomor(Pendaftaran pendaftaran);
    public boolean findNomor(String nomor);
    public boolean insertBiodata(Mahasiswa mhs, AkademikSR aka, FileItem foto, List<Prestasi> prestasi);
    public String getNimByNomor(String nomor);
    public List<Pendaftaran> getListNoNim(String idPamong);
    public Mahasiswa getBiodataByNim(String nim);
    public AkademikSR getAkademikByNim(String nim);
    public List<Prestasi> getPrestasiByNimJenis(String nim, String jenis);
    public Blob getFotoByNim(String nim);
}
