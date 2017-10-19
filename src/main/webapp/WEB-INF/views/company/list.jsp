<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!--헤드(CSS) include-->
    <%@ include file="../include/head.jsp" %>
</head>
<body class="fixed sidebar-mini skin-green">
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
                기업 목록
                <small>기업 목록 페이지</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 기업</a></li>
                <li class="active"> 등록</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <section class="col-lg-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="companiesTable" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>기업명</th>
                                    <th>기업 분류</th>
                                    <th>업종 대분류</th>
                                    <th>업종 소분류</th>
                                    <th>등록일시</th>
                                    <th>수정일시</th>
                                    <th>작성자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="companies" varStatus="i" items="${companies}">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td><a href="${path}/company/info/${companies.companyId}">${companies.companyName}</a></td>
                                        <td>${companies.companyType}</td>
                                        <td>${companies.industryCategory2.industryCategory1.industryCategory1Name}</td>
                                        <td>${companies.industryCategory2.industryCategory2Name}</td>
                                        <td><fmt:formatDate value="${companies.companyRegisterDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td><fmt:formatDate value="${companies.companyUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td>${companies.admin.adminNickName}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
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
    $("#companiesTable").DataTable();
</script>
</body>
</html>
