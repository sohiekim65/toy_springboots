package com.study.toy_springboots.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.toy_springboots.dao.MangoAdminDao;
import com.study.toy_springboots.utils.Paginations;

@Service
public class MangoAdminService {
    @Autowired
    MangoAdminDao mangoSurveyDao;

    @Autowired
    AttachFileService attachFileService;

    public Object getSurveyorList(Object dataMap) {
        String sqlMapId = "MangoAdmin.selectFromSurveyorList";
        Object result = mangoSurveyDao.getSurveyorList(sqlMapId, dataMap);
        return result;
    }

    public Object getSurveyorOne(Object dataMap) {
        String sqlMapId = "MangoAdmin.selectSurveyorOneByUIDPassword";
        Object result = mangoSurveyDao.getSurveyorOne(sqlMapId, dataMap);
        return result;
    }

    public Object insertJoinSurveyor(Object dataMap) {
        String sqlMapId = "MangoAdmin.insertSurveyorJoinInfo";
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
        String sqlMapId = "MangoAdmin.deleteSurveyorByUID";
        Object result = mangoSurveyDao.deleteSurveyor(sqlMapId, dataMap);
        return result;
    }

    // update할 회원 정보 페이지에 출력
    public Object getSurveyorOneByUID(Object dataMap) {
        String sqlMapId = "MangoAdmin.selectSurveyorOneByUID";
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
        String sqlMapId = "MangoAdmin.updateSurveyor";
        Object result = mangoSurveyDao.updateSurveyor(sqlMapId, dataMap);
        return result;
    }

    // admin 회원 설문 결과 조회
    public Object getSurveyorSurveyResultByUID(Object dataMap) {
        String sqlMapId = "MangoAdmin.selectSurveyorSurveyResultByUID";
        Object result = mangoSurveyDao.getSurveyorSurveyResultByUID(sqlMapId, dataMap);
        return result;
    }

    // 설문 문항 List 출력
    public Object getQuestionList(Object dataMap) {
        String sqlMapId = "MangoAdmin.selectFromQuestionList";
        Object result = mangoSurveyDao.getQuestionList(sqlMapId, dataMap);
        return result;
    }

    // admin 회원 검색
    public Object getSearchSurveyor(Object dataMap) {
        String sqlMapId = "MangoAdmin.selectSurveyorSearch";
        Object result = mangoSurveyDao.getSearchSurveyor(sqlMapId, dataMap);
        return result;
    }

    // 0126 파일업로드
    public Object insertMulti(Object dataMap) {
        String sqlMapId = "AttachFile.insertMulti";
        Object result = mangoSurveyDao.insertJoinSurveyor(sqlMapId, dataMap); // 재사용
        return result;
    }

    // 0126 파일업로드하고 List를 뱉어내는 function
    public Object insertWithFilesAndGetList(Object dataMap) {
        Object result = attachFileService.insertMulti(dataMap);
        result = this.insertJoinSurveyor(dataMap); // 회원 추가
        result = this.getSurveyorList(dataMap);
        return result;
    }

    // 0130 페이지네이션 total과 list
    public Object getListWithPagination(Object dataMap) {
        Map<String, Object> result = new HashMap<String, Object>();
        int totalCount = (int) this.getTotal(dataMap);
        int currentPage = (int) ((Map<String, Object>) dataMap).get("currentPage");
        Paginations paginations = new Paginations(totalCount, currentPage);
        result.put("paginations", paginations);
        ((Map<String, Object>) dataMap).put("pageBegin", paginations.getPageBegin());
        ((Map<String, Object>) dataMap).put("pageScale", paginations.getPageScale());
        result.put("resultList", this.getSurveyorList(dataMap));
        return result;
    }

    // 0130 페이지네이션 total
    public Object getTotal(Object dataMap) {
        String sqlMapId = "MangoAdmin.selectTotal";
        Object result = mangoSurveyDao.getSurveyorOne(sqlMapId, dataMap);
        return result;
    }
}
