
function searchAddress() {
    var post_code = $("#reservation_post_code").val().replace("-","");

    if (post_code.match(/^\d{7}/)){
        var post_code1 = post_code.substr(0,3)
        var post_code2 = post_code.substr(3,4)
        
        $.ajax({
            url: `https://madefor.github.io/postal-code-api/api/v1/${post_code1}/${post_code2}.json`,
            type: 'GET',
            dataType: 'json'
        })
        .done(function(data) {
            $("#reservation_prefecture").val(data.data[0].ja.prefecture);
            $("#reservation_city").val(data.data[0].ja.address1+data.data[0].ja.address2);
        })
        .fail(function(){
            alert("郵便番号が見つかりませんでした");
        })
    }else{
        alert("正しいの形式で入力してください（例: 123-1234）");
    }
};