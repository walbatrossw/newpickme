$(function () {
    // 대학/대학교/대학원 항목 추가
    $("#univAddBtn").on("click", function () {
        alert("add click");
        $(".univ").first().clone().appendTo(".univAdd");
        $(".univAdd").children().addClass("add");
    });
    // 대학/대학교/대학원 항목 삭제
    $("#univDelBtn").on("click", function() {
        alert("delete click");
        $(".univAdd").children().last().remove(".add");
    });
    
    // 동아리/학생회 항목 추가
    $("#clubAddBtn").on("click", function () {
        alert("add click");
        $(".club").first().clone().appendTo(".clubAdd");
        $(".clubAdd").children().addClass("add");
    });
    // 동아리/학생회 항목 삭제
    $("#clubDelBtn").on("click", function() {
        alert("delete click");
        $(".clubAdd").children().last().remove(".add");
    });

    // 자격/면허 항목 추가
    $("#certificateAddBtn").on("click", function () {
        alert("add click");
        $(".certificate").first().clone().appendTo(".certificateAdd");
        $(".certificateAdd").children().addClass("add");
    });
    // 자격/면허 항목 삭제
    $("#certificateDelBtn").on("click", function() {
        alert("delete click");
        $(".certificateAdd").children().last().remove(".add");
    });

    // 어학 항목 추가
    $("#languageAddBtn").on("click", function () {
        alert("add click");
        $(".language").first().clone().appendTo(".languageAdd");
        $(".languageAdd").children().addClass("add");
    });
    // 어학 항목 삭제
    $("#languageDelBtn").on("click", function() {
        alert("delete click");
        $(".languageAdd").children().last().remove(".add");
    });

    // 직무관련활동 항목 추가
    $("#activityAddBtn").on("click", function () {
        alert("add click");
        $(".activity").first().clone().appendTo(".activityAdd");
        $(".activityAdd").children().addClass("add");
    });
    // 직무관련활동 항목 삭제
    $("#activityDelBtn").on("click", function() {
        alert("delete click");
        $(".activityAdd").children().last().remove(".add");
    });

    // 경력 항목 추가
    $("#careerAddBtn").on("click", function () {
        alert("add click");
        $(".career").first().clone().appendTo(".careerAdd");
        $(".careerAdd").children().addClass("add");
    });
    // 경력 항목 삭제
    $("#careerDelBtn").on("click", function() {
        alert("delete click");
        $(".awardAdd").children().last().remove(".add");
    });

    // 수상경력 항목 추가
    $("#awardAddBtn").on("click", function () {
        alert("add click");
        $(".award").first().clone().appendTo(".awardAdd");
        $(".awardAdd").children().addClass("add");
    });
    // 수상경력 항목 삭제
    $("#awardDelBtn").on("click", function() {
        alert("delete click");
        $(".awardAdd").children().last().remove(".add");
    });
});

