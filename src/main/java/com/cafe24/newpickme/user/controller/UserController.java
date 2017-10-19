package com.cafe24.newpickme.user.controller;

import com.cafe24.newpickme.user.domain.User;
import com.cafe24.newpickme.user.service.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/*회원 컨트롤러*/
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    // 회원 가입 페이지
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String userRegister() {
        return "/user/register";
    }

    // 회원 가입 페이지 이메일 중복 확인
    @RequestMapping(value = "/duplicate/email", method = RequestMethod.POST)
    @ResponseBody
    public int duplicateEmailCheck(@RequestParam String userEmail) {
        return userService.getOneByEmail(userEmail);
    }

    // 회원 가입 페이지 닉네임 중복 확인
    @RequestMapping(value = "/duplicate/nickname", method = RequestMethod.POST)
    @ResponseBody
    public int duplicateNicknameCheck(@RequestParam String userNickName) {
        return userService.getOneByNickName(userNickName);
    }

    // 회원 가입 처리
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView userRegister(@ModelAttribute User user) {
        // 입력받은 비밀번호 암호화
        String hashPassword = BCrypt.hashpw(user.getUserPassword(), BCrypt.gensalt());
        user.setUserPassword(hashPassword);
        // 회원 가입 처리
        userService.create(user);
        ModelAndView mav = new ModelAndView();
        // 회원 가입 완료 후 welcome 메시지 저장
        mav.addObject("msg", "welcome");
        // 로그인 페이지로 이동
        mav.setViewName("/user/login");
        return mav;
    }

    // 회원 프로필 페이지
    @RequestMapping(value = "/profile/{userId}", method = RequestMethod.GET)
    public String userProfile(@PathVariable int userId, Model model) {
        model.addAttribute("user", userService.getUserById(userId));
        return "user/profile";
    }

    // 회원 닉네임 변경
    @RequestMapping(value = "/profile/{userId}/update/nickname", method = RequestMethod.POST)
    public String newUserNickName(@PathVariable int userId, @ModelAttribute User user, HttpSession session) {
        userService.modifyUserNickName(user);
        session.setAttribute("userNickName", user.getUserNickName());
        return "redirect:/user/profile/"+userId;
    }

    // 회원 프로필 사진 변경
    @RequestMapping(value = "/profile/{userId}/image/update", method = RequestMethod.POST)
    public String newUserProfileImage(@PathVariable int userId, User user, HttpServletRequest request, HttpSession session) throws IOException {
        userService.modifyUserProfileImage(user, request, session);
        return "redirect:/user/profile/"+userId;
    }

    // 회원 비밀번호 변경
    @RequestMapping(value = "/profile/{userId}/update/password", method = RequestMethod.POST)
    public ModelAndView newUserPassword(@PathVariable int userId, @ModelAttribute User user, HttpSession session) {
        // 변경하려는 비밀번호 암호화
        String hashPassword = BCrypt.hashpw(user.getUserPassword(), BCrypt.gensalt());
        user.setUserPassword(hashPassword);
        // 비빌번호 변경처리
        userService.modifyUserPassword(user);
        // 로그아웃 처리
        userService.logout(session);
        ModelAndView mav = new ModelAndView();
        // 비밀번호 변경 성공 메시지 저정
        mav.addObject("msg", "newPwSuccess");
        // 로그인 페이지로 이동
        mav.setViewName("/user/login");
        return mav;
    }

    // 회원 탈퇴
    @RequestMapping(value = "/profile/{userId}/withdrawal", method = RequestMethod.POST)
    public ModelAndView userWithdraw(@PathVariable int userId, @ModelAttribute User user, HttpSession session) {
        // 회원 삭제 처리
        userService.remove(user);
        // 세션에서 삭제처리
        userService.logout(session);
        ModelAndView mav = new ModelAndView();
        // 탈퇴 성공메시지 저장
        mav.addObject("msg", "withdrawUserSuccess");
        // 로그인 페이지로 이동
        mav.setViewName("/user/login");
        return mav;
    }

    // 회원 비밀번호 확인
    @RequestMapping(value = "/password/check", method = RequestMethod.POST)
    @ResponseBody
    public boolean userPwCheck(@RequestParam String userEmail, @RequestParam String userPassword) {
        return userService.checkPassword(userEmail, userPassword);
    }

    // 회원 로그인 페이지
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String userLogin() {
        return "/user/login";
    }

    // 회원 로그인 처리
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView userLogin(@ModelAttribute User user, HttpSession session) {
        // 로그인 처리
        boolean result = userService.login(user, session);
        ModelAndView mav = new ModelAndView();
        // 로그인 성공시
        if (result) {
            // 로그인시간 업데이트
            userService.modifyUserLoginDate(user.getUserEmail());
            mav.setViewName("redirect:/main");
            return mav;
        }
        // 로그인 실패시, failure 메시지와 로그인페이지로 이동
        mav.addObject("msg", "failure");
        mav.setViewName("/user/login");
        return mav;
    }

    // 회원 로그아웃
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView userLogout(HttpSession session) {
        userService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "logout");
        mav.setViewName("/user/login");
        return mav;
    }
    
    // 회원 목록
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String users(Model model) {
        List<User> users = userService.getUsers();
        model.addAttribute("users", users);
        return "/user/list";
    }
}
