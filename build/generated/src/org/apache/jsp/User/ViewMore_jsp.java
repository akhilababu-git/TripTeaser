package org.apache.jsp.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class ViewMore_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>View More</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            String SelQry = "select * from tbl_package p inner join tbl_place s on p.place_id=s.place_id inner join tbl_district d on d.district_id=s.district_id where package_id='"+request.getParameter("id")+"'";
            ResultSet rs = con.selectCommand(SelQry);
            rs.next();


        
      out.write("\n");
      out.write("\n");
      out.write("        <table border=\"1\" align=\"center\">\n");
      out.write("            <tr>\n");
      out.write("                <td>photo</td>\n");
      out.write("                <td><img src='../Assets/Files/Package/");
      out.print(rs.getString("package_photo"));
      out.write("'width='150' height='150'></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Name</td>\n");
      out.write("                <td>");
      out.print(rs.getString("package_name"));
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Details</td>\n");
      out.write("                <td>");
      out.print(rs.getString("package_details"));
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Days</td>\n");
      out.write("                <td>");
      out.print(rs.getString("package_days"));
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>District</td>\n");
      out.write("                <td>");
      out.print(rs.getString("district_name"));
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Place</td>\n");
      out.write("                <td>");
      out.print(rs.getString("place_name"));
      out.write("</td>    \n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Amount</td>\n");
      out.write("                <td>");
      out.print(rs.getString("package_amount"));
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("        ");

            if (request.getParameter("btn_submit") != null) {
                String insQry = "insert into tbl_booking(booking_date,booking_fordate,user_id,booking_leadcount,booking_amount,package_id,booking_status)"
                        + "values(curdate(),'" + request.getParameter("fdate") + "','" + session.getAttribute("uid") + "','" + request.getParameter("bcount") + "','" + request.getParameter("bamount") + "','" + request.getParameter("id") + "',0)";
//                out.println(insQry);
                con.executeCommand(insQry);
                response.sendRedirect("ViewMore.jsp?id="+request.getParameter("id"));
            }
        
      out.write("\n");
      out.write("    <form method=\"post\">\n");
      out.write("        <table border=\"1\" align=\"center\">\n");
      out.write("            <tr>\n");
      out.write("                <td>Booking leadcount</td>\n");
      out.write("                <td><input type=\"text\" name=\"bcount\"></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Booking amount</td>\n");
      out.write("                <td><input type=\"text\" name=\"bamount\"></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>For Date</td>\n");
      out.write("                <td><input type=\"date\" name=\"fdate\"></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td colspan=\"2\" align=\"center\">\n");
      out.write("                    <input type=\"submit\"  name=\"btn_submit\" value=\"Submit\">\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>  \n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("</body>\n");
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
