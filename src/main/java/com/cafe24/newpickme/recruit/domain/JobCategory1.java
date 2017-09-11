package com.cafe24.newpickme.recruit.domain;


public class JobCategory1 {

    private int jobCategory1Id;         // 직무 대분류 아이디
    private String jobCategory1Name;    // 직무 대분류 명

    public int getJobCategory1Id() {
        return jobCategory1Id;
    }

    public void setJobCategory1Id(int jobCategory1Id) {
        this.jobCategory1Id = jobCategory1Id;
    }

    public String getJobCategory1Name() {
        return jobCategory1Name;
    }

    public void setJobCategory1Name(String jobCategory1Name) {
        this.jobCategory1Name = jobCategory1Name;
    }

    @Override
    public String toString() {
        return "JobCategory1{" +
                "jobCategory1Id=" + jobCategory1Id +
                ", jobCategory1Name='" + jobCategory1Name + '\'' +
                '}';
    }
}
