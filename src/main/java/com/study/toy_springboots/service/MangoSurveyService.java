package com.study.toy_springboots.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.toy_springboots.dao.MangoSurveyDao;

@Service
public class MangoSurveyService {
    @Autowired
    MangoSurveyDao mangoSurveyDao;

    public Object getSurveyorList(Object dataMap) {
        String sqlMapId = "MangoSurvey.selectFromSurveyorList";
        Object result = mangoSurveyDao.getSurveyorList(sqlMapId, dataMap);
        return result;
    }

    public Object getSurveyorOne(Object dataMap) {
        String sqlMapId = "MangoSurvey.selectSurveyorOneByUIDPassword";
        Object result = mangoSurveyDao.getSurveyorOne(sqlMapId, dataMap);
        return result;
    }

    public Object insertJoinSurveyor(Object dataMap) {
        String sqlMapId = "MangoSurvey.insertSurveyorJoinInfo";
        Object result = mangoSurveyDao.insertJoinSurveyor(sqlMapId, dataMap);
        return result;
    }

    // delete하고 List 출력
    public Object deleteSurveyorAndGetList(Object dataMap){
        Object result = this.deleteSurveyor(dataMap);
        result = this.getSurveyorList(dataMap);
        return result;
    }

    public Object deleteSurveyor(Object dataMap) {
        String sqlMapId = "MangoSurvey.deleteSurveyorByUID";
        Object result = mangoSurveyDao.deleteSurveyor(sqlMapId, dataMap);
        return result;
    }

    // update할 회원 정보 페이지에 출력
    public Object getSurveyorOneByUID(Object dataMap) {
        String sqlMapId = "MangoSurvey.selectSurveyorOneByUID";
        Object result = mangoSurveyDao.getSurveyorOneByUID(sqlMapId, dataMap);
        return result;
    }

    // update하고 List 출력
    public Object updateSurveyorAndGetList(Object dataMap) {
        Object result = this.updateSurveyor(dataMap);
        result = this.getSurveyorList(dataMap);
        return result;
    }

    public Object updateSurveyor(Object dataMap) {
        String sqlMapId = "MangoSurvey.updateSurveyor";
        Object result = mangoSurveyDao.updateSurveyor(sqlMapId, dataMap);
        return result;
    }

    // admin 회원 설문 결과 조회
    public Object getSurveyorSurveyResultByUID(Object dataMap) {
        String sqlMapId = "MangoSurvey.selectSurveyorSurveyResultByUID";
        Object result = mangoSurveyDao.getSurveyorSurveyResultByUID(sqlMapId, dataMap);
        return result;
    }

    // 설문 문항 List 출력
    public Object getQuestionList(Object dataMap) {
        String sqlMapId = "MangoSurvey.selectFromQuestionList";
        Object result = mangoSurveyDao.getQuestionList(sqlMapId, dataMap);
        return result;
    }

}
