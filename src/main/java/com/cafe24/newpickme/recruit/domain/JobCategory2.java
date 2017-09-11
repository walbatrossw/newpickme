package com.cafe24.newpickme.recruit.domain;

public class JobCategory2 {

    private int jobCategory2Id;         // 직무 소분류 아이디
    private String jobCategory2Name;    // 직무 소분류 명

    private int jobCategory1Id;         // 직무 대분류 아이디
    private JobCategory1 jobCategory1;  // 직무 대분류


    public int getJobCategory2Id() {
        return jobCategory2Id;
    }

    public void setJobCategory2Id(int jobCategory2Id) {
        this.jobCategory2Id = jobCategory2Id;
    }

    public String getJobCategory2Name() {
        return jobCategory2Name;
    }

    public void setJobCategory2Name(String jobCategory2Name) {
        this.jobCategory2Name = jobCategory2Name;
    }

    public int getJobCategory1Id() {
        return jobCategory1Id;
    }

    public void setJobCategory1Id(int jobCategory1Id) {
        this.jobCategory1Id = jobCategory1Id;
    }

    public JobCategory1 getJobCategory1() {
        return jobCategory1;
    }

    public void setJobCategory1(JobCategory1 jobCategory1) {
        this.jobCategory1 = jobCategory1;
    }

    @Override
    public String toString() {
        return "JobCategory2{" +
                "jobCategory2Id=" + jobCategory2Id +
                ", jobCategory2Name='" + jobCategory2Name + '\'' +
                '}';
    }
}
