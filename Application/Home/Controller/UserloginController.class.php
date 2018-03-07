<?php
namespace Home\Controller;
use Think\Controller;
//用户注册
class UserloginController extends Controller {

//陈1.30加的方法
    private $model;
    public function __construct(){
//      调用CommonController里面的构造方法
        parent::__construct();
//      实例化news模型
        $this -> model = new \Common\Model\User;
    }
//陈1.30结束

    public function index(){
        if(IS_POST){
            $post =I('post.');
//1.29陈注释了一行代码
            $post['eye_password']=md5($post['eye_password']);
//1.29陈注释了一行代码
            //实例化模型
            $model =D('eye_user');
            //查询，根据用户名密码进行查询
            $row=$model->where($post)->find();
            if($row){
                //用户名存在，登陆持久化
                session('eye_uid',$row['eye_uid']);//记录用户的id
                session('eye_phone',$row['eye_phone']);//用户名
                session('eye_username',$row['eye_username']);
                //session('perpass',$row['perpass']);//密码
                $this->success('登陆成功',U('center'),3);
            }else{
                $this->error('手机号或密码错误',U('index'),3);
            }
        }
        $this->display();
    }
    public function center(){
        $data = D('eye_user') -> where("eye_uid = {$_SESSION['eye_uid']}") -> find();
        $this -> assign('data',$data);
        //2.26陈判断认证
        $prove = D('eye_user_check') -> where("eye_user_uid = {$_SESSION['eye_uid']}") -> order('eye_time desc') -> field('eye_check') -> find();
        //dump($prove);
        $this -> assign('prove',$prove);
        //陈2.26end
        $this -> display();
    }

    public function logout(){
        session_unset();
        session_destroy();
        $this->success('',U('Index/index'));
    }
//1.29陈start
    public function proveA(){
        $check = M('eye_user_check');
        $exist = $check -> where("eye_user_uid = {$_SESSION['eye_uid']}") -> field('eye_limit') -> limit(1) -> find();
        //dump($exist);
        if($exist){
            if(IS_POST){
                $_POST['eye_time'] = time();
                $_POST['eye_user_uid'] = $_SESSION['eye_uid'];
                $_POST['eye_check'] = 2;
                if($check -> where("eye_user_uid = {$_SESSION['eye_uid']}") -> limit(1) -> save($_POST)){
                    $this -> success('修改成功',U('center'));
                }
                $this -> error('修改失败',U('proveEdit'));
            }
        }

        else{
            if(IS_POST){
                $_POST['eye_time'] = time();
                $_POST['eye_user_uid'] = $_SESSION['eye_uid'];
                $_POST['eye_check'] = 2;
                $_POST['eye_limit'] = 1;
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

    //2.28陈 个人认证信息修改
    public function proveEdit(){
        //$id = I('get.eye_id');
        $check = M('eye_user_check');
        // dump($_POST);
        if(IS_POST){
            $_POST['eye_time'] = time();
            // $_POST['eye_user_uid'] = $_SESSION['eye_uid'];
            // $_POST['eye_check'] = 2;
            if($check -> where("eye_user_uid = {$_SESSION['eye_uid']}") -> limit(1) -> save($_POST)){
                $this -> success('修改成功',U('center'));
            }
            $this -> error('修改失败',U('proveEdit'));
        }

        $data = M('eye_user_check') -> where("eye_user_uid = {$_SESSION['eye_uid']}") ->order('eye_time desc') -> find();
        $this -> assign('data',$data);
        //dump($data);
        $this -> display();
    }
    //2.28陈结束

    //发起项目
    public function itemA(){
        //3.1陈start
        $item = M('eye_rescue');
        //读取相关联的用户表姓名做为项目发起者
        $username = M('eye_user_check') -> where("eye_user_uid = {$_SESSION['eye_uid']}") -> field('eye_name') -> find();
        //这个地方应该写一个判断,就是如果传的图片是两张以上的走picdata字段,一张就pic

        //读取限制字段limit
        $exist = $item -> where("rescue_user_uid = {$_SESSION['eye_uid']}") -> field('rescue_limit') -> limit(1) -> find();
        // dump($exist);
        // 判断是否存在limit 如果存在则edit,如果不在add
        if($exist){
            if($exist){
                if(IS_POST){
                    $_POST['resource_time'] = time();
                    // $_POST['eye_user_uid'] = $_SESSION['eye_uid'];
                    // $_POST['eye_check'] = 2;
                    if($item -> where("rescue_user_uid = {$_SESSION['eye_uid']}") -> limit(1) -> save($_POST)){
                        $this -> success('修改成功',U('itemB'));
                    }
                    $this -> error('修改失败',U('itemA'));
                }
            }
        }
        else{
            if(IS_POST){
                //dump($_POST);exit;
                $_POST['rescue_time'] = time();
                $_POST['rescue_user_uid'] = $_SESSION['eye_uid'];
                $_POST['rescue_source'] = $username['eye_name'];
                $_POST['rescue_limit'] = 1;
                if($item -> add($_POST)){
                    $this -> success('添加成功',U('center'));
                }
                $this -> error($this -> model -> getError());
            }
        }
        $this -> display();
    }

    //3.1陈end

    //  上传
    public function upload()
    {

        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     3145728 ;// 设置附件上传大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->rootPath  =     dirname(__FILE__); // 设置附件上传根目录
        //echo $upload->rootPath;exit;
        $upload->rootPath  = "/www";
        $upload->savePath  =     "/Uploads/Content/" . date('y/m'); // 设置附件上传（子）目录
        // 上传文件
        $info   =   $upload->upload();
        if(!$info) {// 上传错误提示错误信息
            $data = array('error'=>true,'error'=>"no file");

            echo json_encode($data);exit;
            $this->error($upload->getError());
        }else{// 上传成功
            $data = $info['Filedata'];

            echo json_encode($data);exit;
        }

    }

    public function itemB(){
        $this -> display();
    }


//1.29陈end
}
