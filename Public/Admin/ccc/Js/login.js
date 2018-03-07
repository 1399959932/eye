$(function(){
	var wW = $(window).width();
	var wH = $(window).height();

	var imgW = $('#log').width();
	var imgH = $('#log').height();

	var l = (wW - imgW) / 2;
	var t = (wH - imgH)	/ 2;
	$('#logbox').css({'left':l+'px','top':t+'px'});
	$('#log').fadeIn(1000,function(){
		setTimeout(function(){
			$('#log').animate({'top':imgH/2+'px','height':'0px'},300,function(){
				$('#log').attr('src',images+'login.jpg').animate({'top':'0px','height':imgH+'px'},300,function(){
					$('#code').show();
					$('#username').show();
					$('#password').show();
					$('#verify').show();
					$('#sub').show();
					$('#reset').show();
				});
			});
		},300);
	});

	/*// 点击换验证码图片
	$('#code').click(function(){
		var url = $(this).attr('src');
		$(this).attr('src',url+'?'+Math.random());
	});*/

	//简单验证
	var validate = {
		'username' : false,
		'password' : false,
		'verify' : false
	};
	$('#username').blur(function(){
		if($.trim($(this).val()) == ''){
			$('#username_info').text('用户名不能为空');
			validate.username = false;
		}else{
			$('#username_info').text('');
			validate.username = true;
		}
	});
	$('#password').blur(function(){
		if($.trim($(this).val()) == ''){
			$('#password_info').text('密码不能为空');
			validate.password = false;
		}else{
			$('#password_info').text('');
			validate.password = true;
		}
	});
	//验证码每敲键盘都检查，不能用blur事件，因为用blur的话，当点击提交按钮时可以得到异步来的结果，而用回车提交
	//的话，异步数据延迟，在提交之后获取到异步结果，导致即使是输入正确，validate.verify还是false，以致提交不了
/*	$('#verify').keyup(function(){
		var code = $(this).val();
		if($.trim(code) == ''){
			$('#verify_info').text('验证码不能为空');
			validate.verify = false;
		}else if(code.length != 4){
			// 如果验证码输入是四位，当失焦时发异步看输入是否正确
			$.ajax({
				url : act,
				type : "post",
				data : "code="+code,
				dataType : "json",
				success : function(data){
					if(data.stat){
						validate.verify = true;
						$('#verify_info').text('');	
					}else{
						$('#verify_info').text('验证码输入错误');
						validate.verify = false;
					}
				}
			});
		}else{
			$('#verify_info').text('验证码位数错误');
			validate.verify = false;
		}
	});
	// 当点击登录按钮时验证输入是否为空
	$('form').submit(function(){
		$('#username').trigger('blur');
		$('#password').trigger('blur');
		$('#verify').trigger('keyup');
		var isOK = validate.username && validate.password && validate.verify;
		if(!isOK){
			//输入不合要求，晃动
			var timer = null;
			var step = 10;
			if(!timer){
				timer = setInterval(function(){
					$('#logbox').css({'left':(l-step)+'px'});
					step *= -1;
				},50);
			}
			setTimeout(function(){
				if(timer){
					clearInterval(timer);
					timer =null;
				}
			},500);
			return false;
		}

		// 输入合乎要求就向右运动并提交
		// $('#logbox').animate({'left':'2000px','opacity':0},1000,function(){
			return true;
		// });
		
	});*/



});