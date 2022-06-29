$('#passwd').focusin(function () {
    $(".login-box").addClass('up');
}).focusout(function () {
    $(".login-box").removeClass('up');
})

$(document).on('mousemove',function (e) {
    // let dw=$(document).width()/10;
    //除以10保证y和x始终保持在10以内
    //除以15保证y和x始终保持在15以内
    let dw=$(document).width()/10;//dw最大值为文档最大宽度
    let dn=$(document).height()/10;//dn最大值为文档最大高度
    let x=e.pageX/dw;//x最大值为10
    let y=e.pageY/dn;//y最大值为10
    $(".eye-ball").css(//这样子保证了眼球(20px)始终在白色区域(30px)内
        {
            left:x,
            top:y
        }
    )
})