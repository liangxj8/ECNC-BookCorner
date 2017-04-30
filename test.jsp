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
  <div class="container">
    <div class="row clearfix">
      <div class="col-md-12 column">
        <nav class="navbar navbar-default" role="navigation">        
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/bcorner">ECNC BookCorner</a></li>
            <li><a href="/bcorner">主页</a></li>
            <li><a href="/bcorner/corner.jsp">书库</a></li>
            <li><a href="/bcorner/user-management.jsp">用户管理</a></li>
          </ul>
          <form class="navbar-form navbar-left" role="search">
              <div class="form-group">
                <input type="text" class="form-control" 
                  placeholder="书名 | 作者 | 出版社 | ISBN" />
              </div> <button type="submit" class="btn btn-default">查询</button>
            </form>
            <ul class="nav navbar-nav">
              <li>
                 <a href="/bcorner/advanced-search.jsp">高级搜索</a>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">                
              <li>
                <a href="/bcorner/user.jsp">
                  <span class="glyphicon glyphicon-user"></span>
                    梁行健
                </a>
              </li>
              <li>
                <a href="/bcorner/login?logout=1">
                  <span class="glyphicon glyphicon-log-out"></span>
                    注销
                </a>
              </li>
              
            </ul>
          </div>          
        </nav>
        <div class="jumbotron">
          <h1>
            Hello, world!
          </h1>
          <p>
            ECNC 小黑屋借书系统
          </p>
          <p>
            全新上线！
          </p>
        </div>
        <div class="row clearfix">
        <div class="col-md-2 column">
        </div>
        <div class="col-md-8 column">
          <div class="btn-group">
              <button class="btn btn-default" type="button">
                录入图书
              </button>
              <button class="btn btn-default" type="button">
                删除图书
              </button>
              <button class="btn btn-default" type="button">
                修改图书信息
              </button>
          </div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>编号</th>
                  <th>书名</th>
                  <th>作者</th>
                  <th>出版社</th>
                  <th>状态</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>0</td>
                  <td>Book Name</td>
                  <td>Author</td>
                  <td>Press</td>
                  <td>Onself</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>Book Name</td>
                  <td>Author</td>
                  <td>Press</td>
                  <td>Onself</td>
                </tr>
                <tr class="danger">
                  <td>2</td>
                  <td>Book Name</td>
                  <td>Author</td>
                  <td>Press</td>
                  <td>Borrowed</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>Book Name</td>
                  <td>Author</td>
                  <td>Press</td>
                  <td>Onself</td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>Book Name</td>
                  <td>Author</td>
                  <td>Press</td>
                  <td>Onself</td>
                </tr>
              </tbody>
            </table>
          </div>
        <div class="col-md-2 column">
        </div>
      </div>        
      </div>
    </div>
  </div>

</body>
</html>