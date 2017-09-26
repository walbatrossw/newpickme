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
                                    <a href="${path}/resume/${sessionScope.userId}/update" type="button" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i> 이력서 수정</a>
                                    <a href="${path}/resume/${sessionScope.userId}/delete" type="button" class="btn btn-primary btn-xs"><i class="fa fa-remove"></i> 이력서 초기화(cascade)</a>
                                    <a href="${path}/resume/${sessionScope.userId}/delete/${resume.resumeId}" type="button" class="btn btn-primary btn-xs"><i class="fa fa-remove"></i> 이력서 초기화(none cascade)</a>
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
                                        <img class="profile-user-img img-bordered" src="${path}/dist/img/default-user-image.jpg" style="width: 180px; height: 200px;">
                                    </div>
                                    <div class="col-sm-10">
                                        <table class="table table-striped">
                                            <tr>
                                                <th>이름</th>
                                                <th>생년월일</th>
                                                <th>성별</th>
                                            </tr>
                                            <tr>
                                                <td>${resume.personal.personalName}</td>
                                                <td><fmt:formatDate value="${resume.personal.personalBirthDate}" pattern="yyyy-MM-dd"/></td>
                                                <td>${resume.personal.personalGender}</td>
                                            </tr>
                                            <tr>
                                                <th>연락처</th>
                                                <th>이메일</th>
                                                <th>SNS</th>
                                            </tr>
                                            <tr>
                                                <td>${resume.personal.personalPhone}</td>
                                                <td>${resume.personal.personalEmail}</td>
                                                <td>${resume.personal.personalSns}</td>
                                            </tr>
                                            <tr>
                                                <th colspan="3">주소</th>
                                            </tr>
                                            <tr>
                                                <td colspan="3">${resume.personal.personalAddress}</td>
                                            </tr>
                                        </table>
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
                                        <table class="table table-striped">
                                            <tr>
                                                <th>고등학교명</th>
                                                <th>분류</th>
                                                <th>입학일자</th>
                                                <th>졸업일자</th>
                                            </tr>
                                            <tr>
                                                <td>${resume.highSchool.highSchoolName}</td>
                                                <td>${resume.highSchool.highSchoolType}</td>
                                                <td><fmt:formatDate value="${resume.highSchool.highSchoolBeginDate}" pattern="yyyy-MM-dd"/></td>
                                                <td><fmt:formatDate value="${resume.highSchool.highSchoolEndDate}" pattern="yyyy-MM-dd"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-university"></i> 대학교</h3>
                            </div>
                            <div class="box-body universities">

                                <div class="row university">
                                    <div class="col-sm-12">
                                        <table class="table table-striped">
                                            <tr>
                                                <th>대학교명</th>
                                                <th>분류</th>
                                                <th>입학일자</th>
                                                <th>졸업일자</th>
                                                <th>전공명</th>
                                                <th>복수/부전공명</th>
                                                <th>학점</th>
                                            </tr>
                                            <c:forEach var="university" varStatus="i" items="${resume.universities}">
                                            <tr>
                                                <td>${university.universityName}</td>
                                                <td>${university.universityType}</td>
                                                <td><fmt:formatDate value="${university.universityBeginDate}" pattern="yyyy-MM-dd"/></td>
                                                <td><fmt:formatDate value="${university.universityEndDate}" pattern="yyyy-MM-dd"/></td>
                                                <td>${university.universityMajor}</td>
                                                <td>${university.universityDoubleMajor}</td>
                                                <td>${university.universityCredit}</td>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-language"></i> 어학시험</h3>
                            </div>
                            <div class="box-body languages">

                                <div class="row language">
                                    <div class="col-sm-12">
                                        <table class="table table-striped">
                                            <tr>
                                                <th>어학시험명</th>
                                                <th>취득점수</th>
                                                <th>취득일자</th>
                                                <th>만료일자</th>
                                                <th>주관처</th>
                                                <th>등록번호</th>
                                            </tr>
                                            <c:forEach var="language" varStatus="i" items="${resume.languages}">
                                            <tr>
                                                <td>${language.languageName}</td>
                                                <td>${language.languageGrade}</td>
                                                <td><fmt:formatDate value="${language.languageBeginDate}" pattern="yyyy-MM-dd"/></td>
                                                <td><fmt:formatDate value="${language.languageEndDate}" pattern="yyyy-MM-dd"/></td>
                                                <td>${language.languageHost}</td>
                                                <td>${language.languageNumber}</td>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-book"></i> 자격증</h3>
                            </div>
                            <div class="box-body certificates">

                                <div class="row certificate">
                                    <div class="col-sm-12">
                                        <table class="table table-striped">
                                            <tr>
                                                <th>자격증명</th>
                                                <th>등급</th>
                                                <th>취득일자</th>
                                                <th>만료일자</th>
                                                <th>주관처</th>
                                                <th>등록번호</th>
                                            </tr>
                                            <c:forEach var="certificate" varStatus="i" items="${resume.certificates}">
                                            <tr>
                                                <td>${certificate.certificateName}</td>
                                                <td>${certificate.certificateGrade}</td>
                                                <td><fmt:formatDate value="${certificate.certificateBeginDate}" pattern="yyyy-MM-dd"/></td>
                                                <td><fmt:formatDate value="${certificate.certificateEndDate}" pattern="yyyy-MM-dd"/></td>
                                                <td>${certificate.certificateHost}</td>
                                                <td>${certificate.certificateNumber}</td>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-file-text-o"></i> 경력</h3>
                            </div>
                            <div class="box-body careers">
                                <div class="row career">
                                    <div class="col-sm-12">
                                        <table class="table table-striped">
                                            <tr>
                                                <th>회사명</th>
                                                <th>직급</th>
                                                <th>부서</th>
                                                <th>담당업무</th>
                                                <th>입사일자</th>
                                                <th>퇴사일자</th>
                                                <th>퇴사사유</th>
                                            </tr>
                                            <c:forEach var="career" varStatus="i" items="${resume.careers}">
                                            <tr>
                                                <td>${career.careerCompany}</td>
                                                <td>${career.careerPosition}</td>
                                                <td>${career.careerDepartment}</td>
                                                <td>${career.careerTask}</td>
                                                <td><fmt:formatDate value="${career.careerBeginDate}" pattern="yyyy-MM-dd"/></td>
                                                <td><fmt:formatDate value="${career.careerEndDate}" pattern="yyyy-MM-dd"/></td>
                                                <td>${career.careerResign}</td>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-child"></i> 직무관련 경험 및 대외활동</h3>
                            </div>
                            <div class="box-body activities">
                                <div class="row activity">
                                    <div class="col-sm-12">
                                        <table class="table table-striped">
                                            <tr>
                                                <th>활동명</th>
                                                <th>주관단체</th>
                                                <th>시작일자</th>
                                                <th>종료일자</th>
                                                <th>활동내용</th>
                                            </tr>
                                            <c:forEach var="activity" varStatus="i" items="${resume.activities}">
                                            <tr>
                                                <td>${activity.activityName}</td>
                                                <td>${activity.activityHost}</td>
                                                <td><fmt:formatDate value="${activity.activityBeginDate}" pattern="yyyy-MM-dd"/></td>
                                                <td><fmt:formatDate value="${activity.activityEndDate}" pattern="yyyy-MM-dd"/></td>
                                                <td>${activity.activityContent}</td>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-sticky-note-o"></i> 기타사항(논문, 포트폴리오 등등)</h3>
                            </div>
                            <div class="box-body etcs">
                                <div class="row etc">
                                    <div class="col-sm-12">
                                        <table class="table table-striped">
                                            <tr>
                                                <th>기타사항명</th>
                                                <th>시작일자</th>
                                                <th>종료일자</th>
                                                <th>기타내용</th>
                                            </tr>
                                            <c:forEach var="etc" varStatus="i" items="${resume.etcs}">
                                            <tr>
                                                <td>${etc.etcName}</td>
                                                <td><fmt:formatDate value="${etc.etcBeginDate}" pattern="yyyy-MM-dd"/></td>
                                                <td><fmt:formatDate value="${etc.etcEndDate}" pattern="yyyy-MM-dd"/></td>
                                                <td>${etc.etcContent}</td>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>

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
</body>
</html>
