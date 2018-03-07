<?php
namespace Admin\Controller;
class RescueController extends CommonController{
    private $model;
    public function __construct(){
        parent::__construct();
        $this -> model = new \Common\Model\Rescue;
    }

    public function index(){
        $data = $this -> model ->order('rescue_time desc') -> select();
        foreach ($data as $k => $v){
            $data[$k]['rescue_time'] = date('Y-m-d',$data[$k]['rescue_time'] );
        }
        $this -> assign('data',$data);
        $this -> display();
    }
//        添加
    public function add(){
        if(IS_POST){
            $_POST['rescue_time'] = time();
            if($this -> model -> store()){
                $this -> success("添加成功",U('index'));
            }
            $this->error($this->model->getError());
        }
        $this -> display();
    }
//    删除
    public function del(){
        $eid = I('get.rescue_id');
        $this -> model ->where("rescue_id = {$eid}") -> delete();
        $this -> success("删除成功");
    }
}
