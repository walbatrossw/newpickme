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
                채용 등록
                <small>채용기업/채용직무</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 채용</a></li>
                <li class="active"> 채용 등록</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <form id="recruitCreateForm" action="${path}/recruit/create" method="post" enctype="multipart/form-data">
                <div class="row">
                    <section class="col-lg-10">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                              <h3 class="box-title"> 채용 기업 정보 </h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="companyName">기업명</label>
                                                <input type="text" class="form-control" id="companyName" name="companyName">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitName">채용공고명</label>
                                                <input type="text" class="form-control" id="recruitName" name="recruitName">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitBeginDate">채용시작일시</label>
                                                <input type="datetime-local" class="form-control" id="recruitBeginDate" name="recruitBeginDate">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitEndDate">채용마감일시</label>
                                                <input type="datetime-local" class="form-control" id="recruitEndDate" name="recruitEndDate">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="recruitImage">채용 사진파일</label>
                                                <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                                    <div class="form-control" data-trigger="fileinput">
                                                        <i class="glyphicon glyphicon-file fileinput-exists"></i>
                                                        <span class="fileinput-filename"></span>
                                                    </div>
                                                    <span class="input-group-addon btn btn-default btn-file">
                                                        <span class="fileinput-new">사진파일 선택</span>
                                                        <span class="fileinput-exists">변경</span>
                                                        <input type="file" name="recruitImage" id="recruitImage">
                                                    </span>
                                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">삭제</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"> 채용 직무별 정보 </h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-primary btn-xs recruitJobAddBtn">
                                        <i class="fa fa-plus"></i> 직무 추가
                                    </button>
                                    <button type="button" class="btn btn-primary btn-xs recruitJobRemoveBtn">
                                        <i class="fa fa-minus"></i> 직무 삭제
                                    </button>
                                </div>
                            </div>
                            <div class="box-body recruitJobs">
                                <div class="row recruitJob">
                                    <div class="col-sm-12">
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitJobType">채용형태</label>
                                                <select class="form-control" id="recruitJobType" name="recruitJobType">
                                                    <option value="">:::선택:::</option>
                                                    <option value="인턴">인턴</option>
                                                    <option value="계약직">계약직</option>
                                                    <option value="신입">신입</option>
                                                    <option value="경력">경력</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitJobEdu">채용학력</label>
                                                <select class="form-control" id="recruitJobEdu" name="recruitJobEdu">
                                                    <option value="">:::선택:::</option>
                                                    <option value="학력무관">학력무관</option>
                                                    <option value="전문대졸">전문대졸</option>
                                                    <option value="대졸">대졸</option>
                                                    <option value="석사">석사</option>
                                                    <option value="박사">박사</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
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
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitJobCategory2">직무 소분류</label>
                                                <select class="form-control" id="recruitJobCategory2" name="jobCategory2Id">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="recruitJobDetail">상세 직무 설명</label>
                                                <input type="text" class="form-control" id="recruitJobDetail" name="recruitJobDetail" placeholder="예) 자바개발자">
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group articles">
                                                <label for="coverLetterArticleTitle">직무별 자기소개서 항목</label>
                                                <button type="button" class="btn btn-primary btn-xs articleAddBtn">
                                                    <i class="fa fa-plus"></i> 항목 추가
                                                </button>
                                                <button type="button" class="btn btn-primary btn-xs articleRemoveBtn">
                                                    <i class="fa fa-minus"></i> 항목 삭제
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
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </form>
            <button type="button" class="btn btn-primary btn-sm recruitCreateBtn"><i class="fa fa-save"></i> 채용 저장</button>
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
                url: "${path}/recruit/jobCategory1s/" + jobCategory1Id + "/jobCategory2s/list",
                success: function (data) {
                    for (var i in data) {
                        jobCategory2.append(
                            "<option value='" + data[i].jobCategory2Id + "'>" + data[i].jobCategory2Name + "</option>")
                    }
                }
            });
        });

        // 채용 직무 추가
        $(".recruitJobAddBtn").on("click", function () {
            $(".recruitJob:last")
                .after("<hr>")
                .clone(true)
                .find("input[type=text]").val("").end()
                .find("option:first").attr("selected", "selected").end()
                .find("#recruitJobCategory2").val("").end()
                .find(".added").remove().end()
                .appendTo(".recruitJobs");
        });

        // 채용 직무 삭제
        $(".recruitJobRemoveBtn").on("click", function () {
            if ( $(".recruitJob").length === 1 ) {
                alert("채용직무 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                $(".recruitJob:last").remove();
                $(".recruitJobs").find("hr:last").remove();
            }
        });

        // 채용 직무별 자기소개서 항목 추가
        $(".articleAddBtn").on("click", function () {
            $(this).parent().find(".article:last")
                .clone()
                .find("input[type=text]").val("").end()
                .addClass("added")
                .appendTo($(this).parent());
        });

        // 채용 직무별 자기소개서 항목 삭제
        $(".articleRemoveBtn").on("click", function () {
            var article = $(this).parent().find(".article");
            if ( article.length === 1 ) {
                alert("자기소개서 항목 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                article.last().remove();
            }
        });

        // name 속성에 인덱스값 부여
        function renameForSubmit() {

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
            renameForSubmit();
            $("#recruitCreateForm").submit();
        });


        // 유효성검사 추가
    });
</script>
</body>
</html>
