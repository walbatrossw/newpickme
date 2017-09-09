package com.cafe24.newpickme.recruit.domain;

import com.cafe24.newpickme.admin.domain.Admin;
import com.cafe24.newpickme.company.domain.Company;

import java.util.Date;
import java.util.List;

public class Recruit {

    private int recruitId;          // 채용 아이디
    private String recruitName;     // 채용 이름
    private Date recruitBeginDate;  // 채용 시작일시
    private Date recruitEndDate;    // 채용 마감일시
    private Date recruitWriteDate;  // 채용 등록일시
    private Date recruitUpdateDate; // 채용 수정일시

    private int companyId;          // 기업 아이디
    private Company company;        // 기업

    private int adminId;            // 관리자 아이디
    private Admin admin;            // 관리자

    private List<RecruitJob> recruitJobs;   // 채용직무 리스트

    public int getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(int recruitId) {
        this.recruitId = recruitId;
    }

    public String getRecruitName() {
        return recruitName;
    }

    public void setRecruitName(String recruitName) {
        this.recruitName = recruitName;
    }

    public Date getRecruitBeginDate() {
        return recruitBeginDate;
    }

    public void setRecruitBeginDate(Date recruitBeginDate) {
        this.recruitBeginDate = recruitBeginDate;
    }

    public Date getRecruitEndDate() {
        return recruitEndDate;
    }

    public void setRecruitEndDate(Date recruitEndDate) {
        this.recruitEndDate = recruitEndDate;
    }

    public Date getRecruitWriteDate() {
        return recruitWriteDate;
    }

    public void setRecruitWriteDate(Date recruitWriteDate) {
        this.recruitWriteDate = recruitWriteDate;
    }

    public Date getRecruitUpdateDate() {
        return recruitUpdateDate;
    }

    public void setRecruitUpdateDate(Date recruitUpdateDate) {
        this.recruitUpdateDate = recruitUpdateDate;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
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

    public List<RecruitJob> getRecruitJobs() {
        return recruitJobs;
    }

    public void setRecruitJobs(List<RecruitJob> recruitJobs) {
        this.recruitJobs = recruitJobs;
    }

    @Override
    public String toString() {
        return "Recruit{" +
                "recruitId=" + recruitId +
                ", recruitName='" + recruitName + '\'' +
                ", recruitBeginDate=" + recruitBeginDate +
                ", recruitEndDate=" + recruitEndDate +
                ", recruitWriteDate=" + recruitWriteDate +
                ", recruitUpdateDate=" + recruitUpdateDate +
                ", companyId=" + companyId +
                ", company=" + company +
                ", adminId=" + adminId +
                ", admin=" + admin +
                ", recruitJobs=" + recruitJobs +
                '}';
    }
}
