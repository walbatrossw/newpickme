package com.cafe24.newpickme.recruit.domain;

public class CoverLetterArticle {

    private int coverletterArticleId;       // 채용직무 자기소개서 항목 아이디
    private String coverletterArticleTitle; // 채용직무 자기소개서 항목

    private int recruitJobId;               // 채용직무 아이디
    private RecruitJob recruitJob;          // 채용직무

    public int getCoverletterArticleId() {
        return coverletterArticleId;
    }

    public void setCoverletterArticleId(int coverletterArticleId) {
        this.coverletterArticleId = coverletterArticleId;
    }

    public String getCoverletterArticleTitle() {
        return coverletterArticleTitle;
    }

    public void setCoverletterArticleTitle(String coverletterArticleTitle) {
        this.coverletterArticleTitle = coverletterArticleTitle;
    }

    public int getRecruitJobId() {
        return recruitJobId;
    }

    public void setRecruitJobId(int recruitJobId) {
        this.recruitJobId = recruitJobId;
    }

    public RecruitJob getRecruitJob() {
        return recruitJob;
    }

    public void setRecruitJob(RecruitJob recruitJob) {
        this.recruitJob = recruitJob;
    }

    @Override
    public String toString() {
        return "CoverLetterArticle{" +
                "coverletterArticleId=" + coverletterArticleId +
                ", coverletterArticleTitle='" + coverletterArticleTitle + '\'' +
                ", recruitJobId=" + recruitJobId +
                ", recruitJob=" + recruitJob +
                '}';
    }
}
