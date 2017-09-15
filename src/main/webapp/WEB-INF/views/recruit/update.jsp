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
                채용 상세 페이지
                <small>페이지 소제목</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 채용</a></li>
                <li class="active"> 채용상세</li>
            </ol>
        </section>

        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <%--기업 상세 정보--%>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-bordered"
                                 src="${path}/dist/img/default-company-image.png" alt="User profile picture">

                            <h3 class="profile-username text-center">
                                <a href="/company/info/${recruit.companyId}">${recruit.company.companyName}</a></h3>

                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <strong><i class="fa fa-tag margin-r-5"></i> 채용명</strong>
                                    <p class="pull-right">${recruit.recruitName}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-calendar-plus-o margin-r-5"></i> 채용 시작일시</strong>
                                    <p class="pull-right">
                                        <fmt:formatDate value="${recruit.recruitBeginDate}"
                                                        pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-calendar-times-o margin-r-5"></i> 채용 마감일시</strong>
                                    <p class="pull-right">
                                        <fmt:formatDate value="${recruit.recruitEndDate}"
                                                        pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-calendar margin-r-5"></i> 채용 일정</strong>
                                    <div id="calendar"></div>
                                </li>
                            </ul>
                                <div class="btn-group btn-group-justified">
                                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#recruitUpdateModal">채용 수정</a>
                                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#recruitDeleteModal">채용 삭제</a>
                                </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#recruit" data-toggle="tab">채용직무별 목록</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="active tab-pane" id="recruit">
                                <table class="table table-hover">
                                    <tr>
                                        <th>번호</th>
                                        <th>직무대분류</th>
                                        <th>직무소분류</th>
                                        <th>상세직무</th>
                                        <th>채용형태</th>
                                        <th>채용학력</th>
                                        <th>자소서 항목</th>
                                        <th>수정/삭제</th>
                                    </tr>
                                    <c:forEach varStatus="i" var="recruitJobs" items="${recruitJobs}">
                                        <tr>
                                            <td>${i.index+1}</td>
                                            <td>${recruitJobs.jobCategory2.jobCategory1.jobCategory1Name}</td>
                                            <td>${recruitJobs.jobCategory2.jobCategory2Name}</td>
                                            <td>${recruitJobs.recruitJobDetail}</td>
                                            <td>
                                                <select class="form-control"
                                                        id="recruitJobType"
                                                        name="recruitJobType[${i.index}]">
                                                    <option value="">:::선택:::</option>
                                                    <option value="인턴">인턴</option>
                                                    <option value="계약직">계약직</option>
                                                    <option value="신입">신입</option>
                                                    <option value="경력">경력</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select class="form-control" id="recruitJobEdu"
                                                        name="recruitJobEdu[${i.index}]">
                                                    <option value="">:::선택:::</option>
                                                    <option value="학력무관">학력무관</option>
                                                    <option value="전문대졸">전문대졸</option>
                                                    <option value="대졸">대졸</option>
                                                    <option value="석사">석사</option>
                                                    <option value="박사">박사</option>
                                                </select>
                                            </td>
                                            <td>
                                                <c:forEach var="coverLetterArticles"
                                                           varStatus="j"
                                                           items="${recruitJobs.coverLetterArticles}">
                                                    <input type="text" class="form-control"
                                                           id="coverLetterArticleTitle"
                                                           name="recruitJobs[${i.index}].coverLetterArticles[${j.index}].coverLetterArticleTitle"
                                                           placeholder="예) 자신의 지원동기 및 입사후 포부를 기술해주세요"
                                                    value="${coverLetterArticles.coverLetterArticleTitle}">
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#recruitJobUpdateModal"> 수정</a>
                                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#recruitJobDeleteModal"> 삭제</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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



    });

</script>
</body>
</html>
