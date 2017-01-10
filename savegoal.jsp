<%@ page import ="java.io.*, javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, javax.xml.parsers.ParserConfigurationException, javax.xml.transform.Transformer, javax.xml.transform.TransformerException, javax.xml.transform.TransformerFactory, javax.xml.transform.dom.DOMSource, javax.xml.transform.stream.StreamResult, org.w3c.dom.Attr, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.Node, org.w3c.dom.NodeList" errorPage=""%>
<!-- REFERENCE: http://www.mkyong.com/java/how-to-modify-xml-file-in-java-dom-parser/ -->

<html>
<h1>
<%
try {


	String fileNew = "tomcat/webapps/tp_new/user_data.xml";
	BufferedReader reader = new BufferedReader(new FileReader (fileNew));
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
//--------------------------------------------------------

String lname = (String)session.getAttribute("lname");
String fs = (String)session.getAttribute("fname");
String ps = (String)session.getAttribute("pwd");
String es = (String)session.getAttribute("email");
String uss = (String)session.getAttribute("userid");
// ------------------------------------------------------
String titles = request.getParameter("title");
String description = request.getParameter("description");
String start = request.getParameter("start");
String end = request.getParameter("end");
String date_cc = request.getParameter("date_cc");

String chs1 = request.getParameter("s1");
String chs2 = request.getParameter("s2");
String chs3 = request.getParameter("s3");
String chs4 = request.getParameter("s4");

String chn1 = request.getParameter("name1");
String chn2 = request.getParameter("name2");
String chn3 = request.getParameter("name3");
String chn4 = request.getParameter("name4");

String chw1 = request.getParameter("ww1");
String chw2 = request.getParameter("ww2");
String chw3 = request.getParameter("ww3");
String chw4 = request.getParameter("ww4");

String mm = request.getParameter("mode");
String mx = request.getParameter("mo");
String mode = "s" ; 
if (mm.equals("s"))
	mode = "s" ;
if (mm.equals("c"))
	mode = "s";
if (mx.equals("x"))
	mode = "c" ; 

//------------------------------------------------------
String r = "date=" ;
String usertage = "<user fname=" ;
String user = uss ;
String df = date_cc ;
String endforuser = "</user>" ;
String enddate = "</day>" ;
String nT = "<title>" ; 
String x []= fileText.split("\n");

// ============================
 
String titlenew = "\t\t\t\t<title>"+titles+"</title>\n" ; 


String desnew =  "\t\t\t\t<description>"+description+"</description>\n" ; 
String snew =  "\t\t\t\t<start>"+start+"</start>\n" ; 
String enew =  "\t\t\t\t<end>"+end+"</end>\n" ; 
String n1new =  "\t\t\t\t\t\t<name>"+chn1+"</name>\n" ; 
String c1new =  "\t\t\t\t\t\t<completed>"+chs1+"</completed>\n" ; 
String w1new =  "\t\t\t\t\t\t<weight>"  +chw1+"</weight>\n" ; 
String n2new =  "\t\t\t\t\t\t<name>"+chn2+"</name>\n" ; 
String c2new =  "\t\t\t\t\t\t<completed>"+chs2+"</completed>\n" ; 
String w2new =  "\t\t\t\t\t\t<weight>"  +chw2+"</weight>\n" ; 
String n3new =  "\t\t\t\t\t\t<name>"  +chn3+"</name>\n" ; 
String c3new =  "\t\t\t\t\t\t<completed>"  +chs3+"</completed>\n" ; 
String w3new =  "\t\t\t\t\t\t<weight>"  +chw3+"</weight>\n" ; 
String n4new =  "\t\t\t\t\t\t<name>"  +chn4+"</name>\n" ; 
String c4new =  "\t\t\t\t\t\t<completed>"  +chs4+"</completed>\n" ; 
String w4new =  "\t\t\t\t\t\t<weight>"  +chw4+"</weight>\n" ; 


String sdate = "\t\t<day date=\""+date_cc+"\">" ;

String std= "\t\t\t\t<todo>\n" ; 
String sit= "\t\t\t\t\t<item>\n" ; 
String eit= "\t\t\t\t\t</item>\n" ; 
String etd= "\t\t\t\t</todo>\n" ; 
String sg ="\n\t\t\t<goal>\n";
String eg= "\t\t\t</goal>\n" ; 
String ed= "\t\t</day>" ;  

String sus = "\t<user fname=\""+fs+"\" lname=\""+lname+"\" uname=\""+uss+"\" pwd=\""+ps+"\" email=\""+es+"\">\n" ;
String eee = "</user>\n" ;
String total = titlenew+desnew+snew+enew +n1new+c1new +w1new+n2new+c2new +w2new+n3new+c3new +w3new+n4new+c4new +w4new+"\n" ; 
String newtotal = sdate+sg+titlenew+desnew+snew+enew +std+sit+n1new+c1new +w1new+eit+sit+n2new+c2new +w2new+eit+sit+n3new+c3new +w3new+eit+sit+n4new+c4new +w4new+eit+etd+eg+ed+"\n" ; 
String newuser = sus + newtotal + eee ; 
int flag = 0 ; 
int flag_nouser = 0 ; 
for (int i = 0 ; i < x.length ; i ++)
{ 	


	flag = 0 ; 
	if (x[i].indexOf(usertage) >= 0 && x[i].indexOf(user) >= 0  )
	{
		flag_nouser = 1 ; 
		for (int j = i ; j < x.length ; j ++ )
		{

			if (x[j].indexOf(endforuser) >= 0)
			{
				break; 
			}
			else if (x[(j+1)].indexOf(r) >= 0  && x[(j+1)].indexOf(df) >= 0 )
			{
				if ( mode == "s")
				{
					if (x[j+3].indexOf(nT)>= 0  )
					{
						x[j+3] = titlenew;
						x[j+4] = desnew;
						x[j+5] = snew;
						x[j+6] = enew ;
						x[j+9] = n1new;
						x[j+10] = c1new; 
						x[j+11] = w1new;
						x[j+14] = n2new;
						x[j+15] = c2new ;
						x[j+16] = w2new;
						x[j+19] = n3new;
						x[j+20] = c3new ;
						x[j+21] = w3new;
						x[j+24] = n4new;
						x[j+25] = c4new ;
						x[j+26] =  w4new;
					}
					flag = 1 ; 
					break;
					
				}
				else if (mode != "s")
				{
					int as = 0 ; 
					for ( int k = j+1 ; k < x.length ; k ++ ) // one day
					{
						if (x[k].indexOf(enddate) >= 0)
						{
							x[k]= x[k].replace("</day>","</day>"+newtotal) ; 
							as = 1 ; 
							flag = 1 ; 
							break;
						}
					}
					if (as == 0)
					{
						for ( int k = j; k < x.length ; k ++ ) // one day
						{
							if (x[k].indexOf(usertage) >= 0)
							{
								x[k]= x[k].replace("\">","\">"+newtotal) ; 
								as = 1 ;
								flag = 1 ; 								
								break;
							}
						}
					}						
				}
			}
			else if (mode == "c")
			{
				int as = 0 ; 
				for ( int k = j ; k < x.length ; k ++ ) // one day
				{
					if (x[k].indexOf(enddate) >= 0)
					{
						x[k]= x[k].replace("</day>","</day>\n"+newtotal) ;
						as=  2 ; 
						flag = 1 ; 
						break ; 
					}

				}
				if (as == 2)
					break;					
				if (as == 0)
				{
					for ( int k = j; k < x.length ; k ++ ) // one day
					{
						if (x[k].indexOf(usertage) >= 0)
						{
							x[k]= x[k].replace("\">","\">\n"+newtotal) ; 
							as = 1 ; 
							flag = 1 ; 
							break;
						}
					}
				}
			}
			if (flag == 1)
				break;			
		}

	}
		
}
if (flag_nouser == 0)
{
	for ( int k = 0 ; k < x.length ; k ++ ) // one day
	{
		if (x[k].indexOf(endforuser) >= 0)
		{
			x[k]= x[k].replace("</user>","</user>\n"+newuser) ; 
		}
	}
}

for (int p = 0 ; p < x.length ; p ++)
{
	x[p]= x[p].replace("<completed>on</completed>","<completed>true</completed>") ; 
	x[p]= x[p].replace("<completed>null</completed>","<completed>false</completed>") ; 
	
}



//---------------------------------------------------------



        File f = new File(fileNew);
        f.delete();
        File f1 = new File(fileNew);
        BufferedWriter writer = new BufferedWriter(new FileWriter(f, true));
		for (int i = 0 ; i < x.length ; i ++)
		{
			if (x[i].indexOf("<") >=0)
				writer.write(x[i]);
		}
		writer.close();
if (mode.equals("s"))
    out.println("We made change <br> thank you") ; 
else 
    out.println("We Create New One") ; 
%>
<a href="calendar.jsp"> Back to Celender </a>
<%
}
  catch (Exception pce) 
  {
	out.println("Exception");
	pce.printStackTrace();
  } 

finally 
{
//response.sendRedirect("calendarMonthPrintView.jsp");
} 

%>
</h1>
</html>