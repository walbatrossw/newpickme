package com.cafe24.newpickme.company.service;

import com.cafe24.newpickme.company.domain.Company;
import com.cafe24.newpickme.company.domain.IndustryCategory1;
import com.cafe24.newpickme.company.domain.IndustryCategory2;

import java.util.List;

public interface CompanyService {

    /*기업정보 등록 페이지 : 업종대분류 목록*/
    List<IndustryCategory1> getListIndustryCategory1();

    /*기업정보 등록 페이지 : 업종소분류 목록*/
    List<IndustryCategory2> getListIndustryCategory2ByIndustryCategory1Id(int industryCategory1Id);

    /*기업정보 등록 처리*/
    void create(Company company);

    /*기업정보 목록*/
    List<Company> getCompanies();

    /*기업정보 상세조회*/
    Company getCompanyInfo(int companyId);

    /*기업정보 수정*/
    void modifyCompanyInfo(Company company);

    /*기업정보 삭제*/
    void removeCompanyInfo(int companyId);

}
