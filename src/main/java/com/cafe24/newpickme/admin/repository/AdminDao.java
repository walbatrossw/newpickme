package com.cafe24.newpickme.admin.repository;

import com.cafe24.newpickme.admin.domain.Admin;

public interface AdminDao {

    /*관리자 가입 처리*/
    void insert(Admin admin);

    /*관리자 이메일 중복 확인*/
    int selectOneByEmail(String adminEmail);

    /*관리자 닉네임 중복 확인*/
    int selectOneByNickName(String adminNickName);

    /*관리자 닉네임 변경*/
    void updateAdminNickName(Admin admin);

    /*관리자 비밀번호 변경*/
    void updateAdminPassword(Admin admin);

    /*관리자 정보 상세조회*/
    Admin selectOneById(int adminId);

    /*관리자 탈퇴*/
    void delete(Admin admin);

    /*관리자 비밀번호 확인*/
    String selectPasswordByAdminEmail(String adminEmail);

    /*관리자 로그인 처리*/
    Admin login(Admin admin);

    /*관리자 로그인 시간 수정*/
    void updateLoginDate(String adminEmail);

}
