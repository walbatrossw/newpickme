package com.cafe24.newpickme.recruit.service;

import com.cafe24.newpickme.recruit.domain.*;

import java.util.List;

public interface RecruitService {

    // 직무 대분류 리스트
    List<JobCategory1> getJobCategory1s();

    // 직무 소분류 리스트
    List<JobCategory2> getJobCategory2sByJobCategory1Id(int jobCategory1Id);

    // 채용 입력 처리
    void create(Recruit recruit);

    // 채용 목록
    List<Recruit> getRecruits();

    // 채용 달력 페이지
    List<Recruit> getRecruits(int[] jobCategory1Id, int[] industryCategory1Id, String[] companyType, String[] recruitJobType, String[] recruitJobEdu);

    // 채용 상세 보기
    Recruit getRecruitByRecruitId(int recruitId);

    // 채용직무
    Recruit getRecruitJobByRecruitJobId(int recruitJob);

    // 채용 수정 처리
    void modifyRecruit(Recruit recruit);

    // 채용직무 수정 처리 1 - 직무 일괄 수정
    void modifyRecruitJob(RecruitJob recruitJob);

    // 채용직무 수정 처리 2 - 직무 추가
    void createRecruitJob(RecruitJob recruitJob);

    // 채용직무별 자기소개서 수정 처리
    void modifyArticle(CoverLetterArticle coverLetterArticle);

    // 채용 삭제처리
    void removeRecruit(int recruitId);

    // 채용직무 삭제처리
    void removeRecruitJob(int recruitJobId);

    // 채용직무별 자기소개서항목 삭제 처리
    void removeCoverLetterArticle(int coverLetterArticleId);



}
