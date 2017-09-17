package com.cafe24.newpickme.resume.controller;

import com.cafe24.newpickme.resume.domain.Resume;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/resume")
public class ResumeController {

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
    public String create(@ModelAttribute Resume resume) {
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
    * 이력서 화면 처리
    *
    *
    *
    * */
    @RequestMapping(value = "/{userId}/view", method = RequestMethod.GET)
    public String update(@PathVariable int userId, Model model) {
        return "/resume/view";
    }

    /*
    * 이력서 삭제 처리
    *
    *
    *
    * */
    @RequestMapping(value = "/{userId}/delete", method = RequestMethod.GET)
    public String delete() {
        return "/resume/create";
    }
}
