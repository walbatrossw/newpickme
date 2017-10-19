<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--헤드 include--%>
    <%@ include file="../include/head.jsp" %>
</head>
<body class="fixed sidebar-mini skin-green">
<div class="wrapper">

    <%--헤더 네비바 include--%>
    <%@ include file="../include/navbar.jsp" %>

    <%--왼쪽 사이드바 include--%>
    <%@ include file="../include/left_column.jsp" %>

    <%--본문 페이지--%>
    <div class="content-wrapper">
        <%-- 본문 페이지 헤더 --%>
        <section class="content-header">
            <h1>
                ${sessionScope.userNickName}의 프로필
            </h1>
            <%--URL : user/profile--%>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 회원</a></li>
                <li><a href="#">프로필</a></li>
            </ol>
        </section>

        <%-- 본문 페이지 내용 --%>
        <section class="content">
            <div class="row">
                <%-- 프로필 : 가입정보 --%>
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <c:choose>
                                <c:when test="${user.userProfileImageName == ''}">
                                    <img class="profile-user-img img-responsive img-circle" src="${path}/dist/img/default-user-image.jpg">
                                </c:when>
                                <c:otherwise>
                                    <img class="profile-user-img img-responsive img-circle" src="${path}/dist/img/users/${user.userProfileImageName}">
                                </c:otherwise>
                            </c:choose>
                            <h3 class="profile-username text-center">${user.userNickName}</h3>
                            <p class="text-muted text-center">최근 로그인 일시 : <fmt:formatDate value="${user.userLoginDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></p>
                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <strong><i class="fa fa-envelope-o margin-r-5"></i> 이메일 주소(로그인 아이디)</strong>
                                    <p class="text-muted">
                                        ${user.userEmail}
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-user margin-r-5"></i> 닉네임</strong>
                                    <p class="text-muted">
                                        ${user.userNickName}
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-sign-in margin-r-5"></i> 가일일시</strong>
                                    <p class="text-muted">
                                        <fmt:formatDate value="${user.userJoinDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-pencil margin-r-5"></i> 프로필 수정일시</strong>
                                    <p class="text-muted">
                                        <fmt:formatDate value="${user.userUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                                    </p>
                                </li>
                            </ul>

                            <div class="btn-group btn-group-justified">
                                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#nickNameUpdateModal">닉네임 변경</a>
                                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#profileImageUpdateModal">프로필 사진 변경</a>
                                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#pwUpdateModal">비밀번호 변경</a>
                                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#withdrawModal">탈퇴</a>
                            </div>

                            <%--닉네임 수정 modal--%>
                            <div class="modal fade" id="nickNameUpdateModal" tabindex="-1" role="dialog"
                                 aria-labelledby="nickNameUpdateModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="nickNameUpdateModalLabel">닉네임 변경</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" id="nickNameUpdate" method="post" action="/user/profile/${user.userId}/update/nickname">
                                                <div class="form-group">
                                                    <label for="userEmail">이메일(아이디)</label>
                                                    <input type="text" class="form-control" name="userEmail" id="userEmail"
                                                           value="${user.userEmail}" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label>이름</label>
                                                    <input type="text" class="form-control" name="userNickName" id="userNickName"
                                                           value="${user.userNickName}" placeholder="이름을 입력해주세요">
                                                </div>
                                                <div class="form-group">
                                                    <label>비밀번호</label>
                                                    <input type="password" class="form-control" name="userPassword"
                                                           id="userPassword"
                                                           placeholder="비밀번호를 입력해주세요">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">

                                            <div class="form-group" id="warningText" style="color: red">
                                            </div>

                                            <button type="button" class="btn btn-default pull-left"
                                                    data-dismiss="modal">닫기
                                            </button>
                                            <button type="button" class="btn btn-primary" id="nickNameUpdateBtn"> 닉네임 수정
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--닉네임 수정 modal--%>
                            <div class="modal fade" id="profileImageUpdateModal" tabindex="-1" role="dialog"
                                 aria-labelledby="profileImageUpdateModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="profileImageUpdateModalLabel">프로필 사진 변경</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" id="profileImageUpdateForm" method="post" action="/user/profile/${user.userId}/image/update" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <input type="hidden" class="form-control" name="userEmail" value="${user.userEmail}">
                                                </div>
                                                <div class="col-sm-12" align="center">
                                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                                        <div class="fileinput-new thumbnail" style="width: 120px; height: 160px;">
                                                            <img src="${path}/dist/img/default-user-image.jpg" alt="...">
                                                        </div>

                                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 120px; height: 160px;"></div>

                                                        <div>
                                                            <span class="btn btn-default btn-file">
                                                                <span class="fileinput-new">사진 선택</span>
                                                                <span class="fileinput-exists">변경</span>
                                                                <input type="file" id="userProfileImage" name="userProfileImage">
                                                            </span>
                                                            <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">삭제</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">

                                            <div class="form-group" id="warningText" style="color: red">
                                            </div>

                                            <button type="button" class="btn btn-default pull-left"
                                                    data-dismiss="modal">닫기
                                            </button>
                                            <button type="button" class="btn btn-primary" id="profileImageUpdateBtn"> 프로필사진 수정
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--비밀번호 수정 modal--%>
                            <div class="modal fade" id="pwUpdateModal" tabindex="-1" role="dialog"
                                 aria-labelledby="pwUpdateModaLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="pwUpdateModaLabel">비밀번호 수정</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" id="newPasswordForm" method="post" action="/user/profile/${user.userId}/update/password">
                                                <div class="form-group">
                                                    <input type="hidden" class="form-control" name="userEmail" id="userEmailForNewPw"
                                                           value="${user.userEmail}">
                                                </div>
                                                <div class="form-group">
                                                    <label>현재 비밀번호</label>
                                                    <input type="password" class="form-control"
                                                           id="oldPassword"
                                                           placeholder="현재 비밀번호를 입력해주세요">
                                                </div>
                                                <div class="form-group">
                                                    <label>새 비밀번호</label>
                                                    <input type="password" class="form-control" name="userPassword"
                                                           id="newPassword"
                                                           placeholder="새 비밀번호를 입력해주세요">
                                                </div>
                                                <div class="form-group">
                                                    <label>새 비밀번호 확인</label>
                                                    <input type="password" class="form-control"
                                                           id="newPasswordCheck"
                                                           placeholder="새 비밀번호를 확인해주세요">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="form-group" id="warningText2" style="color: red">

                                            </div>
                                            <button type="button" class="btn btn-default pull-left"
                                                    data-dismiss="modal">닫기
                                            </button>
                                            <button type="button" class="btn btn-primary" id="newPwBtn">비밀번호 수정
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--회원 탈퇴 Modal--%>
                            <div class="modal fade" id="withdrawModal" tabindex="-1" role="dialog"
                                 aria-labelledby="withdrawModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="withdrawModalLabel">탈퇴</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" id="withdrawalForm" method="post" action="/user/profile/${user.userId}/withdrawal">
                                                <div class="form-group">
                                                    <input type="hidden" class="form-control" name="userEmail" id="userEmailForWithdraw"
                                                           value="${user.userEmail}">
                                                </div>
                                                <div class="form-group">
                                                    <label>비밀번호</label>
                                                    <input type="password" class="form-control" name="userPassword"
                                                           id="withdrawPassword"
                                                           placeholder="비밀번호를 입력해주세요">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="form-group" id="warningText3" style="color: red">
                                            </div>
                                            <button type="button" class="btn btn-default pull-left"
                                                    data-dismiss="modal">닫기
                                            </button>
                                            <button type="button" class="btn btn-primary" id="withdrawBtn">탈퇴</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <%-- 프로필 : 이력서, 채용북마크, 나의 자소서, 나의 게시글, 게시판북마크, 프로젝트 진행하면서 추가...--%>
                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#resume" data-toggle="tab">이력서</a></li>
                            <li><a href="#recruitBookmark" data-toggle="tab">채용북마크</a></li>
                            <li><a href="#coverLetter" data-toggle="tab">자소서</a></li>
                            <li><a href="#myFreeBoard" data-toggle="tab">게시글</a></li>
                            <li><a href="#freeBoardBookmark" data-toggle="tab">게시글 북마크</a></li>
                        </ul>
                        <div class="tab-content">

                            <div class="active tab-pane" id="resume">
                                <%--이력서 작성 추가--%>
                                <jsp:include page="user_resume.jsp"/>
                                1. 내가 작성한 이력서 <br/>
                                2. 이력서 PDF파일 생성 버튼 <br/>
                                3. 이력서 수정버튼... <br/>
                                4. 이력서 삭제버튼... <br/>
                            </div>

                            <div class="tab-pane" id="recruitBookmark">
                                관심채용 리스트
                            </div>

                            <div class="tab-pane" id="coverLetter">
                                내가 작성한 자기소개서 리스트
                            </div>

                            <div class="tab-pane" id="myFreeBoard">
                                내가 작성한 게시글 리스트
                            </div>

                            <div class="tab-pane" id="freeBoardBookmark">
                                게시글 북마크 리스트
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <%-- 풋터 --%>
    <%@ include file="../include/footer.jsp" %>

    <%-- 컨트롤 사이드바 --%>
    <%@ include file="../include/control_sidebar.jsp" %>

