package com.cafe24.newpickme.resume.service;

import com.cafe24.newpickme.resume.domain.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public interface ResumeService {


    //이력서 작성여부 확인
    boolean resumeCheck(int userId);

    //이력서 작성
    void create(Resume resume, HttpSession session, HttpServletRequest request) throws IOException;

    //이력서 보기
    Resume getResume(int userId);

    //이력서 삭제 Cascade
    void deleteResume(int userId);

    //이력서 삭제 None Cascade
    void deleteResumeNoneCascade(int resumeId);

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
