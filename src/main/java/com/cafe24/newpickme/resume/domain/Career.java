package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Career {

    private int careerId;

    private String careerCompany;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date careerBeginDate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date careerEndDate;

    private String careerPosition;

    private String careerDepartment;

    private String careerTask;

    private String careerResign;

    private int resumeId;
    private Resume resume;

    public int getCareerId() {
        return careerId;
    }

    public void setCareerId(int careerId) {
        this.careerId = careerId;
    }

    public String getCareerCompany() {
        return careerCompany;
    }

    public void setCareerCompany(String careerCompany) {
        this.careerCompany = careerCompany;
    }

    public Date getCareerBeginDate() {
        return careerBeginDate;
    }

    public void setCareerBeginDate(Date careerBeginDate) {
        this.careerBeginDate = careerBeginDate;
    }

    public Date getCareerEndDate() {
        return careerEndDate;
    }

    public void setCareerEndDate(Date careerEndDate) {
        this.careerEndDate = careerEndDate;
    }

    public String getCareerPosition() {
        return careerPosition;
    }

    public void setCareerPosition(String careerPosition) {
        this.careerPosition = careerPosition;
    }

    public String getCareerDepartment() {
        return careerDepartment;
    }

    public void setCareerDepartment(String careerDepartment) {
        this.careerDepartment = careerDepartment;
    }

    public String getCareerTask() {
        return careerTask;
    }

    public void setCareerTask(String careerTask) {
        this.careerTask = careerTask;
    }

    public String getCareerResign() {
        return careerResign;
    }

    public void setCareerResign(String careerResign) {
        this.careerResign = careerResign;
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
        return "Career{" +
                "careerId=" + careerId +
                ", careerCompany='" + careerCompany + '\'' +
                ", careerBeginDate=" + careerBeginDate +
                ", careerEndDate=" + careerEndDate +
                ", careerPosition='" + careerPosition + '\'' +
                ", careerDepartment='" + careerDepartment + '\'' +
                ", careerTask='" + careerTask + '\'' +
                ", careerResign='" + careerResign + '\'' +
                ", resumeId=" + resumeId +
                ", resume=" + resume +
                '}';
    }
}
