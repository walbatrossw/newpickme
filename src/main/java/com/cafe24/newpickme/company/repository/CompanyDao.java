package com.cafe24.newpickme.company.repository;

import com.cafe24.newpickme.company.domain.Company;
import com.cafe24.newpickme.company.domain.IndustryCategory1;
import com.cafe24.newpickme.company.domain.IndustryCategory2;

import java.util.List;

public interface CompanyDao {

    // 기업정보 등록 페이지 : 업종대분류 목록
    List<IndustryCategory1> selectIndustryCategory1s();

    // 기업정보 등록 페이지 : 업종소분류 목록
    List<IndustryCategory2> selectIndustryCategory2sByIndustryCategory1Id(int industryCategory1Id);

    // 기업정보 등록 및 수정 처리
    void insertAndUpdate(Company company);

    // 기업정보 목록
    List<Company> selectList();

    // 기업정보 상세조회
    Company selectCompanyByCompanyId(int companyId);

    // 기업정보 삭제
    void deleteCompanyInfo(int companyId);

    // 기업 ID 조회
    int selectCompanyIdByCompanyName(String companyName);

    //  기업 로고 이미지 파일명
    String selectCompanyLogoImageName(int companyId);
}
