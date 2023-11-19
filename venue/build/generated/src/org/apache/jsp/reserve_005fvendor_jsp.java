package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class reserve_005fvendor_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div>Reserve Vendor</div>\n");
      out.write("        <form action=\"reserve_vendorprocessing.jsp\">\n");
      out.write("            Event Date: <input type=\"date\" id=\"event_date\" name=\"event_date\"><br>\n");
      out.write("            Number of sets: <input type=\"number\" id=\"sets_ordered\" name=\"sets_ordered\"><br>\n");
      out.write("            \n");
      out.write("            Venue ID: \n");
      out.write("            ");
      data_management.vendor VE = null;
      synchronized (session) {
        VE = (data_management.vendor) _jspx_page_context.getAttribute("VE", PageContext.SESSION_SCOPE);
        if (VE == null){
          VE = new data_management.vendor();
          _jspx_page_context.setAttribute("VE", VE, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\n");
      out.write("            <select name=\"venue_id\">\n");
      out.write("                ");

                    List<Integer> venueIds = VE.all_vendor();
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
