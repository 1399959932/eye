<?php
namespace Home\Controller;
use Think\Controller;
//眼科医学
class OphthaController extends CommonController{
    public function index(){
        $cateData = M(eye_category) -> where("category_sid = 0") ->order('category_num') -> select();
        $this -> assign('cateData', $cateData);
        $tagData = M('eye_tag') -> where('tag_sid = 0') ->order('tag_num') -> select();
        $this -> assign('tagData', $tagData );
        $model = M('eye_medart');
        //陈1.21start
        //查询阅读量高的文章
        $art = $model -> field('medart_id, medart_title, medart_pic, medart_time') -> order('medart_reading desc') -> limit(2)->select();
        foreach ($art as $k => $va) {
            $art[$k]['medart_time'] = date('Y-m-d', $art[$k]['medart_time']);
        }
        //var_dump($art);
        //传给view
        $this->assign('art',$art);
//陈end
        $cate_id = I('get.category_id');
        $tag_id = I('get.tag_id');
        if($cate_id){
            $Data = $model -> where("medart_cate_id = {$cate_id}") -> field('medart_id, medart_title, medart_time, medart_pic') -> order('medart_time') -> select();
        } elseif($tag_id){
            $Data = $model -> where("medart_tag_id = {$tag_id}") -> field('medart_id, medart_title, medart_time, medart_pic') -> order('medart_time') -> select();
        } else{
            $Data = $model -> field('medart_id, medart_title, medart_time, medart_pic') ->order('medart_time') -> select();
        }

        foreach ($Data as $k => $v){
            $Data[$k]['medart_time'] = date('Y-m-d', $Data[$k]['medart_time']);
        }
        $p = $_GET['p']?$_GET['p']:1;
        $Data = $model -> order('medart_time')->page($p.',5')->select();
//        dump($list);exit;
        $this -> assign('Data', $Data);
        $count = $model -> count();
        $Page       = new \Think\Page($count,5);
        $show       = $Page->show();
        $this->assign('page',$show);
        $this->display();
    }
//    文章详情
    public function center(){
        $id = I('get.medart_id');
        $cateData = M(eye_category) -> where("category_sid = 0") -> order('category_num') -> select();
        $this -> assign('cateData', $cateData);
        $tagData = M('eye_tag') -> where('tag_sid = 0') -> order('tag_num') -> select();
        $this -> assign('tagData', $tagData );
        $cateData = M(eye_category) -> where("category_sid = 0") -> order('category_num') -> select();
        $this -> assign('cateData', $cateData);
        $tagData = M('eye_tag') -> where('tag_sid = 0') ->order('tag_num') -> select();
        $this -> assign('tagData', $tagData );
        $Deta = M('eye_medart') -> where("medart_id = {$id}") -> find();
        $Deta['medart_time'] = date('Y-m-d', $Deta['medart_time']);
        $Deta['medart_content'] = htmlspecialchars_decode($Deta['medart_content']);
        $Deta['medsart_reading'] = $Deta['nmedsart_reading']+1;
        M('eye_medart') -> where("medart_id = {$id}") -> setInc('medart_reading');
        $this -> assign('Deta', $Deta);
        $this -> display();
    }
}