package com.cafe24.newpickme.resume.service;

import com.cafe24.newpickme.resume.domain.Resume;

public interface ResumeService {

    /*이력서 작성*/
    void create(Resume resume);

    /*이력서 보기*/
    void getResume(int userId);

    /*이력서 수정*/
    void update(Resume resume);

    /*이력서 삭제*/
    void delete(int userId, int resumeId);
}
