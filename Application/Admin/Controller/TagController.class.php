<?php
namespace Admin\Controller;
class TagController extends CommonController{
	private $model;
	public function __construct(){
//		调用CommonController里面的构造方法
		parent::__construct();
//		实例化cate模型
		$this->model=new \Common\Model\Tag;
	}
	
	public function index(){
		$data=$this->model->select();
		$this->assign('data',$data);
// 		$casData=D('Cas')->field('category_caid')->select();
// 		$ids=array();
// 		foreach($casData as $k => $v){
// 　　　　	$ids[] = $v['category_caid'];
// 　　　　}
// 		pre($ids);die;
		$this->display();
	}
//	添加标签
	public function add(){
		if(IS_POST){
			if($this->model->store()){
				$this->success('添加成功',U('index'));
			}
			$this->error($this->model->getError());
		}
		$this->display();
	}
	
//	编辑分类
	public function edit(){
		$caid=I('get.tag_id');
		if(IS_POST){
			if($this->model->where("tag_id={$caid}")->edit())$this->success('修改成功',U('index'));
			$this->error($this->model->getError());
		}
		$oldData=$this->model->where("tag_id={$caid}")->find();
		$this->assign('oldData',$oldData);
		$this->display();
	}
	
//	删除分类
	public function del(){
		$caid=I('get.tag_id');
		$this->model->where("tag_id={$caid}")->delete();
		$this->success('删除成功');
	}
	
}