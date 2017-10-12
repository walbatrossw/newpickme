package com.cafe24.newpickme.coverletter.controller;

import com.cafe24.newpickme.recruit.domain.Recruit;
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
    RecruitService recruitService;

    // 기본 자기소개서 작성 페이지
    @RequestMapping(value = "/create/default", method = RequestMethod.GET)
    public String create() {
        return "/coverletter/create";
    }

    // 기본 자기소개서 작성 페이지
    @RequestMapping(value = "/create/{recruitJobId}", method = RequestMethod.GET)
    public String create(@PathVariable int recruitJobId, HttpSession session, Model model) {
        Recruit recruit = recruitService.getRecruitJobByRecruitJobId(recruitJobId);
        System.out.println(recruit);
        model.addAttribute("recruit", recruit);
        return "/coverletter/create";
    }

    // 자기소개서 작성 처리

    // 자기소개서 목록


    // 자기소개서 수정처리

    // 자기소개서 삭제처리

}
