<%@ page import ="java.io.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
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
        boolean usernameAvailable = true;
        while((currentLine = read.readLine()) != null && usernameAvailable)
        {
            String uinfo[] = currentLine.split(", ");
            if(uinfo[0].equals(user))
            {
                out.println("Username taken. <a href='register.jsp'>try again</a>");
                usernameAvailable = false;
            }
            read.readLine();
        }
        read.close();

        if(usernameAvailable)
        {
            BufferedWriter writer = new BufferedWriter(new FileWriter(users, true));
            String firstLine = user + ", " + pwd;
            String secondLine = fname + ", " + lname + ", " + email;
            writer.write(firstLine);
            writer.newLine();
            writer.write(secondLine);
            writer.newLine();
            writer.close();
            session.setAttribute("userid", user);
			
			String fileNew1 = "tomcat/webapps/tp_new/user_data.xml";
			BufferedReader reader = new BufferedReader(new FileReader (fileNew1));
			String         line = null;
			StringBuilder  stringBuilder = new StringBuilder();
			String         ls = System.getProperty("line.separator");


			while((line = reader.readLine()) != null) 
			{
				stringBuilder.append(line);
				stringBuilder.append(ls);
			}

			String fileText = stringBuilder.toString();
			reader.close();
			
			
			String x []= fileText.split("\n");
			
			String sus = "\t<user fname=\""+fname+"\" lname=\""+lname+"\" uname=\""+user+"\" pwd=\""+pwd+"\" email=\""+email+"\">\n" ;
			String endforuser = "</user>" ;

			String eee = "</user>\n" ;
			for (int i = 0 ; i < x.length ; i ++)
			{ 	
				if (x[i].indexOf(endforuser) >= 0)
				{
					x[i]= x[i].replace("</user>","\t</user>\n"+sus+endforuser) ; 
				}
			}
			File ff = new File(fileNew1);
			ff.delete();
			File f1 = new File(fileNew1);
			BufferedWriter writer1 = new BufferedWriter(new FileWriter(ff, true));
			for (int i = 0 ; i < x.length ; i ++)
			{
				if (x[i].indexOf("<") >=0)
					writer1.write(x[i]);
			}
			writer1.close();
			
			
            response.sendRedirect("calendar.jsp");
        }
        
    }

%>