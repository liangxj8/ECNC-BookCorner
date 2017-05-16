package ecnc.bcorner;

import java.sql.*;

/**
 * @author liangxj8 
 * ECNC BookCorner 借书
 */
public class book {
  String SQLstring;
  String tableResult;

  public book() {
    tableResult = "";
  }

  public String getSQLstring() {
    return SQLstring;
  }

  public void setSQLstring(String SQLstring) {
    this.SQLstring = SQLstring;
  }

  public String getTableResult() {
    Connection con;
    Statement sql;
    ResultSet result;
    try {
      Class.forName("com.mysql.jdbc.Driver");
    } catch (Exception e) {
      tableResult = e.toString();
    }
    try {
      String url = "jdbc:mysql://localhost:3306/bcorner?characterEncoding=utf8&useSSL=true";
      String user = "root";
      String password = "Administrator";
      con = DriverManager.getConnection(url, user, password);
      sql = con.createStatement();
      result = sql.executeQuery(SQLstring);
      tableResult += "<table class=\"table table-striped\"><thead><tr>";
      tableResult += "<th style='text-align: center'>编号</th>";
      tableResult += "<th style='text-align: center'>书名</th>";
      tableResult += "<th style='text-align: center'>作者</th>";
      tableResult += "<th style='text-align: center'>状态</th>";
      tableResult += "<th style='text-align: center'>操作</th>";
      tableResult += "</tr></thead><tbody>";
      if (result.next()) {
        tableResult += "<tr>";
        tableResult += "<td style='text-align: center'>" + result.getString(1) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(3) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(4) + "</td>";
        if (result.getInt(6) == 1) {
          tableResult += "<td style='text-align: center'>在架上</td>";
          tableResult += "<td style='text-align: center'><button type=\"button\"";
          tableResult += "class=\"btn btn-primary\"><a href=\"\" style='color: #ffffff'>";
          tableResult += "借书</a></button></td>";
        } else {
          tableResult += "<td style='text-align: center'>已借出</td>";
          tableResult += "<td style='text-align: center'><button type=\"button\"";
          tableResult += "class=\"btn btn-warning\" disabled>借书</button></td>";
        }
        tableResult += "</tr>";
      } else {
        tableResult = "<tr><td></td><td></td><td style='text-align: center'>";
        tableResult += "未找到相关书目</td><td></td><td></td><td></td></tr>";
      }
      while (result.next()) {
        tableResult += "<tr>";
        tableResult += "<td style='text-align: center'>" + result.getString(1) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(3) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(4) + "</td>";
        if (result.getInt(6) == 1) {
          tableResult += "<td style='text-align: center'>在架上</td>";
          tableResult += "<td style='text-align: center'><button type=\"button\"";
          tableResult += "class=\"btn btn-primary\"><a href=\"\" style='color: #ffffff'>";
          tableResult += "借书</a></button></td>";
        } else {
          tableResult += "<td style='text-align: center'>已借出</td>";
          tableResult += "<td style='text-align: center'><button type=\"button\"";
          tableResult += "class=\"btn btn-warning\" disabled>借书</button></td>";
        }
        tableResult += "</tr>";
      }
      tableResult += "</tbody></table>";
      con.close();
    } catch (SQLException e1) {
      tableResult = e1.toString();
    }
    return tableResult;
  }

}