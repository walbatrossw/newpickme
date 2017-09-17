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
                채용달력
                <small>페이지 소제목</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 채용</a></li>
                <li class="active"> 채용달력</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <div class="col-md-2">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h4 class="box-title">직무 선택</h4>
                        </div>
                        <div class="box-body">
                            <c:forEach var="i" items="${jobCategory1s}">
                            <div class="checkbox">
                                <label for="jobCategory1Id">
                                    <input type="checkbox" id="jobCategory1Id" value="${i.jobCategory1Id}">
                                    ${i.jobCategory1Name}
                                </label>
                            </div>
                            </c:forEach>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /. box -->
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h4 class="box-title">업종 선택</h4>
                        </div>
                        <div class="box-body">
                            <c:forEach var="i" items="${industryCategory1s}">
                            <div class="checkbox">
                                <label for="industryCategory1Id">
                                    <input type="checkbox" id="industryCategory1Id" value="${i.industryCategory1Id}">
                                        ${i.industryCategory1Name}
                                </label>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h4 class="box-title">기업 형태 선택</h4>
                        </div>
                        <div class="box-body">
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    대기업
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    중견기업
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    중소기업
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    외국계
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    스타트업
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    공기업
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    공공기관
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h4 class="box-title">채용 형태 선택</h4>
                        </div>
                        <div class="box-body">
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" class="minimal" id="companyType" value="">
                                    신입
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" class="minimal" id="companyType" value="">
                                    경력
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" class="minimal" id="companyType" value="">
                                    인턴
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" class="minimal" id="companyType" value="">
                                    계약직
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h4 class="box-title">채용 학력 선택</h4>
                        </div>
                        <div class="box-body">
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    학력무관
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    고졸
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    대졸
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    석사
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="companyType">
                                    <input type="checkbox" id="companyType" value="">
                                    박사
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-md-10">
                    <div class="box box-primary">
                        <div class="box-body no-padding">
                            <!-- THE CALENDAR -->
                            <div id="calendar"></div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /. box -->
                </div>
                <!-- /.col -->
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

        $("input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue'
        });

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

    });
</script>
</body>
</html>
