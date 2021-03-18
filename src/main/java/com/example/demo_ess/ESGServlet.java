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

@WebServlet(name = "ESGServlet", urlPatterns = {"", "/"})
public class ESGServlet extends HttpServlet {
    User user = new User("test", "testpass");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

        /*ArrayList<Stock> stocks = user.getPortfolio();
        ArrayList<String> stocksString = null;

        for (Stock sOld : stocks) {
            stocksString.add(sOld.getName() + " : " + sOld.getESGStats().get("total"));
        }
         */

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stockIn = request.getParameter("stock");
        String error;

        // check to make sure they arent blank
        if(stockIn == null || stockIn.isBlank()) {
            error = "ERROR : the box is blank, please enter a stock ticker";

            // send error back to page
            request.setAttribute("error", error);
        }

        // perform calculation using a Java class
        else {
            Stock s = new Stock(stockIn);
            user.addStock(stockIn);
            if (!user.getPortfolio().contains(s)) {

                HashMap<String, String> infoReturn = new HashMap<String, String>();
                HashMap<String, String> priceReturn = new HashMap<String, String>();

                infoReturn = s.getESGStats();
                priceReturn = s.getStockPrice();

                String company = infoReturn.get("company_name");
                String esg = infoReturn.get("total");
                esg = esg.substring(0, esg.length() - 5);
                String letter = infoReturn.get("total_grade");
                String price = priceReturn.get("regularMarketPrice");
                int index = user.getIndex(s);

                ArrayList<Stock> port = user.getPortfolio();

                // send result back to page
                request.setAttribute("resultletter", letter);
                request.setAttribute("resultcompany", company);
                request.setAttribute("resultesg", esg);
                request.setAttribute("resultprice", "$" + price);
                request.setAttribute("allStocks", port);
                request.setAttribute("stockIndex", index);


            }
            else {
                error = "Stock already added, please pick a new one";
                request.setAttribute("error", error);
            }
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            //doGet(request, response);
        }

    }
}
