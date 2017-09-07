package com.cafe24.newpickme.admin.service;

import com.cafe24.newpickme.admin.domain.Admin;
import com.cafe24.newpickme.admin.repository.AdminDao;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminDao adminDao;

    /*관리자 가입 처리*/
    @Override
    public void create(Admin admin) {
        adminDao.insert(admin);
    }

    /*관리자 이메일 중복 확인*/
    @Override
    public int getOneByEmail(String adminEmail) {
        return adminDao.selectOneByEmail(adminEmail);
    }

    /*관리자 닉네임 중복 확인*/
    @Override
    public int getOneByNickName(String adminNickName) {
        return adminDao.selectOneByNickName(adminNickName);
    }

    /*관리자 프로필*/
    @Override
    public Admin getAdminById(int adminId) {
        return adminDao.selectOneById(adminId);
    }

    /*관리자 닉네임 변경*/
    @Override
    public void modifyAdminNickName(Admin admin) {
        adminDao.updateAdminNickName(admin);
    }

    /*관리자 비밀번호 변경*/
    @Override
    public void modifyAdminPassword(Admin admin) {
        adminDao.updateAdminNickName(admin);
    }

    /*관리자 탈퇴*/
    @Override
    public void remove(Admin admin) {
        adminDao.delete(admin);
    }

    /*관리자 비밀번호 확인*/
    @Override
    public boolean getPassword(String adminEmail, String adminPassword) {
        return BCrypt.checkpw(adminPassword, adminDao.selectPasswordByAdminEmail(adminEmail));
    }

    /*관리자 로그인 처리*/
    @Override
    public boolean login(Admin admin, HttpSession session) {
        //
        Admin loginAdmin = adminDao.login(admin);
        System.out.println(loginAdmin+"loginAdmin===================================================");
        if (loginAdmin != null && BCrypt.checkpw(admin.getAdminPassword(), loginAdmin.getAdminPassword())) {
            session.setAttribute("adminId", loginAdmin.getAdminId());
            session.setAttribute("adminEmail", loginAdmin.getAdminEmail());
            session.setAttribute("adminNickName", loginAdmin.getAdminNickName());
            return true;
        }
        return false;
    }

    /*관리자 로그인 시간 수정*/
    @Override
    public void modifyAdminLoginDate(String userEmail) {
        adminDao.updateLoginDate(userEmail);
    }

    /*관리자 로그아웃 처리*/
    @Override
    public void logout(HttpSession session) {
        session.invalidate();
    }

}
