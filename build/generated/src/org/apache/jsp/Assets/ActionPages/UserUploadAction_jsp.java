package org.apache.jsp.Assets.ActionPages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;

public final class UserUploadAction_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      DB.ConnectionClass obj = null;
      synchronized (_jspx_page_context) {
        obj = (DB.ConnectionClass) _jspx_page_context.getAttribute("obj", PageContext.PAGE_SCOPE);
        if (obj == null){
          obj = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("obj", obj, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");


    FileItem f_item = null;
    File savedFile = null;

    String field_name = "";
    String photo = "", proof = "";
    String file_name = "";

    String field[] = new String[20];
    String value[] = new String[20];

//checking if request cotains multipart data
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);//true/false

    if (isMultipart) {

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        //declaring a list of form fields.everything on form adding t itemlist
        List items_list = null;

        //assigning fields to list 'items_list'
        try {
            items_list = upload.parseRequest(request);//requeat contains evrything on form this is parsed and stored to item_list
        } catch (FileUploadException ex) {
            out.println(ex);
        }

        //declaring iterator used to iterate through all positions in item_lists
        Iterator itr = items_list.iterator();
        int k = 0;
        //iterating through the list 'items_list'
        while (itr.hasNext())//checking if there is any value in the position like rs.next()
        {

            //typecasting next element in items_list as fileitem
            f_item = (FileItem) itr.next();// value to which the iterator points  and is coverted to fileitem format

            //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc) or multipath
            if (f_item.isFormField()) {

                //getting fieldname and value
                field[k] = f_item.getFieldName();//field
                value[k] = f_item.getString();//user typing value

                k++;//
            } else//when it is an image or multipart
            {

                //f_item=(FileItem)itr.next();
                file_name = f_item.getName();
                field_name = f_item.getFieldName();

                if (field_name.equals("file_photo"))//write the name of image here it is img_product
                {
                    String ext = file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
                    //setting path to store image
                    File proj_path = new File(config.getServletContext().getRealPath("/"));
                    String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\Files\\User\\";//path for storing image
                    Random r = new Random();//to generate random number
                    int r_num = r.nextInt(1111) + 999;//values between this are generated
                    photo = "UserPhoto_" + r_num + ext;//generating random number for images so this name and format of imagewil be stored inside the server
                    //creating a file object
                    savedFile = new File(file_path + photo);//fn contains name of file
                    try {
                        //writing the file object
                        f_item.write(savedFile);  //writing to server means the folder             

                    } catch (Exception ex) {
                        out.println(ex);
                    }
                }

               
                //to upload proof of doctor
            }

        }
        if (value[9].equals(value[8])) {//Strinh str1="insert into tbl_user ()";//inserting file
            String InsQry = "INSERT INTO `tbl_user`( `user_name`, `user_email`, `user_contact`,`user_address`,`place_id`,`user_gender`, `user_photo`,`user_password`)"
                    + "values('" + value[0] + "','" + value[1] + "','" + value[2] + "','" + value[3] + "','" + value[6] + "','" + value[7] + "','" + photo + "','" + value[8] + "')";
            System.out.println(InsQry);
            //out.println(InsQry);
            boolean status = obj.executeCommand(InsQry);

            if (status == true) {

      out.write(" \n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    alert(\"Registration Completed\");\n");
      out.write("    setTimeout(function() {\n");
      out.write("        window.location.href = '../../Guest/UserRegistration.jsp'\n");
      out.write("    }, 40);//40millisecend it go to next page\n");
      out.write("</script>\n");

    }
} else {

      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    alert(\"Password Mismatched..\");\n");
      out.write("    setTimeout(function() {\n");
      out.write("        window.location.href = '../../Guest/UserRegistration.jsp'\n");
      out.write("    }, 40);//40millisecend it go to next page\n");
      out.write("    //   </script>\n");
      out.write("    ");

            }
        }

    
      out.write('\n');
      out.write('\n');
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
