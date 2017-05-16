package ecnc.bcorner;

import java.sql.*;

/**
 * @author liangxj8 
 * ECNC BookCorner 快速搜索
 */
public class QuickSearch {
  String SQLstring;
  String tableResult;
  String privilege;

  public QuickSearch() {
    tableResult = "";
    privilege = "普通用户";
  }

  public void setPrivilege(String privilege) {
    this.privilege = privilege;
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
      if ("普通用户".equals(privilege)) {
        tableResult += "<th style='text-align: center'>ISBN</th>";
      }
      tableResult += "<th style='text-align: center'>书名</th>";
      tableResult += "<th style='text-align: center'>作者</th>";
      if ("普通用户".equals(privilege)) {
        tableResult += "<th style='text-align: center'>出版社</th>";
      }
      tableResult += "<th style='text-align: center'>状态</th>";
      if ("管理员".equals(privilege)) {
        tableResult += "<th style='text-align: center'>操作</th>";
      }
      tableResult += "</tr></thead><tbody>";
      if (result.next()) {
        if (result.getInt(6) == 1 || "管理员".equals(privilege)) {
          tableResult += "<tr>";
        } else {
          tableResult += "<tr class=\"danger\">";
        }
        tableResult += "<td style='text-align: center'>" + result.getString(1) + "</td>";
        if ("普通用户".equals(privilege)) {
          tableResult += "<td style='text-align: center'>" + result.getString(2) + "</td>";
        }
        tableResult += "<td style='text-align: center'>" + result.getString(3) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(4) + "</td>";
        if ("普通用户".equals(privilege)) {
          tableResult += "<td style='text-align: center'>" + result.getString(5) + "</td>";
        }
        if (result.getInt(6) == 1) {
          tableResult += "<td style='text-align: center'>在架上</td>";
          if ("管理员".equals(privilege)) {
            tableResult += "<td style='text-align: center'><button type=\"button\"";
            tableResult += "class=\"btn btn-primary\"><a href=\"/bcorner/borrow.jsp?bid=";
            tableResult += result.getString(1) + "&bookName=" + result.getString(3) + "\" style='color: #ffffff'>";
            tableResult += "借书</a></button></td>";
          }
        } else {
          tableResult += "<td style='text-align: center'>已借出</td>";
          if ("管理员".equals(privilege)) {

            tableResult += "<td style='text-align: center'><button type=\"button\"";
            tableResult += "class=\"btn btn-warning\" disabled>借书</button></td>";
          }
        }
        tableResult += "</tr>";
      } else {
        tableResult = "<tr><td></td><td></td><td style='text-align: center'>";
        tableResult += "未找到相关书目</td><td></td><td></td><td></td></tr>";
      }
      while (result.next()) {
        if (result.getInt(6) == 1 || "管理员".equals(privilege)) {
          tableResult += "<tr>";
        } else {
          tableResult += "<tr class=\"danger\">";
        }
        tableResult += "<td style='text-align: center'>" + result.getString(1) + "</td>";
        if ("普通用户".equals(privilege)) {
          tableResult += "<td style='text-align: center'>" + result.getString(2) + "</td>";
        }
        tableResult += "<td style='text-align: center'>" + result.getString(3) + "</td>";
        tableResult += "<td style='text-align: center'>" + result.getString(4) + "</td>";
        if ("普通用户".equals(privilege)) {
          tableResult += "<td style='text-align: center'>" + result.getString(5) + "</td>";
        }
        if (result.getInt(6) == 1) {
          tableResult += "<td style='text-align: center'>在架上</td>";
          if ("管理员".equals(privilege)) {
            tableResult += "<td style='text-align: center'><button type=\"button\"";
            tableResult += "class=\"btn btn-primary\"><a href=\"/bcorner/borrow.jsp?bid=";
            tableResult += result.getString(1) + "&bookName=" + result.getString(3) + "\" style='color: #ffffff'>";
            tableResult += "借书</a></button></td>";
          }
        } else {
          tableResult += "<td style='text-align: center'>已借出</td>";
          if ("管理员".equals(privilege)) {

            tableResult += "<td style='text-align: center'><button type=\"button\"";
            tableResult += "class=\"btn btn-warning\" disabled>借书</button></td>";
          }
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