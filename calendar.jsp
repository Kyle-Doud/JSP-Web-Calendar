<%@ page import="edu.auburn.calendar.Month,java.util.*,util.*,java.io.*,java.sql.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,org.w3c.dom.Document,org.w3c.dom.Element,org.w3c.dom.Node,org.w3c.dom.NodeList,java.util.ArrayList" %>
<%-- REFERENCE: http://alvinalexander.com/blog/post/jsp/my-web-calendar-jsp-html-css-source-code --%>

<%@ include file="calendarCommon.jsp" %>

<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>; url=logout.jsp"/>
<html>
<head>
  <title>Calendar</title>
  <link rel="StyleSheet" href="./calendar.css" type="text/css" media="screen" />
</head>

<body id="print_view_page">
<table id="calendar_nav_table" border="0">
  <tr>
    <td id="prev_link">
      <form method="post">
        <input type="submit" name="PREV" value=" << ">
        <input type="hidden" name="month" value="<%=prevMonth%>">
        <input type="hidden" name="year" value="<%=prevYear%>">
      </form>
    </td>
    <td id="link_to_month_view">
      <form action="statistics.jsp" method="post">
        <input type="submit" value="  View Statistics  " class="submit_button">
        <input type="hidden" name="month" value="<%=intMonth%>">
        <input type="hidden" name="year"  value="<%=intYear%>">
      </form>
    </td>
    <td id="next_link">
      <form method="post">
        <input type="submit" name="NEXT" value=" >> ">
        <input type="hidden" name="month" value="<%=nextMonth%>">
        <input type="hidden" name="year" value="<%=nextYear%>">
      </form>
    </td>
  </tr>
</table>

<div id="calendar_print_view_main_div">
<table border="1" cellspacing="0" cellpadding=4 width="100%" height="100%" id="calendar_table">
  <tr>
    <td colspan="7" class="month_year_header">
      <%=monthName%>, <%=intYear%>
    </td>
  </tr>
  <tr class="week_header_row">
    <th width="14%" class="th_day_cell day">Sun</th>
    <th width="14%" class="th_day_cell day">Mon</th>
    <th width="14%" class="th_day_cell day">Tue</th>
    <th width="14%" class="th_day_cell day">Wed</th>
    <th width="14%" class="th_day_cell day">Thu</th>
    <th width="15%" class="th_day_cell day">Fri</th>
    <th width="15%" class="th_day_cell day">Sat</th>
  </tr>
  <%! int pageVisits = 0;%>
