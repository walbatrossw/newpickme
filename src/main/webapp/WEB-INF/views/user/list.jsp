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
                회원 목록
                <small>회원 관리</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 관리자</a></li>
                <li class="active"> 회원 목록</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-body">
                            <table id="usersTable" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>회원 아이디</th>
                                    <th>회원 이름</th>
                                    <th>가입일자</th>
                                    <th>수정일자</th>
                                    <th>로그인일자</th>
                                    <th>수정/삭제</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="users" varStatus="i" items="${users}">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td><a href="${path}/user/profile/${users.userId}">${users.userEmail}</a></td>
                                        <td>${users.userNickName}</td>
                                        <td><fmt:formatDate value="${users.userJoinDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td><fmt:formatDate value="${users.userUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td><fmt:formatDate value="${users.userJoinDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td>
                                            <input type="button" class="btn btn-primary" value="수정">
                                            <input type="button" class="btn btn-danger" value="삭제">
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
    $("#usersTable").DataTable({
        "language": {
            "lengthMenu": "_MENU_ 개씩 보기",
            "zeroRecords": "내용이 없습니다.",
            "info": "현재 _PAGE_ 페이지 / 전체 _PAGES_ 페이지",
            "infoEmpty": "내용이 없습니다.",
            "infoFiltered": "( _MAX_개의 전체 목록 중에서 검색된 결과)",
            "search":         "검색:",
            "paginate": {
                "first":      "처음",
                "last":       "마지막",
                "next":       "다음",
                "previous":   "이전"
            }
        }
    });
</script>
</body>
</html>
