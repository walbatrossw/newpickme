package com.cafe24.newpickme.recruit.controller;

import com.cafe24.newpickme.company.domain.Company;
import com.cafe24.newpickme.company.service.CompanyService;
import com.cafe24.newpickme.recruit.domain.*;
import com.cafe24.newpickme.recruit.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/recruit")
public class RecruitController {

    @Autowired
    RecruitService recruitService;

    @Autowired
    CompanyService companyService;

    /*채용 입력 페이지
    * Method : GET
    * Method Name : create()
    * URL : /recruit/create
    * */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(Model model) {
        // 직무 대분류 리스트
        List<JobCategory1> jobCategory1s = recruitService.getJobCategory1List();
        model.addAttribute("jobCategory1s", jobCategory1s);
        // 기업 명
        List<Company> companies = companyService.getCompanies();
        model.addAttribute("companies", companies);

        return "/recruit/create";
    }

    /*직무 소분류 목록
    * Method : GET
    * Method Name : getJobCategory2List()
    * URL : /recruit/job/category1/{jobCategory1Id}/list
    * */
    @RequestMapping(value = "/job/category1/{jobCategory1Id}/list", method = RequestMethod.GET)
    @ResponseBody
    public List<JobCategory2> getJobCategory2List(@PathVariable int jobCategory1Id) {
        System.out.println(recruitService.getJobCategory2List(jobCategory1Id));
        return recruitService.getJobCategory2List(jobCategory1Id);
    }

    /*채용 입력 처리
    * Method : POST
    * Method Name : create()
    * URL : /recruit/create
    * */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@ModelAttribute Recruit recruit,
                         HttpSession session) {
        // 기업 아이디
        int companyId = recruitService.getCompanyIdByCompanyName(recruit.getCompanyName());
        recruit.setCompanyId(companyId);

        // 관리자 아이디
        int adminId = (Integer) session.getAttribute("adminId");
        recruit.setAdminId(adminId);
        // 채용 입력
        recruitService.create(recruit);
        // 채용 ID
        int recruitId = recruit.getRecruitId();
        System.out.println(recruitId);
        // 채용 직무의 갯수
        int size = recruit.getRecruitJobs().size();

        // 채용 직무의 갯수만큼 반복
        for (int i = 0; i < size; i++){
            // 채용 아이디 Setting
            recruit.getRecruitJobs().get(i).setRecruitId(recruitId);
            RecruitJob recruitJob = recruit.getRecruitJobs().get(i);
            recruitService.create(recruitJob);

            int recruitJobId = recruit.getRecruitJobs().get(i).getRecruitJobId();
            // 채용 직무별 자기소개서 항목의 갯수
            int articleSize = recruit.getRecruitJobs().get(i).getCoverLetterArticles().size();
            // 채용 직무별 자기소개서 항목의 갯수만큼 반복
            for (int j = 0; j < articleSize; j++){
                // 채용 직무 아이디 Setting
                recruit.getRecruitJobs().get(i).getCoverLetterArticles().get(j).setRecruitJobId(recruitJobId);
                CoverLetterArticle coverLetterArticle = recruit.getRecruitJobs().get(i).getCoverLetterArticles().get(j);
                recruitService.create(coverLetterArticle);
            }
        }




        // 채용 입력
        // 채용 기본키 --> 채용 직무의 채용 외래키에 세팅
        // 채용 직무 입력
        // 채용 직무 기본키 --> 채용 직무 자소서항목의 채용직무 외래키에 세팅
        // 채용 직무 자기소개서 항목 입력
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
