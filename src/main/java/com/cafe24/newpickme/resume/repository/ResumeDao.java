package com.cafe24.newpickme.resume.repository;


import com.cafe24.newpickme.resume.domain.*;

import java.util.List;

public interface ResumeDao {

    //이력서 작성여부 확인
    Boolean resumeCheck(int userId);

    String selectPersonalImageName(int resumeId);

    //이력서 작성 및 수정처리
    void insertResume(Resume resume);

    void insertResumePersonal(Personal personal);

    void insertResumeHighSchool(HighSchool highSchool);

    void insertResumeUniversity(University university);

    void insertResumeLanguage(Language language);

    void insertResumeCertificate(Certificate certificate);

    void insertResumeCareer(Career career);

    void insertResumeActivity(Activity activity);

    void insertResumeEtc(Etc etc);

    //이력서 보기
    Resume selectResumeByUserId(int userId);

    //이력서 삭제 Cascade
    void deleteResume(int userId);

    //이력서 삭제 None Cascade
    void deleteResumeNoneCascade(int resumeId);

    //이력서 삭제 None Cascade : 개인신상
    void deleteResumePersonalNoneCascade(int resumeId);

    //이력서 삭제 None Cascade : 고등학교
    void deleteResumeHighSchoolNoneCascade(int resumeId);

    //이력서 삭제 None Cascade : 대학교, 대학원
    void deleteResumeUniversityNoneCascade(int resumeId);

    //이력서 삭제 None Cascade : 어학시험
    void deleteResumeLanguageNoneCascade(int resumeId);

    //이력서 삭제 None Cascade : 자격증
    void deleteResumeCertificateNoneCascade(int resumeId);

    //이력서 삭제 None Cascade : 경력
    void deleteResumeCareerNoneCascade(int resumeId);

    //이력서 삭제 None Cascade : 직무관련 활동
    void deleteResumeActivityNoneCascade(int resumeId);

    //이력서 삭제 None Cascade : 기타활동
    void deleteResumeEtcNoneCascade(int resumeId);

    //이력서 항목 삭제 : 대학교
    void deleteResumeUniversity(int universityId);

    //이력서 항목 삭제 : 어학시험
    void deleteResumeLanguage(int languageId);

    //이력서 항목 삭제 : 자격증
    void deleteResumeCertificate(int certificateId);

    //이력서 항목 삭제 : 경력
    void deleteResumeCareer(int careerId);

    //이력서 항목 삭제 : 활동사항
    void deleteResumeActivity(int activityId);

    //이력서 항목 삭제 : 기타사항
    void deleteResumeEtc(int etcId);

}
