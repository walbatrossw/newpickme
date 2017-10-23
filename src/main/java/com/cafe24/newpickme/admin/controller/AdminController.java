package com.cafe24.newpickme.admin.controller;

import com.cafe24.newpickme.admin.domain.Admin;
import com.cafe24.newpickme.admin.service.AdminService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    // 관리자 가입 페이지
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String adminRegister() {
        return "/admin/register";
    }

    // 관리자 가입 페이지 이메일 중복 확인
    @RequestMapping(value = "/duplicate/email", method = RequestMethod.POST)
    @ResponseBody
    public int duplicateEmailCheck(@RequestParam String adminEmail) {
        return adminService.getOneByEmail(adminEmail);
    }

    // 관리자 가입 페이지 닉네임 중복 확인
    @RequestMapping(value = "/duplicate/nickname", method = RequestMethod.POST)
    @ResponseBody
    public int duplicateNicknameCheck(@RequestParam String adminNickName) {
        return adminService.getOneByNickName(adminNickName);
    }

    // 관리자 가입 처리
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView adminRegister(@ModelAttribute Admin admin) {
        String hashPassword = BCrypt.hashpw(admin.getAdminPassword(), BCrypt.gensalt());
        admin.setAdminPassword(hashPassword);
        adminService.create(admin);
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "welcome");
        mav.setViewName("/admin/login");
        return mav;
    }


    // 관리자 통합 페이지(미정)

    // 관리자 프로필 페이지
    @RequestMapping(value = "/profile/{adminId}", method = RequestMethod.GET)
    public String adminProfile(@PathVariable int adminId, Model model) {
        model.addAttribute("admin", adminService.getAdminById(adminId));
        return "/admin/profile";
    }

    // 관리자 닉네임 변경
    @RequestMapping(value = "/profile/{adminId}/update/nickname", method = RequestMethod.POST)
    public String newAdminNickName(@PathVariable int adminId, @ModelAttribute Admin admin, HttpSession session) {
        // 관리자 닉네임 변경 처리
        adminService.modifyAdminNickName(admin);
        // 변경된 닉네임 session에 적용
        session.setAttribute("adminNickName", admin.getAdminNickName());
        return "redirect:/admin/profile/"+adminId;
    }

    // 관리자 비밀번호 변경
    @RequestMapping(value = "/profile/{adminId}/update/password", method = RequestMethod.POST)
    public ModelAndView newAdminPassword(@PathVariable int adminId, @ModelAttribute Admin admin, HttpSession session) {
        // 변경하려는 비밀번호를 암호화
        String hashPassword = BCrypt.hashpw(admin.getAdminPassword(), BCrypt.gensalt());
        // 비빌번호 변경 처리
        admin.setAdminPassword(hashPassword);
        // 로그아웃 처리
        adminService.logout(session);
        // 비밀번호 변경 성공 메시지 저장
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "newPwSuccess");
        // 로그인 페이지로 이동
        mav.setViewName("/admin/login");
        return mav;
    }

    // 관리자 프로필 이미지 변경
    @RequestMapping(value = "/profile/{adminId}/image/update", method = RequestMethod.POST)
    public String newAdminProfileImage(@PathVariable int adminId, Admin admin, HttpServletRequest request, HttpSession session) throws IOException {
        adminService.modifyAdminProfileImage(admin, request, session);
        return "redirect:/admin/profile/"+adminId;
    }

    // 관리자 탈퇴
    @RequestMapping(value = "/profile/{adminId}/withdrawal", method = RequestMethod.POST)
    public ModelAndView adminWithdraw(@PathVariable int adminId, @ModelAttribute Admin admin, HttpSession session) {
        // 관리자 삭제 처리
        adminService.remove(admin);
        // 관리자 로그아웃 처리
        adminService.logout(session);
        // 탈퇴 성공 메시지 저장, 로그인페이지로 이동
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "withdrawAdminSuccess");
        mav.setViewName("/admin/login");
        return mav;
    }

    // 관리자 비밀번호 확인
    @RequestMapping(value = "/password/check", method = RequestMethod.POST)
    @ResponseBody
    public boolean userPwCheck(@RequestParam String adminEmail, @RequestParam String adminPassword) {
        return adminService.getPassword(adminEmail, adminPassword);
    }

    // 관리자 로그인 페이지
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String adminLogin() {
        return "/admin/login";
    }

    // 관리자 로그인 처리
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView adminLogin(@ModelAttribute Admin admin, HttpSession session) {
        boolean result = adminService.login(admin, session);
        ModelAndView mav = new ModelAndView();
        if (result) {
            adminService.modifyAdminLoginDate(admin.getAdminEmail());
            mav.setViewName("redirect:/main");
            return mav;
        }
        mav.addObject("msg", "failure");
        mav.setViewName("/admin/login");
        return mav;
    }

    // 관리자 로그아웃
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView adminLogout(HttpSession session) {
        adminService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", "logout");
        mav.setViewName("/admin/login");
        return mav;
    }

    // 관리자 목록
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String admins(Model model) {
        List<Admin> admins = adminService.getAdmins();
        model.addAttribute("admins", admins);
        return "/admin/list";
    }
}
