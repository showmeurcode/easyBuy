
//注册页面js验证

//真实姓名
$(function() {
	//真实姓名
	$("#tname").blur(function() {
		var yz = /^\d*$/;
		var tname = $(this).val();

		if (tname == null || tname == "") {
			$("#tnameDiv").html("真实姓名不能为空！");
		} else if (yz.test(tname)) {
			$("#tnameDiv").html("请输入中文或英文姓名！");
		} else {
			$("#tnameDiv").html("");
		}

	});
	// 用户名
	var isRepeat = false;
	$("#name").blur(
			checkrepeat = function() {

				var name = $("#name").val();

				if (name == null || name == "") {
					$("#nameDiv").html("用户名不能为空！");
					return;
				} else {
					$("#nameDiv").html("");

					$.post("../UserServlet", "opr=checkrepeat&name=" + name,
							callBackname);

					function callBackname(data) {

						if (data == "true") {
							$("#nameDiv").html("用户名已被使用！");

							isRepeat = true;
						} else {
							$("#nameDiv").html("用户名可以使用！");
							isRepeat = false;
						}
					}// end of callBack()
				}
			});

	$("#submit").click(function() {
		if (isRepeat == true) {
			return false;
		}
	});

	// 密码
	$(".password").blur(function() {
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		var reg = /^[0-9a-zA-Z]+$/;
		if (password1 == "" || password2 == "") {
			$("#passwordDiv").html("密码不能为空！");

		} else if (!reg.test(password1)) {
			$("#passwordDiv").html("密码密码必须是数字和字母组成的10--16位数");
		} else if (password1.length < 10) {
			$("#passwordDiv").html("密码必须是10--16位数！");

		} else if (password1 != password2) {

			$("#passwordDiv").html("两次密码输入不一样，请重新输入！");

		} else {
			$("#passwordDiv").html("密码设置成功，请牢记密码！");
		}

	});
	// 身份证
	var vcity = {
		11 : "北京",
		12 : "天津",
		13 : "河北",
		14 : "山西",
		15 : "内蒙古",
		21 : "辽宁",
		22 : "吉林",
		23 : "黑龙江",
		31 : "上海",
		32 : "江苏",
		33 : "浙江",
		34 : "安徽",
		35 : "福建",
		36 : "江西",
		37 : "山东",
		41 : "河南",
		42 : "湖北",
		43 : "湖南",
		44 : "广东",
		45 : "广西",
		46 : "海南",
		50 : "重庆",
		51 : "四川",
		52 : "贵州",
		53 : "云南",
		54 : "西藏",
		61 : "陕西",
		62 : "甘肃",
		63 : "青海",
		64 : "宁夏",
		65 : "新疆",
		71 : "台湾",
		81 : "香港",
		82 : "澳门",
		91 : "国外"
	};

	checktheform = function() {
		var card = document.getElementById('card_no').value;
		// var card = $("#card_no").val();
		if (card === '') {
			$("#IDDiv").html("请输入身份证号，身份证号不能为空！");
			document.getElementById("card_no").focus;
			return false;
		}
		// 校验长度，类型
		if (isCardNo(card) === false) {
			$("#IDDiv").html("您输入的身份证号码不正确，请重新输入");
			document.getElementById("card_no").focus;
			return false;
		}
		// 检查省份
		if (checkProvince(card) === false) {
			$("#IDDiv").html("您输入的身份证号码不正确,请重新输入");
			document.getElementById("card_no").focus;
			return false;
		}
		// 校验生日
		if (checkBirthday(card) === false) {
			$("#IDDiv").html("您输入的身份证号码生日不正确,请重新输入");
			document.getElementById("card_no").focus();
			return false;
		}
		// 检验位的检测
		if (checkParity(card) === false) {
			$("#IDDiv").html("您的身份证校验位不正确,请重新输入");
			document.getElementById("card_no").focus();
			return false;
		} else {
			$("#IDDiv").html("OK");
			return true;
		}
	};

	// 检查号码是否符合规范，包括长度，类型
	isCardNo = function(card) {
		// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
		var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
		if (reg.test(card) === false) {
			return false;
		}
		return true;
	};
	// 取身份证前两位,校验省份
	checkProvince = function(card) {
		var province = card.substr(0, 2);
		if (vcity[province] == undefined) {
			return false;
		}
		return true;
	};
	// 检查生日是否正确
	checkBirthday = function(card) {
		var len = card.length;
		// 身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
		if (len == '15') {
			var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
			var arr_data = card.match(re_fifteen);
			var year = arr_data[2];
			var month = arr_data[3];
			var day = arr_data[4];
			var birthday = new Date('19' + year + '/' + month + '/' + day);
			return verifyBirthday('19' + year, month, day, birthday);
		}
		// 身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
		if (len == '18') {
			var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
			var arr_data = card.match(re_eighteen);
			var year = arr_data[2];
			var month = arr_data[3];
			var day = arr_data[4];
			var birthday = new Date(year + '/' + month + '/' + day);
			return verifyBirthday(year, month, day, birthday);
		}
		return false;
	};
	// 校验日期
	verifyBirthday = function(year, month, day, birthday) {
		var now = new Date();
		var now_year = now.getFullYear();
		// 年月日是否合理
		if (birthday.getFullYear() == year
				&& (birthday.getMonth() + 1) == month
				&& birthday.getDate() == day) {
			// 判断年份的范围（3岁到100岁之间)
			var time = now_year - year;
			if (time >= 3 && time <= 100) {
				return true;
			}
			return false;
		}
		return false;
	};
	// 校验位的检测
	checkParity = function(card) {
		// 15位转18位
		card = changeFivteenToEighteen(card);
		var len = card.length;
		if (len == '18') {
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
					8, 4, 2);
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
					'3', '2');
			var cardTemp = 0, i, valnum;
			for (i = 0; i < 17; i++) {
				cardTemp += card.substr(i, 1) * arrInt[i];
			}
			valnum = arrCh[cardTemp % 11];
			if (valnum == card.substr(17, 1)) {
				return true;
			}
			return false;
		}
		return false;
	};
	// 15位转18位身份证号
	changeFivteenToEighteen = function(card) {
		if (card.length == '15') {
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
					8, 4, 2);
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
					'3', '2');
			var cardTemp = 0, i;
			card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6);
			for (i = 0; i < 17; i++) {
				cardTemp += card.substr(i, 1) * arrInt[i];
			}
			card += arrCh[cardTemp % 11];
			return card;
		}
		return card;
	};

	// 邮箱
	$("#email").blur(function() {

		var email = this.value;

		if (email == null || email == "") {
			$("#emailDiv").html("邮箱不能为空！");
		} else if (!/^\w+@\w+.\w+$/.test(email)) {
			$("#emailDiv").html("Email格式不正确\n必须包含 @和 .");
		} else {
			$("#emailDiv").html("");
		}

	});
	// 手机
	$("#phone").blur(function() {
		var phone = this.value;
		var reg = /^1\d{10}$/;
		if (phone == null || phone == "") {
			$("#phoneDiv").html("手机号码不能为空!");
		} else if (!reg.test(phone)) {
			$("#phoneDiv").html("手机号码格式不正确!");

		} else {
			$("#phoneDiv").html("");
		}

	});

});
