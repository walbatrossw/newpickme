package com.cafe24.newpickme.recruit.controller;

import com.cafe24.newpickme.company.domain.Company;
import com.cafe24.newpickme.company.domain.IndustryCategory1;
import com.cafe24.newpickme.company.service.CompanyService;
import com.cafe24.newpickme.recruit.domain.*;
import com.cafe24.newpickme.recruit.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/recruit")
public class RecruitController {

    @Autowired
    RecruitService recruitService;

    @Autowired
    CompanyService companyService;

    // 채용 입력 페이지 (/recruit/create, get)
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(Model model) {
        List<JobCategory1> jobCategory1s = recruitService.getJobCategory1s(); // 직무 대분류 목록
        List<Company> companies = companyService.getCompanies(); // 기업명
        model.addAttribute("jobCategory1s", jobCategory1s);
        model.addAttribute("companies", companies);
        return "/recruit/create";
    }

    // 직무 소분류 (/recruit/job/{category1Id}/list)
    @RequestMapping(value = "/jobCategory1s/{jobCategory1Id}/jobCategory2s/list", method = RequestMethod.GET)
    @ResponseBody
    public List<JobCategory2> getJobCategory2s(@PathVariable int jobCategory1Id) {
        return recruitService.getJobCategory2sByJobCategory1Id(jobCategory1Id);
    }

