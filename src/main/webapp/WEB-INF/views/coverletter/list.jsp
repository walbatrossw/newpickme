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
                자기소개서 리스트
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 자기소개서</a></li>
                <li class="active"> 목록</li>
            </ol>
        </section>

        <div class="pad margin no-print col-lg-8">
            <div class="callout callout-success" style="margin-bottom: 0!important;">
                자기소개서 리스트

            </div>
        </div>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <section class="col-lg-8">
                    <div class="box box-primary">
                        <div class="box-body">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>자소서 명</th>
                                    <th>자소서 제출 마감 일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="userCoverLetter" varStatus="i" items="${userCoverLetters}">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td><a href="${path}/coverletter/update/${userCoverLetter.userCoverLetterId}">${userCoverLetter.userCoverLetterName}</a></td>
                                        <td><fmt:formatDate value="${userCoverLetter.userCoverLetterEndDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
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

</script>
</body>
</html>
