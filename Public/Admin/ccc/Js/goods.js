
$(function(){

//选择分类时生成属性与规格
	$('select[name=cate_id]').val(0).change(function(){
		var type_id = $(':selected',this).attr('type_id');
		
		if (type_id == 0)
		{
			alert('顶级分类不能添加商品');
			return;
		}

		$('input[name=type_id]').val(type_id);
		
		$.post(getAttr, {'type_id' : type_id}, function (data) {
			alert(post);
			if (data != 0)
			{
				var attr, spec, tmp;
					attr = spec = '';
					alert(data)
				for (var i in data)
				{
					tmp = '';
					tmp += '<tr class="info">';
					tmp += '<td align="right">' + data[i].type_attr_name + '</td>';
					tmp += '<td>';
					
					if (data[i].type_attr_value == '')
					{
						tmp += '<input type="text" name="';

						if (data[i].class == 0)
						{
							tmp += 'attr[' + data[i].type_attr__id +']';
						}
						else
						{
							tmp += 'spec[' + data[i].type_attr__id + '][type_attr_value][]';
						}
						
						tmp += '"/>';
					}
					else
					{
						tmp += '<select name="';

						if (data[i].class == 0)
						{
							tmp += 'attr[' + data[i].type_attr__id +']';
						}
						else
						{
							tmp += 'spec[' + data[i].type_attr__id + '][type_attr_value][]';
						}

						tmp += '">';
						tmp += '<option value="0">-请选择-</option>';
						var opt = data[i].type_attr_value.split(',');
						var len = opt.length;
						for (var j = 0; j < len; ++j)
						{
							tmp += '<option value="' + opt[j] + '">' + opt[j] + '</option>';
						}' + opt[j] + '
						tmp += '</select></td>';
					}
					if (data[i].class == 1)
					{
						tmp += '<td>附加价格 <input type="text" name="spec[' + data[i].type_attr__id +'][added][]"/></td>';
						tmp += '<td><span class="add-spec btn btn-success"><i class="icon-plus icon-white"></i>添加规格</span>';
					}
					tmp += '</td>';
					tmp += '</tr>';

					if (data[i].class == 0)
					{
						attr += tmp;
					}
					else
					{
						spec += tmp;
					}
				}
				$('#attr').empty().append(attr);
				$('#spec').empty().append(spec);
			}
			else
			{
				$('#attr').empty();
				$('#spec').empty();
			}
		}, 'json');
	});

	//添加一个规格
	$('.add-spec').live('click', function () {
		var tr = $(this).parents('tr');
		var obj = tr.clone();
		var del = '<span class="del-spec btn btn-info"><i class="icon-white icon-minus"></i>删除规格</span>';
		obj.find('td').eq(3).find('.add-spec').remove();
		obj.find('td').eq(3).append(del);
		tr.after(obj);
	});

	//删除一个规格
	$('.del-spec').live('click', function() {
		$(this).parents('tr').remove();
	});


	/*//百度编辑器
	window.UEDITOR_HOME_URL = {{__ROOT__}} + '/Public/Org/Ueditor';
	//百度编辑器不能用百分比设置宽度吗？？？对，不能,只能设置数字的像素值
	// window.UEDITOR_CONFIG.initialFrameWidth = 1101;
	//图片上传提交地址
    window.UEDITOR_CONFIG.imageUrl = handler; 
    //图片修正地址
    window.UEDITOR_CONFIG.imagePath = {{__ROOT__}} + '/Upload/Editor/';
    window.UEDITOR_CONFIG.toolbars = [
            ['fullscreen', 'source', '|', 'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                'directionalityltr', 'directionalityrtl', 'indent', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe','insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
                'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
                'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', '|',
                'print', 'preview', 'searchreplace', 'help']
        ];                   
	UE.getEditor('intro');
	UE.getEditor('service');
	// 点击出现编辑器
	$('.next_show').click(function(){
		$(this).next().toggle(600);
	});

*/
	



});
