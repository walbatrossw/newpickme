package com.cafe24.newpickme.resume.repository;


import com.cafe24.newpickme.resume.domain.*;

public interface ResumeDao {

    /*이력서 작성*/
    void insertResume(Resume resume);

    void insertResumePersonal(Personal personal);

    void insertResumeHighSchool(HighSchool highSchool);

    void insertResumeUniversity(University university);

    void insertResumeLanguage(Language language);

    void insertResumeCertificate(Certificate certificate);

    void insertResumeCareer(Career career);

    void insertResumeActivity(Activity activity);

    void insertResumeEtc(Etc etc);

    /*이력서 보기*/
    void selectResumeByUserId(int userId);

    /*이력서 수정*/
    void updateResume(Resume resume);

    /*이력서 삭제*/
    void deleteResume(int userId, int resumeId);
}
