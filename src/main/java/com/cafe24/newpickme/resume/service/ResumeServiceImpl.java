package com.cafe24.newpickme.resume.service;

import com.cafe24.newpickme.resume.domain.*;
import com.cafe24.newpickme.resume.repository.ResumeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ResumeServiceImpl implements ResumeService {

    @Autowired
    ResumeDao resumeDao;

    /*이력서 작성여부*/
    @Override
    public boolean isResume(int userId) {
        return resumeDao.isResume(userId);
    }

    /*이력서 작성*/
    @Override
    public void create(Resume resume, HttpSession session) {

        int userId = (Integer) session.getAttribute("userId");
        resume.setUserId(userId);
        resumeDao.insertResume(resume);

        int resumeId = resume.getResumeId();

        // 개인신상
        Personal personal = resume.getPersonal();
        personal.setResumeId(resumeId);
        resumeDao.insertResumePersonal(personal);

        // 고등학교
        HighSchool highSchool = resume.getHighSchool();
        highSchool.setResumeId(resumeId);
        resumeDao.insertResumeHighSchool(highSchool);

        // 대학교, 대학원
        List<University> universities = resume.getUniversities();
        for (University university : universities) {
            university.setResumeId(resumeId);
            resumeDao.insertResumeUniversity(university);
        }

        // 어학시험
        List<Language> languages = resume.getLanguages();
        for (Language language : languages) {
            language.setResumeId(resumeId);
            resumeDao.insertResumeLanguage(language);
        }

        // 자격증
        List<Certificate> certificates = resume.getCertificates();
        for (Certificate certificate : certificates) {
            certificate.setResumeId(resumeId);
            resumeDao.insertResumeCertificate(certificate);
        }

        // 경력
        List<Career> careers = resume.getCareers();
        for (Career career : careers) {
            career.setResumeId(resumeId);
            resumeDao.insertResumeCareer(career);
        }

        // 직무 관련 활동
        List<Activity> activities = resume.getActivities();
        for (Activity activity: activities) {
            activity.setResumeId(resumeId);
            resumeDao.insertResumeActivity(activity);
        }

        // 기타 사항
        List<Etc> etcs = resume.getEtcs();
        for (Etc etc : etcs) {
            etc.setResumeId(resumeId);
            resumeDao.insertResumeEtc(etc);
        }

    }



    /*이력서 보기*/
    @Override
    public Resume getResume(int userId) {
        return resumeDao.selectResumeByUserId(userId);
    }

    /*이력서 수정*/
    @Override
    public void update(Resume resume) {

        int resumeId = resume.getResumeId();

        // 이력서 정보
        resumeDao.insertResume(resume);

        // 개인신상
        Personal personal = resume.getPersonal();
        personal.setResumeId(resumeId);
        resumeDao.insertResumePersonal(personal);

        // 고등학교
        HighSchool highSchool = resume.getHighSchool();
        highSchool.setResumeId(resumeId);
        resumeDao.insertResumeHighSchool(highSchool);

        // 대학교, 대학원
        List<University> universities = resume.getUniversities();
        for (University university : universities) {
            university.setResumeId(resumeId);
            resumeDao.insertResumeUniversity(university);
        }

        // 어학시험
        // 자격증
        // 경력
        // 직무관련활동
        // 기타사항

    }

    /*이력서 삭제 Cascade */
    @Override
    public void deleteResume(int userId) {
        resumeDao.deleteResume(userId);
    }

    /*이력서 삭제 None Cascade*/
    @Override
    public void deleteResumeNoneCascade(int resumeId) {
        resumeDao.deleteResumeEtcNoneCascade(resumeId);
        resumeDao.deleteResumeActivityNoneCascade(resumeId);
        resumeDao.deleteResumeCareerNoneCascade(resumeId);
        resumeDao.deleteResumeCertificateNoneCascade(resumeId);
        resumeDao.deleteResumeLanguageNoneCascade(resumeId);
        resumeDao.deleteResumeUniversityNoneCascade(resumeId);
        resumeDao.deleteResumeHighSchoolNoneCascade(resumeId);
        resumeDao.deleteResumePersonalNoneCascade(resumeId);
        resumeDao.deleteResumeNoneCascade(resumeId);
    }

    @Override
    public void deleteResumeUniversity(int universityId) {
        resumeDao.deleteResumeUniversity(universityId);
    }

    @Override
    public void deleteResumeLanguage(int languageId) {
        resumeDao.deleteResumeLanguage(languageId);
    }

    @Override
    public void deleteResumeCertificate(int certificateId) {
        resumeDao.deleteResumeCertificate(certificateId);
    }

    @Override
    public void deleteResumeCareer(int careerId) {
        resumeDao.deleteResumeCareer(careerId);
    }

    @Override
    public void deleteResumeActivity(int activityId) {
        resumeDao.deleteResumeActivity(activityId);
    }

    @Override
    public void deleteResumeEtc(int etcId) {
        resumeDao.deleteResumeEtc(etcId);
    }


}
