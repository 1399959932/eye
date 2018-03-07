<?php
namespace Admin\Controller;
class ProveController extends CommonController{

   public function index(){
       $data = M('eye_user_check') -> order('eye_time desc') -> select();
       foreach ($data as $k => $v) {
            $data[$k]['eye_time']=date('Y-m-d',$data[$k]['eye_time']);
        }
       $this -> assign('data',$data);
       //dump($data);
       $this -> display();
   }

   public function edit(){
        $id=I('get.eye_id');
        $check = M('eye_user_check');
        if(IS_POST){
            if($check -> where("eye_id={$id}") -> save($_POST)){
                $this->success('修改成功',U('index'));
            }
            $this->error('修改失败',U('edit'));
        }
       //dump($data);
       
       $data = M('eye_user_check') -> where("eye_id={$id}") -> find();
       $this -> assign('data',$data);
       $this -> display();
   }

   //   删除
    public function del(){
        $id=I('get.eye_id');
        // $this ->model = M('eye_user_check');
        // $this -> where("eye_id={$id}")->delete();
        $this -> success('删除成功');
    }
}
//made by chen gg