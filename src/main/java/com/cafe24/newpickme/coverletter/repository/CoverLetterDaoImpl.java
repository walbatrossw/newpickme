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
}
