package com.cafe24.newpickme.admin.repository;

import com.cafe24.newpickme.admin.domain.Admin;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    SqlSession sqlSession;

    /*관리자 가입 처리*/
    @Override
    public void insert(Admin admin) {
        sqlSession.insert("admin.insertAdmin", admin);
    }

    /*관리자 이메일 중복 확인*/
    @Override
    public int selectOneByEmail(String adminEmail) {
        return sqlSession.selectOne("admin.selectCountByEmail", adminEmail);
    }

    /*관리자 닉네임 중복 확인*/
    @Override
    public int selectOneByNickName(String adminNickName) {
        return sqlSession.selectOne("admin.selectCountByNickName", adminNickName);
    }

    /*관리자 정보 상세 조회*/
    @Override
    public Admin selectOneById(int adminId) {
        return sqlSession.selectOne("admin.selectAdminByAdminId", adminId);
    }

    /*관리자 닉네임 변경*/
    @Override
    public void updateAdminNickName(Admin admin) {
        sqlSession.update("admin.updateAdminNickName", admin);
    }

    /*관리자 비밀번호 변경*/
    @Override
    public void updateAdminPassword(Admin admin) {
        sqlSession.update("admin.updateAdminPassword", admin);
    }

    /*관리자 탈퇴*/
    @Override
    public void delete(Admin admin) {
        sqlSession.delete("admin.deleteAdmin", admin);
    }

    /*관리자 비밀번호 확인*/
    @Override
    public String selectPasswordByAdminEmail(String adminEmail) {
        return sqlSession.selectOne("admin.selectAdminPasswordByAdminEmail", adminEmail);
    }

    /*관리자 로그인 처리*/
    @Override
    public Admin login(Admin admin) {
        System.out.println(sqlSession.selectOne("admin.login", admin)+"------------------asdasd");
        return sqlSession.selectOne("admin.login", admin);
    }

    /*관리자 로그인 시간 수정*/
    @Override
    public void updateLoginDate(String adminEmail) {
        sqlSession.update("admin.updateLoginDate", adminEmail);
    }

}
