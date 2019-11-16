/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
/**
 *
 * @author Nitesh Kr
 */
@WebServlet(urlPatterns = {"/generateTicket"})
public class generateTicket extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
       throws ServletException, IOException, ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
       response.setContentType("text/html;charset=UTF-8");
       String movie_name=request.getParameter("movie_name");
       String theatre_name=request.getParameter("theatre_name");
       String slot=request.getParameter("slot");
       String date=request.getParameter("date");
       String screen=request.getParameter("screen_id");
       String timing=request.getParameter("timing");
       String amount=request.getParameter("amount");
       String client_seats=request.getParameter("client_seats");
       String seats_reserved=request.getParameter("tt");
       PrintWriter out =response.getWriter();
       HttpSession session=request.getSession();
       SimpleDateFormat stf=new SimpleDateFormat("yyyy-MM-dd");
       Date d=new Date();
       String curr_date=stf.format(d);
       stf=new SimpleDateFormat("HH:mm");
       String curr_time=stf.format(d);
       PrintWriter pw=response.getWriter();
       pw.print("date is "+curr_date +"time is "+curr_time+"reserved is"+seats_reserved+"movie_name is "+movie_name);
       
       
       Random random=new Random();
       long start=1000000000L;
       long range=9999999999L;
       long fraction=(long) (range*(random.nextDouble()));
       long number=fraction+start;
       
       
       
       
       
       
       
       Connection con=ConnectDB.getConnectDB();
       PreparedStatement ps=con.prepareStatement("insert into ticket values(?,?,?,?,?,?,?,?,?,?,?)");
       ps.setString(1, (String) session.getAttribute("id"));
       ps.setString(2, theatre_name);
       ps.setString(3, movie_name);
       ps.setString(4, amount);
       ps.setString(5, Long.toString(number));
       ps.setString(6, curr_date);
       ps.setString(7, curr_time);
       ps.setString(8, date);
       ps.setString(9, timing);
       ps.setString(10, client_seats);
       ps.setString(11, slot);
       ps.executeUpdate();
       ps=con.prepareStatement("Update time_slots set seat_booked=? where timing=? and slot_id=?");
       ps.setString(1, seats_reserved);
       ps.setString(2, timing);
       ps.setString(3, slot);
       ps.executeUpdate();
       out.print("SELECT movie_primary  from movie where movie_name like %"+movie_name+"");
       PreparedStatement ts=con.prepareStatement("SELECT movie_primary  from movie where movie_name =?");
       ts.setString(1,movie_name);
       ResultSet rs=ts.executeQuery();
       
       while(rs.next())
       {out.print("rs is"+rs.getString(1));
       request.setAttribute("movie_image",rs.getString(1));
       
       
       }
       request.setAttribute("booking_id",Long.toString(number));
       request.getRequestDispatcher("generateTicket.jsp?s=1").forward(request, response);

       
       
       
      
     
      
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(generateTicket.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            PrintWriter pw=response.getWriter();
            pw.print(ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
