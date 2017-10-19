package com.cafe24.newpickme.company.repository;

import com.cafe24.newpickme.company.domain.Company;
import com.cafe24.newpickme.company.domain.IndustryCategory1;
import com.cafe24.newpickme.company.domain.IndustryCategory2;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CompanyDaoImpl implements CompanyDao{

    @Autowired
    SqlSession sqlSession;

    /*기업정보 등록 페이지 : 업종대분류 목록*/
    @Override
    public List<IndustryCategory1> selectIndustryCategory1s() {
        return sqlSession.selectList("company.selectIndustryCategory1s");
    }

    /*기업정보 등록 페이지 : 업종소분류 목록*/
    @Override
    public List<IndustryCategory2> selectIndustryCategory2sByIndustryCategory1Id(int industryCategory1Id) {
        return sqlSession.selectList("company.selectIndustryCategory2sByIndustryCategory1Id", industryCategory1Id);
    }

    /*기업정보 등록 처리*/
    @Override
    public void insert(Company company) {
        sqlSession.insert("company.insertCompany", company);
    }

    /*기업정보 목록*/
    @Override
    public List<Company> selectList() {
        return sqlSession.selectList("company.selectList");
    }

    /*기업정보 상세조회*/
    @Override
    public Company selectCompanyByCompanyId(int companyId) {
        return sqlSession.selectOne("company.selectCompanyByCompanyId", companyId);
    }

    /*기업정보 수정*/
    @Override
    public void updateCompanyInfo(Company company) {
        sqlSession.update("company.updateCompanyInfo", company);
    }

    /*기업정보 삭제*/
    @Override
    public void deleteCompanyInfo(int companyId) {
        sqlSession.delete("company.deleteCompanyInfo", companyId);
    }

    /*기업 ID 조회*/
    @Override
    public int selectCompanyIdByCompanyName(String companyName) {
        return sqlSession.selectOne("company.selectCompanyIdByCompanyName", companyName);
    }

    @Override
    public String selectCompanyLogoImageName(int companyId) {
        return sqlSession.selectOne("company.selectCompanyLogoImageName", companyId);
    }

}
