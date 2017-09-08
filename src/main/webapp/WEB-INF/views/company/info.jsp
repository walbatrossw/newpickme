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
                기업정보 상세 정보
                <small>기업정보</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 기업</a></li>
                <li class="active"> 기업 상세 정보</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <%--기업 상세 정보--%>
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle"
                                 src="../../dist/img/user4-128x128.jpg" alt="User profile picture">

                            <h3 class="profile-username text-center">${companyInfo.companyName}</h3>

                            <ul class="list-group list-group-unbordered">

                                <li class="list-group-item">
                                    <strong><i class="fa fa-building margin-r-5"></i> 기업분류</strong>
                                    <p class="pull-right">${companyInfo.companyType}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-industry margin-r-5"></i> 업종 대분류</strong>
                                    <p class="pull-right">${companyInfo.industryCategory2.industryCategory1.industryCategory1Name}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-industry margin-r-5"></i> 업종 소분류</strong>
                                    <p class="pull-right">${companyInfo.industryCategory2.industryCategory2Name}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-calendar margin-r-5"></i> 설립입</strong>
                                    <p class="pull-right">
                                        <fmt:formatDate value="${companyInfo.companyBirthDate}" pattern="yyyy-MM-dd"/>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-user margin-r-5"></i> 대표자</strong>
                                    <p class="pull-right">${companyInfo.companyCeo}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-map-marker margin-r-5"></i> 주소지</strong>
                                    <p class="text-muted">${companyInfo.companyAddress}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-phone margin-r-5"></i> 대표번호</strong>
                                    <p class="pull-right">${companyInfo.companyPhone}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa  fa-internet-explorer margin-r-5"></i> 공식/채용 홈페이지</strong><br/>
                                    <a class="text-muted" href="${companyInfo.companyHomePage}" target="_blank">${companyInfo.companyHomePage}</a>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-won margin-r-5"></i> 연간 매출액</strong>
                                    <p class="pull-right">${companyInfo.companySales}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-pencil margin-r-5"></i> 기업정보 등록일시</strong>
                                    <p class="pull-right">
                                        <fmt:formatDate value="${companyInfo.companyRegisterDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-pencil margin-r-5"></i> 기업정보 수정일시</strong>
                                    <p class="pull-right">
                                        <fmt:formatDate value="${companyInfo.companyUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-pencil-square-o margin-r-5"></i> 작성자</strong>
                                    <p class="pull-right">${companyInfo.admin.adminNickName}</p>
                                </li>
                            </ul>
                            <c:if test="${sessionScope.adminId != null}">
                            <div class="btn-group btn-group-justified">
                                <a href="${path}/company/info/${companyInfo.companyId}/update" class="btn btn-primary"> 수정 </a>
                                <a href="${path}/company/info/${companyInfo.companyId}/delete" class="btn btn-primary"> 삭제 </a>
                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#recruit" data-toggle="tab">현재 진행중인 채용</a></li>
                            <li><a href="#review" data-toggle="tab">기업리뷰</a></li>
                            <li><a href="#salary" data-toggle="tab">연봉정보</a></li>
                            <li><a href="#interview" data-toggle="tab">면접후기</a></li>
                            <li><a href="#qna" data-toggle="tab">QNA</a></li>
                        </ul>
                        <div class="tab-content">

                            <div class="active tab-pane" id="recruit">
                                현재 진행중인 채용...
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
</body>
</html>
