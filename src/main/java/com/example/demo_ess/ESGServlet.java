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
    User user = new User("nat", "password");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        //requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stockIn = request.getParameter("stock");

        String toDelete = request.getParameter("toRemove");
        System.out.println("hey this is the stock i want to delete: " + toDelete);
        String error;

        if(toDelete!=null) {
            System.out.println("trying to delete");
            user.removeStock(toDelete);
            ArrayList<Stock> port = user.getPortfolio();
            request.setAttribute("allStocks", port);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            //System.out.println("tried to send get request");
            //user.getPortfolio();
        }

        String sorter = request.getParameter("sort");

        if(sorter != null) {
            if(sorter.equals("D")) {
                System.out.println("sorting by default (" + sorter + ")");
                ArrayList<Stock> port = user.getPortfolio();
                request.setAttribute("allStocks", port);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
            if(sorter.equals("E")) {
                System.out.println("sorting by environmental (" + sorter + ")");
                ArrayList<Stock> eport = user.sortEnvironmental();
                request.setAttribute("allStocks", eport);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }

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

                HashMap<String, String> infoReturn = new HashMap<String, String>();
                HashMap<String, String> priceReturn = new HashMap<String, String>();

                infoReturn = s.getESGStats();
                priceReturn = s.getStockPrice();

                String company = infoReturn.get("company_name");
                String esg = infoReturn.get("total");
                String letter = infoReturn.get("total_grade");

                String average = user.getAverageESG();

                ArrayList<Stock> port = user.getPortfolio();

                // send result back to page
                request.setAttribute("user", user);
                request.setAttribute("resultletter", letter);
                request.setAttribute("resultcompany", company);
                request.setAttribute("resultesg", esg);
                request.setAttribute("allStocks", port);
                request.setAttribute("average", average);

            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }
}
