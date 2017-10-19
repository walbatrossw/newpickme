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

    //회원 가입 처리
    @Override
    public void insert(User user) {
        sqlSession.insert("user.insertUser", user);
    }

    //회원 이메일 중복 확인
    @Override
    public int selectCountByEmail(String userEmail) {
        return sqlSession.selectOne("user.selectCountByEmail", userEmail);
    }

    //회원 닉네임 중복 확인
    @Override
    public int selectCountByNickName(String userNickName) {
        return sqlSession.selectOne("user.selectCountByNickName", userNickName);
    }

    @Override
    public List<User> selectList() {
        return null;
    }

    //회원 정보 상세 조회
    @Override
    public User selectOneById(int userId) {
        return sqlSession.selectOne("user.selectOneByUserId", userId);
    }

    //회원 닉네임 변경
    @Override
    public void updateUserNickName(User user) {
        sqlSession.update("user.updateUserNickName", user);
    }

    // 회원 프로필 사진 파일명
    @Override
    public String selectUserProfileImageName(int userId) {
        return sqlSession.selectOne("user.selectUserProfileImageName", userId);
    }

    //회원 프로필 사진 변경
    @Override
    public void updateUserProfileImage(User user) {
        sqlSession.update("user.updateUserProfileImage", user);
    }

    //회원 비밀번호 변경
    @Override
    public void updateUserPassword(User user) {
        sqlSession.update("user.updateUserPassword", user);
    }

    //회원 탈퇴
    @Override
    public void delete(User user) {
        sqlSession.delete("user.deleteUser", user);
    }

    //회원 비밀번호 확인
    @Override
    public String selectPasswordByUserEmail(String userEmail) {
        return sqlSession.selectOne("user.selectUserPasswordByUserEmail", userEmail);
    }

    //회원 로그인 처리
    @Override
    public User login(User user) {
        return sqlSession.selectOne("user.login", user);
    }

    //회원 로그인 시간 수정
    @Override
    public void updateLoginDate(String userEmail) {
        sqlSession.update("user.updateLoginDate", userEmail);
    }

    //회원 목록
    @Override
    public List<User> selectListUsers() {
        return sqlSession.selectList("user.selectListUsers");
    }
}
