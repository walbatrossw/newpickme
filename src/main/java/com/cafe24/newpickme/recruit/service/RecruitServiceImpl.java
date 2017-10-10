package com.cafe24.newpickme.recruit.service;

import com.cafe24.newpickme.recruit.domain.*;
import com.cafe24.newpickme.recruit.repository.RecruitDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
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
    public void create(Recruit recruit) {
        // 채용공고 사진파일
        if (!recruit.getRecruitImage().isEmpty()) {
            String recruitImageName = recruit.getRecruitImage().getOriginalFilename(); // 원본파일명 추출
            String path = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\recruits\\"; // 업로드 디렉토리
            try {
                new File(path).mkdir(); // 디렉토리 생성
                recruit.getRecruitImage().transferTo(new File(path+recruitImageName)); // 파일을 생성된 디렉토리로 전송
            } catch (Exception e) {
                e.printStackTrace();
            }
            recruit.setRecruitImageName(recruitImageName); // 파일명을 setting
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

    // 채용 상세 보기
    @Override
    public Recruit getRecruitByRecruitId(int recruitId) {
        return recruitDao.selectRecruitByRecruitId(recruitId);
    }

    // 채용 수정 처리
    @Override
    public void modifyRecruit(Recruit recruit) {
        // 채용공고 사진파일
        if (!recruit.getRecruitImage().isEmpty()) {
            String recruitImageName = recruit.getRecruitImage().getOriginalFilename(); // 원본파일명 추출
            String path = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\recruits\\"; // 업로드 디렉토리
            try {
                new File(path).mkdir(); // 디렉토리 생성
                recruit.getRecruitImage().transferTo(new File(path+recruitImageName)); // 파일을 생성된 디렉토리로 전송
            } catch (Exception e) {
                e.printStackTrace();
            }
            recruit.setRecruitImageName(recruitImageName); // 파일명을 setting
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

    // 채용 달력 페이지
}
