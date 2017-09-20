package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Personal {

    private int personalId;

    private String personalName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date personalBirthDate;

    private String personalGender;

    private String personalPhone;

    private String personalEmail;

    private String personalSns;

    private String personalAddress;

    private String personalImage;

    private int resumeId;

    private Resume resume;

    public int getPersonalId() {
        return personalId;
    }

    public void setPersonalId(int personalId) {
        this.personalId = personalId;
    }

    public String getPersonalName() {
        return personalName;
    }

    public void setPersonalName(String personalName) {
        this.personalName = personalName;
    }

    public Date getPersonalBirthDate() {
        return personalBirthDate;
    }

    public void setPersonalBirthDate(Date personalBirthDate) {
        this.personalBirthDate = personalBirthDate;
    }

    public String getPersonalGender() {
        return personalGender;
    }

    public void setPersonalGender(String personalGender) {
        this.personalGender = personalGender;
    }

    public String getPersonalPhone() {
        return personalPhone;
    }

    public void setPersonalPhone(String personalPhone) {
        this.personalPhone = personalPhone;
    }

    public String getPersonalEmail() {
        return personalEmail;
    }

    public void setPersonalEmail(String personalEmail) {
        this.personalEmail = personalEmail;
    }

    public String getPersonalSns() {
        return personalSns;
    }

    public void setPersonalSns(String personalSns) {
        this.personalSns = personalSns;
    }

    public String getPersonalAddress() {
        return personalAddress;
    }

    public void setPersonalAddress(String personalAddress) {
        this.personalAddress = personalAddress;
    }

    public String getPersonalImage() {
        return personalImage;
    }

    public void setPersonalImage(String personalImage) {
        this.personalImage = personalImage;
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
        return "Personal{" +
                "personalId=" + personalId +
                ", personalName='" + personalName + '\'' +
                ", personalBirthDate=" + personalBirthDate +
                ", personalGender='" + personalGender + '\'' +
                ", personalPhone='" + personalPhone + '\'' +
                ", personalEmail='" + personalEmail + '\'' +
                ", personalSns='" + personalSns + '\'' +
                ", personalAddress='" + personalAddress + '\'' +
                ", personalImage='" + personalImage + '\'' +
                ", resumeId=" + resumeId +
                ", resume=" + resume +
                '}';
    }
}
