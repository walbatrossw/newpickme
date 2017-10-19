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
                관리자 목록
                <small>관리자 관리</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 관리자</a></li>
                <li class="active"> 관리자 목록</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <section class="col-lg-12">
                    관리자 목록 테이블
                    <table id="adminsTable" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>관리자 아이디</th>
                            <th>관리자 이름</th>
                            <th>가입일자</th>
                            <th>수정일자</th>
                            <th>로그인일자</th>
                            <th>수정/삭제</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="admins" varStatus="i" items="${admins}">
                            <tr>
                                <td>${i.index+1}</td>
                                <td><a href="${path}/admin/profile/${admins.adminId}">${admins.adminEmail}</a></td>
                                <td>${admins.adminNickName}</td>
                                <td><fmt:formatDate value="${admins.adminJoinDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                <td><fmt:formatDate value="${admins.adminUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                <td><fmt:formatDate value="${admins.adminLoginDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                <td>
                                    <input type="button" class="btn btn-primary" value="수정">
                                    <input type="button" class="btn btn-danger" value="삭제">
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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
    $("#adminsTable").DataTable();
</script>
</body>
</html>
