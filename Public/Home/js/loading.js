(function(){
			//获取浏览器页面可见高度和宽度  
            var _PageHeight = document.documentElement.clientHeight,  
                _PageWidth = document.documentElement.clientWidth;  
            //在页面未加载完毕之前显示的loading Html自定义内容  
            var _LoadingHtml = '<div id="loadingDiv" style="position:fixed;overflow:hidden;width:100%;height:' + _PageHeight + 'px;background:#0f524d;filter:alpha(opacity=80);z-index:99999;"><img style="width:200px;height:200px;position: absolute;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);" src="Public/Home/images/loading.gif"></div>';
            //呈现loading效果  
            document.write(_LoadingHtml);  
            //监听加载状态改变  
            document.onreadystatechange = completeLoading;  
            //加载状态为complete时移除loading效果  
            function completeLoading() {  
                if (document.readyState == "complete") {  
                    var loadingMask = document.getElementById('loadingDiv');  
                    loadingMask.parentNode.removeChild(loadingMask);  
                }  
            }  

}())