import java.util.ArrayList;

public class Driver
{
	public static void main(String[] args)
	{
		XmlParser p = new XmlParser("KyleDoud");
		ArrayList<String> ar = p.getEventsForDay("April", 22, 2016);
		for(String s : ar)
		{
			System.out.println(s);
		}
	}
}