package com.cafe24.newpickme.resume.service;

import com.cafe24.newpickme.commons.fileupload.UploadFileUtils;
import com.cafe24.newpickme.resume.domain.*;
import com.cafe24.newpickme.resume.repository.ResumeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ResumeServiceImpl implements ResumeService {

    @Autowired
    ResumeDao resumeDao;

    // 이력서 작성여부 체크
    @Override
    public boolean resumeCheck(int userId) {
        return resumeDao.resumeCheck(userId);
    }

    // 이력서 작성 및 수정 처리
    @Transactional
    @Override
    public void create(Resume resume, HttpSession session, HttpServletRequest request) throws IOException {

        // 업로드 이미지파일이 있으면
        if (!resume.getPersonal().getPersonalImage().isEmpty()) {
            final String REAL_PATH = request.getSession().getServletContext().getRealPath("/")+"resources/dist/img/resume/personal/"; // 서버 업로드 디렉토리
            final String PATH = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\resume\\personal\\"; // 로컬 업로드 디렉토리
            // 이미지파일 수정처리 기존의 파일을 삭제
            if (resume.getResumeId() != 0) {
                String personalImageName = resumeDao.selectPersonalImageName(resume.getResumeId());
                if (personalImageName != null) {
                    new File(PATH + personalImageName.replace('/', File.separatorChar)).delete();
                }
            }
            String originalFilename = resume.getPersonal().getPersonalImage().getOriginalFilename(); // 원본파일명 추출
            byte[] file = resume.getPersonal().getPersonalImage().getBytes();   // 파일 추출
            try {
                // 파일업로드, 경로+UUID+파일명 생성
                String personalImageName = UploadFileUtils.uploadFile(PATH, originalFilename, file);
                resume.getPersonal().setPersonalImageName(personalImageName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        int userId = (Integer) session.getAttribute("userId");
        // 이력서
        resume.setUserId(userId);
        resumeDao.insertResume(resume);
        int resumeId = resume.getResumeId();

        // 개인신상
        Personal personal = resume.getPersonal();
        personal.setResumeId(resumeId);
        resumeDao.insertResumePersonal(personal);

        // 고등학교
        HighSchool highSchool = resume.getHighSchool();
        highSchool.setResumeId(resumeId);
        resumeDao.insertResumeHighSchool(highSchool);

        // 대학교, 대학원
        List<University> universities = resume.getUniversities();
        for (University university : universities) {
            university.setResumeId(resumeId);
            resumeDao.insertResumeUniversity(university);
        }

        // 어학시험
        List<Language> languages = resume.getLanguages();
        for (Language language : languages) {
            language.setResumeId(resumeId);
            resumeDao.insertResumeLanguage(language);
        }

        // 자격증
        List<Certificate> certificates = resume.getCertificates();
        for (Certificate certificate : certificates) {
            certificate.setResumeId(resumeId);
            resumeDao.insertResumeCertificate(certificate);
        }

        // 경력
        List<Career> careers = resume.getCareers();
        for (Career career : careers) {
            career.setResumeId(resumeId);
            resumeDao.insertResumeCareer(career);
        }

        // 직무 관련 활동
        List<Activity> activities = resume.getActivities();
        for (Activity activity: activities) {
            activity.setResumeId(resumeId);
            resumeDao.insertResumeActivity(activity);
        }

        // 기타 사항
        List<Etc> etcs = resume.getEtcs();
        for (Etc etc : etcs) {
            etc.setResumeId(resumeId);
            resumeDao.insertResumeEtc(etc);
        }

    }

    //이력서 보기
    @Override
    public Resume getResume(int userId) {
        return resumeDao.selectResumeByUserId(userId);
    }


    //이력서 삭제 Cascade 
    @Override
    public void deleteResume(int userId) {
        resumeDao.deleteResume(userId);
    }

    //이력서 삭제 None Cascade
    @Transactional
    @Override
    public void deleteResumeNoneCascade(int resumeId) {

        //final String realPath = request.getSession().getServletContext().getRealPath("/")+"resources/dist/img/resume/personal/"; // 서버 업로드 디렉토리
        final String path = "D:\\WORKSPACE\\Spring-MVC-NewPickme\\newpickme\\src\\main\\webapp\\resources\\dist\\img\\resume\\personal\\"; // 로컬 업로드 디렉토리

        // 이미지파일 삭제
        String personalImageName = resumeDao.selectPersonalImageName(resumeId);
        new File(path + personalImageName.replace('/', File.separatorChar)).delete();

        resumeDao.deleteResumeEtcNoneCascade(resumeId);
        resumeDao.deleteResumeActivityNoneCascade(resumeId);
        resumeDao.deleteResumeCareerNoneCascade(resumeId);
        resumeDao.deleteResumeCertificateNoneCascade(resumeId);
        resumeDao.deleteResumeLanguageNoneCascade(resumeId);
        resumeDao.deleteResumeUniversityNoneCascade(resumeId);
        resumeDao.deleteResumeHighSchoolNoneCascade(resumeId);
        resumeDao.deleteResumePersonalNoneCascade(resumeId);
        resumeDao.deleteResumeNoneCascade(resumeId);
    }

    @Override
    public void deleteResumeUniversity(int universityId) {
        resumeDao.deleteResumeUniversity(universityId);
    }

    @Override
    public void deleteResumeLanguage(int languageId) {
        resumeDao.deleteResumeLanguage(languageId);
    }

    @Override
    public void deleteResumeCertificate(int certificateId) {
        resumeDao.deleteResumeCertificate(certificateId);
    }

    @Override
    public void deleteResumeCareer(int careerId) {
        resumeDao.deleteResumeCareer(careerId);
    }

    @Override
    public void deleteResumeActivity(int activityId) {
        resumeDao.deleteResumeActivity(activityId);
    }

    @Override
    public void deleteResumeEtc(int etcId) {
        resumeDao.deleteResumeEtc(etcId);
    }


}
