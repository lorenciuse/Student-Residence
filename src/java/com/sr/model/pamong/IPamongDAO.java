/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.pamong;

import org.springframework.stereotype.Repository;

/**
 *
 * @author Lorencius
 * @param <T>
 */
@Repository
public interface IPamongDAO<T> {
    public int validateLogin(String pUsername, String pPassword);
    public String findPamongNameById(String idPamong);
    public Pamong findByPamongId(String idPamong);
}
