
// 排序
var $listBox = $('.cate_list');
var isDesc = true;
$('#sortPrice').click(function(e){
    var fragment= document.createDocumentFragment(); //用此方法创建文档片段（区分与creatElement区别）
    var list = $('li', $listBox).toArray();//将.cate_list里的li元素 放在数组里  此处注意逗号并不是并集里的逗号
    var $target = $(e.target);    //e.target即#sortPrice  此行代码多余

    isDesc = !isDesc;
    list.sort(function(li1, li2) {  //将数组list里的元素按照 price1和price2排列  视boolean值决定diff的值 从而来决定从小到大还是从大到小
        var price1 = $('.price span', li1).html().slice(1); //slice方法取出价格
        var price2 = $('.price span', li2).text().slice(1);
        var diff = price1 - price2;

        return isDesc ? -diff : diff;  //
    });
    //
    $.map(list, function(li) {//map方法遍历，这里是jQuery.map（待处理数组,callback函数）方法而不是普通的map
        fragment.appendChild(li);
    });

    $listBox.empty();
    $listBox.append(fragment);

    return false;//当在函数中有出现'return false'时，表示事件处理阻止了默认的事件行为并停止了事件通过dom向上冒泡。
    // 如果xxx是一个a标签,那它的默认行为是跳转，当设置了return false;时，它就不会跳转。
});