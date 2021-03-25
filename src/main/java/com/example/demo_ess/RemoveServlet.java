package com.example.demo_ess;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RemoveServlet", value = "/RemoveServlet")
public class RemoveServlet extends HttpServlet {
    User user = new User("nat", "password");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String remove = request.getParameter("removeStock");
        user.removeStock(remove);

        PrintWriter writer = response.getWriter();

        // build HTML code
        String htmlRespone = "<html>";
        htmlRespone += "<h2>Your stock is: " + remove + "<br/>";
        htmlRespone += "</html>";

        // return response
        writer.println(htmlRespone);


        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
