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
                기업정보 상세 정보
                <small>기업정보</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 기업</a></li>
                <li class="active"> 기업 상세 정보</li>
            </ol>
        </section>

        <!--본문 페이지 내용-->
        <section class="content">
            <!-- 페이지 내용 -->
            <div class="row">
                <%--기업 상세 정보--%>
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle"
                                 src="../../dist/img/user4-128x128.jpg" alt="User profile picture">

                            <h3 class="profile-username text-center">${companyInfo.companyName}</h3>

                            <ul class="list-group list-group-unbordered">

                                <li class="list-group-item">
                                    <strong><i class="fa fa-building margin-r-5"></i> 기업분류</strong>
                                    <p class="pull-right">${companyInfo.companyType}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-industry margin-r-5"></i> 업종 대분류</strong>
                                    <p class="pull-right">${companyInfo.industryCategory2.industryCategory1.industryCategory1Name}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-industry margin-r-5"></i> 업종 소분류</strong>
                                    <p class="pull-right">${companyInfo.industryCategory2.industryCategory2Name}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-calendar margin-r-5"></i> 설립입</strong>
                                    <p class="pull-right">
                                        <fmt:formatDate value="${companyInfo.companyBirthDate}" pattern="yyyy-MM-dd"/>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-user margin-r-5"></i> 대표자</strong>
                                    <p class="pull-right">${companyInfo.companyCeo}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-map-marker margin-r-5"></i> 주소지</strong>
                                    <p class="text-muted">${companyInfo.companyAddress}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-phone margin-r-5"></i> 대표번호</strong>
                                    <p class="pull-right">${companyInfo.companyPhone}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa  fa-internet-explorer margin-r-5"></i> 공식/채용 홈페이지</strong><br/>
                                    <a class="text-muted" href="${companyInfo.companyHomePage}" target="_blank">${companyInfo.companyHomePage}</a>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-won margin-r-5"></i> 연간 매출액</strong>
                                    <p class="pull-right">${companyInfo.companySales}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-pencil margin-r-5"></i> 기업정보 등록일시</strong>
                                    <p class="pull-right">
                                        <fmt:formatDate value="${companyInfo.companyRegisterDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-pencil margin-r-5"></i> 기업정보 수정일시</strong>
                                    <p class="pull-right">
                                        <fmt:formatDate value="${companyInfo.companyUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-pencil-square-o margin-r-5"></i> 작성자</strong>
                                    <p class="pull-right">${companyInfo.admin.adminNickName}</p>
                                </li>
                            </ul>
                            <c:if test="${sessionScope.adminId != null}">
                            <div class="btn-group btn-group-justified">
                                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#companyInfoUpdateModal">수정</a>
                                <a class="btn btn-primary" id="companyDeleteBtn">삭제</a>
                            </div>
                            </c:if>


                            <%--기업정보 수정 Modal--%>
                            <div class="modal fade" id="companyInfoUpdateModal" tabindex="-1" role="dialog" aria-labelledby="companyInfoUpdateLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="companyInfoUpdateLabel">기업 정보 수정</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" id="companyInfoUpdateForm" method="post" action="${path}/company/info/${companyInfo.companyId}/update">
                                                <div class="form-group">
                                                    <label for="companyName">기업명</label>
                                                    <input type="text" class="form-control" id="companyName" name="companyName" value="${companyInfo.companyName}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="industryCategory1">업종 대분류</label>
                                                    <select class="form-control" id="industryCategory1">
                                                        <c:forEach var="i" items="${IndustryCategory1}">
                                                            <option value="${i.industryCategory1Id}">${i.industryCategory1Name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="industryCategory2">업종 소분류</label>
                                                    <select class="form-control" id="industryCategory2" name="industryCategory2Id">
                                                    </select>
                                                </div>
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
                                                <div class="form-group">
                                                    <label for="companyBirthDate">설립일자</label>
                                                    <input type="date" class="form-control" id="companyBirthDate" name="companyBirthDate" value="${companyInfo.companyBirthDate}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="companyCeo">대표자</label>
                                                    <input type="text" class="form-control" name="companyCeo" id="companyCeo" value="${companyInfo.companyCeo}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="companyHomePage">공식홈페이지</label>
                                                    <input type="text" class="form-control" id="companyHomePage" name="companyHomePage" value="${companyInfo.companyHomePage}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="companyPhone">대표번호</label>
                                                    <input type="text" class="form-control" id="companyPhone" name="companyPhone" value="${companyInfo.companyPhone}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="companySales">매출액</label>
                                                    <input type="text" class="form-control" id="companySales" value="${companyInfo.companySales}" name="companySales">
                                                </div>
                                                <div class="form-group">
                                                    <label for="companyAddress">본사주소</label>
                                                    <input type="text" class="form-control" id="companyAddress" name="companyAddress" value="${companyInfo.companyAddress}">
                                                </div>
                                            </form>
                                        </div>

                                        <div class="modal-footer">
                                            <div class="form-group" id="warningText" style="color: red"></div>
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                            <button type="button" class="btn btn-primary" id="companyInfoUpdateBtn">저장</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#recruit" data-toggle="tab">현재 진행중인 채용</a></li>
                            <li><a href="#review" data-toggle="tab">기업리뷰</a></li>
                            <li><a href="#salary" data-toggle="tab">연봉정보</a></li>
                            <li><a href="#interview" data-toggle="tab">면접후기</a></li>
                            <li><a href="#qna" data-toggle="tab">QNA</a></li>
                        </ul>
                        <div class="tab-content">

                            <div class="active tab-pane" id="recruit">
                                현재 진행중인 채용...
                            </div>

                            <div class="tab-pane" id="review">
                                기업리뷰...
                            </div>

                            <div class="tab-pane" id="salary">
                                연봉정보...
                            </div>

                            <div class="tab-pane" id="interview">
                                면접후기...
                            </div>

                            <div class="tab-pane" id="qna">
                                QNA...
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

        // 기업형태 SELECT BOX에 출력처리
        $("#companyType").val("${companyInfo.companyType}").attr("selected", "selected");

        // 업종 대분류 id (DB에 저장된 값 저장)
        var industryCt1Id = "${companyInfo.industryCategory2.industryCategory1.industryCategory1Id}";
        
        // 업종 소분류 id (DB에 저장된 값 저장)
        var industryCt2Id = "${companyInfo.industryCategory2Id}";

        // 업종 대분류 SELECT BOX에 출력 처리
        $("#industryCategory1").val(industryCt1Id).attr("selected", "selected");

        // 업종 소분류 SELECT BOX에 출력 처리
        if ($("#industryCategory1").val() !== null) { // 업종 대분류 SELECTBOX의 값이 존재하면
            getIndustryCt2List(industryCt1Id); // 업종 소분류 list 값 불러오기
            $("#industryCategory2").val(industryCt2Id).attr("selected", "selected"); // 업종 소분류 SELECT BOX에 출력
        }

        // 업종 대분류 값이 변경되면 업종 소분류 값도 같이 변경하도록 처리
        $("#industryCategory1").change(function () {
            $("#industryCategory2 option").remove();
            var industryCt1IdChangeValue = $("#industryCategory1").val();
            getIndustryCt2List(industryCt1IdChangeValue);
        });

        // 업종 대분류 id 값으로 업종 소분류 list를 ajax 요청으로 가져오기
        function getIndustryCt2List(param) {
            $.ajax({
                type: "get",
                url: "${path}/company/info/industry/category2/" + param,
                success: function (data) {
                    // 가져온 값을 append
                    for (var i in data) {
                        $("#industryCategory2").append(
                            "<option value='" + data[i].industryCategory2Id + "'>" + data[i].industryCategory2Name + "</option>")
                    }
                }
            });
        }

        // 기업등록 버튼 클릭시 유효성검사
        $("#companyInfoUpdateBtn").on("click", function () {

            var companyName = $("#companyName");
            var industryCategory1 = $("#industryCategory1");
            var companyType = $("#companyType");
            var companyBirthDate = $("#companyBirthDate");
            var companyCeo = $("#companyCeo");
            var companyHomePage = $("#companyHomePage");
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
                warningText.text("설립입을 기재해주세요.");
                companyBirthDate.focus();
            } else if ( companyCeo.val() === "" ) {
                warningText.text("대표자를 기재해주세요.");
                companyCeo.focus();
            } else if ( companyHomePage.val() === "" ) {
                warningText.text("기업홈페이지를 기재해주세요.");
                companyHomePage.focus();
            } else if ( companyPhone.val() === "" ) {
                warningText.text("기업 대표번호를 기재해주세요.");
                companyPhone.focus();
            } else if ( companyAddress.val() === "" ) {
                warningText.text("기업 본사주소를 기재해주세요.");
                companyAddress.focus();
            } else if ( companySales.val() === "" ) {
                warningText.text("매출액을 기재해주세요.");
                companySales.focus();
            } else {
                $("#companyInfoUpdateForm").submit();
            }
        });

        // 삭제 확인 팝업, 삭제 처리 진행
        $("#companyDeleteBtn").on("click", function () {
            if (confirm("기업정보를 삭제하시겠습니까?")) {
                location.href = "${path}/company/info/${companyInfo.companyId}/delete";
            }
        })
    })
</script>
</body>
</html>
