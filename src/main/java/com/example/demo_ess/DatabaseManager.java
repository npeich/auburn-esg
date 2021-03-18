package com.example.demo_ess;
import java.util.ArrayList;
import javax.annotation.processing.Processor;
import javax.xml.crypto.Data;
import java.sql.*;
public class DatabaseManager {

    private Connection connect() {
        // SQLite connection string
        // C:\Users\tjoli\OneDrive\Documents\GitHub\ESGapplication\Customer.db
        // jdbc:sqlite:/Users/johnwood/IdeaProjects/auburn-esg/src/main/java/com/example/demo_ess/Customer.db

        String url = "jdbc:sqlite:/Users/johnwood/IdeaProjects/auburn-esg/src/main/java/com/example/demo_ess/Customer.db";
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
            System.out.println("Connection Successful\n");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }


    public void Test() {
        String sql = "INSERT INTO customer (username, password) Values (testu, testp)";
        try (Connection conn = this.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            // loop through the result set
            while (rs.next()) {
                System.out.println(rs.getInt("customerID") + "\t" +
                        rs.getString("username") + "\t" +
                        rs.getString("password"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public String select_Users(String username) {
        // SQL Statement
        String sql = "SELECT * FROM stock;";

        try (Connection connection = this.connect()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            StringBuilder output = new StringBuilder();
            output.append("Username,").append("\t").append("Password \n");

            while (resultSet.next()) {
                output.append(resultSet.getString("Username")).append("\t").append("\t").append(resultSet.getString("Password")).append("\n");
            }
            return output.toString();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "";
    }
    public ArrayList<Stock> loadAllStocks(String username) {
        // SQL Statement
        ArrayList<Stock> output = new ArrayList();
        String sql = "SELECT stockTicker FROM stock INNER JOIN " +
                "customer ON stock.customerID = customer.customerID;";

        try (Connection connection = this.connect()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);


            while (resultSet.next()) {
                output.add(new Stock(resultSet.getString("stockTicker")));
            }
            return output;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return output;
    }
    public void saveStock(String username, String stockTicker) {
        String sql = "insert into stock (customerID, stockTicker) values ((select customerID "
                + "from customer where username = '" + username + "'), '" + stockTicker.toUpperCase() + "');";
        try (Connection connection = this.connect()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public void deleteStock(String stockTicker) {
        String sql = "DELETE FROM stock WHERE stockTicker = '" + stockTicker.toUpperCase() + "';";
        try (Connection connection = this.connect()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public static void main(String[] args) {
        DatabaseManager app = new DatabaseManager();
        // app.Test();
        app.saveStock("test", "aapl");
        ArrayList<Stock> list = app.loadAllStocks("test");
        for (Stock stock : list) {
             System.out.println(stock.getName());
        }
    }
}

