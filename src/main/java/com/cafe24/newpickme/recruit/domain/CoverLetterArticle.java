package com.cafe24.newpickme.recruit.domain;

public class CoverLetterArticle {

    private int coverLetterArticleId;       // 채용직무 자기소개서 항목 아이디
    private String coverLetterArticleTitle; // 채용직무 자기소개서 항목

    private int recruitJobId;               // 채용직무 아이디
    private RecruitJob recruitJob;          // 채용직무

    public int getCoverLetterArticleId() {
        return coverLetterArticleId;
    }

    public void setCoverLetterArticleId(int coverLetterArticleId) {
        this.coverLetterArticleId = coverLetterArticleId;
    }

    public String getCoverLetterArticleTitle() {
        return coverLetterArticleTitle;
    }

    public void setCoverLetterArticleTitle(String coverLetterArticleTitle) {
        this.coverLetterArticleTitle = coverLetterArticleTitle;
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
                "coverLetterArticleId=" + coverLetterArticleId +
                ", coverLetterArticleTitle='" + coverLetterArticleTitle + '\'' +
                ", recruitJobId=" + recruitJobId +
                '}';
    }
}
