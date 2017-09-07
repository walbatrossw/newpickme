<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %>
</head>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="/"><b>P!ck</b>ME</a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">P!ck ME 관리자 가입 페이지</p>

        <form id="adminCreateForm" action="${path}/admin/register" method="post">
            <div class="form-group has-feedback">
                <input type="email" class="form-control" id="adminEmail" name="adminEmail" placeholder="이메일 (아이디)">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" id="adminNickName" name="adminNickName" placeholder="이름 (닉네임)">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="adminPassword" name="adminPassword"
                       placeholder="비밀번호 (특수/문자/숫자 포함 8~15자리)">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="adminPasswordCheck" placeholder="비밀번호 확인">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="form-group">
                <span id="warningText" style="color: red"></span>
            </div>
            <div class="row">
                <div class="col-xs-5">
                    <button type="button" class="btn btn-primary btn-block btn-flat" id="registerBtn">가입</button>
                </div>

            </div>
        </form>

        <a href="${path}/admin/login" class="text-center">관리자 로그인 페이지</a>
    </div>
</div>
<%@ include file="../include/js.jsp" %>

<script>
    $(function () {
        // 이메일 주소 중복검사
        $("#adminEmail").blur(function () {
            var adminEmail = $("#adminEmail").serialize();
            $.ajax({
                type: "post",
                url: "${path}/admin/duplicate/email",
                dataType: "text",
                data: adminEmail,
                success: function (data) {
                    if (data == 1) {
                        $("#warningText").text("이미 가입된 이메일 주소입니다.");
                        $("input[type=text]").attr("disabled", "");
                        $("input[type=password]").attr("disabled", "");
                    } else {
                        $("#warningText").text("");
                        $("input[type=text]").removeAttr("disabled");
                        $("input[type=password]").removeAttr("disabled");
                    }
                }
            });
        });
        // 닉네임 중복검사
        $("#adminNickName").blur(function () {
            var adminNickName = $("#adminNickName").serialize();
            $.ajax({
                type: "post",
                url: "${path}/admin/duplicate/nickname",
                dataType: "text",
                data: adminNickName,
                success: function (data) {
                    if (data == 1) {
                        $("#warningText").text("중복된 닉네임입니다.");
                        $("input[type=email]").attr("disabled", "");
                        $("input[type=password]").attr("disabled", "");
                    } else {
                        $("#warningText").text("");
                        $("input[type=email]").removeAttr("disabled");
                        $("input[type=password]").removeAttr("disabled");
                    }
                }
            });
        });
        // 회원가입 버튼 클릭시 유효성검사
        $("#registerBtn").on("click", function () {
            var adminEmail = $("#adminEmail");
            var adminNickName = $("#adminNickName");
            var adminPassword = $("#adminPassword");
            var adminPasswordCheck = $("#adminPasswordCheck");
            var warningText = $("#warningText");
            var emailRegx = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            var pwRegx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

            if (adminEmail.val() === "" || !emailRegx.test(adminEmail.val())) {
                warningText.text("이메일주소를 확인해주세요!");
                adminEmail.focus();
            } else if (adminNickName.val() === "") {
                warningText.text("이름을 확인해주세요!");
                adminNickName.focus();
            } else if (adminPassword.val() === "" || !pwRegx.test(adminPassword.val())) {
                warningText.text("특수문자/문자/숫자 포함 8~15자리의 비밀번호!!!");
                adminPassword.focus();
            } else if (adminPasswordCheck === "") {
                warningText.text("비밀번호를 확인해주세요!");
                adminPasswordCheck.focus();
            } else if (adminPasswordCheck.val() !== adminPassword.val()) {
                warningText.text("비밀번호가 일치하지 않습니다!");
                adminPasswordCheck.focus();
            } else {
                $("#adminCreateForm").submit();
            }

        });
    })
</script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    })
</script>
</body>
</html>

