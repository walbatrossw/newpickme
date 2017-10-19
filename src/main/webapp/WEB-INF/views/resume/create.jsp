<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--헤드(CSS) include--%>
    <%@ include file="../include/head.jsp" %>
</head>
<body class="fixed sidebar-mini skin-green">
<div class="wrapper">

    <%--헤더 네비바 include--%>
    <%@ include file="../include/navbar.jsp" %>

    <%--사이드 메뉴 include--%>
    <%@ include file="../include/left_column.jsp" %>

    <%--본문 페이지--%>
    <div class="content-wrapper">

        <%--본문 페이지 헤더--%>
        <section class="content-header">
            <h1>
                ${sessionScope.userNickName}님의 이력서
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 대분류</a></li>
                <li class="active"> 소분류</li>
            </ol>
        </section>

        <div class="pad margin no-print col-lg-10">
            <div class="callout callout-success" style="margin-bottom: 0!important;">
                <p>PickMe는 이력서 편집 기능을 제공합니다</p>
                <p>주요 이력서 항목들을 저장해두고 지원시 빠르고 정확하게 복붙하세요!!!</p>
                <p>로그인이 필요한 서비스입니다</p>
            </div>
        </div>

        <%--본문 페이지 내용--%>
        <section class="content">
            <%-- 페이지 내용 --%>
            <form id="resumeCreateForm" action="${path}/resume/create" method="post" enctype="multipart/form-data">
                <div class="row">
                <section class="col-lg-10">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">이력서 작성 도우미</h3>
                        </div>
                        <div class="box-body">
                            <button class="btn btn-app" type="reset">
                                <i class="fa fa-trash"></i> 초기화
                            </button>
                            <a class="btn btn-app resumeSaveBtn">
                                <i class="fa fa-save"></i> 저장
                            </a>
                            <a class="btn btn-app" data-toggle="modal" data-target="#languageTestLinkModal">
                                <i class="fa fa-language"></i> 어학시험 Link
                            </a>
                            <a class="btn btn-app" data-toggle="modal" data-target="#certificateLinkModal">
                                <i class="fa fa-certificate"></i> 주요 자격증 Link
                            </a>
                            <a class="btn btn-app">
                                <i class="fa fa-print coverLetterPrintBtn"></i> 인쇄
                            </a>
                            <a class="btn btn-app">
                                <i class="fa fa-file-pdf-o"></i> PDF
                            </a>
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
                                        <div class="fileinput-new thumbnail" style="width: 120px; height: 140px;">
                                            <img src="${path}/dist/img/default-user-image.jpg" alt="...">
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 120px; height: 140px;"></div>
                                        <div>
                                            <span class="btn btn-default btn-file">
                                                <span class="fileinput-new">사진 선택</span>
                                                <span class="fileinput-exists">변경</span>
                                                <input type="file" id="personalImage" name="personal.personalImage">
                                            </span>
                                            <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">삭제</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-10">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="personalName">이름</label>
                                            <input type="text" class="form-control" id="personalName" name="personal.personalName">
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="personalBirthDate">생년월일</label>
                                            <input type="date" class="form-control" id="personalBirthDate" name="personal.personalBirthDate">
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
                                            <input type="text" class="form-control" id="personalPhone" name="personal.personalPhone" placeholder="예) 010-1234-1234">
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="personalEmail">이메일</label>
                                            <input type="text" class="form-control" id="personalEmail" name="personal.personalEmail" placeholder="예) abc@abc.com">
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="personalSns">SNS</label>
                                            <input type="text" class="form-control" id="personalSns" name="personal.personalSns" placeholder="예) 페이스북: abc">
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="personalAddress">주소</label>
                                            <input type="text" class="form-control" id="personalAddress" name="personal.personalAddress" placeholder="예) 서울특별시 종로구 1번지">
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
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="highSchoolName">고등학교명</label>
                                            <input type="text" class="form-control" id="highSchoolName" name="highSchool.highSchoolName">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
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
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="highSchoolBeginDate">입학일자</label>
                                            <input type="date" class="form-control" id="highSchoolBeginDate" name="highSchool.highSchoolBeginDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="highSchoolEndDate">졸업일자</label>
                                            <input type="date" class="form-control" id="highSchoolEndDate" name="highSchool.highSchoolEndDate">
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
                            <div class="row university">
                                <div class="col-sm-12">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="universityName">대학교명</label>
                                            <input type="text" class="form-control" id="universityName" name="universityName">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
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
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="universityBeginDate">입학일자</label>
                                            <input type="date" class="form-control" id="universityBeginDate" name="universityBeginDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="universityEndDate">졸업일자</label>
                                            <input type="date" class="form-control" id="universityEndDate" name="universityEndDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="universityMajor">전공명</label>
                                            <input type="text" class="form-control" id="universityMajor" name="universityMajor">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="universityDoubleMajor">복수/부전공명</label>
                                            <input type="text" class="form-control" id="universityDoubleMajor" name="universityDoubleMajor">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="universityCredit">학점</label>
                                            <input type="text" class="form-control" id="universityCredit" name="universityCredit">
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <div class="row language">
                                <div class="col-sm-12">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="languageName">어학시험명</label>
                                            <input type="text" class="form-control" id="languageName" name="languageName">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="languageGrade">취득점수</label>
                                            <input type="text" class="form-control" id="languageGrade" name="languageGrade">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="languageBeginDate">취득일자</label>
                                            <input type="date" class="form-control" id="languageBeginDate" name="languageBeginDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="languageEndDate">만료일자</label>
                                            <input type="date" class="form-control" id="languageEndDate" name="languageEndDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="languageHost">주관처</label>
                                            <input type="text" class="form-control" id="languageHost" name="languageHost">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="languageNumber">등록번호</label>
                                            <input type="text" class="form-control" id="languageNumber" name="languageNumber">
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <div class="row certificate">
                                <div class="col-sm-12">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="certificateName">자격증명</label>
                                            <input type="text" class="form-control" id="certificateName" name="certificateName">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="certificateGrade">등급</label>
                                            <input type="text" class="form-control" id="certificateGrade" name="certificateGrade">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="certificateBeginDate">취득일자</label>
                                            <input type="date" class="form-control" id="certificateBeginDate" name="certificateBeginDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="certificateEndDate">만료일자</label>
                                            <input type="date" class="form-control" id="certificateEndDate" name="certificateEndDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="certificateHost">주관처</label>
                                            <input type="text" class="form-control" id="certificateHost" name="certificateHost">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="certificateNumber">등록번호</label>
                                            <input type="text" class="form-control" id="certificateNumber" name="certificateNumber">
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <div class="row career">
                                <div class="col-sm-12">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="careerCompany">회사명</label>
                                            <input type="text" class="form-control" id="careerCompany" name="careerCompany">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="careerPosition">직급</label>
                                            <input type="text" class="form-control" id="careerPosition" name="careerPosition">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="careerDepartment">부서</label>
                                            <input type="text" class="form-control" id="careerDepartment" name="careerDepartment">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="careerTask">담당업무</label>
                                            <input type="text" class="form-control" id="careerTask" name="careerTask">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="careerBeginDate">입사일자</label>
                                            <input type="date" class="form-control" id="careerBeginDate" name="careerBeginDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="careerEndDate">퇴사일자</label>
                                            <input type="date" class="form-control" id="careerEndDate" name="careerEndDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="careerResign">퇴사사유</label>
                                            <input type="text" class="form-control" id="careerResign" name="careerResign">
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <div class="row activity">
                                <div class="col-sm-12">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="activityName">활동명</label>
                                            <input type="text" class="form-control" id="activityName" name="activityName">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="activityHost">주관단체</label>
                                            <input type="text" class="form-control" id="activityHost" name="activityHost">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="activityBeginDate">시작일자</label>
                                            <input type="date" class="form-control" id="activityBeginDate" name="activityBeginDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="activityEndDate">종료일자</label>
                                            <input type="date" class="form-control" id="activityEndDate" name="activityEndDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="activityContent">활동내용</label>
                                            <input type="text" class="form-control" id="activityContent" name="activityContent">
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <div class="row etc">
                                <div class="col-sm-12">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="etcName">기타사항명</label>
                                            <input type="text" class="form-control" id="etcName" name="etcName">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="etcBeginDate">시작일자</label>
                                            <input type="date" class="form-control" id="etcBeginDate" name="etcBeginDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="etcEndDate">종료일자</label>
                                            <input type="date" class="form-control" id="etcEndDate" name="etcEndDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="personalName">기타내용</label>
                                            <input type="text" class="form-control" id="etcContent" name="etcContent">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            </form>
        </section>

        <%--어학시험 사이트 LINK modal--%>
        <div class="modal fade" id="languageTestLinkModal" tabindex="-1" role="dialog"
             aria-labelledby="languageTestLinkModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="languageTestLinkModalLabel">어학시험 사이트 LINK</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped">
                            <tbody>
                            <tr>
                                <th>번호</th>
                                <th>어학시험명</th>
                                <th>사이트 링크</th>
                                <th>비고</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td><strong> TOEIC / TOEIC SPEAKING </strong></td>
                                <td><a href="http://exam.ybmnet.co.kr/" onclick="window.open(this.href); return false;">http://exam.ybmnet.co.kr/</a></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><strong> TOEFL </strong></td>
                                <td><a href="https://www.ets.org/ko/toefl" onclick="window.open(this.href); return false;">https://www.ets.org/ko/toefl</a></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td><strong> TEPS </strong></td>
                                <td><a href="https://www.teps.or.kr/" onclick="window.open(this.href); return false;">https://www.teps.or.kr/</a></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td><strong> OPIC </strong></td>
                                <td><a href="https://www.opic.or.kr/opics/jsp/senior/index.jsp" onclick="window.open(this.href); return false;">https://www.opic.or.kr/opics/jsp/senior/index.jsp</a></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td><strong> IELTS </strong></td>
                                <td><a href="https://reg.britishcouncil.kr/ko/main/index" onclick="window.open(this.href); return false;">https://reg.britishcouncil.kr/ko/main/index</a></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <%--주요 자격증 사이트 LINK modal--%>
        <div class="modal fade" id="certificateLinkModal" tabindex="-1" role="dialog"
             aria-labelledby="certificateLinkModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="certificateLinkModalLabel">자격증 사이트 LINK</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped">
                            <tbody>
                            <tr>
                                <th>번호</th>
                                <th>주관처</th>
                                <th>사이트 링크</th>
                                <th>주요자격증</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td><strong> 한국산업인력공단(큐넷) </strong></td>
                                <td><a href="http://www.q-net.or.kr/" onclick="window.open(this.href); return false;">http://www.q-net.or.kr/</a></td>
                                <td>기사, 산업기사, 등등</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><strong> 대한상공회의소 </strong></td>
                                <td><a href="http://license.korcham.net/" onclick="window.open(this.href); return false;">http://license.korcham.net/</a></td>
                                <td>유통관리사, 워드프로세서, 컴활, 등등</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td><strong> 국사편찬위원회 </strong></td>
                                <td><a href="http://www.historyexam.go.kr/" onclick="window.open(this.href); return false;">http://www.historyexam.go.kr/</a></td>
                                <td>한국사 능력검정 시험</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td><strong> YBMIT </strong></td>
                                <td><a href="https://www.ybmit.com/" onclick="window.open(this.href); return false;">https://www.ybmit.com/</a></td>
                                <td>MOS</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td><strong> 금융투자협회 </strong></td>
                                <td><a href="https://license.kofia.or.kr/" onclick="window.open(this.href); return false;">https://license.kofia.or.kr/</a></td>
                                <td>금융3종 자격증</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td><strong> 한국세무사회 </strong></td>
                                <td><a href="http://license.kacpta.or.kr/" onclick="window.open(this.href); return false;">http://license.kacpta.or.kr/</a></td>
                                <td>전산 세무/회계 자격증</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td><strong> 무역협회 </strong></td>
                                <td><a href="http://www.tradecampus.com/" onclick="window.open(this.href); return false;">http://www.tradecampus.com/</a></td>
                                <td> 국제무역사/무역관리사/원산지 관리사</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--풋터 include--%>
    <%@ include file="../include/footer.jsp" %>

    <%--컨트롤 사이드바 --%>
    <%@ include file="../include/control_sidebar.jsp" %>


