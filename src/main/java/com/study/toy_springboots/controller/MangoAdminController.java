package com.study.toy_springboots.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.study.toy_springboots.service.MangoAdminService;
import com.study.toy_springboots.utils.MangoUtils;

@Controller
@RequestMapping(value = "/admin")
public class MangoAdminController {

    @Autowired
    MangoAdminService mangoSurveyService;

    @Autowired
    MangoUtils mangoUtils;

    // 회원가입 페이지 이동
    @RequestMapping(value = {"/signUp_form"}, method = RequestMethod.GET)
    public ModelAndView signUp(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("mango/signup_form");
        return modelAndView;
    }

    // 회원가입 완료
    @RequestMapping(value = {"/signUp_done"}, method = RequestMethod.POST)
    public ModelAndView signUpDone(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        // 비밀번호 재입력 CHECK
        String msg = "";
        if(!params.get("password-memeber").equals(params.get("password-check"))){
            msg = "비밀번호가 일치하지 않습니다.";
            modelAndView.addObject("msg", msg);
            modelAndView.setViewName("mango/signup_form");
        } else {
            Object user_id_check = mangoSurveyService.getSurveyorOneByUID(params);
            if(user_id_check != null){
                msg = "중복된 아이디입니다.";
                modelAndView.addObject("msg", msg);
                modelAndView.setViewName("mango/signup_form");
            } else {
                mangoSurveyService.insertJoinSurveyor(params);
                modelAndView.setViewName("mango/signup_done");
            }
        }
        return modelAndView;
    }

    // admin의 회원관리 페이지 이동 = 회원 목록 출력
    // @RequestMapping(value = "/adminUserList", method = RequestMethod.GET)
    // public ModelAndView adminSurveyorList(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
    //     Object resultMap = mangoSurveyService.getSurveyorList(params);
    //     modelAndView.addObject("resultMap", resultMap);
    //     modelAndView.setViewName("mango/user_management");
    //     return modelAndView;
    // }

    // admin 회원 삭제 후 리스트 출력 --> 아이디 안보이도록 hidden params로
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public ModelAndView adminSurveyorDelete(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.deleteSurveyorAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/user_management");
        return modelAndView;
    }

    // admin 회원 수정 페이지로 이동
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public ModelAndView adminSurveyorOne(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.getSurveyorOneByUID(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/admin_userInfoModify");
        return modelAndView;
    }

    // admin 회원 수정 후 리스트 출력
    @RequestMapping(value = "/modify_done", method = RequestMethod.POST)
    public ModelAndView adminSurveyorModify(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.updateSurveyorAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/user_management");
        return modelAndView;
    }

    // admin 회원 설문 결과 조회
    @RequestMapping(value = "/surveyorSurveyResult", method = RequestMethod.POST)
    public ModelAndView adminSurveyorSurveyResult(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.getSurveyorSurveyResultByUID(params);
        Object questionList = mangoSurveyService.getQuestionList(params);
        Object surveyor = mangoSurveyService.getSurveyorOneByUID(params);
        String msg = "설문을 제출하지 않은 회원입니다.";
        modelAndView.addObject("msg", msg);
        modelAndView.addObject("surveyor", surveyor);
        modelAndView.addObject("questionList", questionList);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/admin_user_surveyResultCheck");
        return modelAndView;
    }

    // admin 회원 검색
    @RequestMapping(value = {"/searchSurveyor"}, method = RequestMethod.POST)
    public ModelAndView adminSearchSurveyor(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = mangoSurveyService.getSearchSurveyor(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/admin_searchUserInfo");
        return modelAndView;
    }

    // 업로드하기 클릭 시
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public ModelAndView fileUpload(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("mango/admin_fileUpload");
        return modelAndView;
    }

    @RequestMapping(value = "/fileUploadDone", method = RequestMethod.POST)
    public ModelAndView fileUploadDone(MultipartHttpServletRequest multipartHttpServletRequest
                    , @RequestParam Map<String, Object> params
                    , ModelAndView modelAndView) {

        List attachfiles = mangoUtils.getAttachFiles(multipartHttpServletRequest, params);

        params.put("attachfiles", attachfiles);
        
        Object resultMap = mangoSurveyService.insertWithFilesAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("mango/user_management");
        return modelAndView;
    }

    // 0130 페이지네이션 추가
    @RequestMapping(value = {"/adminUserList/{currentPage}"}, method = RequestMethod.GET)
    public ModelAndView listPagination(@RequestParam Map<String, Object> params
            , @PathVariable String currentPage, ModelAndView modelAndView) {
        params.put("currentPage", Integer.parseInt(currentPage));
        Object resultMap = mangoSurveyService.getListWithPagination(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("mango/user_management");
        return modelAndView;
    }
}
