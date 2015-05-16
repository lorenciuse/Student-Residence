/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.controller;

import com.sr.model.mahasiswa.IMahasiswaDAO;
import com.sr.model.mahasiswa.Mahasiswa;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sr.model.pamong.IPamongDAO;
import com.sr.model.pamong.Pamong;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Lorencius
 */
@Controller
public class LoginMonevController {

    @Autowired
    private IPamongDAO<Pamong> pamong;
    @Autowired
    private IMahasiswaDAO<Mahasiswa> mahasiswa;

    @RequestMapping(value = "pamong", method = {RequestMethod.GET,RequestMethod.POST})
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, ModelMap model, HttpServletRequest request) {
        
        int validateLogin = pamong.validateLogin(username, password);

        switch (validateLogin) {
            case 0:
                request.getSession().setAttribute("idPamong", username);
                return "redirect:/pamong/monev";
            case 1:
                model.addAttribute("error", "true");
                return "redirect:/login";
            case 2:
                model.addAttribute("errorUn", "true");
                return "redirect:/login";
            default:
                break;
        }
        return null;
    }

    @RequestMapping(value = "mhs", method = {RequestMethod.GET,RequestMethod.POST})
    public String loginmhs(@RequestParam("nomorpendaftaran") String username, ModelMap model, HttpServletRequest request) {

        boolean validateLogin = mahasiswa.validateLogin(username);

        if (validateLogin) {
            request.getSession().setAttribute("noDaftar", username);
            return "redirect:/mahasiswa/daftar";
        } else {
            model.addAttribute("errorM", "true");
            return "redirect:/login";
        }
    }
}
