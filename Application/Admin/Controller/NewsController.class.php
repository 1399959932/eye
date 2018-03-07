<?php
namespace Admin\Controller;
class NewsController extends CommonController{
	private $model;
	public function __construct(){
//		调用CommonController里面的构造方法
		parent::__construct();
//		实例化news模型
		$this->model=new \Common\Model\News;
	}
	
	public function index(){
		$data=$this->model->select();

		foreach ($data as $k=>$v){
			$a=date("Y-m-d",$v['newsart_time']);
			$data[$k]['newsart_time'] = $a;
		}
		$this->assign('data',$data);
		$this->display();
	}
//	添加分类
	public function add(){
		if(IS_POST){
			$_POST['newsart_time'] = time();
			if($this->model->store()){
				$this->success('添加成功',U('index'));
			}
			$this->error($this->model->getError());
		}
		//		处理所属分类
		$model=new \Common\Model\Cate;
		$cateData=$model->where("category_sid = 1")->field('category_name,category_id')->select();
		$this->assign('cateData',$cateData);
		//处理所属标签
		$model=new \Common\Model\Tag;
		$tagData=$model->where("tag_sid = 1")->field('tag_name,tag_id')->select();
		$this->assign('tagData',$tagData);
		$this->display();
	}

//	上传
	public function upload()
	{

		$upload = new \Think\Upload();// 实例化上传类
		 $upload->maxSize   =     3145728 ;// 设置附件上传大小
		 $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
		$upload->rootPath  =     dirname(__FILE__); // 设置附件上传根目录
		//echo $upload->rootPath;exit;
		$upload->rootPath  = "/www";
		$upload->savePath  =     "/Uploads/Content/" . date('y/m'); // 设置附件上传（子）目录
		// 上传文件
		$info   =   $upload->upload();
		if(!$info) {// 上传错误提示错误信息
			$data = array('error'=>true,'error'=>"no file");

			echo json_encode($data);exit;
			$this->error($upload->getError());
		}else{// 上传成功
			$data = $info['Filedata'];

			echo json_encode($data);exit;
		}

	}
//	编辑分类
	public function edit(){
		$caid=I('get.newsart_id');
		if(IS_POST){
			if($this->model->where("newsart_id={$caid}")->edit())$this->success('修改成功',U('index'));
			$this->error($this->model->getError());
		}
		$oldData=$this->model->where("newsart_id={$caid}")->find();
		$this->assign('oldData',$oldData);
		//		处理所属分类
		$model=new \Common\Model\Cate;
		$cateData=$model->where("category_sid = 1")->field('category_name,category_id')->select();
		$this->assign('cateData',$cateData);
		//处理所属标签
		$model=new \Common\Model\Tag;
		$tagData=$model->where("tag_sid = 1")->field('tag_name,tag_id')->select();
		$this->assign('tagData',$tagData);
		$this->display();
	}
	
//	删除分类
	public function del(){
		$caid=I('get.newsart_id');
		$this->model->where("newsart_id={$caid}")->delete();
		$this->success('删除成功');
	}
	
}