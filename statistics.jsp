<%@ page contentType="text/html; charset=utf-8" language="java" import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*" errorPage="" %>
<%
String username = (String) session.getAttribute("userid"); // 
String year = request.getParameter("year") ;
int ujan = 0 ; int ufeb = 0 ;int umar = 0 ;int uapr = 0 ;int umay = 0 ;int ujun = 0 ;int ujul = 0 ;int uaug = 0 ;int usep = 0 ;int uoct = 0 ;int unov = 0 ;int udec = 0 ;
int cjan = 0 ; int cfeb = 0 ;int cmar = 0 ;int capr = 0 ;int cmay = 0 ;int cjun = 0 ;int cjul = 0 ;int caug = 0 ;int csep = 0 ;int coct = 0 ;int cnov = 0 ;int cdec = 0 ;
int gjan = 0 ; int gfeb = 0 ;int gmar = 0 ;int gapr = 0 ;int gmay = 0 ;int gjun = 0 ;int gjul = 0 ;int gaug = 0 ;int gsep = 0 ;int goct = 0 ;int gnov = 0 ;int gdec = 0 ;

//	-------------------------------------------------------
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("tomcat/webapps/tp_new/user_data.xml");
NodeList usernamexml = doc.getElementsByTagName("user"); 
NodeList name_task = doc.getElementsByTagName("name"); 
NodeList titlexml = doc.getElementsByTagName("title"); 
//	-------------------------------------------------------
int i_user ; 
String UN = "" ; 
int flag = 0 ; 
int unc = 0 ; 
int com = 0 ; 
int i = 0 ; 
//	-------------------------------------------------------
for( i_user = 0 ; i_user < usernamexml.getLength() ; i_user ++)
{
	UN = usernamexml.item(i_user).getAttributes().getNamedItem("uname").getNodeValue() ; 
	if (UN.equals(username))
	{
		flag = 1;
		break;
	}	
}
//	-------------------------------------------------------
if (flag == 1)
{
	
	String date_title ;
	String user_title ;
	int pie ;
	String da  ;
	String XLX  ; 
	for( i = 0 ; i < titlexml.getLength() ; i ++)
	{
		date_title = titlexml.item(i).getParentNode().getParentNode().getAttributes().getNamedItem("date").getNodeValue();
		user_title = titlexml.item(i).getParentNode().getParentNode().getParentNode().getAttributes().getNamedItem("uname").getNodeValue() ; 
		if ( UN.equals(user_title) && date_title.indexOf(year) != -1)
		{

			if (date_title.split("/")[0].equals("1"))
			{
				gjan ++ ;
			}
			else if (date_title.split("/")[0].equals("2"))
			{
				gfeb ++ ;
			}
			else if (date_title.split("/")[0].equals("3"))
			{
				gmar ++ ;
			}
			else if (date_title.split("/")[0].equals("4"))
			{
				gapr ++ ;
			}
			else if (date_title.split("/")[0].equals("5"))
			{

				gmay ++ ;
			}
			else if (date_title.split("/")[0].equals("6"))
			{
				gjun ++ ;
			}
			else if (date_title.split("/")[0].equals("7"))
			{
				gjul ++ ;
			}
			else if (date_title.split("/")[0].equals("8"))
			{
				gaug ++ ;
			}
			else if (date_title.split("/")[0].equals("9"))
			{
				gsep ++ ;
			}
			else if (date_title.split("/")[0].equals("10"))
			{
				goct ++ ;
			}
			else if (date_title.split("/")[0].equals("11"))
			{
				gnov ++ ;
			}
			else if (date_title.split("/")[0].equals("12"))
			{
				gdec ++ ;
			}
		}
	}
	for (pie = 0 ; pie < name_task.getLength() ; pie ++ )
	{
		XLX = name_task.item(pie).getParentNode().getParentNode().getParentNode().getParentNode().getParentNode().getAttributes().getNamedItem("uname").getNodeValue();
		da = name_task.item(pie).getParentNode().getParentNode().getParentNode().getParentNode().getAttributes().getNamedItem("date").getNodeValue();
		if (da.indexOf(year) != -1 && XLX.equals(username))
		{
			
			if (da.split("/")[0].equals("1"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					cjan ++ ; 
				}
				else
				{
					ujan ++ ;
				}
			}
			else if (da.split("/")[0].equals("2"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					cfeb ++ ; 
				}
				else
				{
					ufeb ++ ;
				}
			}
			else if (da.split("/")[0].equals("3"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					cmar ++ ; 
				}
				else
				{
					umar ++ ;
				}
			}
			else if (da.split("/")[0].equals("4"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					capr ++ ; 
				}
				else
				{
					uapr ++ ;
				}
			}
			else if (da.split("/")[0].equals("5"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					cmay ++ ; 
				}
				else
				{
					umay ++ ;
				}
			}
			else if (da.split("/")[0].equals("6"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					cjun ++ ; 
				}
				else
				{
					ujun ++ ;
				}
			}
			else if (da.split("/")[0].equals("7"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					cjul ++ ; 
				}
				else
				{
					ujul ++ ;
				}
			}
			else if (da.split("/")[0].equals("8"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					caug ++ ; 
				}
				else
				{
					uaug ++ ;
				}
			}
			else if (da.split("/")[0].equals("9"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					csep ++ ; 
				}
				else
				{
					usep ++ ;
				}
			}
			else if (da.split("/")[0].equals("10"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					coct ++ ; 
				}
				else
				{
					uoct ++ ;
				}
			}
			else if (da.split("/")[0].equals("11"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					cnov ++ ; 
				}
				else
				{
					unov ++ ;
				}
			}
			else if (da.split("/")[0].equals("12"))
			{
				if ("true".equals(name_task.item(pie).getNextSibling().getNextSibling().getFirstChild().getNodeValue()))
				{
					cdec ++ ; 
				}
				else
				{
					udec ++ ;
				}
				
			}
				
		}
	}
unc = ujan+ufeb+umar+uapr+umay+ujun+ujul+uaug+usep+uoct+unov+udec;
com = cjan+cfeb+cmar+capr+cmay+cjun+cjul+caug+csep+coct+cnov+cdec;
//out.println("<br> UN " + unc);
}
else
{
	// username is not correct
}


