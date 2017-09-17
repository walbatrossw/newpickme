package com.cafe24.newpickme.recruit.service;

import com.cafe24.newpickme.recruit.domain.*;

import java.util.List;

public interface RecruitService {

    /*채용 입력*/
    void create(Recruit recruit);

    /*채용 직무 입력*/
    void create(RecruitJob recruitJob);

    /*채용 직무별 자기소개서 항목*/
    void create(CoverLetterArticle coverLetterArticle);

    /*직무 대분류 목록*/
    List<JobCategory1> getJobCategory1List();

    /*직무 소분류 목록*/
    List<JobCategory2> getJobCategory2List(int jobCategory1Id);

    /*기업 아이디*/
    int getCompanyIdByCompanyName(String companyName);

    /*채용 목록*/
    List<Recruit> getRecruits();

    /*채용 상세*/
    Recruit getRecruit(int recruitId);

    /*채용 직무 리스트*/
    List<RecruitJob> getRecruitJobsByRecruitId(int recruitId);

    /*채용 직무별 자소서 리스트*/
    List<CoverLetterArticle> getCoverLetterArticlesByRecruitJobId(int recruitJobId);

    /*채용 수정*/
    void modify(int recruitId);

    /*채용 삭제*/
    void removeRecruit(int recruitId);

    /*채용 직무 삭제*/
    void removeRecruitJob(int recruitJobId);
}
