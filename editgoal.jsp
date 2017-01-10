<!DOCTYPE html>
<html>
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>; url=logout.jsp"/>
<%
String title = request.getParameter("title");
String description = request.getParameter("des");
String start = request.getParameter("started");
String end = request.getParameter("ended");
String date_cc = request.getParameter("date_cc");
String mm = request.getParameter("mode");
String mx = request.getParameter("mode");

String CC = request.getParameter("ccolor");
String WW = request.getParameter("weight");

String chs1 = request.getParameter("checktodo11");
String chs2 = request.getParameter("checktodo12");
String chs3 = request.getParameter("checktodo13");
String chs4 = request.getParameter("checktodo14");

String chn1 = request.getParameter("todo11");
String chn2 = request.getParameter("todo12");
String chn3 = request.getParameter("todo13");
String chn4 = request.getParameter("todo14");

String chw1 = request.getParameter("ww1");
String chw2 = request.getParameter("ww2");
String chw3 = request.getParameter("ww3");
String chw4 = request.getParameter("ww4");

%>
<head>

<script>

function clear_every_thing() 
{
    document.getElementById("units").style.background   = "linear-gradient(to right, red 0%, #FFFCCC 0%)";
    document.getElementById('units').innerHTML = '0.0%';
	document.getElementById('title').value = '' ;
	document.getElementById('des').value = '' ;
	
	document.getElementById('start').value = '' ;
	document.getElementById('end').value = '' ;
	
	document.getElementById('tn1').value = '' ;
	document.getElementById('ts1').checked = false;
	document.getElementById('tw1').value = '' ;	
	
	document.getElementById('tn2').value = '' ;
	document.getElementById('ts2').checked = false;
	document.getElementById('tw2').value = '' ;	
	
	document.getElementById('tn3').value = '' ;
	document.getElementById('ts3').checked = false;
	document.getElementById('tw3').value = '' ;

	document.getElementById('tn4').value = '' ;
	document.getElementById("ts4").checked = false;
	document.getElementById('tw4').value = '' ;

	

}


