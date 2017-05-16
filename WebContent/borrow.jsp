<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  if ("1".equals(session.getAttribute("logout")) || session.getAttribute("name") == null) {
    response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
    response.setHeader("Location", "/bcorner");
  }
  if ("普通用户".equals(session.getAttribute("privilege"))) {
%>
<jsp:forward page="user.jsp" />
<%
  }
%>
<%@ page import="ecnc.bcorner.QuickSearch"%>
<%@ page import="ecnc.bcorner.borrow"%>
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
            <jsp:useBean id="QuickSearch"
              class="ecnc.bcorner.QuickSearch" scope="request" />
            <jsp:setProperty name="QuickSearch" property="privilege"
              value="<%=session.getAttribute(\"privilege\")%>" />
            <jsp:setProperty name="QuickSearch" property="SQLstring"
              value="<%=SQLstring%>" />
            <jsp:getProperty name="QuickSearch" property="tableResult" />
          </div>

          <div class="col-md-4 column" style="margin-top: 30px">
            <%
              if (request.getParameter("bid") != null && request.getParameter("bookName") != null) {
            %>
            <h3 style="text-align: middle">借书</h3>
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label for="inputAccount" class="col-sm-2 control-label">编号</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control"
                    id="inputAccount" name="bid"
                    value="<%=request.getParameter("bid")%>" />
                </div>
              </div>
              <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label">书名</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="inputName"
                    name="bookName"
                    value="<%=request.getParameter("bookName")%>" />
                </div>
              </div>
              <div class="form-group">
                <label for="inputPrivilege"
                  class="col-sm-2 control-label"></label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="inputName"
                    name="userName" placeholder="借阅者姓名" />
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                  <button type="submit" class="btn btn-default"
                    action="borrow.jsp">借阅</button>
                </div>
              </div>

              <%
                if (request.getParameter("userName") != null) {
              %>
              <jsp:useBean id="borrow" class="ecnc.bcorner.borrow"
                scope="request" />
              <jsp:setProperty name="borrow" property="bid"
                value="<%=request.getParameter(\"bid\")%>" />
              <jsp:setProperty name="borrow" property="bookName"
                value="<%=request.getParameter(\"bookName\")%>" />
              <jsp:setProperty name="borrow" property="userName"
                value="<%=request.getParameter(\"userName\")%>" />
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                  <h4>
                    <jsp:getProperty name="borrow" property="addMessage" />
                  </h4>
                </div>
              </div>
              <%
                }
              %>
            </form>
            <%
              }
            %>
          </div>
        </div>
      </div>
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>