//异步ajax对类型表的属性值的获得
$(function(){
	
	$('[name=cate_id]').change(function(){
//		获得表单改变以后的tid
		
		var tid=$('option:selected').attr('tid');
		//将获得的tid的值添加到隐藏域form_fid中区
		$('[name=form_fid]').attr('value',tid);
		//将获得的的tid传到php控制器去
			
		$.ajax({
			type:"post",
			url:ajaxdata,
//******************************************************************			
			//传递数据的时候最时，如果是单个的数据则形式如下：data:{键名：键值，键名：键值},也就是说data:{tid:tid,aid:aid}
			//在谷歌浏览器中在NETwork来查看
			//在火狐用firbug中的‘网络’查看(在js文件中不能用hd框架的U函数)
//***********************************************************************
			data:{tid:tid},
			dataType:'json',
			success:function(phpData){
//<tr><td>袖长</td><td><input type="text" name="gavalue" id="" /></td></tr>										
//taid
//taname
//tavalue
//tatype
//form_fid	
//	<select name="">
//		<option value=""></option>
//	</select>



				//定义两个空字符串。一个出入到商品属性，里一个初入到商品规格去
				var gattr='';
				var ggui='';	
				//清空
				$('#attr').html('');
				$('#spec').html('');
				$.each(phpData, function(i,v) {
					
					if(v.tatype==0){
						//商品属性的添加
						gattr+='<tr><td>'+v.taname+'</td><td><select class="form-control" name="attr['+v.taid+']"><option value="">请选择</option>';
						
						for(var k=0;k<v.tavalue.length;k++){
							gattr+='<option value="'+v.tavalue[k]+'">'+v.tavalue[k]+'</option>';
						}
						gattr+='</select></td></tr>';
//						分配到商品属性的表格中
						
//						document.write(gattr);
					}else{
						ggui+='<tr><td>'+v.taname+'</td><td><select class="form-control" name="spec['+v.taid+'][value][]"><option value="">请选择</option>';
						
						for(var k=0;k<v.tavalue.length;k++){
							ggui+='<option value="'+v.tavalue[k]+'">'+v.tavalue[k]+'</option>';
						}
						ggui+='</select></td><td>附加价格</td><td><input class="form-control" type="text" name="spec['+v.taid+'][price][]" id="" /></td><td><input class="btn btn-info add-spec"  type="button" value="添加规格" /></td></tr>';
					
					}
					
				});

				$('#attr').html(gattr);
				$('#spec').html(ggui);
			}	
			
		})
	})
	
	//添加商品规格
	
/**************************************************************************
		因为是ajax异步添加的表单。所以，是未来时间。页面还没有加载，所以，我们要绑定live('click',function()）
		来完成点击事件
***************************************************************************/
	$('.add-spec').live('click',function(){
		//获得父级的tr
		var parentTr=$(this).parents('tr');
		var addclone=parentTr.clone();
		//更换class转化成删除按钮
		addclone.find('.add-spec').removeClass('btn-info add-spec').addClass('btn-danger remove-spec').attr('value','删除规格');
		parentTr.after(addclone);
	})
	//删除规格
	$('.remove-spec').live('click',function(){
		$(this).parents('tr').remove();
	})
	

})
