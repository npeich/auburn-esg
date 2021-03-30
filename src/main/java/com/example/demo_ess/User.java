package com.example.demo_ess;

import java.util.Comparator;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Collections;

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
        ArrayList<Stock> stockPort = portfolio;
        return stockPort;
    }

    public Stock addStock(String stockTicker) {
        Stock stock = new Stock(stockTicker);
        if (stock.getESGStats() == null) {
            System.out.println("Invalid Ticker");
            return null;
        }
        for (Stock company : portfolio) {
            if (company.getName().equalsIgnoreCase(stockTicker)) {
                return null;
            }
        }
        portfolio.add(stock);
        return stock;
    }

    public void removeStock(String stockTicker) {
            for (Stock stock : portfolio) {
                if (stock.getName().equalsIgnoreCase(stockTicker)) {
                    portfolio.remove(stock);
                    return;
                }
            }
    }
    public ArrayList<Stock> sortEnvironmental() {
        ArrayList<Stock> sortedPort = new ArrayList<>(portfolio);
        Collections.sort(sortedPort, new Comparator<Stock>(){
            public int compare(Stock s1, Stock s2) {
                return s2.getESGStats().get("environment_score").compareToIgnoreCase(s1.getESGStats().get("environment_score"));
            }
        });
        return sortedPort;
    }
    public ArrayList<Stock> sortGovernance() {
        ArrayList<Stock> sortedPort = new ArrayList<>(portfolio);
        Collections.sort(sortedPort, new Comparator<Stock>(){
            public int compare(Stock s1, Stock s2) {
                return s2.getESGStats().get("governance_score").compareToIgnoreCase(s1.getESGStats().get("governance_score"));
            }
        });
        return sortedPort;
    }
    public ArrayList<Stock> sortSocial() {
        ArrayList<Stock> sortedPort = new ArrayList<>(portfolio);
        Collections.sort(sortedPort, new Comparator<Stock>(){
            public int compare(Stock s1, Stock s2) {
                return s2.getESGStats().get("social_score").compareToIgnoreCase(s1.getESGStats().get("social_score"));
            }
        });
        return sortedPort;
    }
    public String getAverageESG() {
        double score = 0;
        double stockScore;

        for (Stock stock : portfolio) {
            stockScore = Double.parseDouble(stock.getESGStats().get("total"));
            score += stockScore;
        }
        score = score / portfolio.size();
        String stringscore = String.valueOf(score);
        return stringscore;
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
                HashMap<String, String> ESG = stock.getESGStats();
                HashMap<String, String> price = stock.getStockPrice();
                System.out.println(ticker.toUpperCase());
                System.out.println("Company Name: " + ESG.get("company_name"));
                System.out.println("Total ESG Score: " + ESG.get("total") + " " + ESG.get("total_grade"));
                System.out.println("Environmental: " + ESG.get("environment_score") + " " + ESG.get("environment_grade"));
                System.out.println("Social: " + ESG.get("social_score") + " " + ESG.get("social_grade"));
                System.out.println("Governance: " + ESG.get("governance_score") + " " + ESG.get("governance_grade"));
                System.out.println("Price: " + price.get("price"));
                System.out.println("Volume: " + price.get("total_vol"));
                System.out.println("Change: " + price.get("change_point") + " -> " + price.get("change_percentage") + "%");
                System.out.println("" + user.getAverageESG());
            }
            if (action.equals("p")) {
                ArrayList<Stock> portfolio = user.getPortfolio();
                for (Stock stock : portfolio) {
                    System.out.println(stock.stockTicker.toUpperCase() + "   " + stock.getESGStats().get("total"));
                }
                System.out.println(user.getAverageESG());
            }
            if (action.equals("r")) {
                System.out.println("Enter Stock Ticker: ");
                String remTicker = input.next();
                user.removeStock(remTicker);
            }
            if (action.equals("s")) {
                ArrayList<Stock> portfolio = user.sortGovernance();
                for (Stock stock : portfolio) {
                    System.out.println(stock.stockTicker.toUpperCase() + "   " + stock.getESGStats().get("governance_score"));
                }
                System.out.println(user.getAverageESG());
            }
        }
    }
}

