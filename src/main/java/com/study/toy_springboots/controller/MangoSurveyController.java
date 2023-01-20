package com.study.toy_springboots.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.toy_springboots.service.MangoSurveyService;

@Controller
@RequestMapping(value = "/mango")
public class MangoSurveyController {

    @Autowired
    MangoSurveyService mangoSurveyService;
    
    // 메인 페이지 이동
    @RequestMapping(value = {"/main", "", "/"}, method = RequestMethod.GET)
    public ModelAndView main(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("mango/a_main");
        return modelAndView;
    }

    // 회원이면 -> 로그인, 회원가입  admin이면 -> 회원관리, 로그아웃 navbar
    @RequestMapping(value = {"/main"}, method = RequestMethod.POST)
    public ModelAndView loginMain(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.getSurveyorOne(params);
        if(resultMap == null){
            modelAndView.setViewName("mango/login");
            return modelAndView;
        } else {
            modelAndView.addObject("resultMap", resultMap);
            modelAndView.setViewName("mango/a_main");
            return modelAndView;
        }
    }

    // 로그인 페이지 이동
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public ModelAndView login(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("mango/login");
        return modelAndView;
    }

    // 회원가입 페이지 이동
    @RequestMapping(value = {"/signUp_form"}, method = RequestMethod.GET)
    public ModelAndView signUp(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("mango/signup_form");
        return modelAndView;
    }

    // 회원가입 완료
    @RequestMapping(value = {"/signUp_done"}, method = RequestMethod.POST)
    public ModelAndView signUpDone(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        mangoSurveyService.insertJoinSurveyor(params);
        modelAndView.setViewName("mango/signup_done");
        return modelAndView;
    }

    // admin의 회원관리 페이지 이동 = 회원 목록 출력
    @RequestMapping(value = "/adminUserList", method = RequestMethod.GET)
    public ModelAndView adminSurveyorList(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.getSurveyorList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/user_management");
        return modelAndView;
    }

    // admin 회원 삭제 후 리스트 출력 --> 아이디 안보이도록 hidden params로
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public ModelAndView adminSurveyorDelete(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.deleteSurveyorAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/user_management");
        return modelAndView;
    }

    // admin 회원 수정 페이지로 이동
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public ModelAndView adminSurveyorOne(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.getSurveyorOneByUID(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/admin_userInfoModify");
        return modelAndView;
    }

    // admin 회원 수정 후 리스트 출력
    @RequestMapping(value = "/modify_done", method = RequestMethod.POST)
    public ModelAndView adminSurveyorModify(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.updateSurveyorAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/user_management");
        return modelAndView;
    }

    // admin 회원 설문 결과 조회
    @RequestMapping(value = "/surveyorSurveyResult", method = RequestMethod.POST)
    public ModelAndView adminSurveyorSurveyResult(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.getSurveyorSurveyResultByUID(params);
        Object questionList = mangoSurveyService.getQuestionList(params);
        Object surveyor = mangoSurveyService.getSurveyorOneByUID(params);
        String msg = "설문을 제출하지 않은 회원입니다.";
        modelAndView.addObject("msg", msg);
        modelAndView.addObject("surveyor", surveyor);
        modelAndView.addObject("questionList", questionList);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/admin_user_surveyResultCheck");
        return modelAndView;
    }
}