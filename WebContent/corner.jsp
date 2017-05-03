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
        <jsp:include page="navbar.jsp" />
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