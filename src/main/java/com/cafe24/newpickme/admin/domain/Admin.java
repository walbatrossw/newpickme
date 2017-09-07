package com.cafe24.newpickme.admin.domain;


import java.util.Date;

public class Admin {

    private int adminId;
    private String adminEmail;
    private String adminNickName;
    private String adminPassword;
    private Date adminJoinDate;
    private Date adminUpdateDate;
    private Date adminLoginDate;

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminNickName() {
        return adminNickName;
    }

    public void setAdminNickName(String adminNickName) {
        this.adminNickName = adminNickName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public Date getAdminJoinDate() {
        return adminJoinDate;
    }

    public void setAdminJoinDate(Date adminJoinDate) {
        this.adminJoinDate = adminJoinDate;
    }

    public Date getAdminUpdateDate() {
        return adminUpdateDate;
    }

    public void setAdminUpdateDate(Date adminUpdateDate) {
        this.adminUpdateDate = adminUpdateDate;
    }

    public Date getAdminLoginDate() {
        return adminLoginDate;
    }

    public void setAdminLoginDate(Date adminLoginDate) {
        this.adminLoginDate = adminLoginDate;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminEmail='" + adminEmail + '\'' +
                ", adminNickName='" + adminNickName + '\'' +
                ", adminPassword='" + adminPassword + '\'' +
                ", adminJoinDate=" + adminJoinDate +
                ", adminUpdateDate=" + adminUpdateDate +
                ", adminLoginDate=" + adminLoginDate +
                '}';
    }
}
