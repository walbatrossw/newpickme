package com.cafe24.newpickme.company.service;

import com.cafe24.newpickme.company.domain.Company;
import com.cafe24.newpickme.company.domain.IndustryCategory1;
import com.cafe24.newpickme.company.domain.IndustryCategory2;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface CompanyService {

    // 기업정보 등록 페이지 : 업종대분류 목록
    List<IndustryCategory1> getIndustryCategory1s();

    // 기업정보 등록 페이지 : 업종소분류 목록
    List<IndustryCategory2> getIndustryCategory2sByIndustryCategory1Id(int industryCategory1Id);

    // 기업정보 등록 및 수정 처리
    void createAndModify(Company company, HttpServletRequest request) throws IOException;

    // 기업정보 목록
    List<Company> getCompanies();

    // 기업정보 상세조회
    Company getCompanyInfo(int companyId);

    // 기업정보 삭제
    void removeCompanyInfo(int companyId);

    // 기업 ID 조회
    int getCompanyIdByCompanyName(String companyName);
}
