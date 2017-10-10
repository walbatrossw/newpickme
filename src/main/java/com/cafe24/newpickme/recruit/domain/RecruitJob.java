package com.cafe24.newpickme.recruit.domain;

import java.util.List;

public class RecruitJob {

    private int recruitJobId;       // 채용직무 아이디
    private String recruitJobType;  // 채용직무 형태
    private String recruitJobEdu;   // 채용직무 학력
    private String recruitJobDetail;// 채용직무 상세설명

    private int recruitId;          // 채용 아이디
    private Recruit recruit;        // 채용

    private int jobCategory2Id;         // 직무 소분류 아이디
    private JobCategory2 jobCategory2;  // 직무 소분류

    private List<CoverLetterArticle> coverLetterArticles; // 채용직무 자기소개서 항목 리스트

    public int getRecruitJobId() {
        return recruitJobId;
    }

    public void setRecruitJobId(int recruitJobId) {
        this.recruitJobId = recruitJobId;
    }

    public String getRecruitJobType() {
        return recruitJobType;
    }

    public void setRecruitJobType(String recruitJobType) {
        this.recruitJobType = recruitJobType;
    }

    public String getRecruitJobEdu() {
        return recruitJobEdu;
    }

    public void setRecruitJobEdu(String recruitJobEdu) {
        this.recruitJobEdu = recruitJobEdu;
    }

    public String getRecruitJobDetail() {
        return recruitJobDetail;
    }

    public void setRecruitJobDetail(String recruitJobDetail) {
        this.recruitJobDetail = recruitJobDetail;
    }

    public int getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(int recruitId) {
        this.recruitId = recruitId;
    }

    public Recruit getRecruit() {
        return recruit;
    }

    public void setRecruit(Recruit recruit) {
        this.recruit = recruit;
    }

    public int getJobCategory2Id() {
        return jobCategory2Id;
    }

    public void setJobCategory2Id(int jobCategory2Id) {
        this.jobCategory2Id = jobCategory2Id;
    }

    public JobCategory2 getJobCategory2() {
        return jobCategory2;
    }

    public void setJobCategory2(JobCategory2 jobCategory2) {
        this.jobCategory2 = jobCategory2;
    }

    public List<CoverLetterArticle> getCoverLetterArticles() {
        return coverLetterArticles;
    }

    public void setCoverLetterArticles(List<CoverLetterArticle> coverLetterArticles) {
        this.coverLetterArticles = coverLetterArticles;
    }

    @Override
    public String toString() {
        return "RecruitJob{" +
                "recruitJobId=" + recruitJobId +
                ", recruitJobType='" + recruitJobType + '\'' +
                ", recruitJobEdu='" + recruitJobEdu + '\'' +
                ", recruitJobDetail='" + recruitJobDetail + '\'' +
                ", recruitId=" + recruitId +
                ", jobCategory2Id=" + jobCategory2Id +
                ", jobCategory2=" + jobCategory2 +
                ", coverLetterArticles=" + coverLetterArticles +
                '}';
    }
}
