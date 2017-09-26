package com.cafe24.newpickme.resume.repository;

import com.cafe24.newpickme.resume.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class ResumeDaoImpl implements ResumeDao{

    @Autowired
    SqlSession sqlSession;

    /*이력서 작성여부*/
    @Override
    public Boolean isResume(int userId) {
        return sqlSession.selectOne("resume.isResume", userId);
    }

    /*이력서 작성*/
    @Override
    public void insertResume(Resume resume) {
        sqlSession.insert("resume.insertResume", resume);
        System.out.println(resume);
    }

    @Override
    public void insertResumePersonal(Personal personal) {
        sqlSession.insert("resume.insertResumePersonal", personal);
        System.out.println(personal);
    }

    @Override
    public void insertResumeHighSchool(HighSchool highSchool) {
        sqlSession.insert("resume.insertResumeHighSchool", highSchool);
        System.out.println(highSchool);
    }

    @Override
    public void insertResumeUniversity(University university) {
        sqlSession.insert("resume.insertResumeUniversity", university);
        System.out.println(university);
    }

    @Override
    public void insertResumeLanguage(Language language) {
        sqlSession.insert("resume.insertResumeLanguage", language);
        System.out.println(language);
    }

    @Override
    public void insertResumeCertificate(Certificate certificate) {
        sqlSession.insert("resume.insertResumeCertificate", certificate);
        System.out.println(certificate);
    }

    @Override
    public void insertResumeCareer(Career career) {
        sqlSession.insert("resume.insertResumeCareer", career);
        System.out.println(career);
    }

    @Override
    public void insertResumeActivity(Activity activity) {
        sqlSession.insert("resume.insertResumeActivity", activity);
        System.out.println(activity);
    }

    @Override
    public void insertResumeEtc(Etc etc) {
        sqlSession.insert("resume.insertResumeEtc", etc);
        System.out.println(etc);
    }

    /*이력서 보기*/
    @Override
    public Resume selectResumeByUserId(int userId) {
        return sqlSession.selectOne("resume.selectResumeByUserId", userId);
    }


    /*이력서 삭제 Cascade : 자동삭제 처리*/
    @Override
    public void deleteResume(int userId) {
        sqlSession.delete("resume.deleteResume", userId);
    }

    /*이력서 삭제 None Cascade : 이력서정보 */
    @Override
    public void deleteResumeNoneCascade(int resumeId) {
        sqlSession.delete("resume.deleteResumeNoneCascade", resumeId);
    }

    /*이력서 삭제 None Cascade : 개인신상*/
    @Override
    public void deleteResumePersonalNoneCascade(int resumeId) {
        sqlSession.delete("resume.deleteResumePersonalNoneCascade", resumeId);
    }

    /*이력서 삭제 None Cascade : 고등학교*/
    @Override
    public void deleteResumeHighSchoolNoneCascade(int resumeId) {
        sqlSession.delete("resume.deleteResumeHighSchoolNoneCascade", resumeId);
    }

    /*이력서 삭제 None Cascade : 대학교, 대학원*/
    @Override
    public void deleteResumeUniversityNoneCascade(int resumeId) {
        sqlSession.delete("resume.deleteResumeUniversityNoneCascade", resumeId);
    }

    /*이력서 삭제 None Cascade : 어학시험*/
    @Override
    public void deleteResumeLanguageNoneCascade(int resumeId) {
        sqlSession.delete("resume.deleteResumeLanguageNoneCascade", resumeId);
    }

    /*이력서 삭제 None Cascade : 자격증*/
    @Override
    public void deleteResumeCertificateNoneCascade(int resumeId) {
        sqlSession.delete("resume.deleteResumeCertificateNoneCascade", resumeId);
    }

    /*이력서 삭제 None Cascade : 경력*/
    @Override
    public void deleteResumeCareerNoneCascade(int resumeId) {
        sqlSession.delete("resume.deleteResumeCareerNoneCascade", resumeId);
    }

    /*이력서 삭제 None Cascade : 직무관련 활동*/
    @Override
    public void deleteResumeActivityNoneCascade(int resumeId) {
        sqlSession.delete("resume.deleteResumeActivityNoneCascade", resumeId);
    }

    /*이력서 삭제 None Cascade : 기타활동*/
    @Override
    public void deleteResumeEtcNoneCascade(int resumeId) {
        sqlSession.delete("resume.deleteResumeEtcNoneCascade", resumeId);
    }

    /*이력서 항목 삭제 : 대학교*/
    @Override
    public void deleteResumeUniversity(int universityId) {
        sqlSession.delete("resume.deleteResumeUniversity", universityId);
    }

    /*이력서 항목 삭제 : 어학시험*/
    @Override
    public void deleteResumeLanguage(int languageId) {
        sqlSession.delete("resume.deleteResumeLanguage", languageId);
    }

    /*이력서 항목 삭제 : 자격증*/
    @Override
    public void deleteResumeCertificate(int certificateId) {
        sqlSession.delete("resume.deleteResumeCertificate", certificateId);
    }

    /*이력서 항목 삭제 : 경력*/
    @Override
    public void deleteResumeCareer(int careerId) {
        sqlSession.delete("resume.deleteResumeCareer", careerId);
    }

    /*이력서 항목 삭제 : 활동사항*/
    @Override
    public void deleteResumeActivity(int activityId) {
        sqlSession.delete("resume.deleteResumeActivity", activityId);
    }

    /*이력서 항목 삭제 : 기타사항*/
    @Override
    public void deleteResumeEtc(int etcId) {
        sqlSession.delete("resume.deleteResumeEtc", etcId);
    }

}
