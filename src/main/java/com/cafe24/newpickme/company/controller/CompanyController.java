package com.cafe24.newpickme.company.controller;

import com.cafe24.newpickme.company.domain.Company;
import com.cafe24.newpickme.company.domain.IndustryCategory2;
import com.cafe24.newpickme.company.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    CompanyService companyService;

    /* 기업 등록 페이지
    * URL : /company/info/create
    * Method : GET
    * Method Name : create()
    * */
    @RequestMapping(value = "/info/create", method = RequestMethod.GET)
    public String companyCreate(Model model) {
        model.addAttribute("IndustryCategory1", companyService.getIndustryCategory1s());
        return "/company/create";
    }

    /* 업종 소분류 조회
    * URL : /company/info/industry/category2/{industryCategory1Id}
    * Method : GET
    * Method Name : getIndustryCategory2()
    * */
    @RequestMapping(value = "/info/industry/category2/{industryCategory1Id}", method = RequestMethod.GET)
    @ResponseBody
    public List<IndustryCategory2> getIndustryCategory2s(@PathVariable int industryCategory1Id) {
        return companyService.getIndustryCategory2sByIndustryCategory1Id(industryCategory1Id);
    }

    /* 기업 등록 처리
    * URL : /company/create
    * Method : POST
    * Method Name : companyCreate()
    * */
    @RequestMapping(value = "/info/create", method = RequestMethod.POST)
    public String companyCreate(@ModelAttribute Company company, HttpSession session) {
        int writerId = (Integer) session.getAttribute("adminId");
        company.setAdminId(writerId);
        companyService.create(company);
        return "redirect:/company/info/list";
    }


    /* 기업 목록
    * URL : /company/info/list
    * Method : GET
    * Method Name : companyList()
    * */
    @RequestMapping(value = "/info/list", method = RequestMethod.GET)
    public String companyList(Model model) {
        model.addAttribute("companies", companyService.getCompanies());
        return "/company/list";
    }


    /* 기업 상세 조회
    * URL : /company/info/{companyId}
    * Method : GET
    * Method Name : companyInfo()
    * */
    @RequestMapping(value = "/info/{companyId}", method = RequestMethod.GET)
    public String companyInfo(@PathVariable int companyId, Model model) {
        model.addAttribute("companyInfo", companyService.getCompanyInfo(companyId));
        model.addAttribute("IndustryCategory1", companyService.getIndustryCategory1s());
        return "/company/info";
    }

    /* 기업 수정 처리
    * URL : /company/info/{companyId}/update
    * Method : POST
    * Method Name : companyInfoUpdate()
    * */
    @RequestMapping(value = "/info/{companyId}/update", method = RequestMethod.POST)
    public String companyInfoUpdate(@PathVariable int companyId, @ModelAttribute Company company, HttpSession session) {
        company.setCompanyId(companyId);
        int writerId = (Integer) session.getAttribute("adminId");
        company.setAdminId(writerId);
        companyService.modifyCompanyInfo(company);
        return "redirect:/company/info/list";
    }

    /* 기업 삭제 처리
    * URL : /company/info/{companyId}/delete
    * Method :
    * Method Name :
    * */
    @RequestMapping(value = "/info/{companyId}/delete", method = RequestMethod.GET)
    public String companyInfoDelete(@PathVariable int companyId) {
        companyService.removeCompanyInfo(companyId);
        return "redirect:/company/info/list";
    }


}
