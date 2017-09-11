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
                채용 등록
                <small>페이지 소제목</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 채용</a></li>
                <li class="active"> 채용 등록</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <form id="recruitCreateForm" action="${path}/recruit/create" method="post">
                <div class="row">
                    <div class="col-md-8">

                        <div class="nav-tabs-custom">
                            <%--탭 제목--%>
                            <ul class="nav nav-tabs">

                                <li class="active"><a href="#recruitTab" data-toggle="tab">채용기업</a></li>

                                <li><a href="#recruitJobTab" data-toggle="tab">채용직무 </a></li>

                                <li class="pull-right">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary jobAddBtn"><i
                                                class="fa fa-plus"></i>
                                            직무 추가
                                        </button>
                                        <button type="button" class="btn btn-primary jobDelBtn"><i
                                                class="fa fa-minus"></i>
                                            직무 삭제
                                        </button>
                                        <button type="button" class="btn btn-success recruitCreateBtn"><i
                                                class="fa fa-save"></i> 저장
                                        </button>
                                    </div>
                                </li>
                            </ul>
                            <%--탭 내용--%>
                            <div class="tab-content">

                                <%--채용기업--%>
                                <div class="tab-pane active" id="recruitTab">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group invalidText1" style="color: red"></div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="companyName">기업명</label>
                                                <input type="text" class="form-control" id="companyName"
                                                       name="companyName"
                                                       placeholder="예) 삼성전자">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="recruitName">채용공고명</label>
                                                <input type="text" class="form-control" id="recruitName"
                                                       name="recruitName"
                                                       placeholder="예) 2017 상반기 대졸 신입사원 공채">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="recruitBeginDate">채용시작일</label>
                                                <input type="datetime-local" class="form-control"
                                                       id="recruitBeginDate"
                                                       name="recruitBeginDate">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="recruitEndDate">채용마감일</label>
                                                <input type="datetime-local" class="form-control"
                                                       id="recruitEndDate"
                                                       name="recruitEndDate">
                                            </div>
                                        </div>
                                        <%--<div class="col-sm-12">--%>
                                            <%--<div class="form-group">--%>
                                                <%--<label for="recruitCompanyPhotoName">채용 공고 사진파일</label>--%>
                                                <%--<input type="file" id="recruitCompanyPhotoName"--%>
                                                       <%--name="recruitCompanyPhotoName">--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    </div>
                                </div>

                                <%--채용 직무--%>
                                <div class="tab-pane" id="recruitJobTab">
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
                                </div>

                            </div>

                        </div>

                    </div>

                </div>
            </form>
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

        // 기업명 자동완성
        var companyNameList = new Array();
        <c:forEach var="i" items="${companies}">
        companyNameList.push("${i.companyName}");
        </c:forEach>
        $("#companyName").autocomplete({
            source: companyNameList
        });

        // 직무 소분류 select box
        $("#jobCategory1Id").on("change", function () {
            var jobCategory1Id = $(this).val(); // 업종 대분류 id
            var jobCategory2 = $(this).parents(".recruitJob").find("#recruitJobCategory2");
            $(this).parents(".recruitJob").find("#recruitJobCategory2 option").remove();
            $.ajax({
                type: "get",
                url: "${path}/recruit/job/category1/" + jobCategory1Id + "/list",
                success: function (data) {
                    for (var i in data) {
                        jobCategory2.append(
                            "<option value='" + data[i].jobCategory2Id + "'>" + data[i].jobCategory2Name + "</option>")
                    }
                }
            });
        });

        // 채용직무 추가
        $(".jobAddBtn").on("click", function () {
            // 채용직무 div 복사 : 클릭이벤트까지 (true)
            var job = $(".recruitJob:first").clone(true);
            job
                .find(".add-article").remove().end() // 추가된 자소서항목 div 전부 삭제
                .find("#recruitJobState").val("").end()
                .find("#recruitJobEdu").val("").end()
                .find("#recruitJobCategory2").val("").end()
                .find("#recruitJobDetail").val("").end()
                .find("#coverLetterArticleTitle").val("").end()
                .addClass("job-add") // 채용직무 div 에 job-add 클래스 추가, 원본 삭제 방지를 위해
                //.attr("id", jobId)
                .appendTo("#recruitJobTab"); // 복사한 div 붙여넣기

        });

        // 채용직무 삭제
        $(".jobDelBtn").on("click", function () {
            // 채용직무 .job-add 클래스가 추가된 div 만 삭제되게 처리, 원본 삭제 방지
            $(".recruitJob:last").remove(".job-add");
        });

        // 자소서 항목 추가
        $(".articleAddBtn").on("click", function () {
            // 자소서 항목중 가장 마지막 요소를 변수에 저장
            var article = $(this).parent().find(".article").last();
            article
                .clone() // 요소를 복사
                .find("input:text").val("").end() // input 태그에 작성된 value 값 초기화
                .addClass("add-article") // 항목 div 에 article-add 클래스 추가, 원본 삭제 방지를 위해
                .appendTo($(this).parent()); // 자기자신의 부모 div 에 붙여넣기
        });

        // 자소서 항목 삭제
        $(".articleDelBtn").on("click", function () {
            var article = $(this).parent().find(".add-article").last();
            // 항목 .article-add 클래스가 추가된 div 만 삭제, 원본 삭제 방지
            article.remove(".add-article");
        });

        // name 속성에 인덱스값 부여
        function renameForRecruitJobModelAttribute() {

            $(".recruitJob").each(function (index) {
                $(this).find("select[name=recruitJobType]").attr("name", "recruitJobs["+index+"].recruitJobType");
                $(this).find("select[name=recruitJobEdu]").attr("name", "recruitJobs["+index+"].recruitJobEdu");
                $(this).find("select[name=jobCategory2Id]").attr("name", "recruitJobs["+index+"].jobCategory2Id");
                $(this).find("input[name=recruitJobDetail]").attr("name", "recruitJobs["+index+"].recruitJobDetail");
                $(this).find(".article").each(function (index2) {
                    $(this).find("input[name=coverLetterArticleTitle]").attr("name", "recruitJobs["+index+"].coverLetterArticles["+index2+"].coverLetterArticleTitle");
                })
            });

        }

        $(".recruitCreateBtn").on("click", function () {

                renameForRecruitJobModelAttribute();
                $("#recruitCreateForm").submit();
        });
    });


</script>
</body>
</html>
