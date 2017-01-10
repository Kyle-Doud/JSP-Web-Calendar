

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import java.util.ArrayList;

public class XmlParser
{
	Document doc;
	String myUser;
	public XmlParser(String user)
	{
		this.myUser = user;
		try {

		String file = "user_data.xml";

		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
		doc = docBuilder.parse(file);
		}
		catch(Exception p)
		{
			//do something graceful
		}
	}



	public ArrayList<String> getEventsForDay(String monthin, int yearIn, int dayIn)
	{
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


		String xmldate = mon+"/"+dayIn+"/"+yearIn ;
		ArrayList<String> goals = new ArrayList<String>();
	try
	{
		Node users = doc.getFirstChild();

		NodeList userlist = doc.getElementsByTagName("user");
		Node user = null;
		for(int i = 0; i < userlist.getLength(); i++)
		{
			if(userlist.item(i).getAttributes().getNamedItem("uname").equals(user))
			{
				user = userlist.item(i);
			}
		}
		Element e = (Element) user;
		NodeList daylist = e.getElementsByTagName("day");
		Node day = null;
		for(int i = 0; i < daylist.getLength(); i++)
		{
			if(daylist.item(i).getAttributes().getNamedItem("date").equals(xmldate))
			{
				day = daylist.item(i);
			}
		}

		
		Element d = (Element) day;
		NodeList goalList = d.getElementsByTagName("goal");
		for(int i = 0; i < goalList.getLength(); i++)
		{
			Element t = (Element) goalList.item(i);
			Element te = (Element) t.getElementsByTagName("title").item(1);
			goals.add(te.getTextContent());
		}
	}
	catch(Exception s)
	{
		//do something
	}
		return goals;
	}
}