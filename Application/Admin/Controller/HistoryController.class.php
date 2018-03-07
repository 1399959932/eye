<?php
namespace Admin\Controller;
class HistoryController extends CommonController{
	private $model;
	public function __construct(){
//		调用CommonController里面的构造方法
		parent::__construct();
//		实例化news模型
		$this -> model = new \Common\Model\History;
	}
	
	public function index(){
		$data = $this -> model -> select();

		foreach ($data as $k => $v){
			$a = date("Y-m-d", $v['his_time']);
			$data[$k]['his_time'] = $a;
		}
		$this -> assign('data',$data);

		$this -> display();
	}
//	添加文章
	public function add(){
		if(IS_POST){
//			dump($_POST);exit;
			$_POST['his_time'] = time();
			if($this -> model -> store()){
				$this -> success('添加成功',U('index'));
			}
			$this -> error($this -> model -> getError());
		}
		//		处理所属分类
		$model = new \Common\Model\Cate;
		$cateData = $model -> where("category_sid = 2") -> field('category_name,category_id') -> select();
		$this -> assign('cateData',$cateData);
		//处理所属标签
		$model = new \Common\Model\Tag;
		$tagData = $model -> where("tag_sid = 2") -> field('tag_name,tag_id') -> select();
		$this -> assign('tagData',$tagData);
		$this -> display();
	}


//	编辑文章
	public function edit(){
		$caid = I('get.his_id');
		if(IS_POST){
			if($this -> model -> where("his_id = {$caid}") -> edit())$this -> success('修改成功',U('index'));
			$this -> error($this -> model -> getError());
		}
		$oldData = $this -> model -> where("his_id = {$caid}") -> find();
		$oldData["his_content"] = htmlspecialchars_decode($oldData["his_content"]);
		$this -> assign('oldData',$oldData);
		//		处理所属分类
		$model=new \Common\Model\Cate;
		$cateData=$model->where("category_sid = 2")->field('category_name,category_id')->select();
		$this->assign('cateData',$cateData);
		//处理所属标签
		$model=new \Common\Model\Tag;
		$tagData=$model->where("tag_sid = 2")->field('tag_name,tag_id')->select();
		$this->assign('tagData',$tagData);
		$this -> display();
	}
	
//	删除文章
	public function del(){
		$caid = I('get.his_id');
		$this -> model -> where("his_id = {$caid}") -> delete();
		$this -> success('删除成功');
	}
	
}