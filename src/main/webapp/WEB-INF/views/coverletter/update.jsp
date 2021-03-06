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
                자기소개서 작성
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 자기소개서</a></li>
                <li class="active"> 수정</li>
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
                            <c:if test="${userCoverLetter.recruitJobId == 0}">
                                <a class="btn btn-app articleAddBtn">
                                    <i class="fa fa-plus-square"></i> 문항 추가
                                </a>
                            </c:if>
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
                                <i class="fa fa-print coverLetterPrintBtn"></i> 인쇄
                            </a>
                            <a class="btn btn-app">
                                <i class="fa fa-file-pdf-o"></i> PDF
                            </a>
                            <a class="btn btn-app">
                                <i class="fa fa-file"></i> 공채핵심 자료
                            </a>
                        </div>
                    </div>
                    <form class="userCoverLetterCreateForm" method="post" action="${path}/coverletter/create">
                        <div class="coverLetterPrintSection">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title"> 자기소개서 작성 </h3>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="userCoverLetterName">자기소개서 이름</label>
                                                    <input type="hidden" class="form-control" id="userCoverLetterId"
                                                           name="userCoverLetterId"
                                                           value="${userCoverLetter.userCoverLetterId}">
                                                    <input type="text" class="form-control" id="userCoverLetterName"
                                                           name="userCoverLetterName"
                                                           value="${userCoverLetter.userCoverLetterName}">
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="userCoverLetterEndDate">자기소개서 제출 마감일시</label>
                                                    <input type="datetime-local" class="form-control"
                                                           id="userCoverLetterEndDate" name="userCoverLetterEndDate"
                                                           value="<fmt:formatDate value="${userCoverLetter.userCoverLetterEndDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>">
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="userCoverLetterEndDate">자기소개서 작성 시간</label>
                                                    <input type="datetime-local" class="form-control"
                                                           id="userCoverLetterWriteDate" name="userCoverLetterWriteDate"
                                                           value="<fmt:formatDate value="${userCoverLetter.userCoverLetterWriteDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>"
                                                           readonly>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="userCoverLetterEndDate">자기소개서 수정 시간</label>
                                                    <input type="datetime-local" class="form-control"
                                                           id="userCoverLetterUpdateDate" name="userCoverLetterUpdateDate"
                                                           value="<fmt:formatDate value="${userCoverLetter.userCoverLetterUpdateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>"
                                                           readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box box-primary">
                                <div class="box-body no-padding articles">
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
                                    <c:forEach varStatus="i" var="userCoverLetterArticle"
                                               items="${userCoverLetter.userCoverLetterArticles}">
                                        <table class="table table-bordered table-hover article">
                                            <tr>
                                                <th class="col-sm-1">문항</th>
                                                <td>
                                                    <input type="hidden" name="userCoverLetterArticleId" value="${userCoverLetterArticle.userCoverLetterArticleId}">
                                                    <textarea class="form-control" rows="1"
                                                              name="userCoverLetterArticleTitle" style="resize:none"
                                                              placeholder="자기소개서 문항을 입력해주세요">${userCoverLetterArticle.userCoverLetterArticleTitle}</textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="col-sm-1">내용</th>
                                                <td>
                                                    <textarea class="form-control content"
                                                              id="userCoverLetterArticleContent${i.index}"
                                                              name="userCoverLetterArticleContent" rows="10"
                                                              style="resize:none"
                                                              placeholder="내용을 입력해주세요">${userCoverLetterArticle.userCoverLetterArticleContent}</textarea>
                                                    <br/>
                                                    <a type="button" class="btn btn-default btn-xs articleDelBtn pull-right"><i class="fa fa-trash"></i> 삭제</a>
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
                                </div>
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

        // 추가된 자기소개서 내용 글자수 세기
        $("#userCoverLetterArticleContent").keyup(function (e) {
            var content = $(this).val();
            $(this)
                .parent()
                .parent()
                .parent()
                .find("#counter").html(content.length + "자 : (공백포함)");
        });
        $("#userCoverLetterArticleContent").keyup();

        // 불러온 자기소개서 내용 글자수 세기
        <c:forEach var="userCoverLetterArticle" varStatus="i" items="${userCoverLetter.userCoverLetterArticles}">
        $("#userCoverLetterArticleContent${i.index}").keyup(function (e) {
            var content = $(this).val();
            $("#counter${i.index}").html(content.length + "자 : (공백포함)");
        });
        $('#userCoverLetterArticleContent${i.index}').keyup();
        </c:forEach>

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
            $(".hiddenArticle").find(".article")
                .clone(true)
                .find("textarea").val("").end()
                .find("span").empty().end()
                .appendTo(".articles");
        });

        // 자소서 문항 삭제 버튼 클릭시 --
        $(".articleDelBtn").on("click", function () {
            if ($(".article").length === 2) {
                alert("자기소개서 문항 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                var userCoverLetterArticle = $(this).parent().parent().parent().find("input[type=hidden]"); // articleId;
                var userCoverLetterId = "${userCoverLetter.userCoverLetterId}";
                if (confirm("삭제하시겠습니까?")) {
                    if (userCoverLetterArticle.val() == null) {
                        $(this)
                            .parent()
                            .parent()
                            .parent()
                            .parent().remove();
                    } else {
                        $.ajax({
                            type: "delete",
                            url: "${path}/coverletter/"+userCoverLetterId+"/"+userCoverLetterArticle.val()+"/delete",
                            success: function () {
                                userCoverLetterArticle.parent().parent().parent().remove();
                            }
                        });
                    }
                }
            }
        });

        // 자소서 저장 버튼 클릭시
        $(".coverLetterSaveBtn").on("click", function () {
            $(".hiddenArticle").remove();
            $(".article").each(function (index) {
                $(this).find("input[name=userCoverLetterArticleId]").attr("name", "userCoverLetterArticles[" + index + "].userCoverLetterArticleId");
                $(this).find("textarea[name=userCoverLetterArticleTitle]").attr("name", "userCoverLetterArticles[" + index + "].userCoverLetterArticleTitle");
                $(this).find("textarea[name=userCoverLetterArticleContent]").attr("name", "userCoverLetterArticles[" + index + "].userCoverLetterArticleContent");
            });
            $(".userCoverLetterCreateForm").submit();
        });

        // 자기소개서 인쇄 버튼 클릭시
        $(".coverLetterPrintBtn").on("click", function () {
            $(".coverLetterPrintSection").printThis();
        });
    });

</script>
</body>
</html>