<%
{
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  int [][] days = aMonth.getDays();
  pageVisits++;



  for( int m=0; m<aMonth.getNumberOfWeeks(); m++ )
  {%>
    <tr>
    <%

    for( int j=0; j<7; j++ )
    {
      if( days[m][j] == 0 )
      {%>
        <td class="empty_day_cell">&nbsp;</td>
      <%}
      else
      {

      String username = (String) session.getAttribute("userid");
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
		Document doc;
		if(pageVisits == 0)
		{
			 doc = docBuilder.parse("tomcat/webapps/tp_new/user_data.xml");
		}
		else
		{
			 doc = docBuilder.parse("tomcat/webapps/tp_new/user_data.xml");
		}
		String monthin = monthName;

		int mon = 0;
		if (monthin.equals("January"))
			mon = 1; 
		else if (monthin.equals("February"))
			mon = 2; 
		else if (monthin.equals("March"))
			mon = 3; 
		else if (monthin.equals("April"))
			mon = 4; 
		else if (monthin.equals("May"))
			mon = 5; 
		else if (monthin.equals("June"))
			mon = 6; 
		else if (monthin.equals("July"))
			mon = 7; 
		else if (monthin.equals("August"))
			mon = 8; 
		else if (monthin.equals("September"))
			mon = 9; 
		else if (monthin.equals("October"))
			mon = 10; 
		else if (monthin.equals("November"))
			mon = 11; 
		else if (monthin.equals("December"))
			mon = 12; 


		String date_outside = mon+"/"+days[m][j]+"/"+intYear ;
		
		NodeList usernamexml = doc.getElementsByTagName("user"); 
		NodeList titlexml = doc.getElementsByTagName("title"); 
		NodeList desxml = doc.getElementsByTagName("description"); 
		NodeList startxml = doc.getElementsByTagName("start"); 
		NodeList endxml = doc.getElementsByTagName("end"); 
		NodeList todoxml = doc.getElementsByTagName("todo"); 
		NodeList wtxml = doc.getElementsByTagName("weight"); 

		int i_user ; 
		String UN = "" ; 
		for( i_user = 0 ; i_user < usernamexml.getLength() ; i_user ++)
		{
			UN = usernamexml.item(i_user).getAttributes().getNamedItem("uname").getNodeValue() ; 
			if (UN.equals(username))
				break;
		}
		// ##################work Area #####################
		int i  ; 
		String title ; 
		String desc ; 
		String start ; 
		String endtime ; 
		String datee ="";
		String todo ="";
		// -----------------------------------------------------------------
		String[] Titile = new String[titlexml.getLength()];
		String[] Des = new String[titlexml.getLength()];
		String[] Start = new String[titlexml.getLength()];
		String[] Endarray = new String[titlexml.getLength()];
		float[] Wt = new float[titlexml.getLength()];

		int count = 0 ;   
		int flag = 0 ; 
		for( i = 0 ; i < titlexml.getLength() ; i ++)
		{
			
			if ( UN.equals(titlexml.item(i).getParentNode().getParentNode().getParentNode().getAttributes().getNamedItem("uname").getNodeValue()) && date_outside.equals(titlexml.item(i).getParentNode().getParentNode().getAttributes().getNamedItem("date").getNodeValue()))
			{
				title = titlexml.item(i).getFirstChild().getNodeValue(); 
				desc  = desxml.item(i).getFirstChild().getNodeValue(); 
				start = startxml.item(i).getFirstChild().getNodeValue(); 
				endtime = endxml.item(i).getFirstChild().getNodeValue();
				datee = titlexml.item(i).getParentNode().getParentNode().getAttributes().getNamedItem("date").getNodeValue() ; 
				Titile [count] = title;
				Des [count] = desc;
				Start [count] = start;
				Endarray [count] = endtime;
				String tit_of_wt ="" ; 
				float wt_t = 0 ; 
				float done_wt_t = 0 ; 
				for (int x = 0 ; x < wtxml.getLength() ; x ++)
				{
					tit_of_wt = wtxml.item(x).getParentNode().getParentNode().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getFirstChild().getNodeValue();
					if ( tit_of_wt == title && date_outside.equals(wtxml.item(x).getParentNode().getParentNode().getParentNode().getParentNode().getAttributes().getNamedItem("date").getNodeValue()))
					{		
						wt_t += new Float(wtxml.item(x).getFirstChild().getNodeValue());
						if ("true".equals(wtxml.item(x).getPreviousSibling().getPreviousSibling().getFirstChild().getNodeValue()))				
							done_wt_t += new Float(wtxml.item(x).getFirstChild().getNodeValue());
					}
					
					
				}
				Wt[count++] = (done_wt_t/wt_t) * 100 ; 	
				flag = 1 ; 
			}
		}
		// #######################################
		int unco = 0 ; 
		int co = 0 ;
		NodeList name_task = null ;  
		if (flag == 1)
		{
			
			name_task = doc.getElementsByTagName("name"); 
			int pie ;
			String XLX  ; 
			String da  ; 
			for (pie = 0 ; pie < name_task.getLength() ; pie ++ )
			{
				XLX = name_task.item(pie).getParentNode().getParentNode().getParentNode().getParentNode().getParentNode().getAttributes().getNamedItem("uname").getNodeValue();
				da = name_task.item(pie).getParentNode().getParentNode().getParentNode().getParentNode().getAttributes().getNamedItem("date").getNodeValue();
				if (XLX.equals(username) && date_outside.equals(da))
				{
					if ("false".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
					{
						unco ++ ; 
					}
					else
					{
						co ++ ;
					}
				}
			}
		}




      %>
        <td align="right" valign="top" class="day_cell">
        <a href="goto.jsp?month=<%=monthName%>&year=<%=intYear%>&days=<%=days[m][j]%>"><%=days[m][j]%></a>
        <form name="submitForm" method="POST" action="editgoal.jsp">
        <%
        String[] td = new String[4];
        for(int h = 0; h < count; h++)
        {
        String C ;
				String color_status = Wt [h]+"" ; 
				double no = Double.parseDouble(color_status);
				//int no = Integer.parseInt(color_status);
				if ( no > 66 )
				{
					C = "#66cd77 "+color_status;
				}
				else if ( no  < 66 && no > 33) 
				{
					C = "#FFAE19 "+color_status;
				}
				else
				{
					C = " #CA566A "+color_status;
				}

				int ZA ;
				if (flag == 1)
				{
					String TT = ""; 
					String DD = "";
					String UU = "";
					int cc = 0 ; 
					for (ZA = 0 ; ZA < name_task.getLength() ; ZA ++ )
					{
						DD = name_task.item(ZA).getParentNode().getParentNode().getParentNode().getParentNode().getAttributes().getNamedItem("date").getNodeValue();
						TT = name_task.item(ZA).getParentNode().getParentNode().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getPreviousSibling().getFirstChild().getNodeValue();
						UU = name_task.item(ZA).getParentNode().getParentNode().getParentNode().getParentNode().getParentNode().getAttributes().getNamedItem("uname").getNodeValue();

						if (  TT.equals(Titile [h]) && UU.equals(username) && date_outside.equals(DD))
						{
							
							cc++;%>
							<input type='hidden' value='<%=name_task.item(ZA).getFirstChild().getNodeValue()%>' name='todo1<%=cc%>'>
							<input type='hidden' value='<%=name_task.item(ZA).getNextSibling().getNextSibling().getFirstChild().getNodeValue()%>' name='checktodo1<%=cc%>'>
							<input type='hidden' value='<%=name_task.item(ZA).getNextSibling().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNodeValue()%>' name='ww<%=cc%>'><%
						}
					
					}
				}
				
		%>
        <br/>
        
        <input type="hidden" name="title" value="<%=Titile[h]%>">
        <input type="hidden" name="date_cc" value="<%=date_outside%>">
        <input type="hidden" name="des" value="<%=Des[h]%>">
        <input type="hidden" name="started" value="<%=Start[h]%>">
        <input type="hidden" name="ended" value="<%=Endarray[h]%>">
        <input type="hidden" name="weight" value="<%=Wt[h]%>">
        <input type="hidden" name="ccolor" value="<%=C%>">
        <div valign="bottom" style="text-align:center ; background: linear-gradient(to right, <%=C%>%, white 0%);"><input type="submit" value="<%=Titile[h]%>" class="btn-link"></a></div></form>
        
        
        <%}%>

        </td>
      <%
      }//TODO: add the current goal names if possible
    } // end for %>
    </tr>
  <%}
}
%>
</table>
</div>

</body>
</html>


