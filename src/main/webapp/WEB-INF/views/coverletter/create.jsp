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
                자기소개서 작성
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 자기소개서</a></li>
                <li class="active"> 작성</li>
            </ol>
        </section>

        <div class="pad margin no-print col-lg-8">
            <div class="callout callout-success" style="margin-bottom: 0!important;">
                <p>PickMe는 자기소개서의 이름과 제출일자 편집을 제공합니다</p>
                <p>사용자가 원하는 이름과 마감일자로 변경해보세요</p>
                <p>빠르고 정확한 제출이 서류합격의 지름길입니다.</p>
                <p>맞춤법검사, 메모장, 공채핵심자료를 제공하고 있습니다.(좌측 하단)</p>
            </div>
        </div>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <section class="col-lg-8">
                    <div class="box box-primary" align="center">
                        <div class="box-header">
                            <h3 class="box-title">자기소개서 작성 도우미</h3>
                        </div>
                        <div class="box-body">
                            <a class="btn btn-app myCoverLetterBtn">
                                <i class="fa fa-list"></i> 나의 자소서
                            </a>
                            <a class="btn btn-app recruitJobListBtn">
                                <i class="fa fa-list"></i> 채용직무 리스트
                            </a>
                            <a class="btn btn-app coverLetterSaveBtn">
                                <i class="fa fa-save"></i> 저장
                            </a>
                            <a class="btn btn-app articleAddBtn">
                                <i class="fa fa-plus-square"></i> 문항 추가
                            </a>
                            <a class="btn btn-app memoAddBtn">
                                <i class="fa fa-edit"></i> 메모장 추가
                            </a>
                            <a class="btn btn-app memoDelBtn">
                                <i class="fa fa-trash"></i> 메모장 삭제
                            </a>
                            <a class="btn btn-app" data-toggle="modal" data-target="#spellCheckModal">
                                <i class="fa fa-language"></i> 맞춤법 검사
                            </a>
                            <a class="btn btn-app">
                                <i class="fa fa-print"></i> 인쇄
                            </a>
                            <a class="btn btn-app">
                                <i class="fa fa-file-pdf-o"></i> PDF
                            </a>
                            <a class="btn btn-app">
                                <i class="fa fa-file"></i> 공채핵심 자료
                            </a>
                        </div>
                    </div>
                    <c:choose>
                    <c:when test="${recruit == null}">
                    <form class="userCoverLetterCreateForm" method="post" action="${path}/coverletter/create">
                        </c:when>
                        <c:otherwise>
                        <form class="userCoverLetterCreateForm" method="post"
                              action="${path}/coverletter/create/${recruitJob.recruitJobId}">
                            </c:otherwise>
                            </c:choose>
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title"> 자기소개서 작성 </h3>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <c:choose>
                                                <c:when test="${recruit == null}">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="userCoverLetterName">자기소개서 이름</label>
                                                            <input type="text" class="form-control"
                                                                   id="userCoverLetterName" name="userCoverLetterName"
                                                                   value="기본 자기소개서">
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="userCoverLetterName">자기소개서 이름</label>
                                                            <input type="text" class="form-control"
                                                                   id="userCoverLetterName" name="userCoverLetterName"
                                                                   value="${recruit.company.companyName} / ${recruit.recruitName} / ${recruitJob.recruitJobDetail}">
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="userCoverLetterEndDate">자기소개서 제출 마감일시</label>
                                                    <input type="datetime-local" class="form-control"
                                                           id="userCoverLetterEndDate" name="userCoverLetterEndDate"
                                                           value="<fmt:formatDate value="${recruit.recruitEndDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box box-primary">
                                <div class="box-body no-padding articles">
                                    <c:choose>
                                        <c:when test="${recruitJob != null}">
                                            <div class="hiddenArticle" hidden>
                                                <table class="table table-bordered table-hover article">
                                                    <tr>
                                                        <th class="col-sm-1">문항</th>
                                                        <td>
                                                            <textarea class="form-control" rows="2"
                                                                      id="userCoverLetterArticleTitle"
                                                                      name="userCoverLetterArticleTitle"
                                                                      style="resize:none"
                                                                      placeholder="자기소개서 문항을 입력해주세요"></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th class="col-sm-1">내용</th>
                                                        <td>
                                                            <textarea class="form-control"
                                                                      id="userCoverLetterArticleContent" rows="10"
                                                                      name="userCoverLetterArticleContent"
                                                                      style="resize:none"
                                                                      placeholder="내용을 입력해주세요"></textarea>
                                                            <a type="button" class="btn btn-default btn-xs articleDelBtn pull-right"><i class="fa fa-trash"></i> 삭제</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th class="col-sm-1">글자수</th>
                                                        <td>
                                                            <span id="counter">###</span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <c:forEach varStatus="i" var="coverLetterArticle"
                                                       items="${recruitJob.coverLetterArticles}">
                                                <table class="table table-bordered table-hover article">
                                                    <tr>
                                                        <th class="col-sm-1">문항</th>
                                                        <td>
                                                            <textarea class="form-control" rows="2"
                                                                      name="userCoverLetterArticleTitle"
                                                                      style="resize:none"
                                                                      placeholder="자기소개서 문항을 입력해주세요">${coverLetterArticle.coverLetterArticleTitle}</textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th class="col-sm-1">내용</th>
                                                        <td>
                                                            <textarea class="form-control content"
                                                                      id="userCoverLetterArticleContent${i.index}"
                                                                      name="userCoverLetterArticleContent" rows="10"
                                                                      style="resize:none"
                                                                      placeholder="내용을 입력해주세요"></textarea>
                                                            <br/>
                                                            <a type="button"
                                                               class="btn btn-default btn-xs articleDelBtn pull-right"><i
                                                                    class="fa fa-trash"></i> 삭제</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th class="col-sm-1">글자수</th>
                                                        <td>
                                                            <span id="counter${i.index}">###</span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <table class="table table-hover article">
                                                <tr>
                                                    <th class="col-sm-1">문항</th>
                                                    <td>
                                                        <textarea class="form-control" rows="2"
                                                                  name="userCoverLetterArticleTitle" style="resize:none"
                                                                  placeholder="자기소개서 문항을 입력해주세요"></textarea>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="col-sm-1">내용</th>
                                                    <td>
                                                        <textarea class="form-control"
                                                                  id="userCoverLetterArticleContent" rows="10"
                                                                  name="userCoverLetterArticleContent"
                                                                  style="resize:none"
                                                                  placeholder="내용을 입력해주세요"></textarea>
                                                        <br/>
                                                        <a type="button"
                                                           class="btn btn-default btn-xs articleDelBtn pull-right"><i
                                                                class="fa fa-trash"></i> 삭제</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="col-sm-1">글자수</th>
                                                    <td>
                                                        <span id="counter">###</span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </form>
                </section>
                <section class="col-lg-3 memos">

                </section>
                <%--맞춤법 검사 modal--%>
                <div class="modal fade" id="spellCheckModal" tabindex="-1" role="dialog"
                     aria-labelledby="spellCheckModalLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="spellCheckModalLabel">맞춤법 검사</h4>
                            </div>
                            <div class="modal-body">
                                <iframe src="http://164.125.7.61/speller/" width=855 height=720></iframe>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">닫기
                                </button>
                            </div>
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

        <c:forEach var="coverLetterArticle" varStatus="i" items="${recruitJob.coverLetterArticles}">
        $("#userCoverLetterArticleContent${i.index}").keyup(function (e) {
            var content = $(this).val();
            $("#counter${i.index}").html(content.length + "자 : (공백포함)");
        });
        $('#userCoverLetterArticleContent${i.index}').keyup();
        </c:forEach>

        $("#userCoverLetterArticleContent").keyup(function (e) {
            var content = $(this).val();
            $(this)
                .parent()
                .parent()
                .parent()
                .find("#counter").html(content.length + "자 : (공백포함)");
        });
        $("#userCoverLetterArticleContent").keyup();

        // 메모 버튼 클릭시
        $(".memoAddBtn").on("click", function () {
            $(".memos").append(
                "<div class=\"box box-primary memo\">\n" +
                "<div class=\"box-header\">\n" +
                "<h2 class=\"box-title\">메모장</h2>\n" +
                "</div>\n" +
                "<div class=\"box-body\">\n" +
                "<div class=\"form-group\">\n" +
                "<textarea class=\"form-control\" rows=\"30\" placeholder=\"내용을 입력해주세요. 작성된 내용은 저장되지 않습니다\" style=\"resize: none\"></textarea>\n" +
                "</div>\n" +
                "</div>\n" +
                "</div>"
            );
        });

        // 메모 삭제 버튼 클릭시
        $(document).on("click", ".memoDelBtn", function () {
            $(".memo:last").remove();
        });

        // 자소서 문항 추가 버튼 클릭시
        $(".articleAddBtn").on("click", function () {
            if (${recruitJob == null}) {
                $(".article:last")
                    .clone(true)
                    .find("textarea").val("").end()
                    .find("#counter").empty().end()
                    .appendTo(".articles");
            } else {
                $(".hiddenArticle").find(".article")
                    .clone(true)
                    .find("textarea").val("").end()
                    .find("span").empty().end()
                    .appendTo(".articles");
            }
        });

        // 자소서 문항 삭제 버튼 클릭시
        $(".articleDelBtn").on("click", function () {
            if (${recruitJob == null}) {
                if ($(".article").length === 1) {
                    alert("자기소개서 문항 입력칸 모두를 삭제할 수 없습니다.")
                } else {
                    if (confirm("삭제하시겠습니까?")) {
                        $(this)
                            .parent()
                            .parent()
                            .parent()
                            .parent().remove();
                    }
                }
            } else {
                if ($(".article").length === 2) {
                    alert("자기소개서 문항 입력칸 모두를 삭제할 수 없습니다.")
                } else {
                    if (confirm("삭제하시겠습니까?")) {
                        $(this)
                            .parent()
                            .parent()
                            .parent()
                            .parent().remove();
                    }
                }
            }

        });

        // 자소서 저장 버튼 클릭시
        $(".coverLetterSaveBtn").on("click", function () {
            $(".article").each(function (index) {
                $(this).find("textarea[name=userCoverLetterArticleTitle]").attr("name", "userCoverLetterArticles[" + index + "].userCoverLetterArticleTitle");
                $(this).find("textarea[name=userCoverLetterArticleContent]").attr("name", "userCoverLetterArticles[" + index + "].userCoverLetterArticleContent");
            });
            $(".userCoverLetterCreateForm").submit();
        });


    });

</script>
</body>
</html>
