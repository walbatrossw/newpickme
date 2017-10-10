package com.cafe24.newpickme.resume.controller;

import com.cafe24.newpickme.resume.domain.Resume;
import com.cafe24.newpickme.resume.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
    public String create(HttpSession session) {
        int userId = (Integer) session.getAttribute("userId");
        boolean isResume = resumeService.isResume(userId);
        if (isResume) {
            return "redirect:/resume/"+userId+"/view";
        }
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
    public String update(@PathVariable int userId, Model model) {
        Resume resume = resumeService.getResume(userId);
        model.addAttribute("resume", resume);
        return "/resume/update";
    }

    /*
    * 이력서 수정 처리
    *
    *
    *
    * */
    @RequestMapping(value = "/{userId}/update", method = RequestMethod.POST)
    public String update(@PathVariable int userId, @ModelAttribute Resume resume, HttpSession session) {
        resumeService.create(resume, session);
        return "redirect:/resume/"+userId+"/view";
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
        model.addAttribute("resume", resume);
        return "/resume/view";
    }

    /*
    * 이력서 삭제(초기화) 처리 (CASCADE 설정시)
    *
    *
    *
    * */
    @RequestMapping(value = "/{userId}/delete", method = RequestMethod.GET)
    public String deleteResume(@PathVariable int userId) {
        resumeService.deleteResume(userId);
        return "redirect:/resume/create";
    }

    /*
    * 이력서 삭제(초기화) 처리 (CASCADE 미지원시)
    *
    *
    *
    * */
    @RequestMapping(value = "/{userId}/delete/{resumeId}", method = RequestMethod.GET)
    public String deleteResumeNoneCascade(@PathVariable int userId, @PathVariable int resumeId) {
        resumeService.deleteResumeNoneCascade(resumeId);
        return "redirect:/resume/create";
    }


    /**
     * 이력서 항목 삭제 : 대학교, 대학원
     *
     * */
    @RequestMapping(value = "/{userId}/university/{universityId}/delete", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteUniversity(@PathVariable int userId, @PathVariable int universityId) {
        ResponseEntity<String> entity = null;
        try {
            resumeService.deleteResumeUniversity(universityId);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 이력서 항목 삭제 : 어학시험
    @RequestMapping(value = "/{userId}/language/{languageId}/delete", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteLanguage(@PathVariable int userId, @PathVariable int languageId) {
        ResponseEntity<String> entity = null;
        try {
            resumeService.deleteResumeLanguage(languageId);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 이력서 항목 삭제 : 자격증
    @RequestMapping(value = "/{userId}/certificate/{certificateId}/delete", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteCertificate(@PathVariable int userId, @PathVariable int certificateId) {
        ResponseEntity<String> entity = null;
        try {
            resumeService.deleteResumeCertificate(certificateId);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 이력서 항목 삭제 : 경력
    @RequestMapping(value = "/{userId}/career/{careerId}/delete", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteCareer(@PathVariable int userId, @PathVariable int careerId) {
        ResponseEntity<String> entity = null;
        try {
            resumeService.deleteResumeCareer(careerId);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 이력서 항목 삭제 : 활동사항
    @RequestMapping(value = "/{userId}/activity/{activityId}/delete", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteActivity(@PathVariable int userId, @PathVariable int activityId) {
        ResponseEntity<String> entity = null;
        try {
            resumeService.deleteResumeActivity(activityId);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 이력서 항목 삭제 : 기타사항
    @RequestMapping(value = "/{userId}/etc/{etcId}/delete", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteEtc(@PathVariable int userId, @PathVariable int etcId) {
        ResponseEntity<String> entity = null;
        try {
            resumeService.deleteResumeEtc(etcId);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

}
