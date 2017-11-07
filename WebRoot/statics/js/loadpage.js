
var form = document.querySelector('#loadForm');//返回的仍然是一个dom元素
form.addEventListener('invalid',function(event){ //提交的input元素的值为无效值时，触发oninvalid事件。
    var elem = event.target;
    var vali = elem.validity;
    var name = elem.name;

    switch (name){
        case 'userName':
            if(vali.valueMissing){
                elem.setCustomValidity('用户名不能为空');
            }else if(vali.patternMismatch){
                elem.setCustomValidity('请输入合法的邮箱、手机号码或者2-4位的汉字昵称');
            }else{
                elem.setCustomValidity('');
            }
            break;
        case 'password':
            if(vali.valueMissing){
                elem.setCustomValidity('密码不能为空');
            }else if(vali.patternMismatch){
                elem.setCustomValidity('密码为6-10位字符');
            }else{
                elem.setCustomValidity('');
            }
            break;
    }
},true);