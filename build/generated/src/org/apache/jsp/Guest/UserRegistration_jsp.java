package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class UserRegistration_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>User Registration</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form method=\"post\" enctype=\"multipart/form-data\" action=\"../Assets/ActionPages/UserUploadAction.jsp\">\n");
      out.write("            <table border=\"1\" center=\"align\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>Name</td>\n");
      out.write("                    <td><input type=\"text\" name=\"Name\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email</td>\n");
      out.write("                    <td><input type=\"text\" name=\"Email\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Contact</td>\n");
      out.write("                    <td><input type=\"text\" name=\"Contact\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Address</td>\n");
      out.write("                   <td><textarea cols=\"45\" rows=\"5\" name=\"Address\" ></textarea></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>State</td>\n");
      out.write("                    <td><select name=\"sel_state\" id=\"sel_state\" >\n");
      out.write("                            <option value=\"\">Select state</option>\n");
      out.write("                            ");

                                String selQry = "select * from tbl_state";
                                ResultSet rsd = con.selectCommand(selQry);
                                while (rsd.next()) {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rsd.getString("state_id"));
      out.write('"');
      out.write('>');
      out.print(rsd.getString("state_name"));
      out.write("</option>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                     <td>District</td>\n");
      out.write("                    <td><select  name=\"sel_district\" id=\"sel_district\" onchange=\"getPlace(this.value)\">\n");
      out.write("                     <option value=\"\">Select district</option>\n");
      out.write("                     ");

                                String dselQry="select * from tbl_district";
                                ResultSet rsl=con.selectCommand(dselQry);
                                while(rsl.next())
                                {
                                    
      out.write("\n");
      out.write("                                    <option  value=\"");
      out.print(rsl.getString("District_id"));
      out.write('"');
      out.write('>');
      out.print(rsl.getString("District_name"));
      out.write("</option>\n");
      out.write("                                    ");

                                }
                                
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr\n");
      out.write("                <tr>\n");
      out.write("                    <td>Place</td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"sel_place\" id=\"sel_place\">\n");
      out.write("                            <option value=\"\">Select Place</option>\n");
      out.write("                            ");

                                String pselQry="select * from  tbl_place";
                                ResultSet rs2=con.selectCommand(pselQry);
                                while(rs2.next())
                                {
                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(rs2.getString("place_id"));
      out.write('"');
      out.write('>');
      out.print(rs2.getString("place_name"));
      out.write("</option>\n");
      out.write("                                    ");
      
                                }
                                
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                    \n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Gender</td>\n");
      out.write("                    <td><input type=\"radio\" name=\"gender\" value=\"Male\">Male\n");
      out.write("                        <input type=\"radio\" name=\"gender\" value=\"Female\">Female</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Photo</td>\n");
      out.write("                    <td><input type=\"file\" name=\"file_photo\"></td>\n");
      out.write("        \n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Password</td>\n");
      out.write("                    <td><input type=\"text\" name=\"Password\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Retype Password</td>\n");
      out.write("                    <td><input type=\"text\" name=\"Retype Password\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\"><input type=\"submit\" name=\"btn_register\" value=\"Register\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    <script src=\"../Assets/JQ/jQuery.js\"></script>\n");
      out.write("        <script>\n");
      out.write("                        function getdistrict(sid)\n");
      out.write("                        {\n");
      out.write("                            $.ajax({\n");
      out.write("                                url: \"../Assets/AjaxPages/Ajaxdistrict.jsp?sid=\" + sid,\n");
      out.write("                                success: function(html) {\n");
      out.write("                                    $(\"#sel_district\").html(html);\n");
      out.write("\n");
      out.write("                                }\n");
      out.write("                            });\n");
      out.write("                        }</script>\n");
      out.write("        <script src=\"../Assets/JQ/jQuery.js\"></script>\n");
      out.write("        <script>\n");
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
