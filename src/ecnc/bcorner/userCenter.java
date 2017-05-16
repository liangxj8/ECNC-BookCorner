package ecnc.bcorner;

import java.sql.*;

/**
 * @author liangxj8 
 * ECNC BookCorner 用户中心
 */
public class userCenter {
  String tableResult;
  String privilege;
  String userName;

  public userCenter() {
    tableResult = "";
    privilege = "普通用户";
    userName = "";
  }

  public void setPrivilege(String privilege) {
    this.privilege = privilege;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getTableResult() {
    Connection con;
    Statement sql;
    ResultSet rs;
    try {
      Class.forName("com.mysql.jdbc.Driver");
    } catch (Exception e) {
      tableResult += e;
    }
    try {
      String url = "jdbc:mysql://localhost:3306/bcorner?characterEncoding=utf8&useSSL=true";
      String user = "root";
      String password = "Administrator";
      con = DriverManager.getConnection(url, user, password);
      sql = con.createStatement();
      if ("管理员".equals(privilege)) {
        rs = sql.executeQuery("SELECT * FROM borrowed");
      } else {
        rs = sql.executeQuery("SELECT * FROM borrowed WHERE userName=\"" + userName + "\"");
      }
      tableResult += "<thead><tr>";
      tableResult += "<th style='text-align: center'>书名</th>";
      if ("管理员".equals(privilege)) {
        tableResult += "<th style='text-align: center'>借书人</th>";
      } else {
        tableResult += "<th style='text-align: center'>借入时间</th>";
      }
      tableResult += "<th style='text-align: center'>应还时间</th>";
      if ("管理员".equals(privilege)) {
        tableResult += "<th style='text-align: center'>操作</th>";
      }
      tableResult += "</tr></thead><tbody>";
      while (rs.next()) {
        if (rs.getInt(8) == 0) {
          tableResult += "<tr>";
          tableResult += "<td style='text-align: center'>" + rs.getString(3) + "</td>";
          if ("管理员".equals(privilege)) {
            tableResult += "<td style='text-align: center'>" + rs.getString(4) + "</td>";
          } else {
            tableResult += "<td style='text-align: center'>" + rs.getString(5) + "</td>";
          }
          tableResult += "<td style='text-align: center'>" + rs.getString(7) + "</td>";
          if ("管理员".equals(privilege)) {
            tableResult += "<td style='text-align: center'><button type=\"button\"";
            tableResult += "class=\"btn btn-primary\"><a href=\"/bcorner/user.jsp?bid=";
            tableResult += rs.getString(2) + "\" style='color: #ffffff'>";
            tableResult += "还书</a></button></td>";
          }
          tableResult += "</tr>";
        }
      }
      tableResult += "</tbody>";
      con.close();
    } catch (SQLException e1) {
      tableResult += e1;
    }
    return tableResult;
  }

}