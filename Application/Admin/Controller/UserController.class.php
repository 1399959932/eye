<?php
namespace Admin\Controller;
class UserController extends CommonController{
    private $model;
    public function __construct(){
        parent::__construct();
        $this -> model = new \Common\Model\User;
    }

    public function index(){
        $data = $this -> model ->order('eye_time desc') -> select();
        foreach ($data as $k => $v){
            $data[$k]['eye_time'] = date('y-m-d',$data[$k]['eye_time'] );
        }
        $this -> assign('data',$data);
        $this -> display();
    }
    public function add(){
        if(IS_POST){
            $_POST['eye_time'] = time();
            $_POST['eye_password'] = md5($_POST['eye_password']);
            if($this -> model -> store()){
                $this -> success("添加成功",U('index'));
            }
        }
        $this -> display();
    }
//    编辑
    public function edit(){
        $id = I('get.eye_uid');
        if(IS_POST){
            if($this->model->where("eye_uid={$id}")->edit())$this->success('修改成功',U('index'));
            $this->error($this->model->getError());
        }
        $oldData = $this -> model -> where("eye_uid = {$id}") -> find();
        $this -> assign('oldData', $oldData);
        $this -> display();
    }
//    删除
    public function del(){
        $eid = I('get.eye_uid');
        $this -> model ->where("eye_uid = {$eid}") -> delete();
        $this -> success("删除成功");
    }
}
