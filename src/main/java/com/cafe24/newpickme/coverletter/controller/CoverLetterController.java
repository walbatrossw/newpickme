package com.cafe24.newpickme.coverletter.controller;

import com.cafe24.newpickme.coverletter.domain.UserCoverLetter;
import com.cafe24.newpickme.coverletter.service.CoverLetterService;
import com.cafe24.newpickme.recruit.domain.Recruit;
import com.cafe24.newpickme.recruit.domain.RecruitJob;
import com.cafe24.newpickme.recruit.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

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

    // 기본 자기소개서 작성 처리
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(UserCoverLetter userCoverLetter, HttpSession session) {
        int userId = (Integer) session.getAttribute("userId");
        userCoverLetter.setUserId(userId);
        coverLetterService.create(userCoverLetter);
        return "redirect:/coverletter/list";
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

    // 채용직무별 자기소개서 작성 처리
    @RequestMapping(value = "/create/{recruitJobId}", method = RequestMethod.POST)
    public String create(@PathVariable int recruitJobId, UserCoverLetter userCoverLetter, HttpSession session) {
        int userId = (Integer) session.getAttribute("userId");
        userCoverLetter.setUserId(userId);
        userCoverLetter.setRecruitJobId(recruitJobId);
        coverLetterService.create(userCoverLetter);
        return "redirect:/coverletter/list";
    }

    // 자기소개서 목록
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getCoverLetters(HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        List<UserCoverLetter> userCoverLetters = coverLetterService.getCoverLetters(userId);
        model.addAttribute("userCoverLetters", userCoverLetters);
        return "/coverletter/list";
    }

    // 자기소개서 상세보기 및 수정 페이지
    @RequestMapping(value = "/update/{userCoverLetterId}", method = RequestMethod.GET)
    public String update(@PathVariable int userCoverLetterId, Model model) {
        UserCoverLetter userCoverLetter = coverLetterService.getUserCoverLetter(userCoverLetterId);
        model.addAttribute("userCoverLetter", userCoverLetter);
        return "/coverletter/update";
    }

    // 자기소개서 수정처리
    @RequestMapping(value = "/update/{userCoverLetterId}", method = RequestMethod.POST)
    public String update(@PathVariable int userCoverLetterId, UserCoverLetter userCoverLetter) {
        return "redirect:/coverletter/list";
    }

    // 자기소개서 삭제처리
    @RequestMapping(value = "/delete/{userCoverLetterId}", method = RequestMethod.GET)
    public String delete(@PathVariable int userCoverLetterId) {
        coverLetterService.deleteUserCoverLetter(userCoverLetterId);
        return "redirect:/coverletter/list";
    }


    // 자기소개서 항목 삭제처리
    @RequestMapping(value = "/{userCoverLetterId}/{userCoverLetterArticleId}/delete", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteUserCoverLetterArticle(@PathVariable int userCoverLetterArticleId, HttpSession session) {
        ResponseEntity<String> entity = null;
        try {
            coverLetterService.deleteUserCoverLetterArticle(userCoverLetterArticleId);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
}
