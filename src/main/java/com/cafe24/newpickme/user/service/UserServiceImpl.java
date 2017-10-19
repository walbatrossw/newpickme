package com.cafe24.newpickme.user.service;

import com.cafe24.newpickme.commons.fileupload.UploadFileUtils;
import com.cafe24.newpickme.user.domain.User;
import com.cafe24.newpickme.user.repository.UserDao;
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
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    //회원가입 처리
    @Override
    public void create(User user) {
        userDao.insert(user);
    }

    //회원가입 이메일 중복 확인
    @Override
    public int getOneByEmail(String userEmail) {
        return userDao.selectCountByEmail(userEmail);
    }

    //회원가입 닉네임 중복 확인
    @Override
    public int getOneByNickName(String userNickName) {
        return userDao.selectCountByNickName(userNickName);
    }

    //회원 목록
    @Override
    public List<User> getList() {
        return null;
    }

    //회원 정보 상세조회
    @Override
    public User getUserById(int userId) {
        return userDao.selectOneById(userId);
    }

    //회원 닉네임 수정
    @Override
    public void modifyUserNickName(User user) {
        userDao.updateUserNickName(user);
    }

    //회원 프로필 사진 변경
    @Transactional
    @Override
    public void modifyUserProfileImage(User user, HttpServletRequest request, HttpSession session) throws IOException {
        // 업로드 이미지 파일이 있으면
        if (!user.getUserProfileImage().isEmpty()) {
            final String REAL_PATH = request.getSession().getServletContext().getRealPath("/")+"resources/dist/img/users/profile/"; // 실서버 업로드 디렉토리
            final String PATH = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\users\\profile\\"; // 로컬 업로드 디렉토리
            // 기존의 파일삭제 처리
            String oldUserProfileImageName = userDao.selectUserProfileImageName(user.getUserId());
            if (oldUserProfileImageName != null) {
                new File(PATH + oldUserProfileImageName.replace('/', File.separatorChar)).delete();
            }
            // 새로운 파일을 업로드 처리
            String newUserProfileImageName = user.getUserProfileImage().getOriginalFilename(); // 원본 파일명 추출
            byte[] file = user.getUserProfileImage().getBytes(); // 파일 추출
            try {
                // 파일업로드, 경로 + UUID + 파일명 생성 처리
                String userProfileImageName = UploadFileUtils.uploadFile(PATH, newUserProfileImageName, file);
                user.setUserProfileImageName(userProfileImageName); // 파일명 setting
                userDao.updateUserProfileImage(user);
                session.setAttribute("userProfileImageName", userProfileImageName); // session에 저장된 프로필 사진명 변경
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //회원 비밀번호 변경
    @Override
    public void modifyUserPassword(User user) {
        userDao.updateUserPassword(user);
    }

    //회원 삭제, 탈퇴
    @Override
    public void remove(User user) {
        userDao.delete(user);
    }

    //회원 닉네임, 비밀번호 수정 또는 탈퇴를 위한 비밀번호 확인
    @Override
    public boolean checkPassword(String userEmail, String userPassword) {
        return BCrypt.checkpw(userPassword, userDao.selectPasswordByUserEmail(userEmail));
    }

    //로그인 처리
    @Override
    public boolean login(User user, HttpSession session) {
        User loginUser = userDao.login(user);
        if (loginUser != null && BCrypt.checkpw(user.getUserPassword(), loginUser.getUserPassword())) {
            session.setAttribute("userId", loginUser.getUserId());
            session.setAttribute("userEmail", loginUser.getUserEmail());
            session.setAttribute("userNickName", loginUser.getUserNickName());
            session.setAttribute("userProfileImageName", loginUser.getUserProfileImageName());
            session.setAttribute("userJoinDate", loginUser.getUserJoinDate());
            return true;
        }
        return false;
    }

    //로그인 시간 수정
    @Override
    public void modifyUserLoginDate(String userEmail) {
        userDao.updateLoginDate(userEmail);
    }

    //로그아웃
    @Override
    public void logout(HttpSession session) {
        session.invalidate();
    }

    //회원 목록
    @Override
    public List<User> getUsers() {
        return userDao.selectListUsers();
    }
}
