package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class reserve_005fvenue_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Book a Venue</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div>Reserve Venue</div>\n");
      out.write("        <form action=\"reserve_venueprocessing.jsp\">\n");
      out.write("            Reservation Date: <input type=\"date\" id=\"reservation_date\" name=\"reservation_date\"><br>\n");
      out.write("            \n");
      out.write("            Venue ID: \n");
      out.write("            ");
      data_management.venue V = null;
      synchronized (session) {
        V = (data_management.venue) _jspx_page_context.getAttribute("V", PageContext.SESSION_SCOPE);
        if (V == null){
          V = new data_management.venue();
          _jspx_page_context.setAttribute("V", V, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\n");
      out.write("            <select name=\"venue_id\">\n");
      out.write("                ");

                    List<Integer> venueIds = V.all_venue();
                    for (int venueId : venueIds) {
                
      out.write("\n");
      out.write("                    <option value=\"");
      out.print(venueId);
      out.write('"');
      out.write('>');
      out.print(venueId);
      out.write("</option>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </select><br>\n");
      out.write("            \n");
      out.write("            ");
      data_management.customer C = null;
      synchronized (session) {
        C = (data_management.customer) _jspx_page_context.getAttribute("C", PageContext.SESSION_SCOPE);
        if (C == null){
          C = new data_management.customer();
          _jspx_page_context.setAttribute("C", C, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\n");
      out.write("            Customer ID:\n");
      out.write("            <select name=\"customer_id\">\n");
      out.write("                ");

                    List<Integer> customerIds = C.all_customers();
                    for (int customerId : customerIds) {
                
      out.write("\n");
      out.write("                    <option value=\"");
      out.print(customerId);
      out.write('"');
      out.write('>');
      out.print(customerId);
      out.write("</option>\n");
      out.write("                ");
  }
                
      out.write("\n");
      out.write("            </select><br>\n");
      out.write("            <input type=\"submit\" value=\"Submit\">\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
