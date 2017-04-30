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
      tableResult+=e;
    }
    try {
      String url = "jdbc:mysql://localhost:3306/bcorner";
      String user = "root";
      String password = "Administrator";
      con = DriverManager.getConnection(url, user, password);
      sql = con.createStatement();
      rs = sql.executeQuery("SELECT * FROM books");
      while (rs.next()) {
        if (rs.getInt(6) == 1) {
          tableResult+="<tr>";
        } else {
          tableResult+="<tr class=\"danger\">";
        }
        tableResult+="<td style='text-align: center'>" + rs.getString(1) + "</td>";
        tableResult+="<td style='text-align: center'>" + rs.getString(2) + "</td>";
        tableResult+="<td style='text-align: center'>" + rs.getString(3) + "</td>";
        tableResult+="<td style='text-align: center'>" + rs.getString(4) + "</td>";
        tableResult+="<td style='text-align: center'>" + rs.getString(5) + "</td>";
        if (rs.getInt(6) == 1) {
          tableResult+="<td style='text-align: center'>在架上</td>";
        } else {
          tableResult+="<td style='text-align: center'>已借出</td>";
        }
        tableResult+="</tr>";
      }
      con.close();
    } catch (SQLException e1) {
      tableResult+=e1;
    }
    return tableResult;
  }

}