package com.cafe24.newpickme.coverletter.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class UserCoverLetter {

    private int userCoverLetterId;              // 자기소개서 id
    private int recruitJobId;                   // 채용직무 id
    private int userId;                         // 회원 id
    private String userCoverLetterName;         // 자기소개서 이름
    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
    private Date userCoverLetterEndDate;         // 회원이 설정한 마감제출 시간
    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
    private Date userCoverLetterWriteDate;      // 자기소개서 작성일시
    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
    private Date userCoverLetterUpdateDate;     // 자기소개서 수정일시
    private List<UserCoverLetterArticle> userCoverLetterArticles; // 자기소개서항목 리스트

    public int getUserCoverLetterId() {
        return userCoverLetterId;
    }

    public void setUserCoverLetterId(int userCoverLetterId) {
        this.userCoverLetterId = userCoverLetterId;
    }

    public int getRecruitJobId() {
        return recruitJobId;
    }

    public void setRecruitJobId(int recruitJobId) {
        this.recruitJobId = recruitJobId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserCoverLetterName() {
        return userCoverLetterName;
    }

    public void setUserCoverLetterName(String userCoverLetterName) {
        this.userCoverLetterName = userCoverLetterName;
    }

    public Date getUserCoverLetterEndDate() {
        return userCoverLetterEndDate;
    }

    public void setUserCoverLetterEndDate(Date userCoverLetterEndDate) {
        this.userCoverLetterEndDate = userCoverLetterEndDate;
    }

    public Date getUserCoverLetterWriteDate() {
        return userCoverLetterWriteDate;
    }

    public void setUserCoverLetterWriteDate(Date userCoverLetterWriteDate) {
        this.userCoverLetterWriteDate = userCoverLetterWriteDate;
    }

    public Date getUserCoverLetterUpdateDate() {
        return userCoverLetterUpdateDate;
    }

    public void setUserCoverLetterUpdateDate(Date userCoverLetterUpdateDate) {
        this.userCoverLetterUpdateDate = userCoverLetterUpdateDate;
    }

    public List<UserCoverLetterArticle> getUserCoverLetterArticles() {
        return userCoverLetterArticles;
    }

    public void setUserCoverLetterArticles(List<UserCoverLetterArticle> userCoverLetterArticles) {
        this.userCoverLetterArticles = userCoverLetterArticles;
    }

    @Override
    public String toString() {
        return "UserCoverLetter{" +
                "userCoverLetterId=" + userCoverLetterId +
                ", recruitJobId=" + recruitJobId +
                ", userId=" + userId +
                ", userCoverLetterName='" + userCoverLetterName + '\'' +
                ", userCoverLetterEndDate=" + userCoverLetterEndDate +
                ", userCoverLetterWriteDate=" + userCoverLetterWriteDate +
                ", userCoverLetterUpdateDate=" + userCoverLetterUpdateDate +
                ", userCoverLetterArticles=" + userCoverLetterArticles +
                '}';
    }
}
