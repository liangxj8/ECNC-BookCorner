<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  if ("1".equals(session.getAttribute("logout")) || session.getAttribute("name") == null) {
    response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
    response.setHeader("Location", "/bcorner");
  }
%>
<%@ page import="ecnc.bcorner.userCenter"%>
<%@ page import="ecnc.bcorner.returnBook"%>
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
        <div id="myCarousel" class="carousel slide"
          style="margin-bottom: 20px;">
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0"
              class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img class="first-slide" src="img/img1.jpg"
                alt="First slide">
              <div class="container">
                <div class="carousel-caption">
                  <h3>小黑屋借书系统</h3>
                  <p>ECNC Book Corner</p>
                </div>
              </div>
            </div>
            <div class="item">
              <img class="second-slide" src="img/img2.jpg"
                alt="Second slide">
              <div class="container">
                <div class="carousel-caption">
                  <h3>全新发布</h3>
                  <p>Brand New Version</p>
                </div>
              </div>
            </div>
            <div class="item">
              <img class="third-slide" src="img/img3.jpg"
                alt="Third slide">
              <div class="container">
                <div class="carousel-caption">
                  <h3>已经上线</h3>
                  <p>Already Come!</p>
                </div>
              </div>
            </div>
          </div>
          <a class="left carousel-control" href="#myCarousel"
            role="button" data-slide="prev"> <span
            class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a> <a class="right carousel-control" href="#myCarousel"
            role="button" data-slide="next"> <span
            class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </div>
    <div class="row clearfix">
      <div class="col-md-3 column">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">概览</h3>
          </div>
          <ul class="list-group">
            <li class="list-group-item"><span class="badge"
              id="total">2</span> 历史借书总数</li>
            <li class="list-group-item"><span class="badge"
              id="my_total">0</span> 待还书数</li>
          </ul>
        </div>
      </div>
      <div class="col-md-6 column">
        <table class="table table-striped">
          <jsp:useBean id="userCenter" class="ecnc.bcorner.userCenter"
            scope="request" />
          <jsp:setProperty name="userCenter" property="privilege"
            value="<%=session.getAttribute(\"privilege\")%>" />
          <jsp:setProperty name="userCenter" property="userName"
            value="<%=session.getAttribute(\"name\")%>" />
          <jsp:getProperty name="userCenter" property="tableResult" />
        </table>
        <%
          if (request.getParameter("bid") != null && "管理员".equals(session.getAttribute("privilege"))) {
        %>
        <jsp:useBean id="returnBook" class="ecnc.bcorner.returnBook"
          scope="request" />
        <jsp:setProperty name="returnBook" property="bid"
          value="<%=request.getParameter(\"bid\")%>" />
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-8">
            <h4>
              <jsp:getProperty name="returnBook"
                property="updateMessage" />
            </h4>
          </div>
        </div>
        <%
          }
        %>
      </div>
      <div class="col-md-3 column">
        <div class="panel-group" id="accordion">
          <div class="panel panel-default">
            <div class="panel-heading">
              <a class="panel-title" data-toggle="collapse"
                data-parent="#accordion" href="#cllapse1">通知</a>
            </div>
            <div id="cllapse1" class="panel-collapse in">
              <div class="panel-body">广告位招租！</div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <a class="panel-title collapsed" data-toggle="collapse"
                data-parent="#accordion" href="#collapse2">七日内待还书目</a>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
              <div class="list-group">
                <a class="list-group-item"> group item 1 </a> <a
                  class="list-group-item"> group item 2 </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>