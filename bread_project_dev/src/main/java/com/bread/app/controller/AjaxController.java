package com.bread.app.controller;


import java.sql.SQLException;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bread.app.dao.MemberDAO;

import lombok.AllArgsConstructor;

//Ajax 요청을 처리하는 전용 Controller
@RestController
@AllArgsConstructor
public class AjaxController {

    private MemberDAO memberDAO;
    
    //아이디 중복검사 처리 요청
    @PostMapping("/member/checkIdProcess.do")
    public String checkIdProcess(String member_id) throws SQLException {
        String result="0";//중복 아이디가 없는 경우 결과값
        
        int checkId = memberDAO.checkId(member_id);
        if(checkId != 0) { //중복일경우
            result = "1";//중복 아이디가 있는 경우 결과값
        }

        return result;
    }
    
    //닉네임 중복검사 처리 요청
    @PostMapping("/member/checkNicknameProcess.do")
    public String checkNicknameProcess(String member_nickname) throws SQLException {
        String result="0";//중복 닉네임이 없는 경우 결과값
        
        int checkNickname = memberDAO.checkNickname(member_nickname);
        if(checkNickname != 0) { //중복일경우
            result = "1";//중복 닉네임이 있는 경우 결과값
        }

        return result;
    }
}