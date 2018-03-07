<?php
namespace Admin\Controller;
class MedartController extends CommonController{
	private $model;
	public function __construct(){
//		调用CommonController里面的构造方法
		parent::__construct();
//		实例化news模型
		$this->model=new \Common\Model\Medart;
	}
	
	public function index(){
		$data=$this->model->select();

		foreach ($data as $k=>$v){
			$a=date("Y-m-d",$v['medart_time']);
			$data[$k]['medart_time'] = $a;
		}
		$this->assign('data',$data);

// 		$casData=D('Cas')->field('category_caid')->select();
// 		$ids=array();
// 		foreach($casData as $k => $v){
// 　　　　	$ids[] = $v['category_caid'];
// 　　　　}
// 		pre($ids);die;
		$this->display();
	}
//	添加分类
	public function add(){
		if(IS_POST){
			$_POST['medart_time'] = time();
			if($this->model->store()){
				$this->success('添加成功',U('index'));
			}
			$this->error($this->model->getError());
		}
		//		处理所属分类
		$model=new \Common\Model\Cate;
		$cateData=$model->where("category_sid = 0")->field('category_name,category_id')->select();
		$this->assign('cateData',$cateData);
		//处理所属标签
		$model=new \Common\Model\Tag;
		$tagData=$model->where("tag_sid = 0")->field('tag_name,tag_id')->select();
		$this->assign('tagData',$tagData);
		//处理所属专家
		$model = new \Common\Model\Expert;
		$expData = $model -> field('expert_username,expert_id') -> select();
		$this -> assign('expData',$expData);
		$this->display();
	}
//	编辑
	public function edit(){
		$caid=I('get.medart_id');
		if(IS_POST){
			if($this->model->where("medart_id={$caid}")->edit())$this->success('修改成功',U('index'));
			$this->error($this->model->getError());
		}
		$oldData=$this->model->where("medart_id={$caid}")->find();
		$this->assign('oldData',$oldData);
		// 陈1.18
		//		处理所属分类
		$model=new \Common\Model\Cate;
		$cateData=$model->where("category_sid = 0")->field('category_name,category_id')->select();
		$this->assign('cateData',$cateData);
		//处理所属标签
		$model=new \Common\Model\Tag;
		$tagData=$model->where("tag_sid = 0")->field('tag_name,tag_id')->select();
		$this->assign('tagData',$tagData);
		//处理所属专家
		$model = new \Common\Model\Expert;
		$expData = $model -> field('expert_username,expert_id') -> select();
		$this -> assign('expData',$expData);
		$this->display();
// 陈1.18end
	}
	
//	删除
	public function del(){
		$caid=I('get.medart_id');
		$this->model->where("medart_id={$caid}")->delete();
		$this->success('删除成功');
	}
	
}