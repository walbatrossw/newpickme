$(function () {

    // 채용직무 추가
    $(".jobAddBtn").on("click", function () {
        // 채용직무 div 복사 : 클릭이벤트까지 true
        var job = $(".box-success:last").clone(true);
        job
            .find(".add-article").remove().end() // 추가된 자소서항목 div 전부 삭제
            .addClass("job-add") // 채용직무 div 에 job-add 클래스 추가, 원본 삭제 방지를 위해
            .appendTo(".recruitCompanyJob"); // 복사한 div 붙여넣기
    });

    // 채용직무 삭제
    $(".jobDelBtn").on("click", function() {
        // 채용직무 .job-add 클래스가 추가된 div 만 삭제되게 처리, 원본 삭제 방지
        $(".box-success:last").remove(".job-add");
    });

    // 자소서 항목 추가
    $(".articleAddBtn").on("click", function () {
        // 자소서 항목중 가장 마지막 요소를 변수에 저장
        var article = $(this).parent().find(".article").last();
        article
            .clone() // 요소를 복사
            .find("input:text").val("").end() // input 태그에 작성된 value 값 초기화
            .addClass("add-article") // 항목 div 에 article-add 클래스 추가, 원본 삭제 방지를 위해
            .appendTo($(this).parent()); // 자기자신의 부모 div 에 붙여넣기
    });
    // 자소서 항목 삭제
    $(".articleDelBtn").on("click", function() {
        // 항목 .article-add 클래스가 추가된 div 만 삭제, 원복 삭제 방지
        $(".article:last").remove(".add-article");
    });
});

