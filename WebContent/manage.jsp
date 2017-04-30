<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>小黑屋借书系统</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">
      <h3 class="text-center">
        小黑屋图书管理系统
      </h3>
    </div>
  </div>
  <div class="row-fluid">
    <div class="span4">
    </div>
    <div class="span4">
      <form class="form-horizontal">
        <div class="control-group">
           <label class="control-label" for="inputEmail">Email</label>
          <div class="controls">
            <input id="inputEmail" type="text" />
          </div>
        </div>
        <div class="control-group">
           <label class="control-label" for="inputPassword">密码</label>
          <div class="controls">
            <input id="inputPassword" type="password" />
          </div>
        </div>
        <div class="control-group">
          <div class="controls">
             <label class="checkbox"><input type="checkbox" /> 记住我</label> <button type="submit" class="btn">登陆</button>
          </div>
        </div>
      </form>
    </div>
    <div class="span4">
    </div>
  </div>
</div>
</body>
</html>