</div>
<%@ include file="../include/js.jsp" %>
<script>
    $(function () {

        // 프로필 사진 수정
        $("#profileImageUpdateBtn").on("click", function () {
            $("#profileImageUpdateForm").submit();
        });

        // 회원 닉네임 중복 확인
        $("#userNickName").blur(function () {
            var nickName = "${user.userNickName}"; // 현재 닉네임
            var updatedNickName = $("#userNickName").val(); // 입력한 닉네임
            // 현재 닉네임과 입력한 닉네임이 같지 않으면 중복검사
            if (nickName !== updatedNickName) {
                var data = $("#userNickName").serialize();
                $.ajax({
                    type: "post",
                    url: "${path}/user/duplicate/nickname",
                    dataType: "text",
                    data: data,
                    success: function (data) {
                        if (data == 1) {
                            $("#warningText").text("중복된 이름입니다.");
                            $("input[type=password]").attr("disabled", "");
                        } else {
                            $("#warningText").text("");
                            $("input[type=password]").removeAttr("disabled");
                        }
                    }
                });
            } else {
                $("#warningText").text("");
                $("input[type=password]").removeAttr("disabled");
            }
        });

        // 회원 닉네임 변경 유효성 검사
        $("#nickNameUpdateBtn").on("click", function () {
            var userEmail = $("#userEmail");
            var userNickName = $("#userNickName");
            var userPassword = $("#userPassword");
            var warningText = $("#warningText");
            var passwordCheck = pwCheck(userEmail.val(), userPassword.val());
            if (userNickName.val() === "") { // 닉네임 유효성 검사
                warningText.text("이름을 입력해주세요!");
                userNickName.focus();
            } else if (userPassword.val() === "") { // 비밀번호 유효성 검사
                warningText.text("비밀번호를 입력해주세요!");
                userPassword.focus()
            } else if (!passwordCheck) { // 비밀번호 일치 확인
                warningText.text("비밀번호가 불일치 합니다.");
                userPassword.focus();
            } else {
                warningText.text("비밀번호가 일치 합니다.");
                $("#nickNameUpdate").submit();
            }
        });

        // 회원 비밀번호 변경
        $("#newPwBtn").on("click", function () {
            var userEamil = $("#userEmailForNewPw");
            var oldPassword = $("#oldPassword");
            var oldPasswordCheck = pwCheck(userEamil.val(), oldPassword.val());
            var newPassword = $("#newPassword");
            var newPasswordCheck = $("#newPasswordCheck");
            var warningText = $("#warningText2");
            var pwRegx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

            if (!oldPasswordCheck) {
                warningText.text("비밀번호가 불일치 합니다.");
                oldPassword.focus();
            } else if (newPassword.val() === "" || !pwRegx.test(newPassword.val())) {
                warningText.text("특수문자/문자/숫자 포함 8~15자리의 비밀번호를 입력해주세요");
                newPassword.focus();
            } else if (newPasswordCheck.val() === "") {
                warningText.text("새로운 비밀번호를 확인해주세요!");
                newPasswordCheck.focus();
            } else if (newPassword.val() !== newPasswordCheck.val()) {
                warningText.text("새로운 비밀번호가 일치하지 않습니다!");
                newPasswordCheck.focus();
            } else {
                warningText.text("비밀번호를 수정 합니다.");
                $("#newPasswordForm").submit();
            }

        });

        // 회원 탈되
        $("#withdrawBtn").on("click", function () {
            var userEamil = $("#userEmailForWithdraw");
            var userPassword = $("#withdrawPassword");
            var passwordCheck = pwCheck(userEamil.val(), userPassword.val());
            var warningText = $("#warningText3");

            if (userPassword.val() === "") { // 비밀번호 유효성 검사
                warningText.text("비밀번호를 입력해주세요!");
                userPassword.focus()
            } else if (!passwordCheck) { // 비밀번호 일치 확인
                warningText.text("비밀번호가 불일치 합니다.");
                userPassword.focus();
            } else {
                warningText.text("비밀번호가 일치 합니다.");
                $("#withdrawalForm").submit();
            }
        });

        // 회원 비밀번호 일치 확인
        function pwCheck(email, password) {
            var result;
            var userEmail = email;
            var userPassword = password;
            $.ajax({
                type: "post",
                url: "${path}/user/password/check",
                header: {"Content-Type" : "application/json"},
                dataType: "text",
                async: false,
                data: {
                    userEmail : userEmail,
                    userPassword : userPassword
                },
                success: function (data) {
                    if (data === "false") {
                        result = false;
                    } else {
                        result = true;
                    }
                }
            });
            return result;
        }
    });
</script>
</body>
</html>
