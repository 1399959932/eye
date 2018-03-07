<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Administrator
 * Date: 16-2-29
 * Time: 下午5:48
 * To change this template use File | Settings | File Templates.
 */

namespace Admin\Controller;


use Think\Controller;

class CommonController extends Controller {
    //验证用户是否登录过
    public function __construct(){
        parent::__construct();//因为tp核心文件里面有__construct这个方法，所以为了区别，我们在这里直接把它设置为父类的方法
        if(isset($_POST['session_id'])){
            session('[pause]');                 //tp默认已经开启，先暂停
            session_id($_POST['session_id']);  //这个要在session_start()之前
            session('[start]');                 //再开启
        }
        if(!session("?username")){
            $this->error("你还没有进行登录，请登录",U("Login/index"),1);
            exit;
        }
    }

}