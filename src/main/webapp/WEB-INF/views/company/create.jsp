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
                기업 등록
                <small>기업 등록 페이지</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 기업</a></li>
                <li class="active"> 등록</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <section class="col-lg-12">

                    <div class="box box-primary">

                        <div class="box-header with-border">
                            <h3 class="box-title">기업 등록</h3>
                        </div>

                        <form role="form" id="companyCreateForm" action="${path}/company/info/create" method="post">
                            <div class="box-body">
                                <div class="row">
                                    <%--사진파일 입력 추가예정--%>
                                    <%--<div class="col-sm-2" align="center">
                                        <div class="form-group">
                                            <label for="companyPhoto">기업 로고</label>
                                            <div class="input-group">
                                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                                    <div class="fileinput-new thumbnail" style="width: 150px; height: 150px;">
                                                        <img data-src="${path}/dist/img/default-company-image.png">
                                                    </div>
                                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 150px;"></div>
                                                    <div>
                                                        <span class="btn btn-default btn-file"><span class="fileinput-new">사진 선택</span>
                                                            <span class="fileinput-exists">변경</span>
                                                            <input type="file" class="form-control" id="companyPhoto" name="companyPhoto">
                                                        </span>
                                                        <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">삭제</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                    <div class="col-sm-10">
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="companyName">기업명</label>
                                                <input type="text" class="form-control" id="companyName" name="companyName" placeholder="예) 삼성전자">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="industryCategory1">업종 대분류</label>
                                                <select class="form-control" id="industryCategory1">
                                                    <option value="">::::선택::::</option>
                                                    <c:forEach var="i" items="${IndustryCategory1}">
                                                        <option value="${i.industryCategory1Id}">${i.industryCategory1Name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="industryCategory2">업종 소분류</label>
                                                <select class="form-control" id="industryCategory2" name="industryCategory2Id">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="companyType">기업형태</label>
                                                <select class="form-control" id="companyType" name="companyType">
                                                    <option value="">::::선택::::</option>
                                                    <option value="대기업">대기업</option>
                                                    <option value="중견기업">중견기업</option>
                                                    <option value="중소기업">중소기업</option>
                                                    <option value="외국계">외국계</option>
                                                    <option value="스타트업">스타트업</option>
                                                    <option value="공공기관">공공기관</option>
                                                    <option value="공기업">공기업</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="companyBirthDate">설립일자</label>
                                                <input type="date" class="form-control" id="companyBirthDate" name="companyBirthDate">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="companyCeo">대표이사</label>
                                                <input type="text" class="form-control" id="companyCeo" name="companyCeo" placeholder="예) 홍길동">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="companyHomepage">공식홈페이지</label>
                                                <input type="text" class="form-control" id="companyHomepage" name="companyHomePage" placeholder="예) http://www.abc.com">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="companyPhone">대표번호</label>
                                                <input type="text" class="form-control" id="companyPhone" name="companyPhone" placeholder="예) 02-1234-5678">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="companySales">매출액 (단위: 백만원)</label>
                                                <input type="text" class="form-control" id="companySales" name="companySales">
                                            </div>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-group">
                                                <label for="companyAddress">본사주소</label>
                                                <input type="text" class="form-control" id="companyAddress" name="companyAddress" placeholder="예) 서울시 강남구 XXX번지 ">
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <!-- /.box-body -->

                        </form>

                        <div class="box-footer">
                            <div class="pull-left" id="warningText" style="color: red"></div>
                            <button type="reset" class="btn btn-default pull-right">초기화</button>
                            <button type="button" class="btn btn-primary pull-right" id="companyRegBtn">등록</button>
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
        // 기업 업종 combo select box
        $("#industryCategory1").change(function () {
            var industryCategory1Id = $("#industryCategory1 option:selected").val();
            $("#industryCategory2 option").remove();
            $.ajax({
                type: "get",
                url: "${path}/company/info/industry/category2/" + industryCategory1Id,
                success: function (data) {
                    console.log(data);
                    for (var i in data) {
                        $("#industryCategory2").append(
                            "<option value='" + data[i].industryCategory2Id + "'>" + data[i].industryCategory2Name + "</option>")
                    }
                }
            });
        });

        // 유효성 검사
        $("#companyRegBtn").on("click", function () {
            // 기업등록 버튼 클릭시 유효성검사
            var companyName = $("#companyName");
            var industryCategory1 = $("#industryCategory1");
            var companyType = $("#companyType");
            var companyBirthDate = $("#companyBirthDate");
            var companyCeo = $("#companyCeo");
            var companyHomepage = $("#companyHomepage");
            var companyPhone = $("#companyPhone");
            var companyAddress = $("#companyAddress");
            var companySales = $("#companySales");
            var warningText = $("#warningText");

            if (companyName.val() === "") {
                warningText.text("기업명을 기재해주세요.");
                companyName.focus();
            } else if ( industryCategory1.val() === "" ) {
                warningText.text("업종을 선택해주세요.");
                industryCategory1.focus();
            } else if ( companyType.val() === "" ) {
                warningText.text("기업 규모를 선택해주세요.");
                companyType.focus();
            } else if ( companyBirthDate.val() === "" ) {
                invalidText.text("설립입을 기재해주세요.");
                companyBirthDate.focus();
            } else if ( companyCeo.val() === "" ) {
                warningText.text("대표이사를 기재해주세요.");
                companyCeo.focus();
            } else if ( companyHomepage.val() === "" ) {
                warningText.text("기업홈페이지를 기재해주세요.");
                companyHomepage.focus();
            } else if ( companyPhone.val() === "" ) {
                warningText.text("기업 대표번호를 기재해주세요.");
                companyPhone.focus();
            } else if ( companyAddress.val() === "" ) {
                warningText.text("기업 본사주소를 기재해주세요.");
                companyAddress.focus();
            } else if ( companySales.val() === "") {
                warningText.text("매출액을 기재해주세요.");
                companySales.focus();
            } else {
                $("#companyCreateForm").submit();
            }
        });
    })
</script>
</body>
</html>
