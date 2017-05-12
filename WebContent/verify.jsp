<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
  if ("0".equals(session.getAttribute("logout"))) {
    response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
    response.setHeader("Location","/bcorner");
  }
  String userAccount = request.getParameter("netid");
  String userPassword = request.getParameter("password");
  Connection con;
  Statement sql;
  ResultSet rs;
  try {
    Class.forName("com.mysql.jdbc.Driver");
  } catch (Exception e) {
    out.print(e);
  }
  try {
    String url = "jdbc:mysql://localhost:3306/bcorner?characterEncoding=utf8&useSSL=true";
    String user = "root";
    String password = "Administrator";
    con = DriverManager.getConnection(url, user, password);
    sql = con.createStatement();
    rs = sql.executeQuery("SELECT * from users where userAccount=\"" + userAccount + "\"");
    if (rs.next()) {
      if (userPassword.equals(rs.getString(3))) {
        session.setAttribute("name", rs.getString(4));
        session.setAttribute("privilege", rs.getString(5));
        session.setAttribute("logout", "0");
        response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
        response.setHeader("Location","/bcorner/");
      } else {
        session.setAttribute("logout", "1");
        response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
        response.setHeader("Location","/bcorner/index.jsp?error=1");
      }
    } else if (session.getAttribute("name") == null) {
      session.setAttribute("logout", "1");
      response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
      response.setHeader("Location","/bcorner/index.jsp?error=1");
    } else {
      session.setAttribute("logout", "1");
      response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
      response.setHeader("Location","/bcorner/index.jsp?error=1");
    }
    con.close();
  } catch (SQLException e1) {
    out.print(e1);
  }
%>