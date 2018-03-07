<?php
namespace Home\Controller;
use Think\Controller;
class CompanyController extends CommonController {
    public function index(){
        $model = M('eye_company');
        $Data = $model -> field('company_id, company_name, company_pic, company_city, company_time, company_industry, company_desc') -> order('company_time desc') -> select();
        $this -> assign('Data', $Data);
        $this -> display();
    }
//    企业登录
    public function login(){
        if(IS_POST){
            $post =I('post.');
//            dump($post);exit;
            $post['company_password']=md5($post['company_password']);
            //实例化模型
            $model =M('eye_company');
            //查询，根据用户名密码进行查询
            $row=$model->where($post)->find();
            if($row){
                //用户名存在，登陆持久化
                session('company_id',$row['company_id']);//记录用户的id
                session('company_phone',$row['company_phone']);//用户名
                session('company_name',$row['company_name']);
                //session('perpass',$row['perpass']);//密码
                $this->success('登陆成功',U('center'),3);
            }else{
                $this->error('手机号或密码错误',U('login'),3);
            }
        }
        $this -> display();
    }
//    企业个人中心
    public function center(){
        $data = D('eye_company') -> where("company_id = {$_SESSION['company_id']}") -> find();
        $this -> assign('data', $data);
        //3.1陈判断认证
        $prove = D('eye_company_check') -> where("com_user_uid = {$_SESSION['company_id']}") -> order('com_time desc') -> field('com_check') -> find();
        // dump($prove);
        $this -> assign('prove',$prove);

        //3.1陈end
        $this -> display();
    }
//    企业详情
    public function deta(){
        $id = I('get.company_id');
        $Deta = M('eye_company') -> where("company_id = {$id}") -> find();
        $this -> assign('Deta', $Deta);
        $this -> display();
    }

//    企业注册
    public function reg(){
        if(IS_POST){
            $post = I('post.');
            if($post['company_password'] != $post['company_password2']){
                $this -> error("两次输入密码不一样",U('Company/reg'),2);
            }
            $verify = new \Think\Verify();
            $rst = $verify -> check($post['authcode']);
            if(!$rst){
                $this->error("验证码错误，请重新输入",U('Company/reg'),2);
            }else{
                $post['company_password']=md5($post['company_password']);
                $model = M('eye_company');
                $ss = $model->where("company_phone={$post['company_phone']}")->find();
                if($ss){
                    //echo $model->_sql();exit;
                    $this->error("该手机号已注册！",U('Company/reg'),2);
                }
                $post['company_time'] = time();
                $sss=$model->add($post);
                if($sss){
                    $this->success("恭喜您，注册成功！",U('Company/login'),2);
                }else{
                    echo "注册失败！";
                }
            }
        }
        $this -> display();
    }
    //1.29陈start  企业认证
    //1.29陈start
    public function proveA(){
        //dump($_SESSION['company_id']);
        $check = M('eye_company_check');
        $exist = $check -> where("com_user_uid = {$_SESSION['company_id']}") -> field('com_limit') -> limit(1) -> find();
        //dump($exist);
        if($exist){
            if(IS_POST){
                $_POST['com_time'] = time();

                if($check -> where("com_user_uid = {$_SESSION['company_id']}") -> limit(1) -> save($_POST)){
                    $this -> success('修改成功',U('center'));
                }
                $this -> error('修改失败',U('proveEdit'));
            }
        }

        else{
            if(IS_POST){
                $_POST['com_time'] = time();
                $_POST['com_user_uid'] = $_SESSION['company_id'];
                $_POST['com_check'] = 2;
                $_POST['com_limit'] = 1;
                if($check -> add($_POST)){
                    $this->success('添加成功',U('proveB'));
                }
                $this->error('添加失败',U('proveA'));
            }
        }

        $this -> display();
    }

    public function proveB(){
        $this -> display();
    }

    public function proveC(){
        $this -> display();
    }

    public function proveEdit(){
        //$id = I('get.eye_id');
        $check = M('eye_company_check');
        // dump($_POST);
        if(IS_POST){
            $_POST['com_time'] = time();
            // $_POST['eye_user_uid'] = $_SESSION['eye_uid'];
            // $_POST['eye_check'] = 2;
            if($check -> where("com_user_uid = {$_SESSION['company_id']}") -> limit(1) -> save($_POST)){
                $this -> success('修改成功',U('center'));
            }
            $this -> error('修改失败',U('proveEdit'));
        }

        $data = M('eye_company_check') -> where("com_user_uid = {$_SESSION['company_id']}") ->order('com_time desc') -> find();
        $this -> assign('data',$data);
        // dump($data);
        $this -> display();
    }

//1.29陈end



}