%>

<html>
<head>
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
data.addRows([['Completed',<%=com%>],['Uncompleted',<%=unc%>] ]);
// Set chart options
var options ={'title':'Number of Completed and Uncompleted Tasks',pieSliceText: 'value','width':700,'height':300};
// Instantiate and draw our chart, passing in some options.
var chart =new google.visualization.PieChart(document.getElementById('chart_div'));
chart.draw(data, options);

var data1 = google.visualization.arrayToDataTable([['Month', 'Completed','Uncompleted'],['January', <%=cjan%>,<%=ujan%>],['February', <%=cfeb%>, <%=ufeb%>],['March', <%=cmar%>, <%=umar%>],['April',<%=capr%>, <%=uapr%>],['May',<%=cmay%>, <%=umay%>],['June', <%=cjun%>,<%=ujun%>],['July',<%=cjul%>, <%=ujul%>],['August', <%=caug%>, <%=uaug%>],['September', <%=csep%>, <%=usep%>],['October', <%=coct%>, <%=uoct%>],['November', <%=cnov%>, <%=unov%>] ,['December', <%=cdec%>, <%=udec%>]]);
var options1 = { 'title': 'Completed and Uncompleted Tasks',  bars: 'horizontal'};
var chart =new google.visualization.BarChart(document.getElementById('chart_div1'));
chart.draw(data1, options1);

var data2 = google.visualization.arrayToDataTable([['Month', 'Goal' ],['January', <%=gjan%>],['February', <%=gfeb%>],['March', <%=gmar%>],['April', <%=gapr%>],['May', <%=gmay%>],['June', <%=gjun%>],['July', <%=gjul%>],['August', <%=gaug%>],['September', <%=gsep%>],['October', <%=goct%>],['November', <%=gnov%>] ,['December', <%=gdec%>]]);
var options2 = { 'title': 'Number of Goals',  bars: 'horizontal'};
var chart =new google.visualization.BarChart(document.getElementById('chart_div2'));
chart.draw(data2, options2);
}


	

</script>
</head>
<body>
<center>
<h1>Statistics for <%=year%><h1/>

<div id="chart_div2" style="width: 900px; height: 300px;"></div>

<div id="chart_div1" style="width: 900px; height: 500px;"></div>

<div id="chart_div"></div>

</center>


</body>
</html>