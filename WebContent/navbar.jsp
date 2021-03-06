<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  if ("1".equals(session.getAttribute("logout")) || session.getAttribute("name") == null) {
    response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
    response.setHeader("Location", "/bcorner");
  }
%>
<nav class="navbar navbar-default" role="navigation">
  <div class="collapse navbar-collapse"
    id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li class="active"><a href="/bcorner">ECNC BookCorner</a></li>
      <li><a href="/bcorner">主页</a></li>
      <li><a href="/bcorner/corner.jsp">书库</a></li>
      <%
        if ("管理员".equals(session.getAttribute("privilege"))) {
      %>
      <li><a href="/bcorner/user-management.jsp">用户管理</a></li>
    </ul>
    <form class="navbar-form navbar-left" role="search"
      action="borrow.jsp">
      <%
        } else {
      %>
      </ul>
      <form class="navbar-form navbar-left" role="search"
        action="quickSearch.jsp">
        <%
          }
        %>
        <div class="form-group">
          <input type="text" class="form-control" name="keyword"
            size="22" placeholder="书名 | 作者 | 出版社 | ISBN" />
        </div>
        <button type="submit" class="btn btn-default">查询</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/bcorner/user.jsp"> <span
            class="glyphicon glyphicon-user"></span> <%=session.getAttribute("name")%>
        </a></li>
        <li><a href="/bcorner/index.jsp?logout=1"> <span
            class="glyphicon glyphicon-log-out"></span> 注销
        </a></li>
      </ul>
  </div>
</nav>