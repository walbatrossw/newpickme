package com.cafe24.newpickme.resume.domain;

import com.cafe24.newpickme.user.domain.User;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Resume {

    private int resumeId;

    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
    private Date resumeWriteDate;

    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
    private Date resumeUpdateDate;

    private int userId;

    private User user;

    private Personal personal;

    private HighSchool highSchool;

    private List<University> universities;

    private List<Language> languages;

    private List<Certificate> certificates;

    private List<Career> careers;

    private List<Activity> activities;

    private List<Etc> etcs;

    public int getResumeId() {
        return resumeId;
    }

    public void setResumeId(int resumeId) {
        this.resumeId = resumeId;
    }

    public Date getResumeWriteDate() {
        return resumeWriteDate;
    }

    public void setResumeWriteDate(Date resumeWriteDate) {
        this.resumeWriteDate = resumeWriteDate;
    }

    public Date getResumeUpdateDate() {
        return resumeUpdateDate;
    }

    public void setResumeUpdateDate(Date resumeUpdateDate) {
        this.resumeUpdateDate = resumeUpdateDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Personal getPersonal() {
        return personal;
    }

    public void setPersonal(Personal personal) {
        this.personal = personal;
    }

    public HighSchool getHighSchool() {
        return highSchool;
    }

    public void setHighSchool(HighSchool highSchool) {
        this.highSchool = highSchool;
    }

    public List<University> getUniversities() {
        return universities;
    }

    public void setUniversities(List<University> universities) {
        this.universities = universities;
    }

    public List<Language> getLanguages() {
        return languages;
    }

    public void setLanguages(List<Language> languages) {
        this.languages = languages;
    }

    public List<Certificate> getCertificates() {
        return certificates;
    }

    public void setCertificates(List<Certificate> certificates) {
        this.certificates = certificates;
    }

    public List<Career> getCareers() {
        return careers;
    }

    public void setCareers(List<Career> careers) {
        this.careers = careers;
    }

    public List<Activity> getActivities() {
        return activities;
    }

    public void setActivities(List<Activity> activities) {
        this.activities = activities;
    }

    public List<Etc> getEtcs() {
        return etcs;
    }

    public void setEtcs(List<Etc> etcs) {
        this.etcs = etcs;
    }

    @Override
    public String toString() {
        return "Resume{" +
                "resumeId=" + resumeId +
                ", resumeWriteDate=" + resumeWriteDate +
                ", resumeUpdateDate=" + resumeUpdateDate +
                ", userId=" + userId +
                ", user=" + user +
                ", personal=" + personal +
                ", highSchool=" + highSchool +
                ", universities=" + universities +
                ", languages=" + languages +
                ", certificates=" + certificates +
                ", careers=" + careers +
                ", activities=" + activities +
                ", etcs=" + etcs +
                '}';
    }
}
