package ecnc.bcorner;

import java.sql.*;

/**
 * @author liangxj8 
 * ECNC BookCorner 借书
 */
public class borrow {
  String bid;
  String bookName;
  String userName;
  String addMessage;
  int m, n;

  public borrow() {
    this.bid = "";
    this.bookName = "";
    this.userName = "";
    this.addMessage = "";
    m = 0;
    n = 0;
  }

  public void setBid(String bid) {
    this.bid = bid;
  }

  public void setBookName(String bookName) {
    this.bookName = bookName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getAddMessage() {
    String insertCondition = "INSERT INTO borrowed(bid,bookName,userName,date_borrow,date_final)";
    insertCondition += "VALUES(\"" + bid + "\",\"" + bookName + "\",\"" + userName + "\",CURDATE(),CURDATE()+100)";
    String str = "";
    Connection con;
    Statement sql;
    try {
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bcorner?characterEncoding=utf8&useSSL=true",
          "root", "Administrator");
      sql = con.createStatement();
      if (userName.length() > 0) {
        m = sql.executeUpdate(insertCondition);
      } else {
        str = "必须要有借阅者";
      }
      con.close();
    } catch (SQLException e) {
      str += e;
    }
    String updateCondition = "UPDATE books SET available=0 WHERE bid=" + bid;
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
      str = "借阅成功";
    } else {
      str = "借阅失败";
    }
    return str;
  }
}