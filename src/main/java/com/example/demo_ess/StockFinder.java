package com.example.demo_ess;

public class StockFinder {

    public static String company (String s) {
        if(s.equals("hd")) {
            return "Home Depot";
        }
        if(s.equals("amzn")) {
            return "Amazon";
        }
        return s;
    }

    public static String ESGScore (String s) {
        if(s.equals("hd")) {
            return "ESG score = 800";
        }
        if(s.equals("amzn")) {
            return "ESG score = 642";
        }

        return "ESG score for " + s + "= ???";
    }

    public static String Price (String s) {
        if(s.equals("hd")) {
            return "Stock Price = $200";
        }
        if(s.equals("amzn")) {
            return "Stock Price = $1000";
        }
        return "Stock price for " + s + " is infinity dollars";
    }

    public static String Letter (String s) {
        if(s.equals("hd")) {
            return "BBB";
        }
        if(s.equals("amzn")) {
            return "B";
        }
        return "F";
    }
}
