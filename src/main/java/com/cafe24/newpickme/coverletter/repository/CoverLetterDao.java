package com.cafe24.newpickme.coverletter.repository;

import com.cafe24.newpickme.coverletter.domain.UserCoverLetter;
import com.cafe24.newpickme.coverletter.domain.UserCoverLetterArticle;

public interface CoverLetterDao {

    // 자기소개서 입력
    void insert(UserCoverLetter userCoverLetter);

    // 자기소개서 항목 입력
    void insert(UserCoverLetterArticle userCoverLetterArticle);
}
