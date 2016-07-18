function transtime(n) {
    var dd = new Date(n);
    return dd.getFullYear()+"年"+(dd.getMonth()+1)+"月"+dd.getDate()+" "+dd.getHours()+":"+dd.getMinutes();
}
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function(fmt)
{ //author: meizz
    var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "h+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S"  : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}
//document.domain = '192.168.1.5:3040/';
$('#upload').click(function () {
    var files = $("#files").val();
    if(!files){
        alert('请先选择上传的图片');
        return;
    }
    $.ajaxFileUpload({
        url : "/a/uploadImg",   //submit to UploadFileServlet
        secureuri : false,
        fileElementId : 'files',
        dataType : 'text', //or json xml whatever you like~
        success : function(data, status) {
            var ss = data.replace(/<[^>]+>/g, "");
            var result = JSON.parse(ss).resData;
            console.log(result);
            $("#imgfile").attr('src',result).css('display','block');
        }
    });
})

function cancel(){
    $('.layout').css('display','none');
}
function showmess(str){
    $('.mask').css('display','block');
    $('.mask .mask-info span').empty().html(str);
    setTimeout(function () {
        $('.mask').css('display','none');
    },3000);

}