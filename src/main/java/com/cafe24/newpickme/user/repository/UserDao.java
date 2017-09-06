package com.cafe24.newpickme.user.repository;

import com.cafe24.newpickme.user.domain.User;

import java.util.List;

public interface UserDao {

    /*회원가입*/
    void insert(User user);

    /*회원가입 이메일 중복 확인*/
    int selectCountByEmail(String userEmail);

    /*회원가입 이름 중복 확인*/
    int selectCountByNickName(String userNickName);

    /*회원 목록*/
    List<User> selectList();

    /*회원 정보 상세조회*/
    User selectOneById(int userId);

    /*회원 닉네임 변경*/
    void updateUserNickName(User user);

    /*회원 비밀번호 변경*/
    void updateUserPassword(User user);

    /*회원 삭제, 탈퇴*/
    void delete(User user);

    /*회원 정보 수정, 삭제를 위한 비밀번호 확인*/
    String getPassword(String userEmail);

    /*로그인*/
    User login(User user);

    /*로그인시간 수정*/
    void updateLoginDate(String userEmail);
}
