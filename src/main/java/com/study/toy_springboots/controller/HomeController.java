package com.study.toy_springboots.controller;

import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    // 메인 페이지 이동
    @RequestMapping(value = {"",  "/main"}, method = RequestMethod.GET)
    public ModelAndView main(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("mango/a_main");
        return modelAndView;
    }

    // 0209 security
    @GetMapping({"/"})
    public ModelAndView securityMain( ModelAndView  modelAndView) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        
        String username = null;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }
        String viewName = "main";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}
