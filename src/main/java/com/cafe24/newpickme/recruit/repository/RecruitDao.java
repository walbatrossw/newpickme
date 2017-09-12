package com.cafe24.newpickme.recruit.repository;

import com.cafe24.newpickme.recruit.domain.*;

import java.util.List;

public interface RecruitDao {

    /*채용 입력*/
    void insert(Recruit recruit);

    /*채용 직무 입력*/
    void insert(RecruitJob recruitJob);

    /*채용 직무별 자기소개서 항목*/
    void insert(CoverLetterArticle coverLetterArticle);

    /*직무 대분류 목록*/
    List<JobCategory1> selectListJobCategory1();

    /*직무 소분류 목록*/
    List<JobCategory2> selectListJobCategory2(int jobCategory1Id);

    /*기업 아이디*/
    int selectCompanyIdByCompanyName(String companyName);

    /*채용 목록*/
    List<Recruit> selectListRecruits();

    /*채용 상세*/
    Recruit selectOneByRecruitId(int recruitId);

    /*채용 직무 리스트*/
    List<RecruitJob> selectRecruitJobsByRecruitId(int recruitId);

    /*채용 직무별 자소서 리스트*/
    List<CoverLetterArticle> selectCoverLetterArticlesByRecruitJobId(int recruitJobId);

    /*채용 수정*/
    void update(int recruitId);

    /*채용 삭제*/
    void delete(int recruitId);
}
