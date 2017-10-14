package com.cafe24.newpickme.coverletter.repository;

import com.cafe24.newpickme.coverletter.domain.UserCoverLetter;
import com.cafe24.newpickme.coverletter.domain.UserCoverLetterArticle;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CoverLetterDaoImpl implements CoverLetterDao {

    @Autowired
    SqlSession sqlSession;

    @Override
    public void insert(UserCoverLetter userCoverLetter) {
        sqlSession.insert("coverLetter.insertUserCoverLetter", userCoverLetter);
    }

    @Override
    public void insert(UserCoverLetterArticle userCoverLetterArticle) {
        sqlSession.insert("coverLetter.insertUserCoverLetterArticle", userCoverLetterArticle);
    }

    @Override
    public List<UserCoverLetter> selectCoverLetters(int userId) {
        return sqlSession.selectList("coverLetter.selectCoverLetters", userId);
    }

    @Override
    public UserCoverLetter selectUserCoverLetter(int userCoverLetterId) {
        return sqlSession.selectOne("coverLetter.selectUserCoverLetter", userCoverLetterId);
    }

    @Override
    public void deleteUserCoverLetter(int userCoverLetterId) {
        sqlSession.delete("coverLetter.deleteUserCoverLetter", userCoverLetterId);
    }

    @Override
    public void deleteUserCoverLetterArticle(int userCoverLetterArticleId) {
        sqlSession.delete("coverLetter.deleteUserCoverLetterArticle", userCoverLetterArticleId);
    }

    @Override
    public void deleteUserCoverLetterArticles(int userCoverLetterId) {
        sqlSession.delete("coverLetter.deleteUserCoverLetterArticles", userCoverLetterId);
    }
}
