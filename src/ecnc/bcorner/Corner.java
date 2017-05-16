package ecnc.bcorner;

import java.sql.*;

/**
 * @author liangxj8 
 * ECNC BookCorner 书库
 */
public class Corner {
  String tableResult;

  public Corner() {
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
      rs = sql.executeQuery("SELECT * FROM books");
      tableResult += "<thead><tr>";
      tableResult += "<th style='text-align: center'>编号</th>";
      tableResult += "<th style='text-align: center'>ISBN</th>";
      tableResult += "<th style='text-align: center'>书名</th>";
      tableResult += "<th style='text-align: center'>作者</th>";
      tableResult += "<th style='text-align: center'>出版社</th>";
      tableResult += "<th style='text-align: center'>状态</th>";
      tableResult += "</tr></thead><tbody>";
      while (rs.next()) {
        if (rs.getInt(6) == 1) {
          tableResult += "<tr>";
        } else {
          tableResult += "<tr class=\"danger\">";
        }
        tableResult += "<td style='text-align: center'>" + rs.getString(1) + "</td>";
        tableResult += "<td style='text-align: center'>" + rs.getString(2) + "</td>";
        tableResult += "<td style='text-align: center'>" + rs.getString(3) + "</td>";
        tableResult += "<td style='text-align: center'>" + rs.getString(4) + "</td>";
        tableResult += "<td style='text-align: center'>" + rs.getString(5) + "</td>";
        if (rs.getInt(6) == 1) {
          tableResult += "<td style='text-align: center'>在架上</td>";
        } else {
          tableResult += "<td style='text-align: center'>已借出</td>";
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