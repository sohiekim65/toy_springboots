package com.study.toy_springboots.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthorityController {

    // 0211 security authority
    @GetMapping({"/adminSecurity/*"})   // ROLE_ADMIN
    public ModelAndView adminSecurity(ModelAndView modelAndView) {
        String viewName = "admin/read";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
    @GetMapping({"/managerSecurity/*"})     // ROLE_MANAGER or ROLE_ADMIN
    public ModelAndView managerSecurity(ModelAndView modelAndView) {
        String viewName = "manager/read";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
    @GetMapping({"/userSecurity/*"})     // ROLE_USER
    public ModelAndView userSecurity(ModelAndView modelAndView) {
        String viewName = "main";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}
