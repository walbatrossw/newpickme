<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %>
</head>
<body class="hold-transition login-page">
<div class="login-box">

    <%--로그인 페이지 로고--%>
    <div class="login-logo">
        <a href="/"><b>P!ck</b>Me</a>
    </div>

    <%--로그인 박스--%>
    <div class="login-box-body">

        <p class="login-box-msg">P1ck ME와 함께 취업 성공해봐요!</p>
        <form action="${path}/user/login" method="post">

            <%--로그인, 로그아웃 메시지 출력--%>
            <div class="form-group" align="center">
                <%--회원가입 성공시--%>
                <c:if test="${msg == 'welcome'}">
                        <span style="color: red">
                            환영합니다!!! 회원가입이 완료되었습니다. 로그인해주세요.
                        </span>
                </c:if>
                <%--로그인 실패시--%>
                <c:if test="${msg == 'failure'}">
                        <span style="color: red">
                            아이디 또는 비밀번호가 일치하지 않습니다.
                        </span>
                </c:if>
                <%--권한이 필요한 페이지 접근시--%>
                <c:if test="${param.msg == 'nologin'}">
                        <span style="color: red">
                            로그인 유저만 사용이 가능합니다. 로그인해주세요
                        </span>
                </c:if>
                <%--로그아웃--%>
                <c:if test="${msg == 'logout'}">
                        <span style="color: red">
                            로그아웃되었습니다.
                        </span>
                </c:if>
                <%--로그아웃--%>
                <c:if test="${msg == 'newPwSuccess'}">
                        <span style="color: red">
                            비밀번호가 변경되었습니다. 로그인해주세요
                        </span>
                </c:if>
                <c:if test="${msg == 'withdrawUserSuccess'}">
                    <span style="color: red">
                        탈퇴 처리가 완료되었습니다.
                    </span>
                </c:if>
            </div>

            <%--이메일 입력--%>
            <div class="form-group has-feedback">
                <input type="email" class="form-control" name="userEmail" placeholder="이메일"
                       value="walbatrossw@gmail.com">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>

            <%--비밀번호 입력--%>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="userPassword" placeholder="비밀번호" value="qazwsx12!">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 비밀번호 기억하기
                        </label>
                    </div>
                </div>
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
                </div>
            </div>
        </form>

        <%--소셜 로그인 메뉴--%>
        <div class="social-auth-links text-center">
            <p>- 또는 -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> 페이스북으로
                Login</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i>구글계정으로
                Login</a>
        </div>

        <a href="#">비밀번호 찾기</a><br>
        <a href="${path}/user/register" class="text-center">회원가입 하기</a>

    </div>

</div>

<%@ include file="../include/js.jsp" %>
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