    // 채용 입력 처리 (/recruit/create, post)
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@ModelAttribute Recruit recruit, HttpSession session, HttpServletRequest request) throws IOException {
        int adminId = (Integer) session.getAttribute("adminId"); // 세션 조회 (관리자 id)
        int companyId = companyService.getCompanyIdByCompanyName(recruit.getCompanyName()); // 기업 id 조회
        recruit.setAdminId(adminId); // 관리자 id setting
        recruit.setCompanyId(companyId); // 기업 id setting
        recruitService.create(recruit, request);
        return "redirect:/recruit/list";
    }

    // 채용 목록 (/recruit/list, get)
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getRecruits(Model model) {
        List<Recruit> recruits = recruitService.getRecruits();
        model.addAttribute("recruits", recruits);
        return "/recruit/list";
    }

    // 채용 상세 페이지 (/recruit/{recruitId}, get)
    @RequestMapping(value = "/{recruitId}", method = RequestMethod.GET)
    public String getRecruit(@PathVariable int recruitId, Model model) {
        Recruit recruit = recruitService.getRecruitByRecruitId(recruitId); // 채용
        Company companyInfo = companyService.getCompanyInfo(recruit.getCompanyId()); // 기업 정보
        model.addAttribute("recruit", recruit);
        model.addAttribute("companyInfo", companyInfo);
        return "/recruit/info";
    }

    // 채용 수정 페이지 (/recruit/{recruitId}/update, get)
    @RequestMapping(value = "/{recruitId}/update", method = RequestMethod.GET)
    public String updateRecruit(@PathVariable int recruitId, Model model) {
        Recruit recruit = recruitService.getRecruitByRecruitId(recruitId); // 채용
        Company companyInfo = companyService.getCompanyInfo(recruit.getCompanyId()); // 기업 정보
        List<JobCategory1> jobCategory1s = recruitService.getJobCategory1s(); // 직무 대분류 리스트
        model.addAttribute("recruit", recruit);
        model.addAttribute("companyInfo", companyInfo);
        model.addAttribute("jobCategory1s", jobCategory1s);
        return "/recruit/update";
    }

    // 채용 수정 처리 (/recruit/{recruitId}/update, post)
    @RequestMapping(value = "/{recruitId}/update", method = RequestMethod.POST)
    public String updateRecruit(@PathVariable int recruitId, @ModelAttribute Recruit recruit, HttpSession session, HttpServletRequest request) throws IOException {
        int adminId = (Integer) session.getAttribute("adminId"); // 수정한 관리자 아이디
        recruit.setAdminId(adminId);
        recruit.setRecruitId(recruitId);
        recruitService.modifyRecruit(recruit, request);
        return "redirect:/recruit/" + recruitId + "/update";
    }

    // 채용직무 수정 처리 1 - 직무 및 자소서 항목 일괄 수정 (/recruit/{recruitId}/{recruitJobId}/update, post)
    @RequestMapping(value = "/{recruitId}/jobs/update", method = RequestMethod.POST)
    public String updateRecruitJob(@PathVariable int recruitId, Recruit recruit) {
        List<RecruitJob> recruitJobs = recruit.getRecruitJobs();
        for (RecruitJob recruitJob : recruitJobs) {
            recruitService.modifyRecruitJob(recruitJob);
        }
        return "redirect:/recruit/"+recruitId+"/update";
    }

    // 채용직무 수정 처리 2 - 직무 추가 (/{recruitId}/job/create, POST)
    @RequestMapping(value = "/{recruitId}/job/create", method = RequestMethod.POST)
    public String addRecruitJob(@PathVariable int recruitId, RecruitJob recruitJob) {
        recruitService.createRecruitJob(recruitJob);
        return "redirect:/recruit/"+recruitId+"/update";
    }

    // 채용직무별 자기소개서 수정 처리 (/recruit/{recruitId}/{recruitJobId}/articles/update, post)
    @RequestMapping(value = "/{recruitId}/job/{recruitJobId}/articles/update", method = RequestMethod.POST)
    public String updateArticles(@PathVariable int recruitId, @PathVariable int recruitJobId, RecruitJob recruitJob) {
        List<CoverLetterArticle> coverLetterArticles = recruitJob.getCoverLetterArticles();
        for (CoverLetterArticle coverLetterArticle : coverLetterArticles) {
            coverLetterArticle.setRecruitJobId(recruitJobId);
            recruitService.modifyArticle(coverLetterArticle);
        }
        return "redirect:/recruit/" + recruitId + "/update";
    }

    // 채용 삭제처리 (/recruit/{recruitId}/delete, get)
    @RequestMapping(value = "/{recruitId}/delete", method = RequestMethod.GET)
    public String deleteRecruit(@PathVariable int recruitId) {
        recruitService.removeRecruit(recruitId);
        return "redirect:/recruit/list";
    }


    // 채용직무 삭제처리 (/recruit/{recruitId}/{recruitJobId}/delete, get)
    @RequestMapping(value = "/{recruitId}/job/{recruitJobId}/delete", method = RequestMethod.GET)
    public String deleteRecruitJob(@PathVariable int recruitId, @PathVariable int recruitJobId) {
        recruitService.removeRecruitJob(recruitJobId);
        return "redirect:/recruit/" + recruitId + "/update";
    }


    // 채용직무별 자기소개서 항목 삭제 처리 (/recruit/{recruitId}/{recruitJobId}/{coverLetterArticleId}/delete, get)
    @RequestMapping(value = "/{recruitId}/{recruitJobId}/{coverLetterArticleId}/delete", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteArticles(@PathVariable int recruitId, @PathVariable int recruitJobId, @PathVariable int coverLetterArticleId) {
        ResponseEntity<String> entity = null;
        try {
            recruitService.removeCoverLetterArticle(coverLetterArticleId);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 채용 달력 페이지 (/recruit/calendar, get)
    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String getRecruitsForCalendar(Model model) {
        List<Recruit> recruits = recruitService.getRecruits(); // 채용리스트
        List<JobCategory1> jobCategory1s = recruitService.getJobCategory1s(); // 직무 대분류 리스트
        List<IndustryCategory1> industryCategory1s = companyService.getIndustryCategory1s(); // 업종 대분류 리스트
        model.addAttribute("jobCategory1s", jobCategory1s);
        model.addAttribute("recruits", recruits);
        model.addAttribute("industryCategory1s", industryCategory1s);
        return "/recruit/calendar";
    }

    // 채용 달력 페이지 (검색처리)
    @RequestMapping(value = "/calendar", method = RequestMethod.POST)
    public ModelAndView getRecruitsForSearchedCalendar(int[] jobCategory1Id, int[] industryCategory1Id, String[] companyType, String[] recruitJobType, String[] recruitJobEdu) {
        List<Recruit> recruits = recruitService.getRecruits(jobCategory1Id, industryCategory1Id, companyType, recruitJobType, recruitJobEdu); // 채용리스트
        System.out.println(recruits);
        List<JobCategory1> jobCategory1s = recruitService.getJobCategory1s(); // 직무 대분류 리스트
        List<IndustryCategory1> industryCategory1s = companyService.getIndustryCategory1s(); // 업종 대분류 리스트

        ModelAndView mav = new ModelAndView();
        mav.addObject("recruits", recruits);
        mav.addObject("jobCategory1s", jobCategory1s);
        mav.addObject("industryCategory1s", industryCategory1s);
        mav.addObject("jobCategory1Id", jobCategory1Id);
        mav.addObject("industryCategory1Id", industryCategory1Id);
        mav.addObject("companyType", companyType);
        mav.addObject("recruitJobType", recruitJobType);
        mav.addObject("recruitJobEdu", recruitJobEdu);
        mav.setViewName("/recruit/calendar");
        return mav;
    }
}
