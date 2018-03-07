<?php
namespace Home\Controller;
use Think\Controller;
//用户注册
class UserregController extends CommonController {
    //    生成验证码
    public function selfverify(){
        $verify = new \Think\Verify();
        $verify -> entry();
    }

    public function index(){
        if(IS_POST){
            $post = I('post.');
            if($post['eye_password'] != $post['eye_password2']){
                $this -> error("两次输入密码不一样",U('Userreg/index'),2);
            }
            $verify =new \Think\Verify();
            $rst =$verify->check($post['authcode']);
            if(!$rst){
                $this->error("验证码错误，请重新输入",U('Userreg/index'),2);
            }else{
                $post['eye_password']=md5($post['eye_password']);
                $model = M('eye_user');
                $a = $post['eye_phone'];
                $ss = $model->where("eye_phone={$post['eye_phone']}")->find();
                if($ss){
                    //echo $model->_sql();exit;
                    $this->error("该手机号已注册！",U('Userreg/index'),2);
                }
                $post['eye_time'] = time();
                $sss=$model->add($post);
                if($sss){
                    $this->success("恭喜您，注册成功！",U('Userlogin/index'),2);
                }else{
                    echo "注册失败！";
                }
            }
        }
        $this->display();
    }
    

}