package org.apache.jsp.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class SearchPackage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Search Package</title>\n");
      out.write("    </head>\n");
      out.write("    <body>    \n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"1\"align =\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>District</td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"sel_district\" id =\"sel_district\" onchange=\"getplace(this.value)\">\n");
      out.write("                            <option value=\"\">select District</option>\n");
      out.write(" \n");
      out.write("                            ");

                                String DselQry = "select * from tbl_district";
                                ResultSet rsd = con.selectCommand(DselQry);
                                while (rsd.next()) {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rsd.getString("district_id"));
      out.write('"');
      out.write('>');
      out.print(rsd.getString("district_name"));
      out.write("</option>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>place</td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"sel_place\" id=\"sel_place\">\n");
      out.write("                            <option value=\"\">select place</option>\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\"><input type=\"submit\" name=\"btn_submit\" value=\"Submit\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        <div id=\"tableData\">\n");
      out.write("            <table align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    ");

                                if(request.getParameter("btn_submit")!=null)
                                {
                        int i = 0;
                        String pselqry = "select * from tbl_package where place_id='"+request.getParameter("sel_place")+"'";;
                        ResultSet rsp = con.selectCommand(pselqry);
                        while (rsp.next()) {
                            i++;
                    
      out.write("\n");
      out.write("                    <td>\n");
      out.write("                        <table border=\"1\"align=\"center\" width=\"200\" height=\"300\" style=\"margin:20px\">\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\" align='center'><img src='../Assets/Files/Package/");
      out.print(rsp.getString("package_photo"));
      out.write("'width='150' height='150'></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>package name</td>\n");
      out.write("                                <td>");
      out.print(rsp.getString("package_name"));
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>package amount</td>\n");
      out.write("                                <td>");
      out.print(rsp.getString("package_amount"));
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr><td colspan=\"2\" align=\"center\">\n");
      out.write("                            <a href=\"ViewMore.jsp?id=");
      out.print(rsp.getString("package_id"));
      out.write("\">Book Now</a>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                        </table>\n");
      out.write("                    </td>\n");
      out.write("                    ");

                            if (i == 4) {
                                out.println("</tr><tr>");
                            }
                        }
                                }
                    
      out.write("                        \n");
      out.write("            </table>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("    <script src=\"../Assets/JQ/jQuery.js\"></script>\n");
      out.write("    <script>\n");
      out.write("                        function getplace(pid)\n");
      out.write("                        {\n");
      out.write("                            $.ajax({\n");
      out.write("                                url: \"../Assets/AjaxPages/Ajaxsplace.jsp?pid=\" + pid,\n");
      out.write("                                success: function(html) {\n");
      out.write("                                    $(\"#sel_place\").html(html);\n");
      out.write("\n");
      out.write("                                }\n");
      out.write("                            });\n");
      out.write("                        }</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
