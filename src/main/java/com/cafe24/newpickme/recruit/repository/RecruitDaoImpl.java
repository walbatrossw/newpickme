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

    }

    /*채용 직무 입력*/
    @Override
    public void insert(RecruitJob recruitJob) {

    }

    /*채용 직무별 자기소개서 항목*/
    @Override
    public void insert(CoverLetterArticle coverLetterArticle) {

    }

    /*직무 대분류 목록*/
    @Override
    public List<JobCategory1> selectListJobCategory1() {
        return null;
    }

    /*직무 소분류 목록*/
    @Override
    public List<JobCategory2> selectListJobCategory2ByjobCategory1Id(int jobCategory1Id) {
        return null;
    }

    /*채용 직무 목록*/
    @Override
    public List<Recruit> selectListRecruit() {
        return null;
    }

    /*채용 상세*/
    @Override
    public Recruit selectOneByRecruitId(int recruitId) {
        return null;
    }

    /*채용 수정*/
    @Override
    public void update(int recruitId) {

    }

    /*채용 삭제*/
    @Override
    public void delete(int recruitId) {

    }

}
