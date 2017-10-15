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
                            <table class="table table-bordered table-striped coverLettersTable">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>자소서 명</th>
                                    <th>자소서 제출 마감 일자</th>
                                    <th>D-DAY</th>
                                    <th>자소서 삭제</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="userCoverLetter" varStatus="i" items="${userCoverLetters}">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td><a href="${path}/coverletter/update/${userCoverLetter.userCoverLetterId}">${userCoverLetter.userCoverLetterName}</a></td>
                                        <td><fmt:formatDate value="${userCoverLetter.userCoverLetterEndDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
                                        <td><span id="dateView${i.index}"></span></td>
                                        <td><a href="${path}/coverletter/delete/${userCoverLetter.userCoverLetterId}" type="button" class="btn btn-primary btn-xs userCoverLetterDelBtn${i.index}"><i class="fa fa-trash"></i> 삭제</a></td>
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
    $(function () {
        <c:forEach var="userCoverLetter" varStatus="i" items="${userCoverLetters}">
            $(".userCoverLetterDelBtn${i.index}").on("click", function () {
                if (confirm("삭제하시겠습니까?")) {
                    var url = "${path}/coverletter/delete/${userCoverLetter.userCoverLetterId}";
                    $(location).attr('href', url);
                }
            });

            dDayCount${i.index}();

            function dDayCount${i.index}() {
                var now = new Date();
                var then = new Date("<fmt:formatDate value="${userCoverLetter.userCoverLetterEndDate}" pattern="yyyy-MM-dd HH:mm"/>");
                var diff = then - now;

                var currMin = 60 * 1000; // 초 * 밀리세컨
                var currHour = 60 * 60 * 1000; // 분 * 초 * 밀리세컨
                var currDay = 24 * 60 * 60 * 1000; // 시 * 분 * 초 * 밀리세컨

                var day = parseInt(diff/currDay); //d-day 일
                var hour = parseInt(diff/currHour); //d-day 시
                var min = parseInt(diff/currMin); //d-day 분

                var viewHour = hour-(day*24);
                var viewMin = min-(hour*60);

                if ( day > 0 ) {
                    var viewStr = "D - " + day+"일 "+viewHour+"시 "+viewMin+"분 남음";
                    $("#dateView${i.index}").html(viewStr);
                } else {
                    var day2 = Math.abs(day);
                    var viewHour2 = Math.abs(viewHour);
                    var viewMin2 = Math.abs(viewMin);
                    var viewStr2 = "D + " + day2+"일 "+viewHour2+"시 "+viewMin2+"분 지남";
                    $("#dateView${i.index}").html(viewStr2);
                }

            }
        </c:forEach>

        $(".coverLettersTable").DataTable();
    });
</script>
</body>
</html>
