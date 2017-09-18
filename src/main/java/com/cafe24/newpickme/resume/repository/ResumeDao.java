package com.cafe24.newpickme.resume.repository;


import com.cafe24.newpickme.resume.domain.Resume;

public interface ResumeDao {

    /*이력서 작성*/
    void insertResume(Resume resume);

    /*이력서 보기*/
    void selectResumeByUserId(int userId);

    /*이력서 수정*/
    void updateResume(Resume resume);

    /*이력서 삭제*/
    void deleteResume(int userId, int resumeId);
}
