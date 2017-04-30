<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="ecnc.bcorner.Corner" %>
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
  <div class="container">
    <div class="row clearfix">
      <div class="col-md-12 column">
        <nav class="navbar navbar-default" role="navigation">
        <div class="collapse navbar-collapse"
          id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><a href="/bcorner">ECNC BookCorner</a></li>
            <li><a href="/bcorner">主页</a></li>
            <li class="active"><a href="/bcorner/corner.jsp">书库</a></li>
            <li><a href="/bcorner/user-management.jsp">用户管理</a></li>
          </ul>
          <form class="navbar-form navbar-left" role="search"
            action="quickSearch.jsp">
            <div class="form-group">
              <input type="text" class="form-control" name="keyword" size="22"
                placeholder="书名 | 作者 | 出版社 | ISBN" />
            </div>
            <button type="submit" class="btn btn-default">查询</button>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/bcorner/user.jsp"> <span
                class="glyphicon glyphicon-user"></span> 梁行健
            </a></li>
            <li><a href="/bcorner/login?logout=1"> <span
                class="glyphicon glyphicon-log-out"></span> 注销
            </a></li>

          </ul>
        </div>
        </nav>
        <div class="row clearfix">
          <div class="col-md-12 column">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th style='text-align: center'>编号</th>
                  <th style='text-align: center'>ISBN</th>
                  <th style='text-align: center'>书名</th>
                  <th style='text-align: center'>作者</th>
                  <th style='text-align: center'>出版社</th>
                  <th style='text-align: center'>状态</th>
                </tr>
              </thead>
              <tbody>
                <jsp:useBean id="Corner"
                  class="ecnc.bcorner.Corner" scope="request" />
                <jsp:getProperty name="Corner" property="tableResult" />
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>