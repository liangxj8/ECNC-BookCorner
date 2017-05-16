<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  if ("1".equals(session.getAttribute("logout")) || session.getAttribute("name") == null) {
    session.setAttribute("logout", "1");
    response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
    response.setHeader("Location", "/bcorner");
  }
  if ("普通用户".equals(session.getAttribute("privilege"))) {
%>
<jsp:forward page="user.jsp" />
<%
  }
%>
<%@ page import="ecnc.bcorner.user"%>
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
      </div>
      <div class="col-md-2 column"></div> 
      <div class="col-md-6 column">
        <table class="table table-striped">
          <jsp:useBean id="user" class="ecnc.bcorner.user"
            scope="request" />
          <jsp:getProperty name="user" property="tableResult" />
        </table>
      </div>
      <div class="col-md-4 column">
        <form class="form-horizontal" role="form">
          <div class="form-group">
            <label for="inputAccount" class="col-sm-2 control-label">NetID</label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="inputAccount"/>
            </div>
          </div>
          <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="inputName"/>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPrivilege" class="col-sm-2 control-label">身份</label>
            <div class="col-sm-8">
              <select type="text" class="form-control"
                id="inputPrivilege">
                <option value="普通用户">普通用户</option>
                <option value="管理员">管理员</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
              <button type="submit" class="btn btn-default">添加</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>