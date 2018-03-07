<?php  
namespace Home\Controller;  
use Think\Controller; 
class CommonController extends Controller {  

    public function __construct(){
        parent::__construct();  
       //陈3.1古籍和最新项目
        $Ancient = M('eye_medart') -> field('medart_title, medart_pic, medart_time, medart_id') -> order('medart_reading desc') -> limit(2)->select();
      
        foreach ($Ancient as $k => $va) {
            $Ancient[$k]['medart_time'] = date('Y-m-d', $Ancient[$k]['medart_time']);
        }
        $this->assign('Ancient', $Ancient);
        // dump($Ancient);

        $rescue = M('eye_rescue') -> field('rescue_pic, rescue_id ,rescue_time') -> order('rescue_time desc') -> limit(8) -> select();
        foreach ($rescue as $k => $va) {
            $rescue[$k]['rescue_time'] = date('Y-m-d', $rescue[$k]['rescue_time']);
        }
        $this -> assign('rescue', $rescue);
        // dump($rescue);

    }

     
 //    public function __construct() {  
 //    	dump(1);
 //    	$this-> display('Common/footer');
 //    }  

	// public function index(){
	// 	$this -> display();
	// }

 //     public function footer() {  
     	
 //    	dump(1);
 //    	// echo "index page";  
 //    	$this-> display();
 //    }  
  
} 

