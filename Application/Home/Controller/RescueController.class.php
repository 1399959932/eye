<?php
namespace Home\Controller;
use Think\Controller;
class RescueController extends CommonController {
    public function index(){
        $model = M('eye_rescue');
        $Data = $model -> field('rescue_id, rescue_title, rescue_source, rescue_pic, rescue_appeal, rescue_offer, rescue_rate') -> order('rescue_time desc') -> select();
        foreach ($Data as $k => $v){
            $Data[$k]['rescue_rate'] = round($Data[$k]['rescue_offer'] / $Data[$k]['rescue_appeal'] *100, 2);
        }
        $this -> assign('Data', $Data);
        $this->display();
    }
    public function deta(){
        $id = I('get.rescue_id');
        $Deta = M('eye_rescue') -> where("rescue_id = {$id}") -> find();
        $Deta['rescue_time'] = date('Y-m-d', $Deta['rescue_time']);
        $Deta['rescue_intro'] = htmlspecialchars_decode($Deta['rescue_intro']);
        $this -> assign('Deta', $Deta);
       $this -> display();
    }
}