package com.study.toy_springboots.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfiguration {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf().disable();

        // 권한
        httpSecurity.authorizeRequests()
        .antMatchers("/userSecurity/*").authenticated()
        .antMatchers("/managerSecurity/*").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_MANAGER')")
        .antMatchers("/adminSecurity/*").access("hasRole('ROLE_ADMIN')")
        .anyRequest().permitAll();

        // 로그인
        httpSecurity.formLogin().loginPage("/loginForm")    // 사용자 정의 로그인 페이지
            .failureUrl("/loginForm?fail=true")
            .loginProcessingUrl("/login")
            .defaultSuccessUrl("/");    // 로그인 성공 후 이동 페이지

    return httpSecurity.build();
    }

    // 비밀번호 (권한만 구현 시 DB에 임의로 회원을 넣으면 password가 비교x --> 그래서 join 기능 추가)
    @Bean
    public BCryptPasswordEncoder encoderPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
