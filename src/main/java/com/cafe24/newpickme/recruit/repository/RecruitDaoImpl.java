package com.cafe24.newpickme.recruit.repository;

import com.cafe24.newpickme.recruit.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RecruitDaoImpl implements RecruitDao{

    @Autowired
    SqlSession sqlSession;

    // 직무 대분류 리스트
    @Override
    public List<JobCategory1> selectJobCategory1s() {
        return sqlSession.selectList("recruit.selectJobCategory1s");
    }

    // 직무 소분류 리스트
    @Override
    public List<JobCategory2> selectJobCategory2sByJobCategory1Id(int jobCategory1Id) {
        return sqlSession.selectList("recruit.selectJobCategory2s", jobCategory1Id);
    }

    // 채용 입력 처리
    @Override
    public void insert(Recruit recruit) {
        sqlSession.insert("recruit.insertRecruit",recruit);
    }

    // 채용직무 입력 처리
    @Override
    public void insert(RecruitJob recruitJob) {
        sqlSession.insert("recruit.insertRecruitJob",recruitJob);
    }

    // 채용직무별 자기소개서 항목 입력 처리
    @Override
    public void insert(CoverLetterArticle coverLetterArticle) {
        sqlSession.insert("recruit.insertCoverLetterArticle",coverLetterArticle);
    }

    // 채용 목록
    @Override
    public List<Recruit> selectRecruits() {
        return sqlSession.selectList("recruit.selectRecruits");
    }

    // 채용 직무 목록


    @Override
    public List<RecruitJob> selectRecruitJobs() {
        return sqlSession.selectList("recruit.selectRecruitJobs");
    }

    // 채용 달력 페이지
    @Override
    public List<Recruit> selectRecruits(int[] jobCategory1Id, int[] industryCategory1Id, String[] companyType, String[] recruitJobType, String[] recruitJobEdu) {
        Map<String, Object> searchMap = new HashMap<String, Object>();
        searchMap.put("jobCategory1Id", jobCategory1Id);
        searchMap.put("industryCategory1Id", industryCategory1Id);
        searchMap.put("companyType", companyType);
        searchMap.put("recruitJobType", recruitJobType);
        searchMap.put("recruitJobEdu", recruitJobEdu);
        return sqlSession.selectList("recruit.selectRecruitsSearch", searchMap);
    }

    // 채용 상세 보기
    @Override
    public Recruit selectRecruitByRecruitId(int recruitId) {
        return sqlSession.selectOne("recruit.selectRecruitByRecruitId", recruitId);
    }

    // 채용 직무
    @Override
    public RecruitJob selectRecruitJobByRecruitJobId(int recruitJobId) {
        return sqlSession.selectOne("recruit.selectRecruitJobByRecruitJobId", recruitJobId);
    }

    // 채용 수정 처리
    @Override
    public void updateRecruit(Recruit recruit) {
        sqlSession.insert("recruit.insertRecruit", recruit);
    }

    // 채용직무 수정 처리 1 - 직무 일괄 수정
    @Override
    public void updateRecruitJob(RecruitJob recruitJob) {
        sqlSession.insert("recruit.insertRecruitJob", recruitJob);
    }

    // 채용직무 수정 처리 2 - 직무 추가
    @Override
    public void createRecruitJob(RecruitJob recruitJob) {
        sqlSession.insert("recruit.insertRecruitJob", recruitJob);
    }

    // 채용 삭제처리
    @Override
    public void deleteRecruit(int recruitId) {
        sqlSession.delete("recruit.deleteRecruit", recruitId);
    }

    // 채용직무 삭제처리
    @Override
    public void deleteRecruitJob(int recruitJobId) {
        sqlSession.delete("recruit.deleteRecruitJob", recruitJobId);
    }

    // 채용직무별 자기소개서 삭제 처리
    @Override
    public void deleteCoverLetterArticle(int coverLetterArticleId) {
        sqlSession.delete("recruit.deleteCoverLetterArticle", coverLetterArticleId);
    }

    // 채용직무별 자기소개서 일괄삭제 처리
    @Override
    public void deleteCoverLetterArticles(int recruitJobId) {
        sqlSession.delete("recruit.deleteCoverLetterArticles", recruitJobId);
    }

    // 채용이미지 파일명
    @Override
    public String selectRecruitImageName(int recruitId) {
        return sqlSession.selectOne("recruit.selectRecruitImageName", recruitId);
    }


}
