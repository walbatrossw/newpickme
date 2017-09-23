package com.cafe24.newpickme.resume.controller;

import com.cafe24.newpickme.resume.domain.Resume;
import com.cafe24.newpickme.resume.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/resume")
public class ResumeController {


    @Autowired
    ResumeService resumeService;

    /*
    * 이력서 작성 페이지
    *
    *
    * */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create() {
        return "/resume/create";
    }

    /*
     * 이력서 입력 처리
     *
     *
     * */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@ModelAttribute Resume resume, HttpSession session) {
        resumeService.create(resume, session);
        return "/resume/create";
    }

    /*
    * 이력서 수정 페이지
    *
    *
    * */
    @RequestMapping(value = "/{userId}/update", method = RequestMethod.GET)
    public String update(@PathVariable int userId) {
        return "/resume/update";
    }

    /*
    * 이력서 수정 처리
    *
    *
    *
    * */
    @RequestMapping(value = "/{userId}/update", method = RequestMethod.POST)
    public String update(@PathVariable int userId, @ModelAttribute Resume resume) {
        return "/resume/update";
    }


    /*
    * 이력서 보기
    *
    *
    *
    * */
    @RequestMapping(value = "/{userId}/view", method = RequestMethod.GET)
    public String view(@PathVariable int userId, Model model) {
        Resume resume = resumeService.getResume(userId);
        System.out.println(resume);
        model.addAttribute("resume", resume);
        return "/resume/view";
    }

    /*
    * 이력서 삭제 처리
    *
    *
    *
    * */
    @RequestMapping(value = "/{userId}/delete", method = RequestMethod.GET)
    public String delete(@PathVariable int userId) {
        return "/resume/create";
    }
}
