<?php
return array(
	//'配置项'=>'配置值'
	'TMPL_PARSE_STRING' =>array(
    //后台模板替换原则,MODULE_NAME当前模块名称,APP_NAME是在入口文件index.php中指定的常量
    //通过这样的方式，我们又回到thinkphp3.1.3中模板替换原则
// '__CSS__'=>__ROOT__.'/'.APP_NAME.'/'.MODULE_NAME.'/View/Public/css',
// '__JS__'=>__ROOT__.'/'.APP_NAME.'/'.MODULE_NAME.'/View/Public/js',
// '__IMG__'=>__ROOT__.'/'.APP_NAME.'/'.MODULE_NAME.'/View/Pubic/images',
   '__PUBLIC__'=>__ROOT__.'/Public',
    ),
    // //数据库配置文件
    // 'DB_TYPE'               =>  'mysql',     // 数据库类型
    // 'DB_HOST'               =>  '127.0.0.1', // 服务器地址
    // 'DB_NAME'               =>  'mydb',          // 数据库名
    // 'DB_USER'               =>  'root',      // 用户名
    // 'DB_PWD'                =>  '',          // 密码
    // 'DB_PORT'               =>  '',        // 端口
    // 'DB_PREFIX'             =>  '',    // 数据库表前缀
);