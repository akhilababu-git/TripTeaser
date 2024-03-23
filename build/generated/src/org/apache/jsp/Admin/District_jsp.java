package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class District_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>District</title>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    ");


        if (request.getParameter("btn_submit") != null) {

            String insQry = "insert into tbl_district(district_name,state_id)values('" + request.getParameter("txt_district") + "','"+Integer.parseInt(request.getParameter("sel_state"))+"')";
            con.executeCommand(insQry);
            response.sendRedirect("District.jsp");//Its for Page Refresh

        }
        
          if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_district where district_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("District.jsp");
        }


    
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"1\" align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>State</td>\n");
      out.write("                    <td><select name=\"sel_state\">\n");
      out.write("                            <option value=\"\">----Select----</option>\n");
      out.write("                            ");

                                String selQry = "select * from tbl_state ";
                                ResultSet rss = con.selectCommand(selQry);
                                while (rss.next()) {


                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rss.getString("state_id"));
      out.write('"');
      out.write('>');
      out.print(rss.getString("state_name"));
      out.write("</option>\n");
      out.write("\n");
      out.write("                            ");
                      }


                            
      out.write("\n");
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                </tr>\n");
      out.write("                    <td>District</td>\n");
      out.write("                    <td>            \n");
      out.write("                        <input required=\"\" type=\"text\" id=\"txt_district\" name=\"txt_district\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\"  name=\"btn_submit\" value=\"Submit\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        <br>\n");
      out.write("        <table border=\"1\" align=\"center\">\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    Sl.no\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    State\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    District\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    Action\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            ");
                                                int i = 0;
                String selQryt = "select * from tbl_district d inner join tbl_state s on s.state_id=d.state_id ";
                ResultSet rst = con.selectCommand(selQryt);
                while (rst.next()) {

                    i++;

            
      out.write("\n");
      out.write("            <tr>    \n");
      out.write("                <td >");
      out.print(i);
      out.write("</td>\n");
      out.write("                <td >");
      out.print(rst.getString("state_name"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rst.getString("district_name"));
      out.write("</td>\n");
      out.write("                <td > \n");
      out.write("                    <a href=\"District.jsp?del=");
      out.print(rst.getString("district_id"));
      out.write("\" >Delete</a>\n");
      out.write("\n");
      out.write("                </td> \n");
      out.write("            </tr>\n");
      out.write("            ");
                      }


            
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
