package com.cafe24.newpickme.company.domain;

import com.cafe24.newpickme.admin.domain.Admin;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Company {

    private int companyId;
    private String companyType;
    private String companyName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date companyBirthDate;
    private String companyCeo;
    private String companyAddress;
    private String companyPhone;
    private String companyHomePage;
    private String companySales;
    private Date companyRegisterDate;
    private Date companyUpdateDate;

    private int industryCategory2Id;
    private IndustryCategory2 industryCategory2;

    private int adminId;
    private Admin admin;

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getCompanyType() {
        return companyType;
    }

    public void setCompanyType(String companyType) {
        this.companyType = companyType;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Date getCompanyBirthDate() {
        return companyBirthDate;
    }

    public void setCompanyBirthDate(Date companyBirthDate) {
        this.companyBirthDate = companyBirthDate;
    }

    public String getCompanyCeo() {
        return companyCeo;
    }

    public void setCompanyCeo(String companyCeo) {
        this.companyCeo = companyCeo;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    public String getCompanyHomePage() {
        return companyHomePage;
    }

    public void setCompanyHomePage(String companyHomePage) {
        this.companyHomePage = companyHomePage;
    }

    public String getCompanySales() {
        return companySales;
    }

    public void setCompanySales(String companySales) {
        this.companySales = companySales;
    }

    public Date getCompanyRegisterDate() {
        return companyRegisterDate;
    }

    public void setCompanyRegisterDate(Date companyRegisterDate) {
        this.companyRegisterDate = companyRegisterDate;
    }

    public Date getCompanyUpdateDate() {
        return companyUpdateDate;
    }

    public void setCompanyUpdateDate(Date companyUpdateDate) {
        this.companyUpdateDate = companyUpdateDate;
    }

    public int getIndustryCategory2Id() {
        return industryCategory2Id;
    }

    public void setIndustryCategory2Id(int industryCategory2Id) {
        this.industryCategory2Id = industryCategory2Id;
    }

    public IndustryCategory2 getIndustryCategory2() {
        return industryCategory2;
    }

    public void setIndustryCategory2(IndustryCategory2 industryCategory2) {
        this.industryCategory2 = industryCategory2;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "Company{" +
                "companyId=" + companyId +
                ", companyType='" + companyType + '\'' +
                ", companyName='" + companyName + '\'' +
                ", companyBirthDate=" + companyBirthDate +
                ", companyCeo='" + companyCeo + '\'' +
                ", companyAddress='" + companyAddress + '\'' +
                ", companyPhone='" + companyPhone + '\'' +
                ", companyHomePage='" + companyHomePage + '\'' +
                ", companySales='" + companySales + '\'' +
                ", companyRegisterDate=" + companyRegisterDate +
                ", companyUpdateDate=" + companyUpdateDate +
                ", industryCategory2Id=" + industryCategory2Id +
                ", industryCategory2=" + industryCategory2 +
                ", adminId=" + adminId +
                ", admin=" + admin +
                '}';
    }
}
