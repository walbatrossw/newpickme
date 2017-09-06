package com.cafe24.newpickme.user.domain;

import java.util.Date;

/*회원 클래스*/
public class User {

    private int userId;             // 회원 아이디
    private String userEmail;       // 회원 이메일
    private String userNickName;    // 회원 닉네임
    private String userPassword;    // 회원 비밀번호
    private Date userJoinDate;      // 회원 가입일시
    private Date userUpdateDate;    // 회원 수정일시
    private Date userLoginDate;     // 회원 로그인일시

    // GETTER, SETTER
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Date getUserJoinDate() {
        return userJoinDate;
    }

    public void setUserJoinDate(Date userJoinDate) {
        this.userJoinDate = userJoinDate;
    }

    public Date getUserUpdateDate() {
        return userUpdateDate;
    }

    public void setUserUpdateDate(Date userUpdateDate) {
        this.userUpdateDate = userUpdateDate;
    }

    public Date getUserLoginDate() {
        return userLoginDate;
    }

    public void setUserLoginDate(Date userLoginDate) {
        this.userLoginDate = userLoginDate;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userEmail='" + userEmail + '\'' +
                ", userNickName='" + userNickName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userJoinDate=" + userJoinDate +
                ", userUpdateDate=" + userUpdateDate +
                ", userLoginDate=" + userLoginDate +
                '}';
    }
}
