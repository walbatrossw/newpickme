package com.cafe24.newpickme.admin.service;

import com.cafe24.newpickme.admin.domain.Admin;
import com.cafe24.newpickme.admin.repository.AdminDao;
import com.cafe24.newpickme.commons.fileupload.UploadFileUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminDao adminDao;

    // 관리자 가입 처리
    @Override
    public void create(Admin admin) {
        adminDao.insert(admin);
    }

    // 관리자 이메일 중복 확인
    @Override
    public int getOneByEmail(String adminEmail) {
        return adminDao.selectOneByEmail(adminEmail);
    }

    // 관리자 닉네임 중복 확인
    @Override
    public int getOneByNickName(String adminNickName) {
        return adminDao.selectOneByNickName(adminNickName);
    }

    // 관리자 프로필
    @Override
    public Admin getAdminById(int adminId) {
        return adminDao.selectOneById(adminId);
    }

    // 관리자 닉네임 변경
    @Override
    public void modifyAdminNickName(Admin admin) {
        adminDao.updateAdminNickName(admin);
    }

    // 관리자 비밀번호 변경
    @Override
    public void modifyAdminPassword(Admin admin) {
        adminDao.updateAdminNickName(admin);
    }

    //  관리자 프로필 이미지 변경
    @Transactional
    @Override
    public void modifyAdminProfileImage(Admin admin, HttpServletRequest request, HttpSession session) throws IOException {
        if (!admin.getAdminProfileImage().isEmpty()) {
            //final String PATH = request.getSession().getServletContext().getRealPath("/")+"resources/dist/img/admins/profile/"; // 실서버 업로드 디렉토리
            final String PATH = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\admins\\profile\\"; // 로컬 업로드 디렉토리

            // 기존의 이미지 파일 삭제처리
            String oldAdminProfileImageName = adminDao.selectAdminProfileImageName(admin.getAdminId());
            if (oldAdminProfileImageName != null) {
                new File(PATH + oldAdminProfileImageName.replace('/', File.separatorChar)).delete();
            }
            // 새로운 이미지 파일 업로드 처리
            String newAdminProfileImageName = admin.getAdminProfileImage().getOriginalFilename(); // 원본파일명 추출
            byte[] file = admin.getAdminProfileImage().getBytes(); // 파일 추출
            try {
                // 파일업로드, 경로 + UUID + 파일명 생성처리
                String adminProfileImageName = UploadFileUtils.uploadFile(PATH, newAdminProfileImageName, file);
                admin.setAdminProfileImageName(adminProfileImageName);
                adminDao.updateAdminProfileImage(admin);
                session.setAttribute("adminProfileImageName", adminProfileImageName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // 관리자 탈퇴
    @Override
    public void remove(Admin admin) {
        adminDao.delete(admin);
    }

    // 관리자 비밀번호 확인
    @Override
    public boolean getPassword(String adminEmail, String adminPassword) {
        return BCrypt.checkpw(adminPassword, adminDao.selectPasswordByAdminEmail(adminEmail));
    }

    // 관리자 로그인 처리
    @Override
    public boolean login(Admin admin, HttpSession session) {
        // 
        Admin loginAdmin = adminDao.login(admin);
        if (loginAdmin != null && BCrypt.checkpw(admin.getAdminPassword(), loginAdmin.getAdminPassword())) {
            session.setAttribute("adminId", loginAdmin.getAdminId());
            session.setAttribute("adminEmail", loginAdmin.getAdminEmail());
            session.setAttribute("adminNickName", loginAdmin.getAdminNickName());
            session.setAttribute("adminProfileImageName", loginAdmin.getAdminProfileImageName());
            session.setAttribute("adminJoinDate", loginAdmin.getAdminJoinDate());
            return true;
        }
        return false;
    }

    // 관리자 로그인 시간 수정
    @Override
    public void modifyAdminLoginDate(String userEmail) {
        adminDao.updateLoginDate(userEmail);
    }

    // 관리자 로그아웃 처리
    @Override
    public void logout(HttpSession session) {
        session.invalidate();
    }

    // 관리자 리스트
    @Override
    public List<Admin> getAdmins() {
        return adminDao.selectListAdmins();
    }

}
