package ecnc.bcorner;

import java.sql.*;

/**
 * @author liangxj8 
 * ECNC BookCorner 快速搜索
 */
public class QuickSearch {
  String SQLstring;
  String tableResult;

  public QuickSearch() {
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
      if (result.next()) {
        if (result.getInt(6) == 1) {
          tableResult += "<tr>";
        } else {
          tableResult += "<tr class=\"danger\">";
        }
        tableResult += "<td style='text-align: center'>" + result.getString(1) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(2) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(3) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(4) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(5) + "</td>";
        if (result.getInt(6) == 1) {
          tableResult += "<td style='text-align: center'>在架上</td>";
        } else {
          tableResult += "<td style='text-align: center'>已借出</td>";
        }
        tableResult += "</tr>";
      } else {
        tableResult = "<tr><td></td><td></td><td style='text-align: center'>";
        tableResult += "未找到相关书目</td><td></td><td></td><td></td></tr>";
      }
      while (result.next()) {
        if (result.getInt(6) == 1) {
          tableResult += "<tr>";
        } else {
          tableResult += "<tr class=\"danger\">";
        }
        tableResult += "<td style='text-align: center'>" + result.getString(1) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(2) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(3) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(4) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(5) + "</td>";
        if (result.getInt(6) == 1) {
          tableResult += "<td style='text-align: center'>在架上</td>";
        } else {
          tableResult += "<td style='text-align: center'>已借出</td>";
        }
        tableResult += "</tr>";
      }

      con.close();
    } catch (SQLException e1) {
      tableResult = e1.toString();
    }
    return tableResult;
  }

}