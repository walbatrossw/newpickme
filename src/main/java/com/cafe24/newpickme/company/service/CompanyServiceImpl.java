package com.cafe24.newpickme.company.service;

import com.cafe24.newpickme.company.domain.Company;
import com.cafe24.newpickme.company.domain.IndustryCategory1;
import com.cafe24.newpickme.company.domain.IndustryCategory2;
import com.cafe24.newpickme.company.repository.CompanyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    CompanyDao companyDao;

    /*기업정보 등록 페이지 : 업종대분류 목록*/
    @Override
    public List<IndustryCategory1> getIndustryCategory1s() {
        return companyDao.selectIndustryCategory1s();
    }

    /*기업정보 등록 페이지 : 업종소분류 목록*/
    @Override
    public List<IndustryCategory2> getIndustryCategory2sByIndustryCategory1Id(int industryCategory1Id) {
        return companyDao.selectIndustryCategory2sByIndustryCategory1Id(industryCategory1Id);
    }

    /*기업정보 등록 처리*/
    @Override
    public void create(Company company) {
        companyDao.insert(company);
    }

    /*기업정보 목록*/
    @Override
    public List<Company> getCompanies() {
        return companyDao.selectList();
    }

    /*기업정보 상세조회*/
    @Override
    public Company getCompanyInfo(int companyId) {
        return companyDao.selectCompanyByCompanyId(companyId);
    }

    /*기업정보 수정*/
    @Override
    public void modifyCompanyInfo(Company company) {
        companyDao.updateCompanyInfo(company);
    }

    /*기업정보 삭제*/
    @Override
    public void removeCompanyInfo(int companyId) {
        companyDao.deleteCompanyInfo(companyId);
    }

    /*기업 ID 조회*/
    @Override
    public int getCompanyIdByCompanyName(String companyName) {
        return companyDao.selectCompanyIdByCompanyName(companyName);
    }

}
