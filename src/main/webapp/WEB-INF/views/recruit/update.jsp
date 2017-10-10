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
                채용 수정 페이지
                <small>페이지 소제목</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 채용</a></li>
                <li class="active"> 채용 수정</li>
            </ol>
        </section>

        <section class="content">
            <!-- 페이지 내용 -->

                <div class="row">
                    <%--채용 정보 수정--%>
                    <section class="col-lg-10">
                        <div class="box box-primary">
                            <div class="box-header">
                                <div class="box-title with-border">
                                    <h3 class="box-title">채용정보 수정</h3>

                                </div>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-primary btn-xs recruitUpdateBtn">
                                        <i class="fa fa-edit"></i> 채용 수정
                                    </button>
                                    <button type="button" class="btn btn-primary btn-xs recruitDeleteBtn">
                                        <i class="fa fa-remove"></i> 채용 삭제
                                    </button>
                                </div>
                            </div>
                            <div class="box-body">
                                <form role="form" id="recruitUpdateForm" method="post" action="${path}/recruit/${recruit.recruitId}/update" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="companyName">채용기업명</label>
                                                <input type="text" class="form-control" id="companyName"
                                                       name="companyName"
                                                       value="${companyInfo.companyName}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitName"><strong><i class="fa fa-tag margin-r-5"></i>
                                                    채용공고명</strong> </label>
                                                <input type="text" class="form-control" id="recruitName"
                                                       name="recruitName"
                                                       value="${recruit.recruitName}">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="recruitImage">채용 이미지파일 수정 : 기존의 이미지파일 ( <a id="oldRecruitImage" data-toggle="modal" data-target="#recruitImageModal">${recruit.recruitImageName}</a> )</label>
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
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitBeginDate">
                                                    <strong><i class="fa fa-calendar-plus-o margin-r-5"></i> 채용 시작일시</strong>
                                                </label>
                                                <input type="datetime-local" class="form-control"
                                                       id="recruitBeginDate"
                                                       value="<fmt:formatDate value="${recruit.recruitBeginDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>"
                                                       name="recruitBeginDate">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitEndDate"><strong><i
                                                        class="fa fa-calendar-times-o margin-r-5"></i> 채용 마감일시</strong></label>
                                                <input type="datetime-local" class="form-control"
                                                       id="recruitEndDate"
                                                       value="<fmt:formatDate value="${recruit.recruitEndDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>"
                                                       name="recruitEndDate">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitWriteDate"><i class="fa fa-calendar margin-r-5"></i> 채용 작성일시</label>
                                                <input type="datetime-local" class="form-control" id="recruitWriteDate"
                                                       value="<fmt:formatDate value="${recruit.recruitWriteDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>" readonly>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="recruitUpdateDate"><i class="fa fa-calendar margin-r-5"></i> 채용 수정일시</label>
                                                <input type="datetime-local" class="form-control" id="recruitUpdateDate"
                                                       value="<fmt:formatDate value="${recruit.recruitUpdateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </section>

                    <%--채용 직무별 정보 수정--%>
                    <section class="col-lg-10">
                        <div class="box box-primary">
                            <div class="box-header">
                                <div class="box-title">
                                    채용 직무 정보 수정
                                </div>
                                <div class="box-tools">
                                    <button class="btn btn-primary btn-xs recruitJobUpdateBtn"><i class="fa fa-edit"></i> 직무 수정</button>
                                    <button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#recruitJobAddModal"><i class="fa fa-plus"></i> 직무 추가</button>
                                </div>
                            </div>
                            <div class="box-body">
                                <form role="form" id="recruitJobsUpdateForm" method="post" action="${path}/recruit/${recruit.recruitId}/jobs/update">
                                <table class="table table-hover">
                                    <tr>
                                        <th>채용 형태</th>
                                        <th>채용 학력</th>
                                        <th>직무 대분류</th>
                                        <th>직무 소분류</th>
                                        <th>상세 직무</th>
                                        <th>자소서 항목 수정</th>
                                        <th>직무 삭제</th>
                                    </tr>
                                    <c:forEach varStatus="i" var="recruitJobs" items="${recruit.recruitJobs}">
                                        <tr class="recruitJob">
                                            <td>
                                                <select class="form-control" id="recruitJobType${i.index}" name="recruitJobs[${i.index}].recruitJobType">
                                                    <option value="">:::선택:::</option>
                                                    <option value="인턴">인턴</option>
                                                    <option value="계약직">계약직</option>
                                                    <option value="신입">신입</option>
                                                    <option value="경력">경력</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select class="form-control" id="recruitJobEdu${i.index}" name="recruitJobs[${i.index}].recruitJobEdu">
                                                    <option value="">:::선택:::</option>
                                                    <option value="학력무관">학력무관</option>
                                                    <option value="전문대졸">전문대졸</option>
                                                    <option value="대졸">대졸</option>
                                                    <option value="석사">석사</option>
                                                    <option value="박사">박사</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select class="form-control" id="jobCategory1Id${i.index}">
                                                    <option value="">:::직무대분류:::</option>
                                                    <c:forEach var="j" items="${jobCategory1s}">
                                                        <option value="${j.jobCategory1Id}">${j.jobCategory1Name}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td>
                                                <select class="form-control" id="jobCategory2${i.index}" name="recruitJobs[${i.index}].jobCategory2Id">
                                                </select>
                                            </td>
                                            <td>
                                                <input type="hidden" name="recruitJobs[${i.index}].recruitJobId" value="${recruitJobs.recruitJobId}">
                                                <input type="text" class="form-control" id="recruitJobDetail${i.index}" name="recruitJobs[${i.index}].recruitJobDetail" placeholder="예) 자바개발자" value="${recruitJobs.recruitJobDetail}">
                                            </td>
                                            <td>
                                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#articleUpdateModal${i.index}"> 자소서항목 수정</a>
                                            </td>
                                            <td>
                                                <a href="${path}/recruit/${recruitJobs.recruitId}/job/${recruitJobs.recruitJobId}/delete" class="btn btn-primary btn-xs"><i class="fa fa-remove"></i> 삭제</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>


            <%--자기소개서 항목 수정 Modal--%>
            <c:forEach varStatus="i" var="recruitJobs" items="${recruit.recruitJobs}">
            <div class="modal fade" id="articleUpdateModal${i.index}" tabindex="-1" role="dialog" aria-labelledby="articleUpdateModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="articleUpdateModalLabel">자소서 항목</h4>
                        </div>

                        <div class="modal-body">
                            <form role="form" id="articlesUpdateForm${i.index}" method="post" action="${path}/recruit/${recruit.recruitId}/job/${recruitJobs.recruitJobId}/articles/update">
                            <table class="table table-hover articleUpdateTable">
                                <tr>
                                    <th>상세 직무</th>
                                    <th>자소서 항목
                                        <button type="button" class="btn btn-default btn-xs articleAddBtn${i.index}">
                                            <i class="fa fa-plus"></i> 항목 추가
                                        </button>
                                        <button type="button" class="btn btn-default btn-xs articleDelBtn${i.index}">
                                            <i class="fa fa-minus"></i> 항목 삭제
                                        </button>
                                    </th>
                                </tr>
                                <tr>
                                    <td>${recruitJobs.recruitJobDetail}</td>
                                    <td class="articlesUpdate${i.index}">
                                        <c:forEach var="coverLetterArticles" varStatus="j" items="${recruitJobs.coverLetterArticles}">
                                            <div class="form-group article${i.index}">
                                                <input type="hidden" class="form-control"
                                                       id="coverLetterArticleId"
                                                       name="coverLetterArticleId"
                                                       value="${coverLetterArticles.coverLetterArticleId}">
                                                <input type="text" class="form-control"
                                                       id="coverLetterArticleTitle"
                                                       name="coverLetterArticleTitle"
                                                       placeholder="예) 자신의 지원동기 및 입사후 포부를 기술해주세요"
                                                       value="${coverLetterArticles.coverLetterArticleTitle}">
                                            </div>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </table>
                            </form>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-primary articlesUpdateBtn${i.index}">수정 저장</button>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>


            <%--채용이미지파일 modal--%>
            <div class="modal fade" id="recruitImageModal" tabindex="-1" role="dialog" aria-labelledby="recruitImageModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="recruitImageModalLabel"> 채용이미지 파일</h4>
                        </div>
                        <div class="modal-body">
                            <img class="img-responsive" src="${path}/dist/img/recruits/${recruit.recruitImageName}">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <%--채용직무 추가 modal--%>
            <div class="modal fade" id="recruitJobAddModal" tabindex="-1" role="dialog" aria-labelledby="recruitJobAddModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="recruitJobAddModalLabel"> 직무 추가</h4>
                        </div>
                        <div class="modal-body">
                            <div class="recruitJob">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <form id="recruitJobCreateForm" action="${path}/recruit/${recruit.recruitId}/job/create" method="post">
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
                                            <div class="form-group">
                                                <label for="jobCategory1Id${i.index}">직무 대분류</label>
                                                <select class="form-control" id="jobCategory1Id${i.index}">
                                                    <option value="">:::직무대분류:::</option>
                                                    <c:forEach var="i" items="${jobCategory1s}">
                                                        <option value="${i.jobCategory1Id}">${i.jobCategory1Name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="recruitJobCategory2${i.index}">직무 소분류</label>
                                                <select class="form-control" id="recruitJobCategory2${i.index}"
                                                        name="jobCategory2Id">
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="recruitJobDetail">상세 직무</label>
                                                <input type="text" class="form-control" id="recruitJobDetail"
                                                       name="recruitJobDetail" placeholder="예) 자바개발자">
                                            </div>
                                            <div class="form-group articles">
                                                <label for="coverLetterArticleTitle">직무별 자기소개서 항목</label>
                                                <button type="button" class="btn btn-default btn-xs articleAddBtn">
                                                    <i class="fa fa-plus"></i> 항목 추가
                                                </button>
                                                <button type="button" class="btn btn-default btn-xs articleDelBtn">
                                                    <i class="fa fa-minus"></i> 항목 삭제
                                                </button>
                                                <div class="form-group article">
                                                    <input type="text" class="form-control"
                                                           id="coverLetterArticleTitle"
                                                           name="coverLetterArticleTitle"
                                                           placeholder="예) 자신의 지원동기 및 입사후 포부를 기술해주세요">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="form-group" id="warningText" style="color: red"></div>
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기
                            </button>
                            <button type="button" class="btn btn-primary" id="recruitJobCreateBtn">저장
                            </button>
                        </div>
                    </div>
                </div>
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

        // 채용 수정
        $(".recruitUpdateBtn").on("click", function () {
            if (confirm("채용을 수정하시겠습니까?")) {
                $("#recruitUpdateForm").submit();
            }
        });

        // 채용 삭제
        $(".recruitDeleteBtn").on("click", function () {
            if (confirm("채용을 삭제하시겠습니까?")) {
                location.href = "/recruit/${recruit.recruitId}/delete";
            }
        });

        // 채용직무 수정
        $(".recruitJobUpdateBtn").on("click", function () {
            $("#recruitJobsUpdateForm").submit();
        });

        // 채용직무 추가
        $("#recruitJobCreateBtn").on("click", function () {
            rename();
            $("#recruitJobCreateForm").submit();
        });

        // 채용직무 추가를 위한 채용직무별 자기소개서 항목 name 속성 변경
        function rename() {
            $(".article").each(function (index) {
                $(this).find("input[name=coverLetterArticleTitle]").attr("name", "coverLetterArticles["+index+"].coverLetterArticleTitle");
            });
        }

        // 채용 직무 추가시 자소서 항목 추가 및 삭제
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




        // 채용 직무 수정을 위해 채용 직무 값을 화면에 세팅
        <c:forEach varStatus="i" items="${recruit.recruitJobs}">

            // 직무 대분류 ID
            var jobCategory1Id = "${recruit.recruitJobs.get(i.index).jobCategory2.jobCategory1Id}";

            // 채용 직무 소분류 ID
            var jobCategory2Id = "${recruit.recruitJobs.get(i.index).jobCategory2Id}";

            // 직무 대분류 select box setting
            $("#jobCategory1Id${i.index}").val(jobCategory1Id).attr("selected", "selected");

            var jobCategory2 = $("#jobCategory2${i.index}");

            // 채용 소분류 SELECT BOX에 출력 처리
            if ($("#jobCategory1Id${i.index}").val() !== null) { // 업종 대분류 select box 에 값이 존재하면
                getCategory2List(jobCategory1Id, jobCategory2); // ajax 요청
                $("#jobCategory2${i.index}").val(jobCategory2Id).attr("selected", "selected"); // 업종 소분류 select box 에 출력
            }

            // 직무 대분류 값이 변경되면 직무 소분류 값도 같이 변경하도록 처리
            $("#jobCategory1Id${i.index}").change(function () {
                $("#jobCategory2${i.index} option").remove();// 기존의 소분류 값 remove
                var jobCategory1IdChg = $("#jobCategory1Id${i.index}").val();  // 직무 대분류 변경값 저장
                var jobCategory2Chg = $("#jobCategory2${i.index}");  // 직무소분류 위치(값을 변경할 곳)
                getCategory2List(jobCategory1IdChg, jobCategory2Chg);   // ajax요청
            });

            //직무 대분류 ID 값으로 업종 소분류 List ajax 요청
            function getCategory2List(jobCategory1Id, jobCategory2) {
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
            }

            // 채용 직무 학력
            $("#recruitJobEdu${i.index}").val("${recruit.recruitJobs.get(i.index).recruitJobEdu}").attr("selected", "selected");

            // 채용 직무 형태
            $("#recruitJobType${i.index}").val("${recruit.recruitJobs.get(i.index).recruitJobType}").attr("selected", "selected");

            // 자기소개서
            // 자소서 항목 추가
            $(".articleAddBtn${i.index}").on("click", function () {
                $(".article${i.index}")
                    .last()
                    .clone()
                    .find("input[type=hidden]").remove().end()
                    .find("input[type=text]").val("").end()
                    .appendTo(".articlesUpdate${i.index}");

            });

            // 자소서 항목 삭제
            $(".articleDelBtn${i.index}").on("click", function () {
                if ($(".article${i.index}").length === 1) {
                    alert("자소서 항목 입력칸 모두를 삭제할 수 없습니다.")
                } else {
                    var articleId = $(".article${i.index}").last().find("input[type=hidden]").val();
                    var recruitId = "${recruit.recruitId}";
                    var recruitJobId = "${recruit.recruitJobs.get(i.index).recruitJobId}";
                    if (confirm("삭제하시겠습니까?")) {
                        if (articleId == null) {
                            $(".article${i.index}").last().remove();
                        } else {
                            $.ajax({
                                type: "delete",
                                url: "${path}/recruit/"+recruitId+"/"+recruitJobId+"/"+articleId+"/delete",
                                success: function () {
                                    $(".article${i.index}").last().remove();
                                }
                            });
                        }
                    }
                }
            });

            // 자소서 항목 수정
            $(".articlesUpdateBtn${i.index}").on("click", function () {
                $(".article${i.index}").each(function (index) {
                    $(this).find("input[name=coverLetterArticleId]").attr("name", "coverLetterArticles["+index+"].coverLetterArticleId");
                    $(this).find("input[name=coverLetterArticleTitle]").attr("name", "coverLetterArticles["+index+"].coverLetterArticleTitle");
                });
                $("#articlesUpdateForm${i.index}").submit();
            });

        </c:forEach>




    });
</script>
</body>
</html>
