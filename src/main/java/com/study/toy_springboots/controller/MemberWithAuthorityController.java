package com.study.toy_springboots.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.toy_springboots.service.MemberWithAuthorityService;


@Controller
public class MemberWithAuthorityController {

    @Autowired
    MemberWithAuthorityService memberWithAuthorityService;

    @RequestMapping(value = "/joinForm", method = RequestMethod.GET)
    public ModelAndView joinForm(ModelAndView modelAndView) {
        String viewName = "/member/joinForm";

        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @RequestMapping(value = "/joinProc", method = RequestMethod.POST)
    public String joinProc(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = memberWithAuthorityService.insert(params);
        return "redirect:/";    // 아무것도 전달할 필요 없어서 루트로 가도록
    }
}
