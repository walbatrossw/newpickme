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
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-bordered"
                                 src="${path}/dist/img/default-company-image.png">
                            <h3 class="profile-username text-center"><a
                                    href="/company/info/${recruit.companyId}">${recruit.company.companyName}</a></h3>
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
                        </div>
                    </div>
                </div>


                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#recruit" data-toggle="tab">채용직무별 목록</a></li>
                            <li><a href="#companyInfo" data-toggle="tab">기업 정보</a></li>
                            <li><a href="#review" data-toggle="tab">기업 리뷰</a></li>
                            <li><a href="#salary" data-toggle="tab">연봉 정보</a></li>
                            <li><a href="#interview" data-toggle="tab">면접 후기</a></li>
                            <li><a href="#qna" data-toggle="tab">QNA</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="active tab-pane" id="recruit">
                                <table class="table table-hover">
                                    <tr>
                                        <th>번호</th>
                                        <th>직무 대분류</th>
                                        <th>직무 소분류</th>
                                        <th>상세 직무</th>
                                        <th>채용 형태</th>
                                        <th>채용 학력</th>
                                        <th>자소서 항목</th>
                                    </tr>
                                    <c:forEach varStatus="i" var="recruitJobs" items="${recruitJobs}">
                                        <tr>
                                            <td>${i.index+1}</td>
                                            <td>${recruitJobs.jobCategory2.jobCategory1.jobCategory1Name}</td>
                                            <td>${recruitJobs.jobCategory2.jobCategory2Name}</td>
                                            <td>${recruitJobs.recruitJobDetail}</td>
                                            <td>${recruitJobs.recruitJobType}</td>
                                            <td>${recruitJobs.recruitJobEdu}</td>
                                            <td>
                                                <%--채용 직무별 자기소개서 항목 modal button--%>
                                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                                   data-target="#articleModal${i.index}">
                                                        ${recruitJobs.recruitJobDetail} 자소서항목
                                                </a>
                                                <%--채용 직무별 자기소개서 항목 modal--%>
                                                <div class="modal fade" id="articleModal${i.index}" tabindex="-1"
                                                     role="dialog" aria-labelledby="articleModalLabel">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span></button>
                                                                <h4 class="modal-title" id="articleModalLabel">자소서
                                                                    항목</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <table class="table table-hover">
                                                                    <tr>
                                                                        <th>상세 직무</th>
                                                                        <th>자소서 항목</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>${recruitJobs.recruitJobDetail}</td>
                                                                        <td>
                                                                            <c:forEach var="coverLetterArticles"
                                                                                       varStatus="j"
                                                                                       items="${recruitJobs.coverLetterArticles}">
                                                                                ${j.index+1}. ${coverLetterArticles.coverLetterArticleTitle}
                                                                                <br/>
                                                                            </c:forEach>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <div class="form-group" id="warningText"
                                                                     style="color: red"></div>
                                                                <button type="button" class="btn btn-default pull-left"
                                                                        data-dismiss="modal">닫기
                                                                </button>
                                                                <button type="button" class="btn btn-primary"
                                                                        id="companyInfoUpdateBtn">저장
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <div class="tab-pane" id="companyInfo">
                                <strong><i class="fa fa-building margin-r-5"></i> 기업분류</strong>
                                <p class="text-muted">${companyInfo.companyType}</p>
                                <hr>
                                <strong><i class="fa fa-industry margin-r-5"></i> 업종 대분류</strong>
                                <p class="text-muted">${companyInfo.industryCategory2.industryCategory1.industryCategory1Name}</p>
                                <hr>
                                <strong><i class="fa fa-industry margin-r-5"></i> 업종 소분류</strong>
                                <p class="text-muted">${companyInfo.industryCategory2.industryCategory2Name}</p>
                                <hr>
                                <strong><i class="fa fa-calendar margin-r-5"></i> 설립입</strong>
                                <p class="text-muted">
                                    <fmt:formatDate value="${companyInfo.companyBirthDate}" pattern="yyyy-MM-dd"/>
                                </p>
                                <hr>
                                <strong><i class="fa fa-user margin-r-5"></i> 대표자</strong>
                                <p class="text-muted">${companyInfo.companyCeo}</p>
                                <hr>
                                <strong><i class="fa fa-map-marker margin-r-5"></i> 주소지</strong>
                                <p class="text-muted">${companyInfo.companyAddress}</p>
                                <hr>
                                <strong><i class="fa fa-phone margin-r-5"></i> 대표번호</strong>
                                <p class="text-muted">${companyInfo.companyPhone}</p>
                                <hr>
                                <strong><i class="fa  fa-internet-explorer margin-r-5"></i> 공식/채용 홈페이지</strong><br/>
                                <a class="text-muted" href="${companyInfo.companyHomePage}"
                                   target="_blank">${companyInfo.companyHomePage}</a>
                                <hr>
                                <strong><i class="fa fa-won margin-r-5"></i> 연간 매출액</strong>
                                <p class="text-muted">${companyInfo.companySales}</p>
                                <hr>
                            </div>

                            <div class="tab-pane" id="review">
                                기업리뷰...
                            </div>

                            <div class="tab-pane" id="salary">
                                연봉정보...
                            </div>

                            <div class="tab-pane" id="interview">
                                면접후기...
                            </div>

                            <div class="tab-pane" id="qna">
                                QNA...
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

        // fullCalendar events 값 세팅
        var data = [
            {
                "id": +"${recruit.recruitId}"
                , "title": "${recruit.company.companyName} " + " ${recruit.recruitName}"
                , "start": "<fmt:formatDate value="${recruit.recruitBeginDate}" pattern="yyyy-MM-dd"/>"
                , "end": "<fmt:formatDate value="${recruit.recruitEndDate}" pattern="yyyy-MM-dd"/>"
            }
        ];

        // fullCalendar 세팅
        $("#calendar").fullCalendar({
            locale: "ko", // 언어 : 한글
            editable: false, // 수정 X
            events: data,
            // fullCalendar 로드시 초기날짜 설정(채용시작일)
            defaultDate: "<fmt:formatDate value="${recruit.recruitBeginDate}" pattern="yyyy-MM-dd"/>"
        });

    });

</script>
</body>
</html>
