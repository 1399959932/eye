$(function(){
	//横向导航菜单点击
	$('#nav p a').click(function(){
		var cur = $(this).index();
		$(this).css({'background':'#fff','color':'#1469B6'}).siblings().css({'background':'#00C6FF','color':'#fff'});
		$('#left h2').text($(this).text());
		$('#item dl').eq(cur).show().siblings().hide();
		$('#item dl').eq(cur).find('dd').slideDown(400);
		$('#item dl').eq(cur).siblings().find('dd').slideUp(300);
		$('#path span').text($(this).attr('path'));
	});

	//左侧区块和右侧区块 宽高计算
	var wW = $(window).width();
	var wH = $(window).height();
	$('#left').css('height',(wH-160)+'px');
	$('#right').css({'width':(wW-230)+'px','height':(wH-160)+'px'});
	$('#iframe').css({'width':(wW-230)+'px','height':(wH-195)+'px','margin-top':'5px'});

	//左侧菜单效果
	$('#left li').hover(function(){
		$(this).find('a').css({'color':'#fff'});
		$(this).css({'background':'#0388DB','position':'relative'}).animate({'left':'15px'},400);
	},function(){
		$(this).find('a').css({'color':'#09467C'});
		$(this).css({'background':'#CEE6FE','position':'relative'}).animate({'left':'0px'},500);
	});
	$('#left .item_cur dd').slideDown(400);
	$('#left dt').toggle(function(){
		$(this).next().slideUp(300);
	},function(){
		$(this).next().slideDown(300);
	});
		
	//点击操作 显示的当前路径切换
	$('#left a').click(function(){
		$('#path span').text($(this).attr('path'));
	});

	//欢迎框
	$('#hello').css({'left':(wW-260)/2+'px','top':(wH-160)/2+'px'}).fadeIn(2000,function(){
		$(this).fadeOut(3000);
	});

	//返回上一步 按钮
	$('#back').click(function(){
		window.history.back();
	});



});