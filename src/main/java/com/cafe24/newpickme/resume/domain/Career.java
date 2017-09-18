package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Career {

    private int careerId;

    private String company;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date careerBeginDate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date careerEndDate;

    private String careerPosition;

    private String Department;

    private String task;

    private String resign;

    private int resumeId;
    private Resume resume;

    public int getCareerId() {
        return careerId;
    }

    public void setCareerId(int careerId) {
        this.careerId = careerId;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
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

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String department) {
        Department = department;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getResign() {
        return resign;
    }

    public void setResign(String resign) {
        this.resign = resign;
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
                ", company='" + company + '\'' +
                ", careerBeginDate=" + careerBeginDate +
                ", careerEndDate=" + careerEndDate +
                ", careerPosition='" + careerPosition + '\'' +
                ", Department='" + Department + '\'' +
                ", task='" + task + '\'' +
                ", resign='" + resign + '\'' +
                ", resumeId=" + resumeId +
                ", resume=" + resume +
                '}';
    }
}
