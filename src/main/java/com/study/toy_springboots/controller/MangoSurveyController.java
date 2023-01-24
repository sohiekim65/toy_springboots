package com.study.toy_springboots.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.toy_springboots.service.MangoSurveyService;

@Controller
@RequestMapping(value = "/survey")
public class MangoSurveyController {
    @Autowired
    MangoSurveyService mangoSurveyService;

    @RequestMapping(value = "/surveyStart", method = RequestMethod.GET)
    public ModelAndView surveyStart(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("mango/survey_start");
        return modelAndView;
    }
    @RequestMapping(value = "/survey", method = RequestMethod.GET)
    public ModelAndView survey(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object questionList = mangoSurveyService.getQuestionList(params);
        Object answerList = mangoSurveyService.getAnswerList(params);
        modelAndView.addObject("questionList", questionList);
        modelAndView.addObject("answerList", answerList);
        modelAndView.setViewName("mango/survey");
        return modelAndView;
    }
}
