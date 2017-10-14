package com.cafe24.newpickme.coverletter.repository;

import com.cafe24.newpickme.coverletter.domain.UserCoverLetter;
import com.cafe24.newpickme.coverletter.domain.UserCoverLetterArticle;

import java.util.List;

public interface CoverLetterDao {

    // 자기소개서 입력
    void insert(UserCoverLetter userCoverLetter);

    // 자기소개서 항목 입력
    void insert(UserCoverLetterArticle userCoverLetterArticle);

    // 자기소개서 목록
    List<UserCoverLetter> selectCoverLetters(int userId);

    // 자기소개서
    UserCoverLetter selectUserCoverLetter(int userCoverLetterId);

    // 자기소개서 삭제
    void deleteUserCoverLetter(int userCoverLetterId);

    // 자기소개서 항목 삭제
    void deleteUserCoverLetterArticle(int userCoverLetterArticleId);

    // 자기소개서 항목 일괄 삭제
    void deleteUserCoverLetterArticles(int userCoverLetterId);
}
