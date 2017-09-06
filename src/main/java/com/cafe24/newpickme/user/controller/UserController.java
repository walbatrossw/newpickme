package com.cafe24.newpickme.user.controller;

import com.cafe24.newpickme.user.domain.User;
import com.cafe24.newpickme.user.service.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/*회원 컨트롤러*/
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /*회원가입 페이지*/
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String userRegister() {
        return "/user/register";
    }

    /*회원가입 페이지 이메일 중복 확인*/
    @RequestMapping(value = "/duplicate/email", method = RequestMethod.POST)
    @ResponseBody
    public int duplicateEmailCheck(@RequestParam String userEmail) {
        return userService.getOneByEmail(userEmail);
    }

    /*회원가입 페이지 닉네임 중복 확인*/
    @RequestMapping(value = "/duplicate/nickname", method = RequestMethod.POST)
    @ResponseBody
    public int duplicateNicknameCheck(@RequestParam String userNickName) {
        return userService.getOneByNickName(userNickName);
    }

    /*회원가입 처리*/
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView userRegister(@ModelAttribute User user) {
        // 입력받은 비밀번호 암호화
        String hashPassword = BCrypt.hashpw(user.getUserPassword(), BCrypt.gensalt());
        user.setUserPassword(hashPassword);
        userService.create(user);
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "welcome");
        mav.setViewName("/user/login");
        return mav;
    }

    /*회원 정보 상세 페이지 profile */
    @RequestMapping(value = "/profile/{userId}", method = RequestMethod.GET)
    public String userProfile(@PathVariable int userId, Model model) {
        model.addAttribute("user", userService.getUserById(userId));
        return "user/profile";
    }

    /*회원 닉네임 변경 처리*/
    @RequestMapping(value = "/profile/{userId}/update/nickname", method = RequestMethod.POST)
    public String newUserNickName(@PathVariable int userId, @ModelAttribute User user, HttpSession session) {
        userService.modifyUserNickName(user);
        session.setAttribute("userNickName", user.getUserNickName());
        return "redirect:/user/profile/"+userId;
    }

    /*회원 비밀번호 변경 처리 profile/update/password */
    @RequestMapping(value = "/profile/{userId}/update/password", method = RequestMethod.POST)
    public ModelAndView newUserPassword(@PathVariable int userId, @ModelAttribute User user, HttpSession session) {
        String hashPassword = BCrypt.hashpw(user.getUserPassword(), BCrypt.gensalt());
        user.setUserPassword(hashPassword);
        userService.modifyUserPassword(user);
        userService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "newPwSuccess");
        mav.setViewName("/user/login");
        return mav;
    }


    /*회원 탈퇴 처리 : 추후에 DB 테이블에서 완전 삭제가 아닌 상태변경으로 수정할 예정*/
    @RequestMapping(value = "/profile/{userId}/withdrawal", method = RequestMethod.POST)
    public ModelAndView userWithdraw(@PathVariable int userId, @ModelAttribute User user, HttpSession session) {
        userService.remove(user);
        userService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "withdrawUserSuccess");
        mav.setViewName("/user/login");
        return mav;
    }

    /*회원 비밀번호 확인*/
    @RequestMapping(value = "/password/check", method = RequestMethod.POST)
    @ResponseBody
    public boolean userPwCheck(@RequestParam String userEmail, @RequestParam String userPassword) {
        return userService.checkPassword(userEmail, userPassword);
    }

    /*회원 로그인 페이지*/
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String userLogin() {
        return "/user/login";
    }

    /*회원 로그인 처리*/
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

    /*회원 로그아웃 처리*/
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView userLogout(HttpSession session) {
        userService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "logout");
        mav.setViewName("/user/login");
        return mav;
    }
}
