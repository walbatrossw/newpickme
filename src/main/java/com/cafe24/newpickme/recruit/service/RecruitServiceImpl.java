package com.cafe24.newpickme.recruit.service;

import com.cafe24.newpickme.recruit.domain.*;
import com.cafe24.newpickme.recruit.repository.RecruitDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecruitServiceImpl implements RecruitService{

    @Autowired
    RecruitDao recruitDao;

    /*채용 입력*/
    @Override
    public void create(Recruit recruit) {
        recruitDao.insert(recruit);
    }

    /*채용 직무 입력*/
    @Override
    public void create(RecruitJob recruitJob) {
        recruitDao.insert(recruitJob);
    }

    /*채용 직무별 자기소개서 항목*/
    @Override
    public void create(CoverLetterArticle coverLetterArticle) {
        recruitDao.insert(coverLetterArticle);
    }

    /*직무 대분류 목록*/
    @Override
    public List<JobCategory1> getJobCategory1List() {
        return recruitDao.selectListJobCategory1();
    }

    /*직무 소분류 목록*/
    @Override
    public List<JobCategory2> getJobCategory2List(int jobCategory1Id) {
        return recruitDao.selectListJobCategory2(jobCategory1Id);
    }

    /*기업 아이디*/
    @Override
    public int getCompanyIdByCompanyName(String companyName) {
        return recruitDao.selectCompanyIdByCompanyName(companyName);
    }

    /*채용 목록*/
    @Override
    public List<Recruit> getRecruits() {
        return recruitDao.selectListRecruits();
    }

    /*채용 상세*/
    @Override
    public Recruit getRecruit(int recruitId) {
        return recruitDao.selectOneByRecruitId(recruitId);
    }

    /*채용 직무 목록*/
    @Override
    public List<RecruitJob> getRecruitJobsByRecruitId(int recruitId) {
        return recruitDao.selectRecruitJobsByRecruitId(recruitId);
    }

    /*채용 직무별 자소서 목록*/
    @Override
    public List<CoverLetterArticle> getCoverLetterArticlesByRecruitJobId(int recruitJobId) {
        return recruitDao.selectCoverLetterArticlesByRecruitJobId(recruitJobId);
    }

    /*채용 수정*/
    @Override
    public void modify(int recruitId) {

    }

    /*채용 삭제*/
    @Override
    public void remove(int recruitId) {

    }

}
