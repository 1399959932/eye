<?php
    if(C('LAYOUT_ON')) {
        echo '{__NOLAYOUT__}';
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>跳转提示</title>
	<link rel="shortcut icon" href="//s0.zjlao.com/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="__CSS__/base.css">
	<link rel="stylesheet" type="text/css" href="__CSS__/Back_com.css">

	<style type="text/css">
		*{ margin:0; padding:0; font-family: "微软雅黑"; font-size:16px; }
		body{ text-align: center; }
		#div { padding: 150px 0; background: #f7f6f5; width:1200px; margin: 0 auto; }
		.div-f{ display: inline-block; height:100px; vertical-align:middle; }
		#div-r a{ color:#2b86d3; text-decoration: none; }
		#div-r a:hover{ color:#e95513; }
		#wait{ color:#e95513; }
	</style>
    <!--[if lt IE 7]>
<script type="Text/Javascript" src="__JS__/pngfix.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('img,a,div,span, li'); 
</script>
<![endif]-->

</head>
<body>
	<include file="Public:index_header" />
	<div class="YX_blank10"></div>
	<div id="div">
		<span class="div-f" style="margin-right: 10px;"><?php if(isset($message)) {?><img src="//s0.zjlao.com/images/xl.png"><?php }else{?><img src="//s0.zjlao.com/images/SY_yxzx_smile.png"><?php }?></span>
		<span class="div-f" id="div-r"><div style="font-size:24px;line-height: 30px;"><?php if(isset($message)) {?><?php echo($message); ?><?php }else{?><?php echo($error); ?><?php }?></div><div>页面自动 <a id="href" href="<?php echo($jumpUrl); ?>">跳转</a> 等待时间：<span id="wait"><?php echo($waitSecond); ?></span></div></span>
	</div>
	<include file="Public:footer" />
</body>
<script type="text/javascript">
(function(){
var wait = document.getElementById('wait'),href = document.getElementById('href').href;
var interval = setInterval(function(){
	var time = --wait.innerHTML;
	if(time <= 0) {
		location.href = href;
		clearInterval(interval);
	};
}, 1000);
})();
</script>
</html>