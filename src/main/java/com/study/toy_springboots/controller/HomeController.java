package com.study.toy_springboots.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    
    // @RequestMapping(value = {"", "/", "/main"})
    // public String main() {
    //     return "main";
    // }

    // 메인 페이지 이동
    @RequestMapping(value = {"", "/", "/main"}, method = RequestMethod.GET)
    public ModelAndView main(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("mango/a_main");
        return modelAndView;
    }
}
