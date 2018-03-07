<?php namespace Admin\Controller;
use Think\Controller;
class LoginController extends Controller{
	public function index(){
		if(IS_POST){
//			接收数据
			$username=I('post.eye_admin_username',"addslashes");
			$password=I('post.eye_admin_password','','md5');
//			判断用户名是否存在
			$user=M('eye_admin_user');
			$data=$user->where("eye_admin_username='{$username}'")->find();
			if(!$data) $this->error('用户名或密码错误');
//			判断密码是否正确
			if($data['eye_admin_password']!= $password) $this->error('用户名或密码错误');
//			登陆成功
			$_SESSION['uid']=$data['eye_admin_uid'];
			$_SESSION['username']=$data['eye_admin_username'];
			
			$this->success('登陆成功',U('Index/index'));
				
		}
		$this->display();
		
	}
	
//	修改密码
	public function alter(){
		$user=M('eye_admin_user');
		$uid=$_SESSION['uid'];
		$username=$_SESSION['username'];
//		dump($_SESSION);die;
		if(IS_POST){
			$oldpassword=md5(I('post.eye_admin_password'));
			$password=$user->where("eye_admin_uid={$uid}")->field('eye_admin_password')->find();
			if($oldpassword==$password['eye_admin_password']){
				$password1=I('post.password1');
				$password2=I('post.password2');
				if($password1!=$password2)$this->error('两次输入密码不一样');
				$user->where("eye_admin_uid={$uid}")->save(array('eye_admin_password'=>md5($password1),'eye_admin_username'=>$username));
				$this->success('密码修改成功',U('Login/index'));
				return true;
			}
			$this->error('密码输入错误');
		}
		$this->display();
	}
//	退出
	public function out(){
		session_unset();
		session_destroy();
		$this->success('退出成功',U('Login/index'));
	}
}





