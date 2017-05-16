package ecnc.bcorner;

import java.sql.*;

/**
 * @author liangxj8 
 * ECNC BookCorner 还书
 */
public class returnBook {
  String bid;
  String updateMessage;
  int m, n;

  public returnBook() {
    this.bid = "";
    this.updateMessage = "";
    m = 0;
    n = 0;
  }

  public void setBid(String bid) {
    this.bid = bid;
  }

  public String getUpdateMessage() {
    String str = "";
    Connection con;
    Statement sql;
    String updateCondition = "UPDATE books SET available=1 WHERE bid=" + bid;
    try {
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bcorner?characterEncoding=utf8&useSSL=true",
          "root", "Administrator");
      sql = con.createStatement();
      m = sql.executeUpdate(updateCondition);
      con.close();
    } catch (SQLException e) {
      str += e;
    }
    updateCondition = "UPDATE borrowed SET returned=1 WHERE bid=" + bid;
    try {
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bcorner?characterEncoding=utf8&useSSL=true",
          "root", "Administrator");
      sql = con.createStatement();
      n = sql.executeUpdate(updateCondition);
      con.close();
    } catch (SQLException e) {
      str += e;
    }
    if (m != 0 && n != 0) {
      str = "还书成功";
    } else {
      str = "还书失败";
    }
    return str;
  }
}