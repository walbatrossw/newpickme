package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class University {

    private int universityId;

    private String universityName;

    private String universityType;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date universityBeginDate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date universityEndDate;

    private String universityMojor;

    private String universityDoubleMajor;

    private String universityCredit;

    private int resumeId;

    private Resume resume;

    public int getUniversityId() {
        return universityId;
    }

    public void setUniversityId(int universityId) {
        this.universityId = universityId;
    }

    public String getUniversityName() {
        return universityName;
    }

    public void setUniversityName(String universityName) {
        this.universityName = universityName;
    }

    public String getUniversityType() {
        return universityType;
    }

    public void setUniversityType(String universityType) {
        this.universityType = universityType;
    }

    public Date getUniversityBeginDate() {
        return universityBeginDate;
    }

    public void setUniversityBeginDate(Date universityBeginDate) {
        this.universityBeginDate = universityBeginDate;
    }

    public Date getUniversityEndDate() {
        return universityEndDate;
    }

    public void setUniversityEndDate(Date universityEndDate) {
        this.universityEndDate = universityEndDate;
    }

    public String getUniversityMojor() {
        return universityMojor;
    }

    public void setUniversityMojor(String universityMojor) {
        this.universityMojor = universityMojor;
    }

    public String getUniversityDoubleMajor() {
        return universityDoubleMajor;
    }

    public void setUniversityDoubleMajor(String universityDoubleMajor) {
        this.universityDoubleMajor = universityDoubleMajor;
    }

    public String getUniversityCredit() {
        return universityCredit;
    }

    public void setUniversityCredit(String universityCredit) {
        this.universityCredit = universityCredit;
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
        return "University{" +
                "universityId=" + universityId +
                ", universityName='" + universityName + '\'' +
                ", universityType='" + universityType + '\'' +
                ", universityBeginDate=" + universityBeginDate +
                ", universityEndDate=" + universityEndDate +
                ", universityMojor='" + universityMojor + '\'' +
                ", universityDoubleMajor='" + universityDoubleMajor + '\'' +
                ", universityCredit='" + universityCredit + '\'' +
                ", resumeId=" + resumeId +
                ", resume=" + resume +
                '}';
    }
}
