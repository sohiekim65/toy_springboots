package com.study.toy_springboots.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class MangoSurveyDao {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public Object getSurveyorList(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }

    public Object getSurveyorOne(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectOne(sqlMapId, dataMap);
        return result;
    }

    public Object insertJoinSurveyor(String sqlMapId, Object dataMap){
        Object result = sqlSessionTemplate.insert(sqlMapId, dataMap);
        return result;
    }

    public Object deleteSurveyor(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.delete(sqlMapId, dataMap);
        return result;
    }

    public Object getSurveyorOneByUID(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectOne(sqlMapId, dataMap);
        return result;
    }

    public Object updateSurveyor(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.update(sqlMapId, dataMap);
        return result;
    }

    public Object getSurveyorSurveyResultByUID(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }

    public Object getQuestionList(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }
}
