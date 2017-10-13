package com.cafe24.newpickme.coverletter.domain;

public class UserCoverLetterArticle {

    private int userCoverLetterArticleId;           // 자기소개서 항목 id
    private int userCoverLetterId;                      // 자기소개서 id
    private String userCoverLetterArticleTitle;     // 자기소개서 제목
    private String userCoverLetterArticleContent;   // 자기소개서 내용

    public int getUserCoverLetterArticleId() {
        return userCoverLetterArticleId;
    }

    public void setUserCoverLetterArticleId(int userCoverLetterArticleId) {
        this.userCoverLetterArticleId = userCoverLetterArticleId;
    }

    public int getUserCoverLetterId() {
        return userCoverLetterId;
    }

    public void setUserCoverLetterId(int userCoverLetterId) {
        this.userCoverLetterId = userCoverLetterId;
    }

    public String getUserCoverLetterArticleTitle() {
        return userCoverLetterArticleTitle;
    }

    public void setUserCoverLetterArticleTitle(String userCoverLetterArticleTitle) {
        this.userCoverLetterArticleTitle = userCoverLetterArticleTitle;
    }

    public String getUserCoverLetterArticleContent() {
        return userCoverLetterArticleContent;
    }

    public void setUserCoverLetterArticleContent(String userCoverLetterArticleContent) {
        this.userCoverLetterArticleContent = userCoverLetterArticleContent;
    }

    @Override
    public String toString() {
        return "UserCoverLetterArticle{" +
                "userCoverLetterArticleId=" + userCoverLetterArticleId +
                ", userCoverLetterId=" + userCoverLetterId +
                ", userCoverLetterArticleTitle='" + userCoverLetterArticleTitle + '\'' +
                ", userCoverLetterArticleContent='" + userCoverLetterArticleContent + '\'' +
                '}';
    }
}
