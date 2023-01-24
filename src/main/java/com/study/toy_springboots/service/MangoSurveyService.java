package com.study.toy_springboots.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.toy_springboots.dao.MangoSurveyDao;

@Service
public class MangoSurveyService {
    @Autowired
    MangoSurveyDao mangoSurveyDao;

    public Object getQuestionList(Object dataMap) {
        String sqlMapId = "MangoSurvey.selectFromQuestionList";
        Object result = mangoSurveyDao.getQuestionList(sqlMapId, dataMap);
        return result;
    }
    public Object getAnswerList(Object dataMap) {
        String sqlMapId = "MangoSurvey.selectFromAnswerList";
        Object result = mangoSurveyDao.getAnswerList(sqlMapId, dataMap);
        return result;
    }
}
