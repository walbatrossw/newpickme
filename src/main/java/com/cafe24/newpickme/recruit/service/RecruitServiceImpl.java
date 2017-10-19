package com.cafe24.newpickme.recruit.service;

import com.cafe24.newpickme.commons.fileupload.UploadFileUtils;
import com.cafe24.newpickme.recruit.domain.*;
import com.cafe24.newpickme.recruit.repository.RecruitDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class RecruitServiceImpl implements RecruitService{

    @Autowired
    RecruitDao recruitDao;

    // 직무 대분류 리스트
    @Override
    public List<JobCategory1> getJobCategory1s() {
        return recruitDao.selectJobCategory1s();
    }

    // 직무 소분류 리스트
    @Override
    public List<JobCategory2> getJobCategory2sByJobCategory1Id(int jobCategory1Id) {
        return recruitDao.selectJobCategory2sByJobCategory1Id(jobCategory1Id);
    }

    // 채용 입력 처리
    @Override
    public void create(Recruit recruit, HttpServletRequest request) throws IOException {
        // 채용공고 이미지 파일이 있으면
        if (!recruit.getRecruitImage().isEmpty()) {
            final String REAL_PATH = request.getSession().getServletContext().getRealPath("/")+"resources/dist/img/recruits/"; // 서버 업로드 디렉토리
            final String PATH = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\recruits\\"; // 로컬 업로드 디렉토리
            String originalFileName = recruit.getRecruitImage().getOriginalFilename(); // 원본 파일이름 추출
            byte[] file = recruit.getRecruitImage().getBytes(); // 파일 추출
            try {
                // 파일 업로드, 경로 + UUID + 파일명 생성 처리
                String recruitImageName = UploadFileUtils.uploadFile(PATH, originalFileName, file);
                recruit.setRecruitImageName(recruitImageName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        recruitDao.insert(recruit); // 채용 입력 처리
        int recruitId = recruit.getRecruitId(); // 채용 id
        List<RecruitJob> recruitJobs = recruit.getRecruitJobs();
        for (RecruitJob recruitJob : recruitJobs) {
            recruitJob.setRecruitId(recruitId); // 채용 id setting
            recruitDao.insert(recruitJob); // 채용직무 입력 처리
            int recruitJobId = recruitJob.getRecruitJobId();
            List<CoverLetterArticle> coverLetterArticles = recruitJob.getCoverLetterArticles();
            for (CoverLetterArticle coverLetterArticle : coverLetterArticles) {
                coverLetterArticle.setRecruitJobId(recruitJobId); // 채용직무 id setting
                recruitDao.insert(coverLetterArticle); // 채용직무별 자기소개서항목 입력 처리
            }
        }
    }

    // 채용 목록
    @Override
    public List<Recruit> getRecruits() {
        return recruitDao.selectRecruits();
    }

    // 채용 달력 페이지
    @Override
    public List<Recruit> getRecruits(int[] jobCategory1Id, int[] industryCategory1Id, String[] companyType, String[] recruitJobType, String[] recruitJobEdu) {
        return recruitDao.selectRecruits(jobCategory1Id, industryCategory1Id, companyType, recruitJobType, recruitJobEdu);
    }

    // 채용 상세 보기
    @Override
    public Recruit getRecruitByRecruitId(int recruitId) {
        return recruitDao.selectRecruitByRecruitId(recruitId);
    }

    // 채용 직무
    @Override
    public RecruitJob getRecruitJobByRecruitJobId(int recruitJobId) {
        return recruitDao.selectRecruitJobByRecruitJobId(recruitJobId);
    }

    // 채용 수정 처리
    @Override
    public void modifyRecruit(Recruit recruit, HttpServletRequest request) throws IOException {
        // 채용공고 사진파일이 존재하면
        if (!recruit.getRecruitImage().isEmpty()) {
            final String REAL_PATH = request.getSession().getServletContext().getRealPath("/")+"resources/dist/img/recruits/"; // 서버 업로드 디렉토리
            final String PATH = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\recruits\\"; // 로컬 업로드 디렉토리
            String oldRecruitImageName = recruitDao.selectRecruitImageName(recruit.getRecruitId()); // 기존의 채용공고 사진파일명
            // 기존의 사진파일명이 존재하면 파일을 삭제
            if (oldRecruitImageName != null) {
                new File(PATH + oldRecruitImageName.replace('/', File.separatorChar)).delete();
            }
            String originalFileName = recruit.getRecruitImage().getOriginalFilename(); // 원본파일명 추출
            byte[] file = recruit.getRecruitImage().getBytes(); // 파일 추출
            try {
                String newRecruitImageName = UploadFileUtils.uploadFile(PATH, originalFileName, file);
                recruit.setRecruitImageName(newRecruitImageName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        recruitDao.updateRecruit(recruit);
    }

    // 채용직무 수정 처리 1 - 직무 일괄 수정
    @Override
    public void modifyRecruitJob(RecruitJob recruitJob) {
        recruitDao.updateRecruitJob(recruitJob);
    }

    // 채용직무 수정 처리 2 - 직무 추가
    @Override
    public void createRecruitJob(RecruitJob recruitJob) {
        recruitDao.insert(recruitJob);
        int recruitJobId = recruitJob.getRecruitJobId();
        List<CoverLetterArticle> coverLetterArticles = recruitJob.getCoverLetterArticles();
        for (CoverLetterArticle coverLetterArticle : coverLetterArticles) {
            coverLetterArticle.setRecruitJobId(recruitJobId);
            recruitDao.insert(coverLetterArticle);
        }
    }

    // 채용직무별 자기소개서 수정 처리
    @Override
    public void modifyArticle(CoverLetterArticle coverLetterArticle) {
        recruitDao.insert(coverLetterArticle);
    }

    // 채용 삭제처리
    @Override
    public void removeRecruit(int recruitId) {
        Recruit recruit = recruitDao.selectRecruitByRecruitId(recruitId);
        List<RecruitJob> recruitJobs = recruit.getRecruitJobs();
        for (RecruitJob recruitJob : recruitJobs) {
            int recruitJobId = recruitJob.getRecruitJobId();
            recruitDao.deleteCoverLetterArticles(recruitJobId); // 채용직무별 자기소개서항목 일괄 삭제
            recruitDao.deleteRecruitJob(recruitJobId); // 채용직무 삭제
        }
        recruitDao.deleteRecruit(recruitId); // 채용 삭제
    }

    // 채용직무 삭제처리
    @Override
    public void removeRecruitJob(int recruitJobId) {
        recruitDao.deleteCoverLetterArticles(recruitJobId); // 채용직무별 자기소개서 항목 일괄 삭제
        recruitDao.deleteRecruitJob(recruitJobId); // 채용직무 삭제
    }

    // 채용직무별 자기소개서항목 삭제처리
    @Override
    public void removeCoverLetterArticle(int coverLetterArticleId) {
        recruitDao.deleteCoverLetterArticle(coverLetterArticleId);
    }


}
