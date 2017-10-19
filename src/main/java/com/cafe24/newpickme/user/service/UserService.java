package com.cafe24.newpickme.user.service;

import com.cafe24.newpickme.user.domain.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public interface UserService {

    /*회원가입 처리*/
    void create(User user);

    /*회원가입 이메일중복 확인*/
    int getOneByEmail(String userEmail);

    /*회원가입 닉네임 중복 확인*/
    int getOneByNickName(String userNickName);

    /*회원 목록*/
    List<User> getList();

    /*회원 정보 상세조회*/
    User getUserById(int userId);

    /*회원 닉네임 변경*/
    void modifyUserNickName(User user);

    /*회원 프로필 사진 변경*/
    void modifyUserProfileImage(User user, HttpServletRequest request, HttpSession session) throws IOException;

    /*회원 비밀번호 변경*/
    void modifyUserPassword(User user);

    /*회원 삭제, 탈퇴*/
    void remove(User user);

    /*회원 정보 수정, 삭제를 위한 비밀번호 확인*/
    boolean checkPassword(String userEmail, String userPassword);

    /*로그인 처리*/
    boolean login(User user, HttpSession session);

    /*로그인 시간 수정*/
    void modifyUserLoginDate(String userEmail);

    /*로그아웃*/
    void logout(HttpSession session);

    /*회원 목록*/
    List<User> getUsers();
}
