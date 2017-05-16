package ecnc.bcorner;

import java.sql.*;

/**
 * @author liangxj8 
 * ECNC BookCorner 用户管理
 */
public class userManagement {
  String tableResult;

  public userManagement() {
    tableResult = "";
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
      rs = sql.executeQuery("SELECT * FROM users");
      tableResult += "<thead><tr>";
      tableResult += "<th style='text-align: center'>用户账号</th>";
      tableResult += "<th style='text-align: center'>用户姓名</th>";
      tableResult += "<th style='text-align: center'>用户身份</th>";
      tableResult += "<th style='text-align: center'>操作</th>";
      tableResult += "</tr></thead><tbody>";
      while (rs.next()) {
        tableResult += "<td style='text-align: center'>" + rs.getString(2) + "</td>";
        tableResult += "<td style='text-align: center'>" + rs.getString(4) + "</td>";
        tableResult += "<td style='text-align: center'>" + rs.getString(5) + "</td>";
        if ("管理员".equals(rs.getString(5))) {
          tableResult += "<td style='text-align: center'><button type=\"button\"";
          tableResult += "class=\"btn btn-danger\" disabled>删除</button></td>";
        } else {
          tableResult += "<td style='text-align: center'><button type=\"button\"";
          tableResult += "class=\"btn btn-danger\"><a href=\"\" style='color: #ffffff'>";
          tableResult += "删除</a></button></td>";
        }
        tableResult += "</tr>";
      }
      tableResult += "</tbody>";
      con.close();
    } catch (SQLException e1) {
      tableResult += e1;
    }
    return tableResult;
  }

}