package com.example.demo_ess;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;

@WebServlet(name = "CalcServlet", urlPatterns = {"", "/"})
public class ESGServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
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

            Stock s = new Stock(stockIn);

            HashMap<String, String> infoReturn = new HashMap<String, String>();
            HashMap<String, String> priceReturn = new HashMap<String, String>();

            infoReturn = s.getESGStats();
            priceReturn = s.getStockPrice();

            //String stockinfo = infoReturn.get("total");

            String company = stockIn.toUpperCase();
            String esg = infoReturn.get("total");
            String price = priceReturn.get("regularMarketPrice");
            String letter = infoReturn.get("total_grade");

            esg = esg.substring(0, esg.length() - 5);

            // send result back to page
            //request.setAttribute("resultESGCall", pleaseWork);
            request.setAttribute("resultletter", letter);
            request.setAttribute("resultcompany", company);
            request.setAttribute("resultesg", esg);
            request.setAttribute("resultprice", "$"+price);
        }

        request.setAttribute("numberA", stockIn);
        //request.setAttribute("numberB", numB);

        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
