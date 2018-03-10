<?php
namespace Home\Controller;
use Think\Controller;
class ExpertController extends CommonController {
    public function index(){
        $model = M('eye_expert_user');
        $Data = $model -> field('expert_id, expert_realname, expert_pic, expert_job, expert_hospital, expert_brief, expert_time') -> order('expert_time desc') -> select();
        $this -> assign('Data', $Data);
        $this -> display();
    }
//    专家登录
    public function login(){
        if(IS_POST){
            $post =I('post.');
//            dump($post);exit;
//1.29陈注释了一行代码
            // $post['expert_password']=md5($post['expert_password']);
//1.29陈注释了一行代码
            //实例化模型
            $model =M('eye_expert_user');
            //查询，根据用户名密码进行查询
            $row=$model->where($post)->find();
            if($row){
                //用户名存在，登陆持久化
                session('expert_id',$row['expert_id']);//记录用户的id
                session('expert_phone',$row['expert_phone']);//用户名
                session('expert_username',$row['expert_username']);
                //session('perpass',$row['perpass']);//密码
                $this->success('登陆成功',U('center'),3);
            }else{
                $this->error('手机号或密码错误',U('login'),3);
            }
        }
        $this -> display();
    }
//    个人中心
    public function center(){
        //dump($_SESSION['expert_id']);
        $data = D('eye_expert_user') -> where("expert_id = {$_SESSION['expert_id']}") -> find();
        $this -> assign('data',$data);
        // 2.26陈判断认证

        $prove = D('eye_expert_user_check') -> where("expert_user_uid = {$_SESSION['expert_id']}") -> field('expert_check') -> find();
        // dump($prove);
        $this -> assign('prove',$prove);

        //陈2.26end
        $this -> display();
    }

    public function deta(){
        $id = I('get.expert_id');
        $Deta = M('eye_expert_user') -> where("expert_id = {$id}") -> find();
        $Deta['expert_time'] = date('Y-m-d', $Deta['expert_time']);
        $this -> assign('Deta', $Deta);
        $this -> display();
    }
//    专家注册


//1.29陈start

    public function proveA(){
        //dump($_SESSION['expert_id']);
        $check = M('eye_expert_user_check');
        $exist = $check -> where("expert_user_uid = {$_SESSION['expert_id']}") -> field('expert_limit') -> limit(1) -> find();

        //dump($exist);
        if($exist){
            if(IS_POST){
                $_POST['expert_time'] = time();
                // $_POST['eye_user_uid'] = $_SESSION['eye_uid'];
                // $_POST['eye_check'] = 2;
                if($check -> where("expert_user_uid = {$_SESSION['expert_id']}") -> limit(1) -> save($_POST)){
                    $this -> success('修改成功',U('center'));
                }
                $this -> error('修改失败',U('proveEdit'));
            }
        }

        else{
            if(IS_POST){
                $_POST['expert_time'] = time();
                $_POST['expert_user_uid'] = $_SESSION['expert_id'];
                $_POST['expert_check'] = 2;
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

    public function proveEdit(){
        //$id = I('get.eye_id');
        $check = M('eye_expert_user_check');
        // dump($_POST);
        if(IS_POST){
            $_POST['expert_time'] = time();
            // $_POST['eye_user_uid'] = $_SESSION['eye_uid'];
            // $_POST['eye_check'] = 2;
            if($check -> where("expert_user_uid = {$_SESSION['expert_id']}") -> limit(1) -> save($_POST)){
                $this -> success('修改成功',U('center'));
            }
            $this -> error('修改失败',U('proveEdit'));
        }

        $data = M('eye_expert_user_check') -> where("expert_user_uid = {$_SESSION['expert_id']}") ->order('expert_time desc') -> find();
        $this -> assign('data',$data);
        //dump($data);
        $this -> display();
    }
//end

//2.27发布文章陈 start
    public function publishA(){
        //dump($_SESSION['expert_id']);

        if(IS_POST){
            $publish = M('eye_medart');
            $_POST['medart_time'] = time();
            $_POST['medart_expert_id'] = $_SESSION['expert_id'];
            if($publish -> add($_POST)){
                $this->success('添加成功',U('publishB'));
            }
            $this->error('添加失败',U('publishA'));
        }

        //陈2.27处理分类,标签
        //      处理所属分类
        $model=new \Common\Model\Cate;
        $cateData= $model -> where("category_sid = 2") -> field('category_name,category_id') -> select();
        //dump($cateData);
        $this -> assign('cateData',$cateData);
        //处理所属标签
        $model= new \Common\Model\Tag;
        $tagData= $model -> where("tag_sid = 1") -> field('tag_name,tag_id') -> select();
        $this -> assign('tagData',$tagData);
        $this -> display();
    }

    public function publichB(){
        $this -> display();
    }

//陈2.27end
    public function reg(){
        if(IS_POST){
            $post = I('post.');
            if($post['expert_password'] != $post['expert_password2']){
                $this -> error("两次输入密码不一样",U('Expert/reg'),2);
            }
            $verify =new \Think\Verify();
            $rst =$verify->check($post['authcode']);
            if(!$rst){
                $this->error("验证码错误，请重新输入",U('Expert/reg'),2);
            }else{
                $post['expert_password']=md5($post['expert_password']);
                $model = M('eye_expert_user');
                $a = $post['expert_phone'];
                $ss = $model->where("expert_phone={$post['expert_phone']}")->find();
                if($ss){
                    //echo $model->_sql();exit;
                    $this->error("该手机号已注册！",U('Expert/reg'),2);
                }
                $post['expert_time'] = time();
                $sss=$model->add($post);
                if($sss){
                    $this->success("恭喜您，注册成功！",U('Expert/login'),2);
                }else{
                    echo "注册失败！";
                }
            }
        }
        $this -> display();
    }

}
