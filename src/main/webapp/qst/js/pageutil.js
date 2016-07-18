$(function() {
    $.fn.showPage = function (options) {
        var dft = {
            currnetPage: options.currentPage,//显示第几页
            totalCount: options.allRow,//总共多少条
            pageSize: 10,//每页显示多少条
            showPage: 5,
            selectedColor: "background-color:#2FA4E7;color:#fff",//选中页数的样式
            onChangePage: function () {
            }
        };

        var ops = $.extend(dft, options);
        var mThis = this;
        function clickPage(ops) {
            var eftotal = Math.ceil(ops.showPage / 2) - 1;
            var totalRow = Math.ceil(ops.totalCount / ops.pageSize);
            /*<a class="item">
             <i class="left arrow icon"></i>上一页
             </a>
             <a class="item selecteditem" >1</a>
             <a class="item">2</a>
             <a class="item">3</a>
             <a class="item">
             下一页<i class="right arrow icon"></i>
             </a>*/
            var str = "";
            if (totalRow == 0) {
                return;
            }
            //判断第一页
            if (ops.currnetPage != 1) {
                str += '<a class="item" style="cursor:pointer" val="' + (ops.currnetPage - 1) + '"> <i class="left arrow icon"></i>上一页 </a>';
            } else {
                str += '<a class="item" style="cursor:pointer" val=""> <i class="left arrow icon"></i>上一页 </a>';
            }
            if (ops.showPage >= totalRow) {
                for (var i = 1; i < totalRow + 1; i++) {
                    if (i == ops.currnetPage) {
                        str += '<a style="cursor:pointer;'+ops.selectedColor+'" class="item " val="' + i + '">' + i + '</a>';
                    } else {
                        str += '<a style="cursor:pointer" class="item" val="' + i + '">' + i + '</a>';
                    }
                }
            } else {
                var leftnum = ops.currnetPage - eftotal;
                var rightnum = Number(ops.currnetPage) + eftotal;
                if (leftnum <= 0) {
                    for (var i = 1; i < ops.showPage + 1; i++) {
                        if (i == ops.currnetPage) {
                            str += '<a style="cursor:pointer;'+ops.selectedColor+'" class="item" val="' + i + '">' + i + '</a>';
                        } else {
                            str += '<a style="cursor:pointer" class="item" val="' + i + '">' + i + '</a>';
                        }
                    }
                } else if (rightnum >= totalRow) {
                    for (var i = leftnum; i < totalRow + 1; i++) {
                        if (i == ops.currnetPage) {
                            str += '<a style="cursor:pointer;'+ops.selectedColor+'" class="item "val="' + i + '">' + i + '</a>';
                        } else {
                            str += '<a style="cursor:pointer" class="item" val="' + i + '">' + i + '</a>';
                        }
                    }
                } else {
                    for (var i = leftnum; i < ops.showPage + leftnum; i++) {
                        if (i == ops.currnetPage) {
                            str += '<a style="cursor:pointer;'+ops.selectedColor+'" class="item selecteditem" val="' + i + '">' + i + '</a>';
                        } else {
                            str += '<a style="cursor:pointer" class="item" val="' + i + '">' + i + '</a>';
                        }
                    }
                }

            }
            //判断最后一页
            if (ops.currnetPage != totalRow) {
                str += ' <a style="cursor:pointer" class="item" val="' + (Number(ops.currnetPage) + 1) + '">下一页<i class="right arrow icon"></i></a>';
            } else {
                str += ' <a style="cursor:pointer" class="item" val="">下一页<i class="right arrow icon"></i></a>';
            }
            $(mThis).html(str); //把版权文字加入到想显示的div
            //修改间距
            $(mThis).find("a.item").css({paddingLeft: "5px", paddingRight: "5px"});
            mThis.test = function (e) {
                ops.currnetPage = e.data.page;
                clickPage(ops);
                ops.onChangePage(ops.currnetPage)
            }
            var items = $(mThis).find("a.item");
            for (var j = 0; j < items.length; j++) {
                $(items[j]).unbind("click");
                if ($(items[j]).attr("val") != null && $(items[j]).attr("val") != "") {
                    $(items[j]).bind("click", {page: $(items[j]).attr("val")}, mThis.test);
                }
            }
        }

        clickPage(ops);

    };


   
});
