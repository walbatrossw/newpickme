package com.cafe24.newpickme.company.service;

import com.cafe24.newpickme.commons.fileupload.UploadFileUtils;
import com.cafe24.newpickme.company.domain.Company;
import com.cafe24.newpickme.company.domain.IndustryCategory1;
import com.cafe24.newpickme.company.domain.IndustryCategory2;
import com.cafe24.newpickme.company.repository.CompanyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    CompanyDao companyDao;

    //기업정보 등록 페이지 : 업종대분류 목록
    @Override
    public List<IndustryCategory1> getIndustryCategory1s() {
        return companyDao.selectIndustryCategory1s();
    }

    //기업정보 등록 페이지 : 업종소분류 목록
    @Override
    public List<IndustryCategory2> getIndustryCategory2sByIndustryCategory1Id(int industryCategory1Id) {
        return companyDao.selectIndustryCategory2sByIndustryCategory1Id(industryCategory1Id);
    }

    //기업정보 등록 및 수정 처리
    @Transactional
    @Override
    public void create(Company company, HttpServletRequest request) throws IOException {
        // 업로드 이미지 파일이 있으면
        if (!company.getCompanyLogoImage().isEmpty()) {
            final String REAL_PATH = request.getSession().getServletContext().getRealPath("/")+"resources/dist/img/companies/logos/"; // 서버 업로드 디렉토리
            final String PATH = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\companies\\logos\\"; // 로컬 업로드 디렉토리
            // 이미지 파일 수정처리의 경우 (기존의 파일 삭제)
            if (company.getCompanyId() != 0) {
                String oldCompanyLogoImageName = companyDao.selectCompanyLogoImageName(company.getCompanyId());
                if (oldCompanyLogoImageName != null && !oldCompanyLogoImageName.equals("")) {
                    new File(PATH + oldCompanyLogoImageName.replace('/', File.separatorChar)).delete();
                }
            }
            String originalFilename = company.getCompanyLogoImage().getOriginalFilename(); // 원본파일명 추출
            byte[] file = company.getCompanyLogoImage().getBytes(); // 파일 추출
            try {
                // 파일 업로드, 경로+UUID+파일명 생성
                String newCompanyLogoImageName = UploadFileUtils.uploadFile(PATH, originalFilename, file);
                company.setCompanyLogoImageName(newCompanyLogoImageName);
                companyDao.insert(company);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //기업정보 목록
    @Override
    public List<Company> getCompanies() {
        return companyDao.selectList();
    }

    //기업정보 상세조회
    @Override
    public Company getCompanyInfo(int companyId) {
        return companyDao.selectCompanyByCompanyId(companyId);
    }

    //기업정보 수정
    @Override
    public void modifyCompanyInfo(Company company) {
        if (!company.getCompanyLogoImage().isEmpty()) {
            String companyLogoImageName = company.getCompanyLogoImage().getOriginalFilename(); // 원본파일명 추출
            String path = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\companies\\"; // 업로드 디렉토리
            try {
                new File(path).mkdir(); // 디렉토리 생성
                company.getCompanyLogoImage().transferTo(new File(path+companyLogoImageName)); // 파일을 생성된 디렉토리로 전송
            } catch (Exception e) {
                e.printStackTrace();
            }
            company.setCompanyLogoImageName(companyLogoImageName); // 파일명을 setting
        }
        companyDao.updateCompanyInfo(company);
    }

    //기업정보 삭제
    @Override
    public void removeCompanyInfo(int companyId) {
        companyDao.deleteCompanyInfo(companyId);
    }

    //기업 ID 조회
    @Override
    public int getCompanyIdByCompanyName(String companyName) {
        return companyDao.selectCompanyIdByCompanyName(companyName);
    }

}
