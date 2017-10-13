package com.cafe24.newpickme.coverletter.controller;

import com.cafe24.newpickme.coverletter.domain.UserCoverLetter;
import com.cafe24.newpickme.coverletter.service.CoverLetterService;
import com.cafe24.newpickme.recruit.domain.Recruit;
import com.cafe24.newpickme.recruit.domain.RecruitJob;
import com.cafe24.newpickme.recruit.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/coverletter")
public class CoverLetterController {

    @Autowired
    CoverLetterService coverLetterService;

    @Autowired
    RecruitService recruitService;

    // 기본 자기소개서 작성 페이지
    @RequestMapping(value = "/create/default", method = RequestMethod.GET)
    public String create() {
        return "/coverletter/create";
    }

    // 채용직무별 자기소개서 작성 페이지
    @RequestMapping(value = "/create/{recruitId}/{recruitJobId}", method = RequestMethod.GET)
    public String create(@PathVariable int recruitId, @PathVariable int recruitJobId, Model model) {
        Recruit recruit = recruitService.getRecruitByRecruitId(recruitId);
        RecruitJob recruitJob = recruitService.getRecruitJobByRecruitJobId(recruitJobId);
        model.addAttribute("recruit", recruit);
        model.addAttribute("recruitJob", recruitJob);
        return "/coverletter/create";
    }

    // 자기소개서 작성 처리
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(UserCoverLetter userCoverLetter, HttpSession session) {
        int userId = (Integer) session.getAttribute("userId");
        userCoverLetter.setUserId(userId);
        coverLetterService.create(userCoverLetter);
        return "redirect:/";
    }

    // 자기소개서 목록
    
    // 자기소개서 수정처리

    // 자기소개서 삭제처리

}