function save(c_s)
{
	var flag = 0 ; 
	var  t = document.getElementById('title') ;
	var  d = document.getElementById('des') ;
	
	var  s = document.getElementById('start') ;
	var  e = document.getElementById('end') ;
	
	var  n1 = document.getElementById('tn1') ;
	var  w1 = document.getElementById('tw1') ;	
	
	var  n2 = document.getElementById('tn2') ;
	var  w2 = document.getElementById('tw2') ;	
	
	var  n3 = document.getElementById('tn3') ;
	var  w3 = document.getElementById('tw3') ;

	var  n4 = document.getElementById('tn4') ;
	var  w4 = document.getElementById('tw4') ;
	
	
	if (t.value == "" || t.value == " ")
	{
		alert("Please Enter Title");
		t.focus();
		flag = 1 ; 
	}
	else if (d.value == "" || d.value == " ")
	{
		alert("Please Enter Description");
		d.focus();
		flag = 1 ; 
	} 	
	else if (s.value == "" || s.value == " ")
	{
		flag = 1 ; 
		alert("Please Enter start time");
		s.focus();
	} 
	else if (e.value == "" || e.value == " ")
	{
		alert("Please Enter end time");
		flag = 1 ; 
		e.focus();
	} 
	else if (n1.value == "" || n1.value == " ")
	{
		alert("Please Enter name for task number : 1");
		flag = 1 ; 
		n1.focus();
	} 
	else if (n2.value == "" || n2.value == " ")
	{
		alert("Please Enter name for task number : 2");
		flag = 1 ; 
		n2.focus();
	} 
	else if (n3.value == "" || n3.value == " ")
	{
		alert("Please Enter name for task number : 3");
		flag = 1 ; 
		n3.focus();
	} 
	else if (n4.value == "" || n4.value == " "  )
	{
		alert("Please Enter name for task number : 4");
		flag = 1 ; 
		n4.focus();
	} 
//----------------------------------------
	else if (w1.value == "" || w1.value == " ")
	{
		alert("please Enter Number for Weight task number one");
		flag = 1 ; 
		w1.focus();
	}
	else if (!isNumeric(w1.value))	
	{
		alert("please Enter Number for Weight task number one");
		flag = 1 ; 
		w1.focus();
	}
	else if ( parseFloat(w1.value) > 1 || parseFloat(w1.value) <= 0 )
	{
		alert("The scope is more than 0 to 1, please change the first weight");
		flag = 1 ; 
		w1.focus();
	}
	else if (w2.value == "" || w2.value == " ")
	{
		alert("please Enter Number for Weight task number Two");
		flag = 1 ; 
		w2.focus();
	}
	else if (!isNumeric(w2.value))	
	{
		alert("please Enter Number for Weight task number two");
		flag = 1 ; 
		w2.focus();
	}
	else if ( parseFloat(w2.value) > 1 || parseFloat(w2.value) <= 0 )
	{
		alert("The scope is more than 0 to 1, please change the second weight");
		flag = 1 ; 
		w2.focus();
	}
	else if (w3.value == "" || w3.value == " ")
	{
		alert("please Enter Number for Weight task number three");
		flag = 1 ; 
		w3.focus();
	}
	else if (!isNumeric(w3.value))	
	{
		alert("please Enter Number for Weight task number threes");
		flag = 1 ; 
		w3.focus();
	}
	else if ( parseFloat(w3.value) > 1 || parseFloat(w3.value) <= 0 )
	{
		alert("The scope is more than 0 to 1, please change the third weight");
		flag = 1 ; 
		w3.focus();
	}
	else if (w4.value == "" || w4.value == " ")
	{
		alert("Please Enter Weight for the Forth task");
		flag = 1 ; 
		w4.focus();
	}
	else if (!isNumeric(w4.value))	
	{
		alert("please Enter Number for Weight task number four");
		flag = 1 ; 
		w4.focus();
	}
	else if ( parseFloat(w4.value) > 1 || parseFloat(w4.value) <= 0 )
	{
		alert("The scope is more than 0 to 1, please change the Forth weight");
		flag = 1 ; 
		w4.focus();
	}
	else if (!validation_hour(s.value))
	{
		alert("the e is not correct the format is : dd:dd \n example 12:13 or 23:59");
		flag = 1 ; 
		s.focus();
	}
	else if (!validation_hour(e.value))
	{
		flag = 1 ; 
		alert("the e is not correct the format is : dd:dd \n example 12:13 or 23:59");
		e.focus();
	}
	else if (parseInt(s.value.split(":")[0]) >=	parseInt(e.value.split(":")[0]))
	{
		var res1 = s.value.split(":");
		var res2 = e.value.split(":");
		if (parseInt(s.value.split(":")[0]) >	parseInt(e.value.split(":")[0]))
		{
			alert("Can't Start time after End time");
			flag = 1 ; 
			s.focus();
		}			
		else if (parseInt(res2[0]) == parseInt(res1[0]))
		{
			if (parseInt(res2[1]) < parseInt(res1[1]))
			{
				flag = 1 ; 
				alert("Can't Start time after End time");
				s.focus();
			}
			else if  (parseInt(res2[1]) == parseInt(res1[1]))
			{
				flag = 1 ; 
				alert("Can't Start time and End time to be the same");
				e.focus();
			}
			else 
				flag = 0 ;
		}
	}
	if (flag == 0)
	{
		if (c_s == 's')
		{
			document.getElementById('mode').value = 's' ;  
			document.getElementById("editgoalform").submit();
		}
		else
		{
			document.getElementById('mode').value = 'x' ;  
			document.getElementById('ts1').checked = true;
			document.getElementById('ts2').checked = true;
			document.getElementById('ts3').checked = true;
			document.getElementById('ts4').checked = true;
			document.getElementById("editgoalform").submit();
		}
	}
}
//	------------------------------------------------------------------
function isNumeric(n) 
{
  return !isNaN(parseFloat(n)) && isFinite(n);
}
//	------------------------------------------------------------------
function validation_hour(str)
{
var pattern = /^([01]\d|2[0-3]):?([0-5]\d)$/;
return pattern.test(str);
}
//	------------------------------------------------------------------
</script>
</head>
<title>Edit Goal</title>
<body BGCOLOR="#FFFCCC">
<center>
<h2>CREATE A NEW GOAL</h2>
<form name=editgoal id=editgoalform action="savegoal.jsp" method=post>
	
	<table>
	  <tr><td align = left>
	<TextArea id='title' align=left rows=2 cols=55 name=title placeholder="Title..."><% if(title != null)
	{
		out.print(title);
	}
	%></TextArea></td>
	</tr>
	<br/>
	<br/>
	<br/>
	<tr><td align = left><TextArea id='des' align=left rows=7 cols=55 name=description placeholder="Description..."><% if(description != null)
	{
		out.print(description);
	}
	%></TextArea></td>
	</tr>
	</table><br/>
	<table>
	<tr>
		<td align=left>Start:</td>
				<td align=left><input id='start' type=text name=start size=5 placeholder="24:00" value="<% if(start != null){	out.print(start);	}%>"></input></td>
		<td>End:</td>
				<td align=left><input id='end' type=text name=end size=5 placeholder="24:00" value="<% if(end != null){	out.print(end);	}%>"></input></td>
	</tr>
	</table>

	<br/>
	<br/>

	<table>
	<tr>
	<td align=center>Todo List<td>
	</tr>
	</table>

	<table>
	<tr>
	<td>
	<input id='tn1' type=text placeholder="Task" value="<% if(chn1 != null){out.print(chn1);} else {out.print("");} %>" name="name1"></input></td>
	<td><input id='tw1' type=text placeholder="Weight (0.0-1.0)" value="<% if(chw1 != null){out.print(chw1);} else {out.print("");} %>" name="ww1"></input></td>
	<td><input id='ts1' type=checkbox <%if(chn1 != null){if (chs1.equals("true"))out.println("checked");} %> name="s1">Completed</input>


	
	</td>
	</tr>
	<tr>
	<td><input id='tn2' type=text placeholder="Task"  value="<% if(chn2 != null){out.print(chn2);} else {out.print("");} %>"  name="name2"></input></td>
	<td><input id='tw2' type=text placeholder="Weight (0.0-1.0)" value="<% if(chw2 != null){out.print(chw2);} else {out.print("");} %>" name="ww2"></input></td>
	<td><input id='ts2' type=checkbox <%if(chn2 != null){if (chs2.equals("true"))out.println("checked");} %> name="s2">Completed</input></td>
	</tr>

	<tr>
	<td><input id='tn3' type=text placeholder="Task"  value="<% if(chn3 != null){out.print(chn3);} else {out.print("");} %>"  name="name3"></input></td>
	<td><input id='tw3' type=text placeholder="Weight (0.0-1.0)" value="<% if(chw3 != null){out.print(chw3);} else {out.print("");} %>" name="ww3"></input></td>
	<td><input  id='ts3' type=checkbox <%if(chn3 != null){if (chs3.equals("true"))out.println("checked");} %> name="s3">Completed</input></td>
	</tr>

	<tr>
	<td><input  id='tn4' type=text placeholder="Task"  value="<% if(chn4 != null){out.print(chn4);} else {out.print("");} %>"  name="name4" ></input></td>
	<td><input  id='tw4' type=text placeholder="Weight (0.0-1.0)" value="<% if(chw4 != null){out.print(chw4);} else {out.print("");} %>" name="ww4"></input></td>
	<td><input  id='ts4' type=checkbox <%if(chn4 != null){if (chs4.equals("true"))out.println("checked");} %> name="s4">Completed</input></td>
	</tr>
	</table>


	<br/>
	<br/>
	<input type=button value="Goal Completed!" onclick="save('c')"></input>
	<input type='button' value="Clear" onclick="clear_every_thing()"></input>
	<input type=button value="Save"  onclick="save('s')"></input><br/><br/><br/>
	<input type='hidden' value='<%=date_cc%>' name='date_cc'>
	<input type='hidden' id='mode' value='s' name='mode'>
	<input type='hidden' id='mode' value='<%=mx%>' name='mo'>

</form>
<table border=1 width=400>
	<tr>
	<td>Progress: </td>

			<td id="units" width="80%"style="text-align:center ; background: linear-gradient(to right, <%=CC%>%, #FFFCCC 0%);">
				<%
				if (WW != null)	
					out.print(WW) ; 
				else
					out.println("0.0") ; 
				
				%>%
				
			</td>
	

 

	</tr>
</table>

</center>
</body>
</html>
