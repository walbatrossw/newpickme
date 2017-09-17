package com.cafe24.newpickme.recruit.repository;

import com.cafe24.newpickme.recruit.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RecruitDaoImpl implements RecruitDao{

    @Autowired
    SqlSession sqlSession;

    /*채용 입력*/
    @Override
    public void insert(Recruit recruit) {
        sqlSession.insert("recruit.insertRecruit", recruit);
    }

    /*채용 직무 입력*/
    @Override
    public void insert(RecruitJob recruitJob) {
        sqlSession.insert("recruit.insertRecruitJob", recruitJob);
    }

    /*채용 직무별 자기소개서 항목*/
    @Override
    public void insert(CoverLetterArticle coverLetterArticle) {
        sqlSession.insert("recruit.insertCoverLetterArticle", coverLetterArticle);
    }

    /*직무 대분류 목록*/
    @Override
    public List<JobCategory1> selectListJobCategory1() {
        return sqlSession.selectList("recruit.selectListJobCategory1");
    }

    /*직무 소분류 목록*/
    @Override
    public List<JobCategory2> selectListJobCategory2(int jobCategory1Id) {
        return sqlSession.selectList("recruit.selectListJobCategory2", jobCategory1Id);
    }

    /*기업 아이디*/
    @Override
    public int selectCompanyIdByCompanyName(String companyName) {
        return sqlSession.selectOne("recruit.selectCompanyIdByCompanyName", companyName);
    }

    /*채용 목록*/
    @Override
    public List<Recruit> selectListRecruits() {
        return sqlSession.selectList("recruit.selectListRecruits");
    }

    /*채용 상세 페이지 : 채용*/
    @Override
    public Recruit selectOneByRecruitId(int recruitId) {
        return sqlSession.selectOne("recruit.selectOneByRecruitId", recruitId);
    }

    /*채용 상세 페이지 : 채용 직무 목록*/
    @Override
    public List<RecruitJob> selectRecruitJobsByRecruitId(int recruitId) {
        return sqlSession.selectList("recruit.selectRecruitJobsByRecruitId", recruitId);
    }

    /*채용 상세 페이지 : 채용 직무별 자기소개서 항목 */
    @Override
    public List<CoverLetterArticle> selectCoverLetterArticlesByRecruitJobId(int recruitJobId) {
        return sqlSession.selectList("recruit.selectCoverLetterArticlesByRecruitJobId", recruitJobId);
    }

    /*채용 수정*/
    @Override
    public void update(int recruitId) {
        sqlSession.update("recruit.update");
    }

    /*채용 삭제*/
    @Override
    public void deleteRecruit(int recruitId) {

    }

    /*채용 직무 삭제*/
    @Override
    public void deleteRecruitJob(int recruitJobId) {
        sqlSession.delete("recruit.deleteRecruitJob", recruitJobId);
    }

}
