package dk.cphbusiness.dbd.sql;

import java.sql.*;
import java.util.Properties;

public class Program {
  public static void main(String[] args) throws Exception {
    String url = "jdbc:postgresql://localhost/soft2021";
    Properties props = new Properties();
    props.setProperty("user","softdbd");
    props.setProperty("password","softdbd");
    try (Connection conn = DriverManager.getConnection(url, props)) {
      String sql = "select * from EXAMPLE;";
      PreparedStatement statement = conn.prepareStatement(sql);
      try(ResultSet result = statement.executeQuery()) {
        while (result.next()) {
          System.out.println(""+result.getInt(1)+" "+result.getString(2));
          }
        }
      }



    //String url = "jdbc:postgresql://localhost/test?user=fred&password=secret&ssl=true";
    //Connection conn = DriverManager.getConnection(url);
    }

}
