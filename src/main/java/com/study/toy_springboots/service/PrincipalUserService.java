package com.study.toy_springboots.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.study.toy_springboots.configurations.PrincipalUser;
import com.study.toy_springboots.dao.MangoAdminDao;

@Service
public class PrincipalUserService implements UserDetailsService {

    @Autowired
    MangoAdminDao mangoAdminDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        String sqlMapId = "Memberwithauthority.selectByUID";
        Object usernameObj = username;
        Map<String, String> resultMap = (Map<String, String>) mangoAdminDao.getSurveyorOne(sqlMapId, usernameObj);

        // session 등록
        PrincipalUser principalUser = new PrincipalUser(resultMap);

        return principalUser;
    }
    
}
