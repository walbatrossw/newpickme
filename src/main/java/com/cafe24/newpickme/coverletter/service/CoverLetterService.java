package com.cafe24.newpickme.coverletter.service;

import com.cafe24.newpickme.coverletter.domain.UserCoverLetter;

import java.util.List;

public interface CoverLetterService {

    // 자기소개서 입력
    void create(UserCoverLetter userCoverLetter);

    // 자기소개서 목록
    List<UserCoverLetter> getCoverLetters(int userId);

    // 자기소개서
    UserCoverLetter getUserCoverLetter(int userCoverLetterId);
}
