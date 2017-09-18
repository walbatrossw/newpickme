package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Personal {

    private int personalId;

    private String personalName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date personalbirthDate;

    private String personalPhone;

    private String personalSns;

    private String personalAdress;

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

    public Date getPersonalbirthDate() {
        return personalbirthDate;
    }

    public void setPersonalbirthDate(Date personalbirthDate) {
        this.personalbirthDate = personalbirthDate;
    }

    public String getPersonalPhone() {
        return personalPhone;
    }

    public void setPersonalPhone(String personalPhone) {
        this.personalPhone = personalPhone;
    }

    public String getPersonalSns() {
        return personalSns;
    }

    public void setPersonalSns(String personalSns) {
        this.personalSns = personalSns;
    }

    public String getPersonalAdress() {
        return personalAdress;
    }

    public void setPersonalAdress(String personalAdress) {
        this.personalAdress = personalAdress;
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
                ", personalbirthDate=" + personalbirthDate +
                ", personalPhone='" + personalPhone + '\'' +
                ", personalSns='" + personalSns + '\'' +
                ", personalAdress='" + personalAdress + '\'' +
                ", personalImage='" + personalImage + '\'' +
                ", resumeId=" + resumeId +
                ", resume=" + resume +
                '}';
    }
}
