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

    }

    /*채용 직무 입력*/
    @Override
    public void create(RecruitJob recruitJob) {

    }

    /*채용 직무별 자기소개서 항목*/
    @Override
    public void create(CoverLetterArticle coverLetterArticle) {

    }

    /*직무 대분류 목록*/
    @Override
    public List<JobCategory1> getJobCategory1List() {
        return null;
    }

    /*직무 소분류 목록*/
    @Override
    public List<JobCategory2> getJobCategory2List(int jobCategory1Id) {
        return null;
    }

    /*채용 직무 목록*/
    @Override
    public List<Recruit> getRecruits() {
        return null;
    }

    /*채용 상세*/
    @Override
    public Recruit getRecruit(int recruitId) {
        return null;
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
