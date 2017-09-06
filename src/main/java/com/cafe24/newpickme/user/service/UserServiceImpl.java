package com.cafe24.newpickme.user.service;

import com.cafe24.newpickme.user.domain.User;
import com.cafe24.newpickme.user.repository.UserDao;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    /*회원가입 처리*/
    @Override
    public void create(User user) {
        userDao.insert(user);
    }

    /*회원가입 이메일 중복 확인*/
    @Override
    public int getOneByEmail(String userEmail) {
        return userDao.selectCountByEmail(userEmail);
    }

    /*회원가입 닉네임 중복 확인*/
    @Override
    public int getOneByNickName(String userNickName) {
        return userDao.selectCountByNickName(userNickName);
    }

    /*회원 목록*/
    @Override
    public List<User> getList() {
        return null;
    }

    /*회원 정보 상세조회*/
    @Override
    public User getUserById(int userId) {
        return userDao.selectOneById(userId);
    }

    /*회원 닉네임 수정*/
    @Override
    public void modifyUserNickName(User user) {
        userDao.updateUserNickName(user);
    }

    /*회원 비밀번호 변경*/
    @Override
    public void modifyUserPassword(User user) {
        userDao.updateUserPassword(user);
    }


    /*회원 삭제, 탈퇴*/
    @Override
    public void remove(User user) {
        userDao.delete(user);
    }

    /*회원 닉네임, 비밀번호 수정 또는 탈퇴를 위한 비밀번호 확인*/
    @Override
    public boolean checkPassword(String userEmail, String userPassword) {
        return BCrypt.checkpw(userPassword, userDao.getPassword(userEmail));
    }

    /*로그인 처리*/
    @Override
    public boolean login(User user, HttpSession session) {
        User loginUser = userDao.login(user);
        if (loginUser != null && BCrypt.checkpw(user.getUserPassword(), loginUser.getUserPassword())) {
            session.setAttribute("userId", loginUser.getUserId());
            session.setAttribute("userEmail", loginUser.getUserEmail());
            session.setAttribute("userNickName", loginUser.getUserNickName());
            return true;
        }
        return false;
    }

    /*로그인 시간 수정*/
    @Override
    public void modifyUserLoginDate(String userEmail) {
        userDao.updateLoginDate(userEmail);
    }

    /*로그아웃*/
    @Override
    public void logout(HttpSession session) {
        session.invalidate();
    }
}
