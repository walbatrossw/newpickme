package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Etc {

    private int etcId;

    private String etcName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date etcBeginDate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date etcEndDate;

    private String etcContent;

    private int resumeId;

    private Resume resume;

    public int getEtcId() {
        return etcId;
    }

    public void setEtcId(int etcId) {
        this.etcId = etcId;
    }

    public String getEtcName() {
        return etcName;
    }

    public void setEtcName(String etcName) {
        this.etcName = etcName;
    }

    public Date getEtcBeginDate() {
        return etcBeginDate;
    }

    public void setEtcBeginDate(Date etcBeginDate) {
        this.etcBeginDate = etcBeginDate;
    }

    public Date getEtcEndDate() {
        return etcEndDate;
    }

    public void setEtcEndDate(Date etcEndDate) {
        this.etcEndDate = etcEndDate;
    }

    public String getEtcContent() {
        return etcContent;
    }

    public void setEtcContent(String etcContent) {
        this.etcContent = etcContent;
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
        return "Etc{" +
                "etcId=" + etcId +
                ", etcName='" + etcName + '\'' +
                ", etcBeginDate=" + etcBeginDate +
                ", etcEndDate=" + etcEndDate +
                ", etcContent='" + etcContent + '\'' +
                ", resumeId=" + resumeId +
                ", resume=" + resume +
                '}';
    }
}
