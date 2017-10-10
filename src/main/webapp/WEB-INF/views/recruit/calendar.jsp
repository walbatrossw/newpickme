<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--헤드(CSS) include--%>
    <%@ include file="../include/head.jsp" %>
</head>
<body class="fixed skin-blue-light sidebar-mini">
<div class="wrapper">

    <%--헤더 네비바 include--%>
    <%@ include file="../include/navbar.jsp" %>

    <%--사이드 메뉴 include--%>
    <%@ include file="../include/left_column.jsp" %>


    <div class="content-wrapper">

        <section class="content-header">
            <h1>
                채용 달력
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 채용</a></li>
                <li class="active"> 채용달력</li>
            </ol>
        </section>

        <section class="content">
            <div class="row">
                <form class="recruitSearchForm" method="post" action="${path}/recruit/calendar">
                    <div class="col-md-2">
                        <div class="box">
                            <button type="button" class="btn btn-primary btn-block recruitSearchBtn">
                                <i class="fa fa-search"></i> 선택 조건으로 검색
                            </button>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <div class="box-title">
                                    직무 선택
                                </div>
                            </div>
                            <div class="box-body">
                                <c:forEach var="jobCategory1s" varStatus="i" items="${jobCategory1s}">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="jobCategory1Id" value="${jobCategory1s.jobCategory1Id}">
                                        ${jobCategory1s.jobCategory1Name}
                                    </label>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h4 class="box-title">업종 선택</h4>
                            </div>
                            <div class="box-body">
                                <c:forEach var="industryCategory1s" varStatus="i" items="${industryCategory1s}">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="industryCategory1Id" value="${industryCategory1s.industryCategory1Id}">
                                            ${industryCategory1s.industryCategory1Name}
                                    </label>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h4 class="box-title">기업 형태 선택</h4>
                            </div>
                            <div class="box-body">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="companyType" value="대기업">
                                        대기업
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="companyType" value="중견기업">
                                        중견기업
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="companyType" value="중소기업">
                                        중소기업
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="companyType" value="외국계">
                                        외국계
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="companyType" value="스타트업">
                                        스타트업
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="companyType" value="공기업">
                                        공기업
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="companyType" value="공공기관">
                                        공공기관
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h4 class="box-title">채용 형태 선택</h4>
                            </div>
                            <div class="box-body">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="recruitJobType" value="신입">
                                        신입
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="recruitJobType" value="경력">
                                        경력
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="recruitJobType" value="인턴">
                                        인턴
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="recruitJobType" value="계약직">
                                        계약직
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h4 class="box-title">채용 학력 선택</h4>
                            </div>
                            <div class="box-body">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="recruitJobEdu" value="학력무관">
                                        학력무관
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="recruitJobEdu" value="고졸">
                                        고졸
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="recruitJobEdu" value="대졸">
                                        대졸
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="recruitJobEdu" value="석사">
                                        석사
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="recruitJobEdu" value="박사">
                                        박사
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="col-md-10">
                    <div class="box box-primary">
                        <div class="box-body no-padding">
                            <div id="calendar"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <%--풋터 include--%>
    <%@ include file="../include/footer.jsp" %>

    <%--컨트롤 사이드바--%>
    <%@ include file="../include/control_sidebar.jsp" %>


</div>
<%--풋(JS) include--%>
<%@ include file="../include/js.jsp" %>
<script>
    $(function () {

        // 체크박스
        $("input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue'
        });

        // 데이터
        var data = [
            <c:forEach var="recruits" varStatus="i" items="${recruits}" >
            {
                "id": + "${recruits.recruitId}"
                , "title": "${recruits.company.companyName} " + " ${recruits.recruitName}"
                , "start": "<fmt:formatDate value="${recruits.recruitBeginDate}" pattern="yyyy-MM-dd"/>"
                , "end": "<fmt:formatDate value="${recruits.recruitEndDate}" pattern="yyyy-MM-dd"/>"
                , url: "/recruit/${recruits.recruitId}"
            }<c:if test="${!i.last}">,</c:if>
            </c:forEach>
        ];

        // 채용 달력
        $("#calendar").fullCalendar({
            locale: "ko",
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,basicWeek,basicDay'
            },
            editable : false,
            events: data
        });

        // 직무로 검색
        $(".recruitSearchBtn").on("click", function () {
            $(".recruitSearchForm").submit();
        })
    });
</script>
</body>
</html>
