function formatInputValue() {
    
    var post_code = $("#reservation_post_code").val().replace("-","");
    post_code = `${post_code.substr(0,3)}-${post_code.substr(3,4)}`
    if (post_code.match(/^\d{3}-\d{4}/)){
        $("#reservation_post_code").val(post_code);
    }
    
    var tele_num = $("#reservation_tele_num").val().replace("-","");
    tele_num = `${tele_num.substr(0,3)}-${tele_num.substr(3,4)}-${tele_num.substr(8,4)}`
    if (tele_num.match(/^\d{3}-\d{4}-\d{4}/)){
        $("#reservation_tele_num").val(tele_num);
    }

    $("#new_reservation").submit()
}