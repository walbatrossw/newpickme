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
                                 src="${path}/dist/img/default-company-image.png" alt="User profile picture">

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
                            <c:if test="${sessionScope.adminId != null}">
                                <div class="btn-group btn-group-justified">
                                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#recruitUpdateModal">채용 수정</a>
                                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#recruitDeleteModal">채용 삭제</a>
                                </div>
                            </c:if>
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
                                        <th>자소서 페이지</th>
                                        <c:if test="${sessionScope.adminId != null}">
                                        <th>직무 및 자소서항목 수정/삭제</th>
                                        </c:if>
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
                                                <c:forEach var="coverLetterArticles" varStatus="i"
                                                           items="${recruitJobs.coverLetterArticles}">
                                                    ${i.index+1}. ${coverLetterArticles.coverLetterArticleTitle}<br/>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <a href="#" class="btn btn-primary btn-xs"
                                                   role="button">${recruitJobs.recruitJobDetail} 자소서 작성</a>
                                            </td>
                                            <c:if test="${sessionScope.adminId != null}">
                                            <td>
                                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#recruitJobUpdateModal"> 수정</a>
                                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#recruitJobDeleteModal"> 삭제</a>
                                            </td>
                                            </c:if>
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

    <%--채용 수정 modal--%>
    <div class="modal fade" id="recruitUpdateModal" tabindex="-1" role="dialog" aria-labelledby="recruitUpdateModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="recruitUpdateModalLabel">채용 기본정보 수정</h4>
                </div>
                <div class="modal-body">
                    <form role="form" id="recruitUpdateForm" method="post" action="">
                        <div class="form-group">
                            <label for="companyName">채용기업명</label>
                            <input type="text" class="form-control" id="companyName" name="companyName" value="${companyInfo.companyName}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="recruitName">채용공고명</label>
                            <input type="text" class="form-control" id="recruitName" name="recruitName" value="${recruit.recruitName}">
                        </div>
                        <div class="form-group">
                            <label for="recruitBeginDate">채용시작일시</label>
                            <input type="datetime-local" class="form-control"
                                   id="recruitBeginDate"
                                   value="<fmt:formatDate value="${recruit.recruitBeginDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>"
                                   name="recruitBeginDate">
                        </div>
                        <div class="form-group">
                            <label for="recruitEndDate">채용마감일시</label>
                            <input type="datetime-local" class="form-control"
                                   id="recruitEndDate"
                                   value="<fmt:formatDate value="${recruit.recruitBeginDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>"
                                   name="recruitBeginDate">
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <div class="form-group" id="warningText" style="color: red"></div>
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="companyInfoUpdateBtn">저장</button>
                </div>
            </div>
        </div>
    </div>

    <%--채용 직무 수정 modal--%>
    <div class="modal fade" id="recruitJobUpdateModal" tabindex="-1" role="dialog" aria-labelledby="recruitJobUpdateModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="recruitJobUpdateModalLabel">채용 직무정보 수정</h4>
                </div>
                <div class="modal-body">
                    <form role="form" id="recruitJobUpdateForm" method="post" action="">
                        <div class="recruitJob">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group invalidText2" style="color: red"></div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="recruitJobType">채용형태</label>
                                        <select class="form-control" id="recruitJobType"
                                                name="recruitJobType">
                                            <option value="">:::선택:::</option>
                                            <option value="인턴">인턴</option>
                                            <option value="계약직">계약직</option>
                                            <option value="신입">신입</option>
                                            <option value="경력">경력</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="recruitJobEdu">채용학력</label>
                                        <select class="form-control" id="recruitJobEdu"
                                                name="recruitJobEdu">
                                            <option value="">:::선택:::</option>
                                            <option value="학력무관">학력무관</option>
                                            <option value="전문대졸">전문대졸</option>
                                            <option value="대졸">대졸</option>
                                            <option value="석사">석사</option>
                                            <option value="박사">박사</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row jobCategories">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="jobCategory1Id">직무 대분류</label>
                                        <select class="form-control" id="jobCategory1Id">
                                            <option value="">:::직무대분류:::</option>
                                            <c:forEach var="i" items="${jobCategory1s}">
                                                <option value="${i.jobCategory1Id}">${i.jobCategory1Name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="recruitJobCategory2">직무 소분류</label>
                                        <select class="form-control" id="recruitJobCategory2"
                                                name="jobCategory2Id">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="recruitJobDetail">상세 직무</label>
                                        <input type="text" class="form-control" id="recruitJobDetail"
                                               name="recruitJobDetail" placeholder="예) 자바개발자">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group articles">
                                        <label for="coverLetterArticleTitle">직무별 자기소개서 항목</label>
                                        <button type="button" class="btn btn-default btn-xs articleAddBtn">
                                            <i
                                                    class="fa fa-plus"></i> 항목 추가
                                        </button>
                                        <button type="button" class="btn btn-default btn-xs articleDelBtn">
                                            <i
                                                    class="fa fa-minus"></i> 항목 삭제
                                        </button>
                                        <div class="form-group article">
                                            <input type="text" class="form-control"
                                                   id="coverLetterArticleTitle"
                                                   name="coverLetterArticleTitle"
                                                   placeholder="예) 자신의 지원동기 및 입사후 포부를 기술해주세요">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <div class="form-group" id="warningText" style="color: red"></div>
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="companyInfoUpdateBtn">저장</button>
                </div>
            </div>
        </div>
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

        var data = [
            {
                "id": +"${recruit.recruitId}"
                , "title": "${recruit.company.companyName} " + " ${recruit.recruitName}"
                , "start": "<fmt:formatDate value="${recruit.recruitBeginDate}" pattern="yyyy-MM-dd"/>"
                , "end": "<fmt:formatDate value="${recruit.recruitEndDate}" pattern="yyyy-MM-dd"/>"
            }
        ];

        $("#calendar").fullCalendar({
            locale: "ko",
            editable: false,
            events: data,
            defaultDate: "<fmt:formatDate value="${recruit.recruitBeginDate}" pattern="yyyy-MM-dd"/>"

        });

        // 기업형태 SELECT BOX에 출력처리
        $("#recruitJobType").val("${recruitJobs.get(0).recruitJobType}").attr("selected", "selected");

        $("#recruitJobEdu").val("${recruitJobs.get(0).recruitJobEdu}").attr("selected", "selected");

        $("#jobCategory1Id").val("${recruitJobs.get(0).jobCategory2.jobCategory1Id}").attr("selected", "selected");

        $("#recruitJobDetail").val("${recruitJobs.get(0).recruitJobDetail}").append();


    });

</script>
</body>
</html>
