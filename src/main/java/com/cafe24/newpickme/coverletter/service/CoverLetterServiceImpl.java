package com.cafe24.newpickme.coverletter.service;

import com.cafe24.newpickme.coverletter.domain.UserCoverLetter;
import com.cafe24.newpickme.coverletter.domain.UserCoverLetterArticle;
import com.cafe24.newpickme.coverletter.repository.CoverLetterDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoverLetterServiceImpl implements CoverLetterService {

    @Autowired
    CoverLetterDao coverLetterDao;

    @Override
    public void create(UserCoverLetter userCoverLetter) {
        coverLetterDao.insert(userCoverLetter);
        int userCoverLetterId = userCoverLetter.getUserCoverLetterId();
        List<UserCoverLetterArticle> userCoverLetterArticles = userCoverLetter.getUserCoverLetterArticles();
        for (UserCoverLetterArticle userCoverLetterArticle : userCoverLetterArticles) {
            userCoverLetterArticle.setUserCoverLetterId(userCoverLetterId);
            coverLetterDao.insert(userCoverLetterArticle);
        }
    }

    @Override
    public List<UserCoverLetter> getCoverLetters(int userId) {
        return coverLetterDao.selectCoverLetters(userId);
    }

    @Override
    public UserCoverLetter getUserCoverLetter(int userCoverLetterId) {
        return coverLetterDao.selectUserCoverLetter(userCoverLetterId);
    }
}
