package com.study.toy_springboots.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.toy_springboots.dao.AttachFileDao;

@Service
public class AttachFileService {
    @Autowired
    AttachFileDao attachFileDao;  
    public Object insertMulti(Object dataMap) {
        String sqlMapId = "AttachFile.insertMulti";
        Object result = attachFileDao.insert(sqlMapId, dataMap);
        return result;
    }
}