</div>
<%-- 풋(JS) include--%>
<%@ include file="../include/js.jsp" %>
<script>
    $(function () {

        // 대학교 추가 버튼 클릭시
        $(".universityAddBtn").on("click", function () {

            $(".university:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".universities");

        });

        // 대학교 삭제 버튼 클릭시
        $(".universityDelBtn").on("click", function () {

            if ( $(".university").length === 1) {
                alert("대학교 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                $(".university:last").remove();
                $(".universities").find("hr:last").remove();
            }

        });

        // 어학시험 추가 버튼 클릭시
        $(".languageAddBtn").on("click", function () {

            $(".language:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".languages");

        });

        // 어학시험 삭제 버튼 클릭시
        $(".languageDelBtn").on("click", function () {

            if ( $(".language").length === 1 ) {
                alert("어학시험 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                $(".language:last").remove();
                $(".languages").find("hr:last").remove();
            }


        });

        // 자격증 추가 버튼 클릭시
        $(".certificateAddBtn").on("click", function () {

            $(".certificate:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".certificates");

        });

        // 자격증 삭제 버튼 클릭시
        $(".certificateDelBtn").on("click", function () {

            if ( $(".certificate").length === 1 ) {
                alert("자격증 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                $(".certificate:last").remove();
                $(".certificates").find("hr:last").remove();
            }
        });

        // 경력 추가 버튼 클릭시
        $(".careerAddBtn").on("click", function () {

            $(".career:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".careers");

        });

        // 경력 삭제 버튼 클릭시
        $(".careerDelBtn").on("click", function () {

            if ( $(".career").length === 1 ) {
                alert("경력 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                $(".career:last").remove();
                $(".careers").find("hr:last").remove();
            }
        });



        // 활동사항 추가 버튼 클릭시
        $(".activityAddBtn").on("click", function () {

            $(".activity:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".activities");

        });

        // 활동사항 삭제 버튼 클릭시
        $(".activityDelBtn").on("click", function () {

            if ( $(".activity").length === 1 ) {
                alert("활동사항 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                $(".activity:last").remove();
                $(".activities").find("hr:last").remove();
            }

        });

        // 기타사항 추가 버튼 클릭시
        $(".etcAddBtn").on("click", function () {

            $(".etc:last")
                .after("<hr>")
                .clone()
                .find("input[type=text]").val("").end()
                .find("input[type=hidden]").val("").end()
                .find("input[type=date]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .appendTo(".etcs");

        });

        // 기타사항 삭제 버튼 클릭시
        $(".etcDelBtn").on("click", function () {

            if ( $(".etc").length === 1 ) {
                alert("활동사항 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                $(".etc:last").remove();
                $(".etcs").find("hr:last").remove();
            }
        });

        $(".resumeSaveBtn").on("click", function () {

            $(".university").each(function (index) {
                $(this).find("input[name=universityName]").attr("name", "universities["+index+"].universityName");
                $(this).find("select[name=universityType]").attr("name", "universities["+index+"].universityType");
                $(this).find("input[name=universityBeginDate]").attr("name", "universities["+index+"].universityBeginDate");
                $(this).find("input[name=universityEndDate]").attr("name", "universities["+index+"].universityEndDate");
                $(this).find("input[name=universityMajor]").attr("name", "universities["+index+"].universityMajor");
                $(this).find("input[name=universityDoubleMajor]").attr("name", "universities["+index+"].universityDoubleMajor");
                $(this).find("input[name=universityCredit]").attr("name", "universities["+index+"].universityCredit");
            });

            $(".language").each(function (index) {
                $(this).find("input[name=languageName]").attr("name", "languages["+index+"].languageName");
                $(this).find("input[name=languageGrade]").attr("name", "languages["+index+"].languageGrade");
                $(this).find("input[name=languageHost]").attr("name", "languages["+index+"].languageHost");
                $(this).find("input[name=languageNumber]").attr("name", "languages["+index+"].languageNumber");
                $(this).find("input[name=languageBeginDate]").attr("name", "languages["+index+"].languageBeginDate");
                $(this).find("input[name=languageEndDate]").attr("name", "languages["+index+"].languageEndDate");
            });

            $(".certificate").each(function (index) {
                $(this).find("input[name=certificateName]").attr("name", "certificates["+index+"].certificateName");
                $(this).find("input[name=certificateGrade]").attr("name", "certificates["+index+"].certificateGrade");
                $(this).find("input[name=certificateHost]").attr("name", "certificates["+index+"].certificateHost");
                $(this).find("input[name=certificateNumber]").attr("name", "certificates["+index+"].certificateNumber");
                $(this).find("input[name=certificateBeginDate]").attr("name", "certificates["+index+"].certificateBeginDate");
                $(this).find("input[name=certificateEndDate]").attr("name", "certificates["+index+"].certificateEndDate");
            });

            $(".career").each(function (index) {
                $(this).find("input[name=careerCompany]").attr("name", "careers["+index+"].careerCompany");
                $(this).find("input[name=careerBeginDate]").attr("name", "careers["+index+"].careerBeginDate");
                $(this).find("input[name=careerEndDate]").attr("name", "careers["+index+"].careerEndDate");
                $(this).find("input[name=careerPosition]").attr("name", "careers["+index+"].careerPosition");
                $(this).find("input[name=careerDepartment]").attr("name", "careers["+index+"].careerDepartment");
                $(this).find("input[name=careerTask]").attr("name", "careers["+index+"].careerTask");
                $(this).find("input[name=careerResign]").attr("name", "careers["+index+"].careerResign");
            });

            $(".activity").each(function (index) {
                $(this).find("input[name=activityName]").attr("name", "activities["+index+"].activityName");
                $(this).find("input[name=activityHost]").attr("name", "activities["+index+"].activityHost");
                $(this).find("input[name=activityBeginDate]").attr("name", "activities["+index+"].activityBeginDate");
                $(this).find("input[name=activityEndDate]").attr("name", "activities["+index+"].activityEndDate");
                $(this).find("input[name=activityContent]").attr("name", "activities["+index+"].activityContent");
            });

            $(".etc").each(function (index) {
                $(this).find("input[name=etcName]").attr("name", "etcs["+index+"].etcName");
                $(this).find("input[name=etcBeginDate]").attr("name", "etcs["+index+"].etcBeginDate");
                $(this).find("input[name=etcEndDate]").attr("name", "etcs["+index+"].etcEndDate");
                $(this).find("input[name=etcContent]").attr("name", "etcs["+index+"].etcContent");
            });

            $("#resumeCreateForm").submit();
        });

    });

</script>
</body>
</html>
