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
<%@ page import="ecnc.bcorner.book"%>
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
          <div class="col-md-2 column"></div>
          <div class="col-md-8 column">
            <%
              String keyword = "";
              String SQLstring = "";
              keyword += request.getParameter("keyword");
              if (keyword.length() != 0 && !keyword.equals("null")) {
                out.print(SQLstring);
                SQLstring += "SELECT * FROM books WHERE name like '%" + keyword + "%' OR author like '%" + keyword
                    + "%' OR press like '%" + keyword + "%' OR ISBN like '%" + keyword + "%'";
              } else {
                SQLstring += "SELECT * FROM books";
              }
            %>
            <jsp:useBean id="book" class="ecnc.bcorner.book"
              scope="request" />
            <jsp:setProperty name="book" property="SQLstring"
              value="<%=SQLstring%>" />
            <jsp:getProperty name="book" property="tableResult" />
          </div>        
          <div class="col-md-2 column"></div>
        </div>
      </div>
    </div>
  </div>
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>