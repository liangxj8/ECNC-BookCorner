package ecnc.bcorner;

import java.sql.*;
import java.util.*;

/**
 * @author liangxj8 
 * ECNC BookCorner 随机搜索
 */

public class RandomSearch {
  String databaseName = "bcorner";
  String tableName = "books";
  int count;
  int randomNumber = 10;
  StringBuffer randomQueryResult;
  Connection con;
  Statement sql;
  ResultSet resulet;

  public RandomSearch() {
    randomQueryResult = new StringBuffer();
    try {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (Exception e) {
      randomQueryResult = new StringBuffer();
      randomQueryResult.append("" + e);
    }
  }

  public String getDatabaseName() {
    return databaseName;
  }

  public String getTableName() {
    return tableName;
  }

  public int getRandomNumber() {
    return randomNumber;
  }

  public void setRandomNumber(int n) {
    this.randomNumber = n;
  }

  public int getCount() {
    try {
      String url = "jdbc:mysql://localhost:3306/" + databaseName + "?characterEncoding=utf8&useSSL=true";
      con = DriverManager.getConnection(url, "root", "Administrator");
      sql = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      resulet = sql.executeQuery("SELECT * FROM " + tableName);
      resulet.last();
      count = resulet.getRow();
      con.close();
    } catch (SQLException exp) {
      count = -1;
    }
    return count;
  }

  public StringBuffer getRandomQueryResult() {
    randomQueryResult = new StringBuffer();
    try {
      String url = "jdbc:mysql://localhost:3306/" + databaseName + "?characterEncoding=utf8&useSSL=true";
      con = DriverManager.getConnection(url, "root", "Administrator");
      DatabaseMetaData metadata = con.getMetaData();
      ResultSet resulet1 = metadata.getColumns(null, null, tableName, null);
      int attributeNum = 0;
      while (resulet1.next()) {
        attributeNum++;
      }
      randomQueryResult.append("<table class=\"table table-striped\"><thead><tr>");
      randomQueryResult.append("<th style='text-align: center'>编号</th>");
      randomQueryResult.append("<th style='text-align: center'>ISBN</th>");
      randomQueryResult.append("<th style='text-align: center'>书名</th>");
      randomQueryResult.append("<th style='text-align: center'>作者</th>");
      randomQueryResult.append("<th style='text-align: center'>出版社</th>");
      randomQueryResult.append("<th style='text-align: center'>状态</th>");
      randomQueryResult.append("</tr></thead><tbody>");

      sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
      resulet = sql.executeQuery("SELECT * FROM " + tableName);
      resulet.last();
      count = resulet.getRow();
      Vector<Integer> vector = new Vector<Integer>();
      for (int i = 1; i <= count; i++) {
        vector.add(new Integer(i));
      }
      int selectNum = Math.min(randomNumber, count);
      while (selectNum > 0) {
        int i = (int) (Math.random() * vector.size());
        int index = (vector.elementAt(i)).intValue(); // 在向量vector中随机抽取一个元素
        resulet.absolute(index); // 游标移到这一行
        if (resulet.getInt(attributeNum) == 1) {
          randomQueryResult.append("<tr>");
        } else {
          randomQueryResult.append("<tr class=\"danger\">");
        }
        for (int k = 1; k < attributeNum; k++) {
          randomQueryResult.append("<td style='text-align: center'>" + resulet.getString(k) + "</td>");
        }
        if (resulet.getInt(attributeNum) == 1) {
          randomQueryResult.append("<td style='text-align: center'>在架上</td>");
        } else {
          randomQueryResult.append("<td style='text-align: center'>已借出</td>");
        }
        randomQueryResult.append("</tr>");
        selectNum--;
        vector.removeElementAt(i); // 将抽取过的元素从向量中删除
      }      
      randomQueryResult.append("</tbody></table>");
      con.close();
    } catch (SQLException e) {
      randomQueryResult.append(e);
    }
    randomNumber = 0;
    return randomQueryResult;
  }
}