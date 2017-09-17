<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--채용 수정 modal--%>
<div class="modal fade" id="recruitUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="recruitUpdateModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="recruitUpdateModalLabel">채용 기본정보 수정</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="recruitUpdateForm" method="post" action="">
                    <div class="form-group">
                        <label for="companyName">채용기업명</label>
                        <input type="text" class="form-control" id="companyName"
                               name="companyName"
                               value="${companyInfo.companyName}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="recruitName">채용공고명</label>
                        <input type="text" class="form-control" id="recruitName"
                               name="recruitName"
                               value="${recruit.recruitName}">
                    </div>
                    <div class="form-group">
                        <label for="recruitBeginDate">채용시작일시</label>
                        <input type="datetime-local" class="form-control"
                               id="recruitBeginDate"
                               value="<fmt:formatDate value="${recruit.recruitBeginDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>"
                               name="recruitBeginDate">
                    </div>
                    <div class="form-group">
                        <label for="recruitEndDate">채용마감일시</label>
                        <input type="datetime-local" class="form-control"
                               id="recruitEndDate"
                               value="<fmt:formatDate value="${recruit.recruitBeginDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>"
                               name="recruitBeginDate">
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <div class="form-group" id="warningText" style="color: red"></div>
                <button type="button" class="btn btn-default pull-left"
                        data-dismiss="modal">닫기
                </button>
                <button type="button" class="btn btn-primary" id="companyInfoUpdateBtn">
                    저장
                </button>
            </div>
        </div>
    </div>
</div>
