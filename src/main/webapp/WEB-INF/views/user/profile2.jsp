<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %>
</head>
<body class="fixed skin-blue-light sidebar-mini">
<div class="wrapper">

    <!--헤더 네비바 include-->
    <%@ include file="../include/navbar.jsp" %>

    <!--왼쪽 사이드바 include-->
    <%@ include file="../include/left_column.jsp" %>

    <!--본문 페이지 내용-->
    <div class="content-wrapper">

        <!-- 본문 페이지 헤더 -->
        <section class="content-header">
            <h1>
                상세 회원 정보
                <small>가입정보 및 활동내역</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 회원정보</a></li>
                <li class="active"> 가입정보</li>
            </ol>
        </section>


        <!-- 본문 페이지 내용 -->
        <section class="content">

            <!-- Main row -->
            <div class="row">

                <!--내프로필 간단 요약-->
                <div class="col-md-3">

                    <!-- 프로필 이미지 -->
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle" src="../../dist/img/user4-128x128.jpg" alt="User profile picture">

                            <h3 class="profile-username text-center">${user.userNickName}</h3>

                            <p class="text-muted text-center">최근 로그인 일자: <fmt:formatDate value="${user.userLoginDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></p>

                            <ul class="list-group list-group-">
                                <li class="list-group-item">
                                    <strong><i class="fa fa-book margin-r-5"></i> 이메일(아이디)</strong>
                                    <p class="pull-right">${user.userEmail}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-map-marker margin-r-5"></i> 이름(닉네임)</strong>
                                    <p class="pull-right">${user.userNickName}</p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-pencil margin-r-5"></i> 가입일자</strong>
                                    <p class="pull-right"><fmt:formatDate value="${user.userJoinDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></p>
                                </li>
                                <li class="list-group-item">
                                    <strong><i class="fa fa-file-text-o margin-r-5"></i> 정보 수정일자</strong>
                                    <p class="pull-right"><fmt:formatDate value="${user.userUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></p>
                                </li>
                            </ul>
                        </div>
                        <div class="box-footer">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myInfoUpdateModal">
                                가입정보 수정
                            </button>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myPwUpdateModal">
                                비밀번호 변경
                            </button>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#withdrawModal">
                                탈퇴
                            </button>
                        </div>
                    </div>
                    <!-- /.box -->

                </div>

                <!--내프로필 상세보기 -->
                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <!--상단 탭-->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#myInfo" data-toggle="tab">계정정보</a></li>
                            <li><a href="#resume" data-toggle="tab">이력서</a></li>
                            <li><a href="#activity" data-toggle="tab">활동정보</a></li>
                            <li><a href="#bookmark" data-toggle="tab">관심채용</a></li>
                        </ul>
                        <!--하단 내용-->
                        <div class="tab-content">
                            <div class="active tab-pane" id="myInfo">
                                <div class="box-body">
                                    <strong><i class="fa fa-book margin-r-5"></i> 이메일(아이디)</strong>
                                    <p class="text-muted">${user.userEmail}</p>
                                    <hr>
                                    <strong><i class="fa fa-map-marker margin-r-5"></i> 이름(닉네임)</strong>
                                    <p class="text-muted">${user.userNickName}</p>
                                    <hr>
                                    <strong><i class="fa fa-pencil margin-r-5"></i> 가입일자</strong>
                                    <p class="text-muted"><fmt:formatDate value="${user.userJoinDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></p>
                                    <hr>
                                    <strong><i class="fa fa-file-text-o margin-r-5"></i> 정보 수정일자</strong>
                                    <p class="text-muted"><fmt:formatDate value="${user.userUpdateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/></p>
                                </div>
                                <div class="box-footer">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myInfoUpdateModal">
                                        가입정보 수정
                                    </button>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myPwUpdateModal">
                                        비밀번호 변경
                                    </button>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#withdrawModal">
                                        탈퇴
                                    </button>
                                </div>

                                <div class="modal fade" id="myInfoUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myInfoModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myInfoModalLabel">나의 가입정보 수정</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form role="form" id="updateInfo" method="post" action="/user/update">
                                                    <!-- text input -->
                                                    <div class="hidden">
                                                        <label>회원번호</label>
                                                        <input type="text" class="form-control" name="id" value="${user.userId}" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label>이메일(아이디)</label>
                                                        <input type="text" class="form-control" name="email" id="email" value="${user.userEmail}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>이름</label>
                                                        <input type="text" class="form-control" name="name" id="name" value="${user.userNickName}" placeholder="이름을 입력해주세요">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>비밀번호</label>
                                                        <input type="password" class="form-control" name="password" id="password" value="${user.userPassword}" placeholder="비밀번호를 입력해주세요">
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <%--<c:if test="${msg == 'failure'}">--%>
                                                <div class="form-group" style="color: red">
                                                    비밀번호가 일치하지 않습니다.
                                                </div>
                                                <%--</c:if>--%>
                                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                                <button type="button" class="btn btn-primary" id="updateInfoBtn">저장하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.myInfo Modal -->
                                <div class="modal fade" id="myPwUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myInfoModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myInfoModalLabel">나의 가입정보 수정</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form role="form" id="updateInfo" method="post" action="/user/update">
                                                    <!-- text input -->
                                                    <div class="form-group">
                                                        <label>현재 비밀번호</label>
                                                        <input type="password" class="form-control" name="password" id="email" placeholder="현재 비밀번호">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>새 비밀번호</label>
                                                        <input type="password" class="form-control" name="password" id="name" placeholder="새 비밀번호">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>새 비밀번호 확인</label>
                                                        <input type="password" class="form-control" id="password" placeholder="새 비밀번호 확인">
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <%--<c:if test="${msg == 'failure'}">--%>
                                                <div class="form-group" style="color: red">
                                                    비밀번호가 일치하지 않습니다.
                                                </div>
                                                <%--</c:if>--%>
                                                <%--<c:if test="${msg == 'failure'}">--%>
                                                <div class="form-group" style="color: red">
                                                    비밀번호가 수정되었습니다.
                                                </div>
                                                <%--</c:if>--%>
                                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                                <button type="button" class="btn btn-primary" id="updateInfoBtn">변경</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.myInfo Modal -->
                                <div class="modal fade" id="withdrawModal" tabindex="-1" role="dialog" aria-labelledby="myInfoModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myInfoModalLabel">나의 가입정보 수정</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form role="form" id="updateInfo" method="post" action="/user/update">
                                                    <!-- text input -->
                                                    <div class="hidden">
                                                        <label>회원번호</label>
                                                        <input type="text" class="form-control" name="id" value="${user.userId}" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label>이메일(아이디)</label>
                                                        <input type="text" class="form-control" name="email" id="email" value="${user.userEmail}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>이름</label>
                                                        <input type="text" class="form-control" name="name" id="name" value="${user.userNickName}" placeholder="이름을 입력해주세요">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>비밀번호</label>
                                                        <input type="password" class="form-control" name="password" id="password" value="${user.userPassword}" placeholder="비밀번호를 입력해주세요">
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <%--<c:if test="${msg == 'failure'}">--%>
                                                <div class="form-group" style="color: red">
                                                    비밀번호가 일치하지 않습니다.
                                                </div>
                                                <%--</c:if>--%>
                                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                                <button type="button" class="btn btn-primary" id="updateInfoBtn">저장하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.myInfo Modal -->
                            </div>
                            <div class="tab-pane" id="resume">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label for="inputName" class="col-sm-2 control-label">Name</label>

                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="inputName" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName" class="col-sm-2 control-label">Name</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputName" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputExperience" class="col-sm-2 control-label">Experience</label>

                                        <div class="col-sm-10">
                                            <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-danger">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="activity">

                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="bookmark">

                            </div>
                            <!-- /.tab-pane -->
                        </div>
                    </div>
                </div>

            </div>


        </section>

    </div>

    <!-- 풋터 -->
    <%@ include file="../include/footer.jsp" %>

    <!-- 컨트롤 사이드바 -->
    <%@ include file="../include/control_sidebar.jsp" %>

</div>
<%@ include file="../include/js.jsp" %>
</body>
</html>
