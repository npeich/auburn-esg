package com.example.demo_ess;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "CalcServlet", urlPatterns = {"", "/"})
public class ESGServlet extends HttpServlet {
    User user = new User("nat", "password");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);


        ArrayList<Stock> stocks = user.getPortfolio();
        ArrayList<String> stocksString = null;

        for (Stock sOld : stocks) {
            stocksString.add(sOld.getName() + " : " + sOld.getESGStats().get("total"));
        }

        request.setAttribute("portfolio2", stocksString);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stockIn = request.getParameter("stock");

        String error;

        // check to make sure they arent blank
        if(stockIn == null || stockIn.isBlank()) {
            error = "ERROR : the box is blank, plese enter a stock ticker";

            // send error back to page
            request.setAttribute("error", error);
        }
        // perform calculation using a Java class
        else {
            user.addStock(stockIn);

            Stock s = new Stock(stockIn);

            HashMap<String, String> infoReturn = new HashMap<String, String>();
            HashMap<String, String> priceReturn = new HashMap<String, String>();

            infoReturn = s.getESGStats();
            priceReturn = s.getStockPrice();


            String company = stockIn.toUpperCase();
            String esg = infoReturn.get("total");
            String price = priceReturn.get("regularMarketPrice");
            String letter = infoReturn.get("total_grade");


            ArrayList<Stock> port = user.getPortfolio();

            String portfolio = "";

            for(Stock stockport : port) {
                portfolio += stockport.getName() + " : " + stockport.getESGStats().get("total_grade");
            }


            esg = esg.substring(0, esg.length() - 5);

            // send result back to page
            request.setAttribute("resultletter", letter);
            request.setAttribute("resultcompany", company);
            request.setAttribute("resultesg", esg);
            request.setAttribute("resultprice", "$"+price);
            request.setAttribute("allStocks", port);
            request.setAttribute("returnportfolio", portfolio);


        }

        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        doGet(request, response);
    }
}
