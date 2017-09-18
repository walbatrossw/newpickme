package com.cafe24.newpickme.resume.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Certificate {

    private int certificateId;

    private String certificateName;

    private String certificateGrade;

    private String certificateHost;

    private String certificatNumber;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date certificateBeginDate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date certificateEndDate;

    private int resumeId;

    private Resume resume;
}
