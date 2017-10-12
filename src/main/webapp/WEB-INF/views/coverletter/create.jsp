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

        <div class="pad margin no-print col-lg-6">
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
                            <a class="btn btn-app">
                                <i class="fa fa-save"></i> 저장
                            </a>
                            <c:choose>
                                <c:when test="${recruit != null}">
                                    <a class="btn btn-app articleAddBtn" disabled>
                                        <i class="fa fa-plus-square"></i> 자소서문항 추가
                                    </a>
                                    <a class="btn btn-app articleDelBtn" disabled>
                                        <i class="fa fa-minus-square"></i> 자소서문항 삭제
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn btn-app articleAddBtn" id="memoDelBtn">
                                        <i class="fa fa-plus-square"></i> 자소서문항 추가
                                    </a>
                                    <a class="btn btn-app articleDelBtn" id="memoDelBtn">
                                        <i class="fa fa-minus-square"></i> 자소서문항 삭제
                                    </a>
                                </c:otherwise>
                            </c:choose>

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
                                <i class="fa fa-file-pdf-o"></i> PDF파일로 저장
                            </a>
                            <a class="btn btn-app">
                                <i class="fa fa-file"></i> 공채핵심 자료
                            </a>
                        </div>
                    </div>

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"> 자기소개서 작성 </h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="coverLetterArticleName">자기소개서 이름</label>
                                            <input type="text" class="form-control" id="coverLetterArticleName" name="coverLetterArticleName" value="${recruit.company.companyName}  ${recruit.recruitJobs.get(0).recruitJobDetail}">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="recruitEndDate">자기소개서 제출 마감일시</label>
                                            <input type="datetime-local" class="form-control" id="recruitEndDate" name="recruitEndDate" value="<fmt:formatDate value="${recruit.recruitEndDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>">

                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="recruitEndDate">저장 시간</label>
                                            <input type="datetime-local" class="form-control" id="recruitEndDate" name="recruitEndDate" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box box-primary">
                        <div class="box-body articles">
                            <c:choose>
                                <c:when test="${recruit != null}">
                                    <c:forEach varStatus="i" var="coverLetterArticle" items="${recruit.recruitJobs.get(0).coverLetterArticles}">
                                        <table class="table table-hover article">
                                            <tr>
                                                <th class="col-sm-1">${i.index+1} 번 문항</th>
                                                <td>
                                                    <div>
                                                        <textarea class="form-control" rows="2" name="" style="resize:none" placeholder="자기소개서 문항을 입력해주세요">${coverLetterArticle.coverLetterArticleTitle}</textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="col-sm-1">${i.index+1} 번 내용</th>
                                                <td>
                                                    <textarea class="form-control content" id="coverLetterArticleContent${i.index}" rows="10" name="" style="resize:none" placeholder="내용을 입력해주세요"></textarea>
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
                                                <div>
                                                    <textarea class="form-control" rows="2" name="" style="resize:none" placeholder="자기소개서 문항을 입력해주세요"></textarea>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="col-sm-1">내용</th>
                                            <td>
                                                <textarea class="form-control" id="coverLetterArticleContent" rows="10" name="coverLetterArticleContent" style="resize:none" placeholder="내용을 입력해주세요"></textarea>
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

        <c:forEach var="coverLetterArticle" varStatus="i" items="${recruit.recruitJobs.get(0).coverLetterArticles}">
            $("#coverLetterArticleContent${i.index}").keyup(function (e){
                var content = $(this).val();
                $("#counter${i.index}").html(content.length + "자 : (공백포함)");
            });
            $('#coverLetterArticleContent${i.index}').keyup();
        </c:forEach>

        $("#coverLetterArticleContent").keyup(function (e){
            var content = $(this).val();
            $(this)
                .parent()
                .parent()
                .parent()
                .find("#counter").html(content.length + "자 : (공백포함)");
        });
        $("#coverLetterArticleContent").keyup();



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
            $(".article:last")
                .clone(true)
                .find("textarea").val("").end()
                .find("#counter").empty().end()
                .appendTo(".articles");

        });

        // 대학교 삭제 버튼 클릭시
        $(".articleDelBtn").on("click", function () {
            if ( $(".article").length === 1) {
                alert("자기소개서 문항 입력칸 모두를 삭제할 수 없습니다.")
            } else {
                $(".article:last").remove();
            }

        });


        $(".resumeSaveBtn").on("click", function () {

            $(".university").each(function (index) {
                $(this).find("input[name=universityName]").attr("name", "universities["+index+"].universityName");
                $(this).find("select[name=universityType]").attr("name", "universities["+index+"].universityType");
                $(this).find("input[name=universityBeginDate]").attr("name", "universities["+index+"].universityBeginDate");
                $(this).find("input[name=universityEndDate]").attr("name", "universities["+index+"].universityEndDate");
                $(this).find("input[name=universityMajor]").attr("name", "universities["+index+"].universityMajor");
                $(this).find("input[name=universityDoubleMajor]").attr("name", "universities["+index+"].universityDoubleMajor");
                $(this).find("input[name=universityCredit]").attr("name", "universities["+index+"].universityCredit");
            });

            $(".language").each(function (index) {
                $(this).find("input[name=languageName]").attr("name", "languages["+index+"].languageName");
                $(this).find("input[name=languageGrade]").attr("name", "languages["+index+"].languageGrade");
                $(this).find("input[name=languageHost]").attr("name", "languages["+index+"].languageHost");
                $(this).find("input[name=languageNumber]").attr("name", "languages["+index+"].languageNumber");
                $(this).find("input[name=languageBeginDate]").attr("name", "languages["+index+"].languageBeginDate");
                $(this).find("input[name=languageEndDate]").attr("name", "languages["+index+"].languageEndDate");
            });

            $(".certificate").each(function (index) {
                $(this).find("input[name=certificateName]").attr("name", "certificates["+index+"].certificateName");
                $(this).find("input[name=certificateGrade]").attr("name", "certificates["+index+"].certificateGrade");
                $(this).find("input[name=certificateHost]").attr("name", "certificates["+index+"].certificateHost");
                $(this).find("input[name=certificateNumber]").attr("name", "certificates["+index+"].certificateNumber");
                $(this).find("input[name=certificateBeginDate]").attr("name", "certificates["+index+"].certificateBeginDate");
                $(this).find("input[name=certificateEndDate]").attr("name", "certificates["+index+"].certificateEndDate");
            });

            $(".career").each(function (index) {
                $(this).find("input[name=careerCompany]").attr("name", "careers["+index+"].careerCompany");
                $(this).find("input[name=careerBeginDate]").attr("name", "careers["+index+"].careerBeginDate");
                $(this).find("input[name=careerEndDate]").attr("name", "careers["+index+"].careerEndDate");
                $(this).find("input[name=careerPosition]").attr("name", "careers["+index+"].careerPosition");
                $(this).find("input[name=careerDepartment]").attr("name", "careers["+index+"].careerDepartment");
                $(this).find("input[name=careerTask]").attr("name", "careers["+index+"].careerTask");
                $(this).find("input[name=careerResign]").attr("name", "careers["+index+"].careerResign");
            });

            $(".activity").each(function (index) {
                $(this).find("input[name=activityName]").attr("name", "activities["+index+"].activityName");
                $(this).find("input[name=activityHost]").attr("name", "activities["+index+"].activityHost");
                $(this).find("input[name=activityBeginDate]").attr("name", "activities["+index+"].activityBeginDate");
                $(this).find("input[name=activityEndDate]").attr("name", "activities["+index+"].activityEndDate");
                $(this).find("input[name=activityContent]").attr("name", "activities["+index+"].activityContent");
            });

            $(".etc").each(function (index) {
                $(this).find("input[name=etcName]").attr("name", "etcs["+index+"].etcName");
                $(this).find("input[name=etcBeginDate]").attr("name", "etcs["+index+"].etcBeginDate");
                $(this).find("input[name=etcEndDate]").attr("name", "etcs["+index+"].etcEndDate");
                $(this).find("input[name=etcContent]").attr("name", "etcs["+index+"].etcContent");
            });

            $("#resumeCreateForm").submit();
        });



    });

</script>
</body>
</html>
