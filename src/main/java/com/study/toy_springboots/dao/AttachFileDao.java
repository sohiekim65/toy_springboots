package com.study.toy_springboots.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

// @Repository
@Component
public class AttachFileDao {
    @Autowired  // DI해줌
    private SqlSessionTemplate sqlSessionTemplate; // DB와 Mapper XML 연결 클래스

    public Object getList(String sqlMapId, Object dataMap) { 
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap); // return 값이 list인데 통틀어 Object로
        return result;
    }

    public Object getOne(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectOne(sqlMapId, dataMap);
        return result;
    }

    public Object update(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.update(sqlMapId, dataMap);
        return result;
    }

    public Object insert(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.insert(sqlMapId, dataMap);
        return result;
    }

    public Object delete(String sqlMapId, Object dataMap) { // 삭제한 개수로 리턴이 됨
        Object result = sqlSessionTemplate.delete(sqlMapId, dataMap);
        return result;
    }
}
