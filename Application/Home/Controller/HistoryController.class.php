<?php
namespace Home\Controller;
use Think\Controller;
class HistoryController extends CommonController {
    public function index(){
        $model = M('eye_hisart');
        $Data = $model -> field('his_id, his_title, his_time, his_pic') ->order('his_time') -> select();
        foreach ($Data as $k => $v){
            $Data[$k]['his_time'] = date('Y-m-d', $Data[$k]['his_time']);
        }
        $count = $model -> count();
        $Page       = new \Think\Page($count,8);
        $show       = $Page->show();
        $Data = $model -> order('his_time') -> limit($Page -> firstRow.','.$Page -> listRows) -> select();
        $this -> assign('Data', $Data);
        $this->assign('page',$show);
        $this->display();
    }
//    详情页
    public function deta(){
        $id = I('get.his_id');
        $Deta = M('eye_hisart') -> where("his_id = {$id}") -> find();
        $Deta['his_time'] = date('Y-m-d', $Deta['his_time']);
        $Deta['his_content'] = htmlspecialchars_decode($Deta['his_content']);
        $Deta['his_reading'] = $Deta['his_reading']+1;
        M('eye_hisart') -> where("his_id = {$id}") -> setInc('his_reading');
        $this -> assign('Deta', $Deta);

        $front=M('eye_hisart')->where("his_id>".$id)->order('his_id asc')->limit('1')->find();
        $this->assign('front',$front);

        $after=M('eye_hisart')->where("his_id<".$id)->order('his_id desc')->limit('1')->find();
        $this->assign('after',$after);

        $this -> display();
    }
}