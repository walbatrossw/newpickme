package com.cafe24.newpickme.user.repository;

import com.cafe24.newpickme.user.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    SqlSession sqlSession;

    @Override
    public void insert(User user) {
        sqlSession.insert("user.insertUser", user);
    }

    @Override
    public int selectCountByEmail(String userEmail) {
        return sqlSession.selectOne("user.selectCountByEmail", userEmail);
    }

    @Override
    public int selectCountByNickName(String userNickName) {
        return sqlSession.selectOne("user.selectCountByNickName", userNickName);
    }

    @Override
    public List<User> selectList() {
        return null;
    }

    @Override
    public User selectOneById(int userId) {
        return sqlSession.selectOne("user.selectOneByUserId", userId);
    }

    @Override
    public void updateUserNickName(User user) {
        sqlSession.update("user.updateUserNickName", user);
    }

    @Override
    public void updateUserPassword(User user) {
        sqlSession.update("user.updateUserPassword", user);
    }

    @Override
    public void delete(User user) {
        sqlSession.delete("user.deleteUser", user);
    }

    @Override
    public String getPassword(String userEmail) {
        return sqlSession.selectOne("user.getPassword", userEmail);
    }

    @Override
    public User login(User user) {
        return sqlSession.selectOne("user.login", user);
    }

    @Override
    public void updateLoginDate(String userEmail) {
        sqlSession.update("user.updateLoginDate", userEmail);
    }
}
