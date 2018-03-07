<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends CommonController {
    public function index(){
     
//        首页救助数据
        $rescueData = M('eye_rescue') -> field('rescue_title, rescue_pic, rescue_source, rescue_intro, rescue_id') -> order('rescue_time desc') -> limit(5) ->select();
        $str = 0;
        $end = 50;
        foreach ($rescueData as $k => $v){
            $a = htmlspecialchars_decode($rescueData[$k]['rescue_intro']);
            $rescueData[$k]['rescue_intro'] = mb_substr(ezk_cutstr_html($a), $str, $end);

        }
        $this -> assign('rescueData', $rescueData);
//        首页医学文章
        $ophData = M('eye_medart') -> field('medart_title, medart_id, medart_pic, medart_content') -> order('medart_time desc') -> limit(3) -> select();
        $str = 0;
        $end = 50;
        foreach ($ophData as $k => $v){
            $a = htmlspecialchars_decode($ophData[$k]['medart_content']);
            $ophData[$k]['medart_content'] = mb_substr(ezk_cutstr_html($a), $str, $end);
        }
//        dump($ophData);exit;
        $this -> assign('ophData', $ophData);
//        首页专家
        $expertData = M('eye_expert_user') -> field('expert_id, expert_realname, expert_pic, expert_job, expert_hospital, expert_brief, expert_time') -> order('expert_time desc') -> limit(4) -> select();
        $str = 0;
        $end = 50;
        foreach ($expertData as $k => $v){
            $a = htmlspecialchars_decode($expertData[$k]['expert_brief']);
            $expertData[$k]['expert_brief'] = mb_substr(ezk_cutstr_html($a), $str, $end);
        }
        $this -> assign('expertData', $expertData);
        $this->display();
    }
    

}

