<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!--헤드(CSS) include-->
    <%@ include file="../include/head.jsp" %>
</head>
<body class="fixed skin-blue-light sidebar-mini">
<div class="wrapper">

    <!--헤더 네비바 include-->
    <%@ include file="../include/navbar.jsp" %>

    <!--사이드 메뉴 include-->
    <%@ include file="../include/left_column.jsp" %>

    <!--본문 페이지-->
    <div class="content-wrapper">

        <!--본문 페이지 헤더-->
        <section class="content-header">
            <h1>
                이력서
                <small>페이지 소제목</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 대분류</a></li>
                <li class="active"> 소분류</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <form id="resumeUpdateForm" action="${path}/resume/${sessionScope.userId}/update" method="post">
                <div class="row">
                    <section class="col-lg-8">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-user-secret"></i> 이력서 정보</h3>
                                <div class="box-tools">
                                    <a href="${path}/resume/${sessionScope.userId}/delete" type="button" class="btn btn-primary"><i class="fa fa-remove"></i> 이력서 초기화(cascade)</a>
                                    <a href="${path}/resume/${sessionScope.userId}/delete/${resume.resumeId}" type="button" class="btn btn-primary"><i class="fa fa-remove"></i> 이력서 초기화(none cascade)</a>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group col-sm-4">
                                    <label for="resumeName">이력서 이름</label>
                                    <input type="text" class="form-control" id="resumeName" name="resumeName" value="${resume.resumeName}">
                                    <input type="hidden" class="form-control" id="resumeId" name="resumeId" value="${resume.resumeId}">
                                </div>
                                <div class="form-group col-sm-4">
                                    <strong> 이력서 작성일자</strong>
                                    <p class="text-muted">
                                        <fmt:formatDate value="${resume.resumeWriteDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </div>
                                <div class="form-group col-sm-4">
                                    <strong> 이력서 수정일자</strong>
                                    <p class="text-muted">
                                        <fmt:formatDate value="${resume.resumeUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </div>
                            </div>

                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-user-secret"></i> 개인 신상 정보</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-sm-2" align="center">
                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                            <div class="fileinput-new thumbnail" style="width: 120px; height: 160px;">
                                                <img src="${path}/dist/img/default-user-image.jpg" alt="...">
                                            </div>

                                            <div class="fileinput-preview fileinput-exists thumbnail" style="width: 120px; height: 160px;"></div>

                                            <div>
                                            <span class="btn btn-default btn-file">
                                                <span class="fileinput-new">사진 선택</span>
                                                <span class="fileinput-exists">변경</span>
                                                <input type="file" id="personalImage" name="...">
                                            </span>
                                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">삭제</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="personalName">이름</label>
                                                <input type="text" class="form-control" id="personalName" name="personal.personalName" value="${resume.personal.personalName}">
                                                <input type="hidden" class="form-control" id="personalId" name="personal.personalId" value="${resume.personal.personalId}">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="personalBirthDate">생년월일</label>
                                                <input type="date" class="form-control" id="personalBirthDate" name="personal.personalBirthDate" value="<fmt:formatDate value="${resume.personal.personalBirthDate}" pattern="yyyy-MM-dd"/>">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="personalGender">성별</label>
                                                <select class="form-control" id="personalGender" name="personal.personalGender">
                                                    <option value="">::::선택::::</option>
                                                    <option value="남">남</option>
                                                    <option value="여">여</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="personalPhone">연락처</label>
                                                <input type="text" class="form-control" id="personalPhone" name="personal.personalPhone" placeholder="예) 010-1234-1234" value="${resume.personal.personalPhone}">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="personalEmail">이메일</label>
                                                <input type="text" class="form-control" id="personalEmail" name="personal.personalEmail" placeholder="예) abc@abc.com" value="${resume.personal.personalEmail}">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="personalSns">SNS</label>
                                                <input type="text" class="form-control" id="personalSns" name="personal.personalSns" placeholder="예) 페이스북: abc" value="${resume.personal.personalSns}">
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="personalAddress">주소</label>
                                                <input type="text" class="form-control" id="personalAddress" name="personal.personalAddress" placeholder="예) 서울특별시 종로구 1번지" value="${resume.personal.personalAddress}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-mortar-board"></i> 고등학교</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label for="highSchoolName">고등학교명</label>
                                                <input type="text" class="form-control" id="highSchoolName" name="highSchool.highSchoolName" value="${resume.highSchool.highSchoolName}">
                                                <input type="hidden" class="form-control" id="highSchoolId" name="highSchool.highSchoolId" value="${resume.highSchool.highSchoolId}">
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label for="highSchoolType">분류</label>
                                                <select class="form-control" id="highSchoolType">
                                                    <option value="">::::선택::::</option>
                                                    <option value="문과">문과</option>
                                                    <option value="이과">이과</option>
                                                    <option value="전문(실업)계">전문(실업)계</option>
                                                    <option value="예체능">예체능</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label for="highSchoolBeginDate">입학일자</label>
                                                <input type="date" class="form-control" id="highSchoolBeginDate" name="highSchool.highSchoolBeginDate" value="<fmt:formatDate value="${resume.highSchool.highSchoolBeginDate}" pattern="yyyy-MM-dd"/>">
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label for="highSchoolEndDate">졸업일자</label>
                                                <input type="date" class="form-control" id="highSchoolEndDate" name="highSchool.highSchoolEndDate" value="<fmt:formatDate value="${resume.highSchool.highSchoolEndDate}" pattern="yyyy-MM-dd"/>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-university"></i> 대학교</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-primary btn-xs universityAddBtn"><i class="fa fa-plus"></i> 추가</button>
                                    <button type="button" class="btn btn-primary btn-xs universityDelBtn"><i class="fa fa-minus"></i> 삭제</button>
                                </div>
                            </div>
                            <div class="box-body universities">
                                <c:forEach var="university" varStatus="i" items="${resume.universities}">
                                    <div class="row university">
                                        <div class="col-sm-12">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="universityName">대학교명</label>
                                                    <input type="text" class="form-control" id="universityName" name="universityName" value="${university.universityName}">
                                                    <input type="hidden" class="form-control" id="universityId" name="universityId" value="${university.universityId}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="universityType">분류</label>
                                                    <select class="form-control" id="universityType" name="universityType">
                                                        <option value="">::::선택::::</option>
                                                        <option value="2년제">2년제</option>
                                                        <option value="3년제">3년제</option>
                                                        <option value="4년제">4년제</option>
                                                        <option value="대학원">대학원</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="universityBeginDate">입학일자</label>
                                                    <input type="date" class="form-control" id="universityBeginDate" name="universityBeginDate" value="<fmt:formatDate value="${university.universityBeginDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="universityEndDate">졸업일자</label>
                                                    <input type="date" class="form-control" id="universityEndDate" name="universityEndDate" value="<fmt:formatDate value="${university.universityEndDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <label for="universityMajor">전공명</label>
                                                    <input type="text" class="form-control" id="universityMajor" name="universityMajor" value="${university.universityMajor}">
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <label for="universityDoubleMajor">복수/부전공명</label>
                                                    <input type="text" class="form-control" id="universityDoubleMajor" name="universityDoubleMajor" value="${university.universityDoubleMajor}">
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <label for="universityCredit">학점</label>
                                                    <input type="text" class="form-control" id="universityCredit" name="universityCredit" value="${university.universityCredit}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${i.last}">

                                        </c:when>
                                        <c:otherwise>
                                            <hr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-language"></i> 어학시험</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-primary btn-xs languageAddBtn"><i class="fa fa-plus"></i> 추가</button>
                                    <button type="button" class="btn btn-primary btn-xs languageDelBtn"><i class="fa fa-minus"></i> 삭제</button>
                                </div>
                            </div>
                            <div class="box-body languages">
                                <c:forEach var="language" varStatus="i" items="${resume.languages}">
                                    <div class="row language">
                                        <div class="col-sm-12">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="languageName">어학시험명</label>
                                                    <input type="text" class="form-control" id="languageName" name="languageName" value="${language.languageName}">
                                                    <input type="hidden" class="form-control" id="languageId" name="languageId" value="${language.languageId}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="languageGrade">취득점수</label>
                                                    <input type="text" class="form-control" id="languageGrade" name="languageGrade" value="${language.languageGrade}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="languageBeginDate">취득일자</label>
                                                    <input type="date" class="form-control" id="languageBeginDate" name="languageBeginDate" value="<fmt:formatDate value="${language.languageBeginDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="languageEndDate">만료일자</label>
                                                    <input type="date" class="form-control" id="languageEndDate" name="languageEndDate" value="<fmt:formatDate value="${language.languageEndDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="languageHost">주관처</label>
                                                    <input type="text" class="form-control" id="languageHost" name="languageHost" value="${language.languageHost}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="languageNumber">등록번호</label>
                                                    <input type="text" class="form-control" id="languageNumber" name="languageNumber" value="${language.languageNumber}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${i.last}">

                                        </c:when>
                                        <c:otherwise>
                                            <hr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-book"></i> 자격증</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-primary btn-xs certificateAddBtn"><i class="fa fa-plus"></i> 추가</button>
                                    <button type="button" class="btn btn-primary btn-xs certificateDelBtn"><i class="fa fa-minus"></i> 삭제</button>
                                </div>
                            </div>
                            <div class="box-body certificates">
                                <c:forEach var="certificate" varStatus="i" items="${resume.certificates}">
                                    <div class="row certificate">
                                        <div class="col-sm-12">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="certificateName">자격증명</label>
                                                    <input type="text" class="form-control" id="certificateName" name="certificateName" value="${certificate.certificateName}">
                                                    <input type="hidden" class="form-control" id="certificateId" name="certificateId" value="${certificate.certificateId}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="certificateGrade">등급</label>
                                                    <input type="text" class="form-control" id="certificateGrade" name="certificateGrade" value="${certificate.certificateGrade}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="certificateBeginDate">취득일자</label>
                                                    <input type="date" class="form-control" id="certificateBeginDate" name="certificateBeginDate" value="<fmt:formatDate value="${certificate.certificateBeginDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="certificateEndDate">만료일자</label>
                                                    <input type="date" class="form-control" id="certificateEndDate" name="certificateEndDate" value="<fmt:formatDate value="${certificate.certificateEndDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="certificateHost">주관처</label>
                                                    <input type="text" class="form-control" id="certificateHost" name="certificateHost" value="${certificate.certificateHost}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="certificateNumber">등록번호</label>
                                                    <input type="text" class="form-control" id="certificateNumber" name="certificateNumber" value="${certificate.certificateNumber}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${i.last}">

                                        </c:when>
                                        <c:otherwise>
                                            <hr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-file-text-o"></i> 경력</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-primary btn-xs careerAddBtn"><i class="fa fa-plus"></i> 추가</button>
                                    <button type="button" class="btn btn-primary btn-xs careerDelBtn"><i class="fa fa-minus"></i> 삭제</button>
                                </div>
                            </div>
                            <div class="box-body careers">
                                <c:forEach var="career" varStatus="i" items="${resume.careers}">
                                    <div class="row career">
                                        <div class="col-sm-12">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="careerCompany">회사명</label>
                                                    <input type="text" class="form-control" id="careerCompany" name="careerCompany" value="${career.careerCompany}">
                                                    <input type="hidden" class="form-control" id="careerId" name="careerId" value="${career.careerId}">
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <label for="careerPosition">직급</label>
                                                    <input type="text" class="form-control" id="careerPosition" name="careerPosition" value="${career.careerPosition}">
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <label for="careerDepartment">부서</label>
                                                    <input type="text" class="form-control" id="careerDepartment" name="careerDepartment" value="${career.careerDepartment}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="careerTask">담당업무</label>
                                                    <input type="text" class="form-control" id="careerTask" name="careerTask" value="${career.careerTask}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="careerBeginDate">입사일자</label>
                                                    <input type="date" class="form-control" id="careerBeginDate" name="careerBeginDate" value="<fmt:formatDate value="${career.careerBeginDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="careerEndDate">퇴사일자</label>
                                                    <input type="date" class="form-control" id="careerEndDate" name="careerEndDate" value="<fmt:formatDate value="${career.careerEndDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="careerResign">퇴사사유</label>
                                                    <input type="text" class="form-control" id="careerResign" name="careerResign" value="${career.careerResign}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${i.last}">

                                        </c:when>
                                        <c:otherwise>
                                            <hr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-child"></i> 직무관련 경험 및 대외활동</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-primary btn-xs activityAddBtn"><i class="fa fa-plus"></i> 추가</button>
                                    <button type="button" class="btn btn-primary btn-xs activityDelBtn"><i class="fa fa-minus"></i> 삭제</button>
                                </div>
                            </div>
                            <div class="box-body activities">
                                <c:forEach var="activity" varStatus="i" items="${resume.activities}">
                                    <div class="row activity">
                                        <div class="col-sm-12">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="activityName">활동명</label>
                                                    <input type="text" class="form-control" id="activityName" name="activityName" value="${activity.activityName}">
                                                    <input type="hidden" class="form-control" id="activityId" name="activityId" value="${activity.activityId}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="activityHost">주관단체</label>
                                                    <input type="text" class="form-control" id="activityHost" name="activityHost" value="${activity.activityHost}">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="activityBeginDate">시작일자</label>
                                                    <input type="date" class="form-control" id="activityBeginDate" name="activityBeginDate" value="<fmt:formatDate value="${activity.activityBeginDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="activityEndDate">종료일자</label>
                                                    <input type="date" class="form-control" id="activityEndDate" name="activityEndDate" value="<fmt:formatDate value="${activity.activityEndDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="activityContent">활동내용</label>
                                                    <input type="text" class="form-control" id="activityContent" name="activityContent" value="${activity.activityContent}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${i.last}">

                                        </c:when>
                                        <c:otherwise>
                                            <hr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-sticky-note-o"></i> 기타사항(논문, 포트폴리오 등등)</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-primary btn-xs etcAddBtn"><i class="fa fa-plus"></i> 추가</button>
                                    <button type="button" class="btn btn-primary btn-xs etcDelBtn"><i class="fa fa-minus"></i> 삭제</button>
                                </div>
                            </div>
                            <div class="box-body etcs">
                                <c:forEach var="etc" varStatus="i" items="${resume.etcs}">
                                    <div class="row etc">
                                        <div class="col-sm-12">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="etcName">기타사항명</label>
                                                    <input type="text" class="form-control" id="etcName" name="etcName" value="${etc.etcName}">
                                                    <input type="hidden" class="form-control" id="etcId" name="etcId" value="${etc.etcId}">
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="etcBeginDate">시작일자</label>
                                                    <input type="date" class="form-control" id="etcBeginDate" name="etcBeginDate" value="<fmt:formatDate value="${etc.etcBeginDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="etcEndDate">종료일자</label>
                                                    <input type="date" class="form-control" id="etcEndDate" name="etcEndDate" value="<fmt:formatDate value="${etc.etcEndDate}" pattern="yyyy-MM-dd"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="personalName">기타내용</label>
                                                    <input type="text" class="form-control" id="etcContent" name="etcContent" value="${etc.etcContent}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${i.last}">

                                        </c:when>
                                        <c:otherwise>
                                            <hr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
                </div>
            </form>
            <button type="button" class="btn btn-primary btn-sm resumeUpdateBtn"><i class="fa fa-save"></i> 이력서 수정</button>
        </section>

    </div>

    <!--풋터 include-->
    <%@ include file="../include/footer.jsp" %>

    <!--컨트롤 사이드바 -->
    <%@ include file="../include/control_sidebar.jsp" %>


</div>
<!-- 풋(JS) include-->
<%@ include file="../include/js.jsp" %>
<script>
    $(function () {

        // 대학교 추가 버튼 클릭시
        $(".universityAddBtn").on("click", function () {

            $(".university:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").remove().end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".universities");

        });

        // 대학교 삭제 버튼 클릭시
        $(".universityDelBtn").on("click", function () {

            if ( $(".university").length === 1) {
                alert("대학교 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                var universityId = $(".university:last").find("input[name=universityId]").val();
                if ( confirm("삭제하시겠습니까?") ) {
                    if (universityId === "") {
                        $(".university:last").remove();
                        $(".universities").find("hr:last").remove();
                    } else {
                        $.ajax({
                            type: "delete",
                            url: "${path}/resume/${sessionScope.userId}/university/"+universityId+"/delete",
                            success: function () {
                                $(".university:last").remove();
                                $(".universities").find("hr:last").remove();
                            }
                        });
                    }
                }
            }



        });

        // 어학시험 추가 버튼 클릭시
        $(".languageAddBtn").on("click", function () {

            $(".language:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").remove().end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".languages");

        });

        // 어학시험 삭제 버튼 클릭시
        $(".languageDelBtn").on("click", function () {

            if ( $(".language").length === 1 ) {
                alert("어학시험 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                var languageId = $(".language:last").find("input[name=languageId]").val();
                if ( confirm("삭제하시겠습니까?") ) {
                    if (languageId === "") {
                        $(".language:last").remove();
                        $(".languages").find("hr:last").remove();
                    } else {
                        $.ajax({
                            type: "delete",
                            url: "${path}/resume/${sessionScope.userId}/language/"+languageId+"/delete",
                            success: function () {
                                $(".language:last").remove();
                                $(".languages").find("hr:last").remove();
                            }
                        });
                    }
                }
            }
        });

        // 자격증 추가 버튼 클릭시
        $(".certificateAddBtn").on("click", function () {

            $(".certificate:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").remove().end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".certificates");

        });

        // 자격증 삭제 버튼 클릭시
        $(".certificateDelBtn").on("click", function () {

            if ( $(".certificate").length === 1 ) {
                alert("자격증 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                var certificateId = $(".certificate:last").find("input[name=certificateId]").val();
                if ( confirm("삭제하시겠습니까?") ) {
                    if (certificateId === "") {
                        $(".certificate:last").remove();
                        $(".certificates").find("hr:last").remove();
                    } else {
                        $.ajax({
                            type: "delete",
                            url: "${path}/resume/${sessionScope.userId}/certificate/"+certificateId+"/delete",
                            success: function () {
                                $(".certificate:last").remove();
                                $(".certificates").find("hr:last").remove();
                            }
                        });
                    }
                }
            }
        });

        // 경력 추가 버튼 클릭시
        $(".careerAddBtn").on("click", function () {

            $(".career:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").remove().end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".careers");

        });

        // 경력 삭제 버튼 클릭시
        $(".careerDelBtn").on("click", function () {

            if ( $(".career").length === 1 ) {
                alert("경력 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                var careerId = $(".career:last").find("input[name=careerId]").val();
                if ( confirm("삭제하시겠습니까?") ) {
                    if (careerId === "") {
                        $(".career:last").remove();
                        $(".careers").find("hr:last").remove();
                    } else {
                        $.ajax({
                            type: "delete",
                            url: "${path}/resume/${sessionScope.userId}/career/"+careerId+"/delete",
                            success: function () {
                                $(".career:last").remove();
                                $(".careers").find("hr:last").remove();
                            }
                        });
                    }
                }
            }
        });



        // 활동사항 추가 버튼 클릭시
        $(".activityAddBtn").on("click", function () {

            $(".activity:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").remove().end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".activities");

        });

        // 활동사항 삭제 버튼 클릭시
        $(".activityDelBtn").on("click", function () {

            if ( $(".activity").length === 1 ) {
                alert("활동사항 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                var activityId = $(".activity:last").find("input[name=activityId]").val();
                if ( confirm("삭제하시겠습니까?") ) {
                    if (activityId === "") {
                        $(".activity:last").remove();
                        $(".activities").find("hr:last").remove();
                    } else {
                        $.ajax({
                            type: "delete",
                            url: "${path}/resume/${sessionScope.userId}/activity/"+activityId+"/delete",
                            success: function () {
                                $(".activity:last").remove();
                                $(".activities").find("hr:last").remove();
                            }
                        });
                    }
                }
            }

        });

        // 기타사항 추가 버튼 클릭시
        $(".etcAddBtn").on("click", function () {

            $(".etc:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").remove().end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".etcs");

        });

        // 기타사항 삭제 버튼 클릭시
        $(".etcDelBtn").on("click", function () {

            if ( $(".etc").length === 1 ) {
                alert("활동사항 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                var etcId = $(".etc:last").find("input[name=etcId]").val();
                if ( confirm("삭제하시겠습니까?") ) {
                    if (etcId === "") {
                        $(".etc:last").remove();
                        $(".etcs").find("hr:last").remove();
                    } else {
                        $.ajax({
                            type: "delete",
                            url: "${path}/resume/${sessionScope.userId}/etc/"+etcId+"/delete",
                            success: function () {
                                $(".etc:last").remove();
                                $(".etcs").find("hr:last").remove();
                            }
                        });
                    }
                }

            }
        });

        $(".resumeUpdateBtn").on("click", function () {

            $(".university").each(function (index) {
                $(this).find("input[name=universityId]").attr("name", "universities["+index+"].universityId");
                $(this).find("input[name=universityName]").attr("name", "universities["+index+"].universityName");
                $(this).find("select[name=universityType]").attr("name", "universities["+index+"].universityType");
                $(this).find("input[name=universityBeginDate]").attr("name", "universities["+index+"].universityBeginDate");
                $(this).find("input[name=universityEndDate]").attr("name", "universities["+index+"].universityEndDate");
                $(this).find("input[name=universityMajor]").attr("name", "universities["+index+"].universityMajor");
                $(this).find("input[name=universityDoubleMajor]").attr("name", "universities["+index+"].universityDoubleMajor");
                $(this).find("input[name=universityCredit]").attr("name", "universities["+index+"].universityCredit");
            });

            $(".language").each(function (index) {
                $(this).find("input[name=languageId]").attr("name", "languages["+index+"].languageId");
                $(this).find("input[name=languageName]").attr("name", "languages["+index+"].languageName");
                $(this).find("input[name=languageGrade]").attr("name", "languages["+index+"].languageGrade");
                $(this).find("input[name=languageHost]").attr("name", "languages["+index+"].languageHost");
                $(this).find("input[name=languageNumber]").attr("name", "languages["+index+"].languageNumber");
                $(this).find("input[name=languageBeginDate]").attr("name", "languages["+index+"].languageBeginDate");
                $(this).find("input[name=languageEndDate]").attr("name", "languages["+index+"].languageEndDate");
            });

            $(".certificate").each(function (index) {
                $(this).find("input[name=certificateId]").attr("name", "certificates["+index+"].certificateId");
                $(this).find("input[name=certificateName]").attr("name", "certificates["+index+"].certificateName");
                $(this).find("input[name=certificateGrade]").attr("name", "certificates["+index+"].certificateGrade");
                $(this).find("input[name=certificateHost]").attr("name", "certificates["+index+"].certificateHost");
                $(this).find("input[name=certificateNumber]").attr("name", "certificates["+index+"].certificateNumber");
                $(this).find("input[name=certificateBeginDate]").attr("name", "certificates["+index+"].certificateBeginDate");
                $(this).find("input[name=certificateEndDate]").attr("name", "certificates["+index+"].certificateEndDate");
            });

            $(".career").each(function (index) {
                $(this).find("input[name=careerId]").attr("name", "careers["+index+"].careerId");
                $(this).find("input[name=careerCompany]").attr("name", "careers["+index+"].careerCompany");
                $(this).find("input[name=careerBeginDate]").attr("name", "careers["+index+"].careerBeginDate");
                $(this).find("input[name=careerEndDate]").attr("name", "careers["+index+"].careerEndDate");
                $(this).find("input[name=careerPosition]").attr("name", "careers["+index+"].careerPosition");
                $(this).find("input[name=careerDepartment]").attr("name", "careers["+index+"].careerDepartment");
                $(this).find("input[name=careerTask]").attr("name", "careers["+index+"].careerTask");
                $(this).find("input[name=careerResign]").attr("name", "careers["+index+"].careerResign");
            });

            $(".activity").each(function (index) {
                $(this).find("input[name=activityId]").attr("name", "activities["+index+"].activityId");
                $(this).find("input[name=activityName]").attr("name", "activities["+index+"].activityName");
                $(this).find("input[name=activityHost]").attr("name", "activities["+index+"].activityHost");
                $(this).find("input[name=activityBeginDate]").attr("name", "activities["+index+"].activityBeginDate");
                $(this).find("input[name=activityEndDate]").attr("name", "activities["+index+"].activityEndDate");
                $(this).find("input[name=activityContent]").attr("name", "activities["+index+"].activityContent");
            });

            $(".etc").each(function (index) {
                $(this).find("input[name=etcId]").attr("name", "etcs["+index+"].etcId");
                $(this).find("input[name=etcName]").attr("name", "etcs["+index+"].etcName");
                $(this).find("input[name=etcBeginDate]").attr("name", "etcs["+index+"].etcBeginDate");
                $(this).find("input[name=etcEndDate]").attr("name", "etcs["+index+"].etcEndDate");
                $(this).find("input[name=etcContent]").attr("name", "etcs["+index+"].etcContent");
            });

            $("#resumeUpdateForm").submit();
        });
    });

</script>
</body>
</html>
