<?php
namespace Home\Controller;
use Think\Controller;
class NewsController extends CommonController {

    public function index(){
            $cateData = M(eye_category) -> where("category_sid = 1") ->order('category_num') -> select();

    //        $num = M('eye_newsart') -> join('eye_category ON eye_newsart.newsart_cate_id = eye_category.category_id') -> select();
    //        $num1 = count($num);
    //        dump($num1);exit;
            $this -> assign('cateData', $cateData);
            $tagData = M('eye_tag') -> where('tag_sid = 1') ->order('tag_num') -> select();
            $this -> assign('tagData',$tagData );
        $model = M('eye_newsart');
        //陈1.21start
        //查询阅读量高的文章
        $art = $model -> field('newsart_id, newsart_title, newsart_pic, newsart_time') -> order('newsart_reading desc') -> limit(2)->select();
        foreach ($art as $k => $va) {
            $art[$k]['newsart_time'] = date('Y-m-d', $art[$k]['newsart_time']);
        }
        //var_dump($art);
        //传给view
        $this->assign('art',$art);
//陈end
        $cate_id = I('get.category_id');
        $tag_id = I('get.tag_id');
        if($cate_id){
            $Data = $model -> where("newsart_cate_id = {$cate_id}") -> order('newsart_time') -> select();
        } elseif($tag_id){
            $Data = $model -> where("newsart_tag_id = {$tag_id}") -> order('newsart_time') -> select();
        } else{
            $Data = $model -> order('newsart_time') -> select();
        }

        $st = 0;
        $len = 50;
        foreach($Data as $k => $v){
            $Data[$k]['newsart_time']=date('Y-m-d',$Data[$k]['newsart_time']);
            $Data[$k]['newsart_content']=htmlspecialchars_decode($Data[$k]['newsart_content']);
            $Data[$k]['newsart_content'] = ezk_cutstr_html($Data[$k]['newsart_content']);
//            dump($Data[$k]['newsart_content']);
            $Data[$k]['newsart_content']=mb_substr($Data[$k]['newsart_content'],$st,$len,'utf8');
        }
        $this -> assign('data', $Data);
        $this->display();
    }

    public function deta(){
        $id = I('get.newsart_id');
        $cateData = M(eye_category) -> where("category_sid = 1") ->order('category_num') -> select();
        $this -> assign('cateData', $cateData);
        $tagData = M('eye_tag') -> where('tag_sid = 1') ->order('tag_num') -> select();
        $this -> assign('tagData',$tagData );
        $Deta = M('eye_newsart') -> where("newsart_id = {$id}") -> find();
        $Deta['newsart_time'] = date('Y-m-d',$Deta['newsart_time']);
        $Deta['newsart_content'] = htmlspecialchars_decode($Deta['newsart_content']);
        $Deta['newsart_reading']=$Deta['newsart_reading']+1;
        M('eye_newsart')->where("newsart_id={$id}")->setInc('newsart_reading');
//        dump($Deta);
        //陈1.26翻页
        //上一篇
        $Article = M('eye_newsart');
        $front=$Article -> where("newsart_id<".$id) -> field('newsart_id, newsart_title') -> order('newsart_id desc') ->  limit('1') -> find();
        $this->assign('front',$front);
        //下一篇
        $after=$Article -> where("newsart_id>".$id) -> field('newsart_id, newsart_title') -> order('newsart_id') ->  limit('1') -> find();
        //var_dump($after);
        $this->assign('after',$after);
        //陈1.26end
        $this -> assign('Deta', $Deta);
        $this -> display();
    }
}