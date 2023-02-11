package com.study.toy_springboots.service;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.study.toy_springboots.dao.MangoAdminDao;
import com.study.toy_springboots.utils.MangoUtils;

import java.util.Map;

@Service
public class MemberWithAuthorityService {

    @Autowired
    MangoAdminDao mangoAdminDao;

    @Autowired
    MangoUtils mangoUtils;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    public Object insert(Object dataMap) {
        String sqlMapId = "Memberwithauthority.insertWithUID";
        // 자동으로 만든 uid를 dataMap에 넣어주기
        ((Map)dataMap).put("USERS_UID", mangoUtils.getUniqueId());
        ((Map)dataMap).put("role", "ROLE_USER");
        // normal to crypto password
        String password = (String)((Map)dataMap).get("password");    // 먼저 가져오기
        ((Map)dataMap).put("password", bcryptPasswordEncoder.encode(password));
        
        Object result = mangoAdminDao.insertJoinSurveyor(sqlMapId, dataMap);
        return result;
    }
}
