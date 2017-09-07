package com.cafe24.newpickme.admin.service;

import com.cafe24.newpickme.admin.domain.Admin;


import javax.servlet.http.HttpSession;

public interface AdminService {

    /*관리자 가입 처리*/
    void create(Admin admin);

    /*관리자 이메일 중복 확인*/
    int getOneByEmail(String adminEmail);

    /*관리자 닉네임 중복 확인*/
    int getOneByNickName(String adminNickName);

    /*관리자 프로필*/
    Admin getAdminById(int adminId);

    /*관리자 닉네임 변경*/
    void modifyAdminNickName(Admin admin);

    /*관리자 비밀번호 변경*/
    void modifyAdminPassword(Admin admin);

    /*관리자 탈퇴*/
    void remove(Admin admin);

    /*관리자 비밀번호 확인*/
    boolean getPassword(String adminEmail, String adminPassword);

    /*관리자 로그인 처리*/
    boolean login(Admin admin, HttpSession session);

    /*관리자 로그인 시간 수정*/
    void modifyAdminLoginDate(String userEmail);

    /*관리자 로그아웃 처리*/
    void logout(HttpSession session);

}
