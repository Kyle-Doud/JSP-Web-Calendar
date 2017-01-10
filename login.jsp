<%@ page import ="java.io.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String file = application.getRealPath("/") + "users.txt";
    File users = new File(file);
    if(!users.exists())
    {
    %>
      user file missing. contact administrator
    <%
    }
    else
    {
        BufferedReader read = new BufferedReader(new FileReader(users));
        String currentLine;
        while((currentLine = read.readLine()) != null)
        {
            String uinfo[] = currentLine.split(", ");
            if(uinfo[0].equals(userid) && uinfo[1].equals(pwd))
            {
                session.setMaxInactiveInterval(60);
                session.setAttribute("userid", userid);
                session.setAttribute("pwd", pwd);
                currentLine = read.readLine();
                String uinfo2[] = currentLine.split(", ");
                session.setAttribute("fname", uinfo2[0]);
                session.setAttribute("lname", uinfo2[1]);
                session.setAttribute("email", uinfo2[2]);
                response.sendRedirect("calendar.jsp");
            }
            read.readLine();
        }
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }

%>