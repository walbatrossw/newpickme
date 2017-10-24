package com.cafe24.newpickme.recruit.repository;

import com.cafe24.newpickme.recruit.domain.*;

import java.util.List;

public interface RecruitDao {

    // 직무 대분류 리스트
    List<JobCategory1> selectJobCategory1s();

    // 직무 소분류 리스트
    List<JobCategory2> selectJobCategory2sByJobCategory1Id(int jobCategory1Id);

    // 채용 입력 처리
    void insert(Recruit recruit);

    // 채용직무 입력 처리
    void insert(RecruitJob recruitJob);

    // 채용직무별 자기소개서 항목 입력 처리
    void insert(CoverLetterArticle coverLetterArticle);

    // 채용 목록
    List<Recruit> selectRecruits();

    // 채용 직무 목록
    List<RecruitJob> selectRecruitJobs();

    // 채용 달력 페이지
    List<Recruit> selectRecruits(int[] jobCategory1Id, int[] industryCategory1Id, String[] companyType, String[] recruitJobType, String[] recruitJobEdu);

    // 채용 상세 보기
    Recruit selectRecruitByRecruitId(int recruitId);

    // 채용 직무
    RecruitJob selectRecruitJobByRecruitJobId(int recruitJobId);

    // 채용 수정 처리
    void updateRecruit(Recruit recruit);

    // 채용직무 수정 처리 1 - 직무 일괄 수정
    void updateRecruitJob(RecruitJob recruitJob);

    // 채용직무 수정 처리 2 - 직무 추가
    void createRecruitJob(RecruitJob recruitJob);

    // 채용 삭제처리
    void deleteRecruit(int recruitId);

    // 채용직무 삭제처리
    void deleteRecruitJob(int recruitJobId);

    // 채용직무별 자기소개서 삭제 처리
    void deleteCoverLetterArticle(int coverLetterArticleId);

    // 채용직무별 자기소개서 항목 일괄 삭제 처리
    void deleteCoverLetterArticles(int recruitJobId);

    // 채용 이미지 파일명
    String selectRecruitImageName(int recruitId);
}
