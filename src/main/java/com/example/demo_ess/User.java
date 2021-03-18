package com.example.demo_ess;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.Scanner;

public class User {
    public String username;
    public ArrayList<Stock> portfolio;
    public String password;

    User(String usernameIn, String passwordIn) {
        this.username = usernameIn;
        this.password = passwordIn;
        this.portfolio = new ArrayList<Stock>();
    }

    public ArrayList<Stock> getPortfolio() {
        System.out.println("Portfolio");
        for (Stock stock : portfolio)
            System.out.println(stock.stockTicker.toUpperCase() + "   " + stock.getESGStats().get("total"));
        return portfolio;
    }

    public Stock addStock(String stockTicker) {
        Stock stock = new Stock(stockTicker);
        if (stock.getESGStats() == null) {
            System.out.println("Invalid Ticker");
            return null;
        }
        portfolio.add(stock);
        HashMap<String,String> ESG = stock.getESGStats();
        HashMap<String,String> price = stock.getStockPrice();
        System.out.println(stockTicker.toUpperCase());
        System.out.println("Company Name: " + ESG.get("company_name"));
        System.out.println("Total ESG Score: " + ESG.get("total") + " " + ESG.get("total_grade"));
        System.out.println("Environmental: " + ESG.get("environment_score") + " " + ESG.get("environment_grade"));
        System.out.println("Social: " + ESG.get("social_score") + " " + ESG.get("social_grade"));
        System.out.println("Governance: " + ESG.get("governance_score") + " " + ESG.get("governance_grade"));
        System.out.println("Price: " + price.get("regularMarketPrice"));
        System.out.println("Open: " + price.get("regularMarketOpen"));
        System.out.println("Change: " + price.get("Change") + " -> " + price.get("regularMarketChangePercent") + "%");
        return stock;
    }



    public void removeStock(String stockTicker) {
    }
    public ArrayList<Stock> sortEnvironmental() {
        return null;
    }
    public ArrayList<Stock> sortGovernance() {
        return null;
    }
    public ArrayList<Stock> sortSocial() {
        return null;
    }
    public double getAverageESG() {
        return 0.0;
    }
    public ArrayList<Stock> getRecomendations(double lowBound, double upperBound) {
        return null;
    }
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter Username: ");
        String username = input.next();
        System.out.println("Enter Password: ");
        String password = input.next();
        User user = new User(username, password);
        String action = "";
        while (!action.equals("e")) {
            System.out.println("\nWould you like to add a stock (a), view portfolio (p), or exit (e)?\n");
            action = input.next();
            if (action.equals("a")) {
                System.out.println("Enter Stock Ticker: ");
                String ticker = input.next();
                Stock stock = user.addStock(ticker);
            }
            if (action.equals("p")) {
                ArrayList<Stock> portfolio = user.getPortfolio();
            }
        }


    }
}
