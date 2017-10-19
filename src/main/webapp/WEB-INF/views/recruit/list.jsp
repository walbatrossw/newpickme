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
                채용 목록
                <small>페이지 소제목</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 채용</a></li>
                <li class="active"> 목록</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <section class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="recruitTable" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>기업명</th>
                                    <th>채용명</th>
                                    <th>채용시작일시</th>
                                    <th>채용마감일시</th>
                                    <th>등록일시</th>
                                    <th>수정일시</th>
                                    <th>작성자</th>
                                    <th>수정</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="recruits" varStatus="i" items="${recruits}">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td><a href="${path}/company/info/${recruits.company.companyId}">${recruits.company.companyName}</a></td>
                                        <td><a href="${path}/recruit/${recruits.recruitId}">${recruits.recruitName}</td>
                                        <td><fmt:formatDate value="${recruits.recruitBeginDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td><fmt:formatDate value="${recruits.recruitEndDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td><fmt:formatDate value="${recruits.recruitWriteDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td><fmt:formatDate value="${recruits.recruitUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td>${recruits.admin.adminNickName}</td>
                                        <td>
                                            <a href="${path}/recruit/${recruits.recruitId}/update" methods="GET" class="btn btn-primary btn-xs" role="button">수정</a>
                                        </td>
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
    $("#recruitTable").DataTable();
</script>
</body>
</html>
