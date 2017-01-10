<%@ page contentType="text/html; charset=utf-8" language="java" import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*" errorPage="" %>
<%@ page import="java.text.NumberFormat" %>
<%
NumberFormat nf = NumberFormat.getInstance();
nf.setMaximumFractionDigits(2);
nf.setMinimumFractionDigits(2);
String username = (String) session.getAttribute("userid"); // get this from outside
String date_days = request.getParameter("days") ;
String date_month = request.getParameter("month") ;
String date_year = request.getParameter("year") ;
int mon  = 0 ; 
if (date_month.equals("January"))
	mon = 1; 
else if (date_month.equals("February"))
	mon = 2; 
else if (date_month.equals("March"))
	mon = 3; 
else if (date_month.equals("April"))
	mon = 4; 
else if (date_month.equals("May"))
	mon = 5; 
else if (date_month.equals("June"))
	mon = 6; 
else if (date_month.equals("July"))
	mon = 7; 
else if (date_month.equals("August"))
	mon = 8; 
else if (date_month.equals("September"))
	mon = 9; 
else if (date_month.equals("October"))
	mon = 10; 
else if (date_month.equals("November"))
	mon = 11; 
else if (date_month.equals("December"))
	mon = 12; 


String date_outside = mon+"/"+date_days+"/"+date_year ; 

DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("tomcat/webapps/tp_new/user_data.xml");


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

<html>
	<head>
		<title>Go To Date</title>

<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
// Load the Visualization API and the corechart package.
      google.charts.load('current',{'packages':['corechart']});
// Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);
// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart()
{
	
// Create the data table.
var data = new google.visualization.DataTable();
data.addColumn('string','Topping');
data.addColumn('number','Slices');
data.addRows([['Completed',<%=co%>],['Uncompleted',<%=unco%>] ]);
// Set chart options
var options ={'title':'Number of Completed and Uncompleted',pieSliceText: 'value','width':700,'height':300};
// Instantiate and draw our chart, passing in some options.
var chart =new google.visualization.PieChart(document.getElementById('chart_div'));
chart.draw(data, options);


}

//datee
	

</script>

	</head>

	<body>
	<h3>Name : <%=usernamexml.item(i_user).getAttributes().getNamedItem("fname").getNodeValue()+" "+usernamexml.item(i_user).getAttributes().getNamedItem("lname").getNodeValue()%></h3>
	<h4>Username : <%=username%></h4>
	<h4>Date : <%=date_outside%></h4>
	
	<br/><br/><br/>
	<center>
<%
	
	int j = 0 ;
	for (j = 0 ; j < count ; j ++)
	{
		
	
%>	
<form name='version<%=Titile [j]%>' action="editgoal.jsp" method="get">
	<table border=1 width=400>
		<tr>
			<td>
				Goal
			</td>
			<td>
				<%=Titile [j]%>
				<input type='hidden' value='<%=Titile [j]%>' name='title'>
				<input type='hidden' value='<%=Start [j]%>' name='started'>
				<input type='hidden' value='<%=Endarray [j]%>' name='ended'>
				<input type='hidden' value='<%=date_outside%>' name='date_cc'>

			</td>
		</tr>
		<tr>
			<td>
				Progress
			</td>
			<%
				String C ;
				String color_status = Wt [j]+"" ; 
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
					
			%>
			
			<td  width="80%"style="text-align:center ; background: linear-gradient(to right, <%=C%>%, white 0%);">
				%<%=nf.format(Wt [j])%>
				<input type='hidden' value='<%=Wt [j]%>' name='weight'>
				<input type='hidden' value='<%=C%>' name='ccolor'>
			</td>
		</tr>
		<tr>
			<td>
				Description
			</td>
			<td>
				<%=Des [j]%>
				<input type='hidden' value='<%=Des [j]%>' name='des'>
			</td>
		</tr>
		<tr>
		<td colspan=2>
		
			<input type='submit' value='Edit'/>
		</td>
		 
		</tr>
		
	</table>
	<br/><br/>
		<table width=400 border=1>
		<tr>
			<td>
				Tasks
			</td>
			<td>
				Status
			</td>
		</tr>
		
		<%
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

				if (  TT.equals(Titile [j]) && UU.equals(username) && date_outside.equals(DD))
				{
					
					cc++;
					
				
				%>
				
			<tr>
				<td>
					<%= name_task.item(ZA).getFirstChild().getNodeValue() %>
					<input type='hidden' value='<%=name_task.item(ZA).getFirstChild().getNodeValue()%>' name='todo1<%=cc%>'>
				</td>
				<td>
				
					<%
						if ("false".equals(name_task.item(ZA).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
						{%>
								<img width='15%' src="X.png"/>
						<%}
						else
						{%>
								<img width='15%' 	src="D.png"/>
						<%}
					 %>
					<input type='hidden' value='<%=name_task.item(ZA).getNextSibling().getNextSibling().getFirstChild().getNodeValue()%>' name='checktodo1<%=cc%>'>
					<input type='hidden' value='<%=name_task.item(ZA).getNextSibling().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNodeValue()%>' name='ww<%=cc%>'>
				</td>
			</tr>

			
				
			<%
			
				}
			
			}
		}
			
	
	
	
	%>
	</table>
</form>

	<br/><hr><br/>
	
	
	
	
	<%}%>
	
	
	
<br>	
<br>	
<br>
<% if (flag == 1)
{%>	
<div id="chart_div"></div>
You have not created any Goals. <a href="editgoal.jsp?mode=x&date_cc=<%=date_outside%>">Click Here</a> to add a new goal.
<%}

else
{
	%>
	<center>
	<h1>
		You have not created any Goals. <a href="editgoal.jsp?mode=x&date_cc=<%=date_outside%>">Click Here</a> to add a new goal.
	</h1>
	</center>
	<%
}

	%>
	
	</center>
	</body>
</html>

 