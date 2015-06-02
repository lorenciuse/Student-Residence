/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.controller;

import com.sr.model.dao.IMahasiswaDAO;
import com.sr.model.Mahasiswa;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sr.model.dao.IPamongDAO;
import com.sr.model.Pamong;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "pamong", method = {RequestMethod.POST})
    public String login(ModelMap model, HttpServletRequest request) {
        
        int validateLogin = pamong.validateLogin(request.getParameter("username"),request.getParameter("password"));

        switch (validateLogin) {
            case 0:
                request.getSession().setAttribute("idPamong", request.getParameter("username"));
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

    @RequestMapping(value = "mhs", method = {RequestMethod.POST})
    public String loginmhs(ModelMap model, HttpServletRequest request) {

        boolean validateLogin = mahasiswa.validateLogin(request.getParameter("nomorpendaftaran"));

        if (validateLogin) {
            request.getSession().setAttribute("noDaftar", request.getParameter("nomorpendaftaran"));
            return "redirect:/mahasiswa/daftar";
        } else {
            model.addAttribute("errorM", "true");
            return "redirect:/login";
        }
    }
}
