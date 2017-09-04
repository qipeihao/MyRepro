<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<% 
     out.println("#####");
    out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");

      out.write("    \r\n");
      out.write("    <title>My JSP 'index.jsp' starting page</title>\r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">\r\n");
      out.write("\t<meta http-equiv=\"description\" content=\"This is my page\">\r\n");
      out.write("\t<!--\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">\r\n");
      out.write("\t-->\r\n");
      out.write("  </head>\r\n");
      out.write("  \r\n");
      out.write("  <body>\r\n<br>");
      out.write("      <a href=\"doOpr.jsp\">===测试请求===</a>\r\n");
      out.write("      hello jsp!!!\r\n");
      out.write("      <!-- hello jsp!!!1111 -->\r\n");
      out.write("      ");
      out.write("\r\n");
      out.write("      ");
      out.write("\r\n");
      out.write("      \r\n");
     
      out.write("      ");

      out.write("\r\n");
      out.write("      \r\n");
      out.write("      <table>\r\n");
      out.write("         ");

            for(int i=0;i<100;i++){
         
      out.write("\r\n");
      out.write("           <tr>\r\n");
      out.write("            <td>");
      out.print((int)(Math.random()*1000) );
      out.write("</td>\r\n");
      out.write("            <td>");
      out.print((int)(Math.random()*1000) );
      out.write("</td>\r\n");
      out.write("            <td>");
      out.print((int)(Math.random()*1000) );
      out.write("</td>\r\n");
      out.write("            </tr>\r\n");
      out.write("             \r\n");
      out.write("         ");
   
            }
          
      out.write("\r\n");
      out.write("         \r\n");
      out.write("         \r\n");
      out.write("      </table>\r\n");
      out.write("      \r\n");
      out.write("      \r\n");
      out.write("       \r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
%>