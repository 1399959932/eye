<?php namespace Common\Model;
use Think\Model;
class User extends Model{
//	指定表名
	protected $tableName="eye_user";
//自动验证 固定写法
	protected $validate=array(
//		array(字段名,验证方法,错误提示,验证条件,验证时间)
		array('eye_username','required','用户名不能为空',3,3),
		array('eye_phone','required','手机号不能为空',3,3),
		array('eye_password','required','密码不能为空',3,3),
		array('eye_username','maxlen:50','用户名不能超过50个字符',3,3),
	);
	//	自定义的store方法
	public function store(){
//		调用框架的create方法 触发自动验证
		if($this->create()){
//			如果验证通过 调用框架的添加方法 返回自增主键id
//			返回真
//p($_POST);die;
			return $this->add();
		}else{
//			返回假
			return false;
		}
	}
	//	模型 编辑方法
	public function edit(){
//		执行自动验证
		if($this->create()){
			$this->save();
			return true;
		}
		return false;
	}
}