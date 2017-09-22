package com.cafe24.newpickme.resume.repository;

import com.cafe24.newpickme.resume.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDaoImpl implements ResumeDao{

    @Autowired
    SqlSession sqlSession;

    /*이력서 작성*/
    @Override
    public void insertResume(Resume resume) {
        sqlSession.insert("resume.insertResume", resume);
        System.out.println(resume);
    }

    @Override
    public void insertResumePersonal(Personal personal) {
        //sqlSession.insert("resume.insertResumePersonal", personal);
        System.out.println(personal);
    }

    @Override
    public void insertResumeHighSchool(HighSchool highSchool) {
        //sqlSession.insert("resume.insertResumeHighSchool", highSchool);
        System.out.println(highSchool);
    }

    @Override
    public void insertResumeUniversity(University university) {
        //sqlSession.insert("resume.insertResumeUniversity", university);
        System.out.println(university);
    }

    @Override
    public void insertResumeLanguage(Language language) {
        //sqlSession.insert("resume.insertResumeLanguage", language);
        System.out.println(language);
    }

    @Override
    public void insertResumeCertificate(Certificate certificate) {
        //sqlSession.insert("resume.insertResumeCertificate", certificate);
        System.out.println(certificate);
    }

    @Override
    public void insertResumeCareer(Career career) {
        //sqlSession.insert("resume.insertResumeCareer", career);
        System.out.println(career);
    }

    @Override
    public void insertResumeActivity(Activity activity) {
        //sqlSession.insert("resume.insertResumeActivity", activity);
        System.out.println(activity);
    }

    @Override
    public void insertResumeEtc(Etc etc) {
        //sqlSession.insert("resume.insertResumeEtc", etc);
        System.out.println(etc);
    }

    /*이력서 보기*/
    @Override
    public void selectResumeByUserId(int userId) {

    }

    /*이력서 수정*/
    @Override
    public void updateResume(Resume resume) {

    }

    /*이력서 삭제*/
    @Override
    public void deleteResume(int userId, int resumeId) {

    }

}
