package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Certificate {

    private int certificateId;

    private String certificateName;

    private String certificateGrade;

    private String certificateHost;

    private String certificateNumber;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date certificateBeginDate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date certificateEndDate;

    private int resumeId;

    private Resume resume;

    public int getCertificateId() {
        return certificateId;
    }

    public void setCertificateId(int certificateId) {
        this.certificateId = certificateId;
    }

    public String getCertificateName() {
        return certificateName;
    }

    public void setCertificateName(String certificateName) {
        this.certificateName = certificateName;
    }

    public String getCertificateGrade() {
        return certificateGrade;
    }

    public void setCertificateGrade(String certificateGrade) {
        this.certificateGrade = certificateGrade;
    }

    public String getCertificateHost() {
        return certificateHost;
    }

    public void setCertificateHost(String certificateHost) {
        this.certificateHost = certificateHost;
    }

    public String getCertificateNumber() {
        return certificateNumber;
    }

    public void setCertificateNumber(String certificateNumber) {
        this.certificateNumber = certificateNumber;
    }

    public Date getCertificateBeginDate() {
        return certificateBeginDate;
    }

    public void setCertificateBeginDate(Date certificateBeginDate) {
        this.certificateBeginDate = certificateBeginDate;
    }

    public Date getCertificateEndDate() {
        return certificateEndDate;
    }

    public void setCertificateEndDate(Date certificateEndDate) {
        this.certificateEndDate = certificateEndDate;
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
        return "Certificate{" +
                "certificateId=" + certificateId +
                ", certificateName='" + certificateName + '\'' +
                ", certificateGrade='" + certificateGrade + '\'' +
                ", certificateHost='" + certificateHost + '\'' +
                ", certificateNumber='" + certificateNumber + '\'' +
                ", certificateBeginDate=" + certificateBeginDate +
                ", certificateEndDate=" + certificateEndDate +
                ", resumeId=" + resumeId +
                ", resume=" + resume +
                '}';
    }
}
