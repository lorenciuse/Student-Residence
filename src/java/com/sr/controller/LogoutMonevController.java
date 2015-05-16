/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Lorencius
 */
@Controller
public class LogoutMonevController {
    
    @RequestMapping(value = "do")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/home";
    }
}
