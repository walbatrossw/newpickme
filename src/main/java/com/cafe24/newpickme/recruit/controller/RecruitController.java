package com.cafe24.newpickme.recruit.controller;

import com.cafe24.newpickme.recruit.domain.JobCategory2;
import com.cafe24.newpickme.recruit.domain.Recruit;
import com.cafe24.newpickme.recruit.domain.RecruitJob;
import com.cafe24.newpickme.recruit.domain.CoverLetterArticle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/recruit")
public class RecruitController {

    /*채용 입력 페이지
    * Method : GET
    * Method Name : create()
    * URL : /recruit/create
    * */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create() {
        return "/recruit/create";
    }

    /*직무 소분류 목록
    * Method : GET
    * Method Name : getJobCategory2List()
    * URL : /recruit/job/category1/{jobCategory1Id}/list
    * */
    @RequestMapping(value = "/job/category1/{jobCategory1Id}/list", method = RequestMethod.GET)
    public List<JobCategory2> getJobCategory2List(@PathVariable int jobCategory1Id) {
        return null;
    }

    /*채용 입력 처리
    * Method : POST
    * Method Name : create()
    * URL : /recruit/create
    * */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@ModelAttribute Recruit recruit,
                         @ModelAttribute RecruitJob recruitJob,
                         @ModelAttribute CoverLetterArticle coverletterArticle,
                         HttpSession session) {
        return "redirect:/recruit/list";
    }

    /*채용 목록 페이지
    * Method : GET
    * Method Name : getRecruits()
    * URL : /recruit/list
    * */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getRecruits() {
        return "/recruit/list";
    }

    /*채용 상세 페이지
    * Method : GET
    * Method Name : getRecruit()
    * URL : /recruit/{recruitId}
    * */
    @RequestMapping(value = "/{recruitId}", method = RequestMethod.GET)
    public String getRecruit(@PathVariable int recruitId) {
        return "/recruit/info";
    }

    /*채용 수정 처리
    * Method : POST
    * Method Name : updateRecruit()
    * URL : /recruit/{recruitId}/update
    * */
    @RequestMapping(value = "/{recruitId}/update", method = RequestMethod.POST)
    public String updateRecruit(@PathVariable int recruitId,
                                @ModelAttribute Recruit recruit,
                                @ModelAttribute RecruitJob recruitJob,
                                @ModelAttribute CoverLetterArticle coverletterArticle,
                                HttpSession session) {
        return "redirect:/recruit/list";
    }

    /*채용 삭제 처리
    * Method : GET
    * Method Name : deleteRecruit()
    * URL : /recruit/{recruitId}/delete
    * */
    @RequestMapping(value = "/{recruitId}/delete", method = RequestMethod.GET)
    public String deleteRecruit(@PathVariable int recruitId,
                                @ModelAttribute Recruit recruit,
                                @ModelAttribute RecruitJob recruitJob,
                                @ModelAttribute CoverLetterArticle coverletterArticle,
                                HttpSession session) {
        return "redirect:/recruit/list";
    }

    /*채용 달력 페이지
    * Method : GET
    * Method Name : recruitCalendar()
    * URL : /recruit/calendar
    * */
    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String recruitCalendar() {
        return "/recruit/calendar";
    }
}
