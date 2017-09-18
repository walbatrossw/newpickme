package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class HighSchool {

    private int highSchoolId;

    private String highSchoolName;

    private String highSchoolType;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date highSchoolBeginDate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date highSchoolEndDate;

    private int resumeId;

    private Resume resume;

    public int getHighSchoolId() {
        return highSchoolId;
    }

    public void setHighSchoolId(int highSchoolId) {
        this.highSchoolId = highSchoolId;
    }

    public String getHighSchoolName() {
        return highSchoolName;
    }

    public void setHighSchoolName(String highSchoolName) {
        this.highSchoolName = highSchoolName;
    }

    public String getHighSchoolType() {
        return highSchoolType;
    }

    public void setHighSchoolType(String highSchoolType) {
        this.highSchoolType = highSchoolType;
    }

    public Date getHighSchoolBeginDate() {
        return highSchoolBeginDate;
    }

    public void setHighSchoolBeginDate(Date highSchoolBeginDate) {
        this.highSchoolBeginDate = highSchoolBeginDate;
    }

    public Date getHighSchoolEndDate() {
        return highSchoolEndDate;
    }

    public void setHighSchoolEndDate(Date highSchoolEndDate) {
        this.highSchoolEndDate = highSchoolEndDate;
    }

    public int getResumeId() {
        return resumeId;
    }

    public void setResumeId(int resumeId) {
        this.resumeId = resumeId;
    }

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }

    @Override
    public String toString() {
        return "HighSchool{" +
                "highSchoolId=" + highSchoolId +
                ", highSchoolName='" + highSchoolName + '\'' +
                ", highSchoolType='" + highSchoolType + '\'' +
                ", highSchoolBeginDate=" + highSchoolBeginDate +
                ", highSchoolEndDate=" + highSchoolEndDate +
                ", resumeId=" + resumeId +
                ", resume=" + resume +
                '}';
    }
}
