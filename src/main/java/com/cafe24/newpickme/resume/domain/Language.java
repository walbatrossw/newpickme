package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Language {

    private int languageId;

    private String languageName;

    private String languageGrade;

    private String languageHost;

    private String languageNumber;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date languageBeginDate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date languageEndDate;

    private int resumeId;

    private Resume resume;

    public int getLanguageId() {
        return languageId;
    }

    public void setLanguageId(int languageId) {
        this.languageId = languageId;
    }

    public String getLanguageName() {
        return languageName;
    }

    public void setLanguageName(String languageName) {
        this.languageName = languageName;
    }

    public String getLanguageGrade() {
        return languageGrade;
    }

    public void setLanguageGrade(String languageGrade) {
        this.languageGrade = languageGrade;
    }

    public String getLanguageHost() {
        return languageHost;
    }

    public void setLanguageHost(String languageHost) {
        this.languageHost = languageHost;
    }

    public String getLanguageNumber() {
        return languageNumber;
    }

    public void setLanguageNumber(String languageNumber) {
        this.languageNumber = languageNumber;
    }

    public Date getLanguageBeginDate() {
        return languageBeginDate;
    }

    public void setLanguageBeginDate(Date languageBeginDate) {
        this.languageBeginDate = languageBeginDate;
    }

    public Date getLanguageEndDate() {
        return languageEndDate;
    }

    public void setLanguageEndDate(Date languageEndDate) {
        this.languageEndDate = languageEndDate;
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
        return "Language{" +
                "languageId=" + languageId +
                ", languageName='" + languageName + '\'' +
                ", languageGrade='" + languageGrade + '\'' +
                ", languageHost='" + languageHost + '\'' +
                ", languageNumber='" + languageNumber + '\'' +
                ", languageBeginDate=" + languageBeginDate +
                ", languageEndDate=" + languageEndDate +
                ", resumeId=" + resumeId +
                ", resume=" + resume +
                '}';
    }
}
