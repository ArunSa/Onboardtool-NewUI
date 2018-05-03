

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

import onboard.DBconnection;



/**
 * Servlet implementation class ajx
 */
@WebServlet("/Weekly_linechart")
public class Weekly_linechart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Weekly_linechart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 /*String text = "some text";

		    response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
		    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
		    response.getWriter().write(text);       // Write response body.*/
		
		response.setContentType("application/json");
		ArrayList<String> month = new ArrayList<String>();
		month.add("arun");
		month.add("vijay");
		doGet(request, response);
		//new Gson().toJson(month, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> db_date = new ArrayList<String>();
		ArrayList<String> db_count = new ArrayList<String>();
		try
		{
		DBconnection d=new DBconnection();
	    Connection con = (Connection)d.getConnection();
	    Statement week= con.createStatement();
	    
	    ResultSet rs_week=week.executeQuery("select date,count from  visits ");
	    while (rs_week.next())
	    {
	    	db_date.add(rs_week.getString(1));
	    	db_count.add(rs_week.getString(2));
	    }
		}
		catch(Exception e)
		{
			
		}
	    
		HashMap<String, Integer> map = new HashMap<>();
        
       
        map.put("January", 0);
        map.put("February", 1);
        map.put("March", 2);
        map.put("April", 3);
        map.put("May", 4);
        map.put("June", 5);
        map.put("July", 6);
        map.put("August", 7);
        map.put("September", 8);
        map.put("October", 9);
        map.put("November",10);
        map.put("December", 11);
        System.out.println("size "+map.size());
        ArrayList<String> Xaxis = new ArrayList<String>();
        ArrayList<String> from_dates = new ArrayList<String>();
        ArrayList<String> end_dates = new ArrayList<String>();
        ArrayList<Integer> final_count = new ArrayList<Integer>();
        
       /* String mn=request.getParameter("month");
        String year_frm_form=request.getParameter("year");
        int year=Integer.parseInt(year_frm_form);*/
        String month1=request.getParameter("field1");
        String year1=request.getParameter("field2");
        String mn=month1;
        System.out.println(" Month "+month1);
        System.out.println(" Year "+year1);
        int year=Integer.parseInt(year1);
        
        
        int date_from=0;
        int date_new=0;
        
        if (map.containsKey(mn)) 
        {
            Integer a = map.get(mn);
            System.out.println("value for key "+mn+" is:- " + a);
            int actual_month=a+1;
            String month  = (actual_month < 10 ? "0" : "") + actual_month;
            
            Calendar cal = Calendar.getInstance();
           
                cal.set(Calendar.YEAR, year);
                cal.set(Calendar.DAY_OF_MONTH, a);
                cal.set(Calendar.MONTH, a);
                int maxWeeknumber = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
                int last_date=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                
             //System.out.println("LOG For Month :: "+ a + " Num Week :: " + maxWeeknumber+"Last Date :"+last_date);
            for(int i=0;i<maxWeeknumber;i++)
            {
            	         date_new=date_from+7;
            	         date_from=date_from+1;
            	         if(date_new >= last_date)
                     	{
                     		date_new=last_date;
                     		String from_date=year+"-"+month+"-"+date_from;
                     		String to_date=year+"-"+month+"-"+date_new;
                     		Xaxis.add("From "+ from_date+" To "+to_date);
                     		from_dates.add(from_date);
                     		end_dates.add(to_date);
                     		
                     	}
            	         else
            	         {
            	        	 if(date_new <=9 )
            	        	 {
            	        		 String from  = (date_from < 10 ? "0" : "") + date_from;
            	        		 String to = (date_new < 10 ? "0" : "") + date_new;
            	        		 String from_date=year+"-"+month+"-"+from;
            	        		 String to_date=year+"-"+month+"-"+to;
            	        		 Xaxis.add("From "+ from_date+" To "+to_date);
            	        		 from_dates.add(from_date);
            	        		 end_dates.add(to_date);
            			
            			date_from=date_new;
            	        	 }
            	        	 else
            	        	 {
            	        		 if(date_from <=9 )
                	        	 {
            	        			 String from  = (date_from < 10 ? "0" : "") + date_from;
            	        			 String from_date=year+"-"+month+"-"+from;
            	        			 String to_date=year+"-"+month+"-"+date_new;
            	        			 Xaxis.add("From "+ from_date+" To "+to_date);
            	        			 from_dates.add(from_date);
            	        			 end_dates.add(to_date);
            	        			 
                           			date_from=date_new;
                           			
                	        	 }
            	        		 else
            	        		 {
            	        			 String from_date=year+"-"+month+"-"+date_from;
                              		String to_date=year+"-"+month+"-"+date_new;
                              		Xaxis.add("From "+ from_date+" To "+to_date);
                              		from_dates.add(from_date);
                              		end_dates.add(to_date);
                              		
                          			date_from=date_new;
            	        		 }
            	        	 }
            	         }
            		
            		
            	}
            
           
            
            
            }
      
        for(int i=0;i<from_dates.size();i++)
        {
    	
        	String s = from_dates.get(i);
        	String e = end_dates.get(i);
        	int count=0;
        	
        	LocalDate start = LocalDate.parse(s);
        	LocalDate end = LocalDate.parse(e);
        	List<LocalDate> totalDates = new ArrayList<>();
        	while (!start.isAfter(end)) {
        	    totalDates.add(start);
        	    for(int k=0;k<db_date.size();k++)
        	    {
        	    	

        	    	String s1 = start.toString();
        	    	
        	    	if(s1.equals(db_date.get(k)))
        	    	{
        	    		
        	    		count=count+Integer.parseInt(db_count.get(k));
        	    		
        	    	}
        	    	else
        	    	{
        	    		continue;
        	    	}
        	    }
        	   
        	    start = start.plusDays(1);
        	}
        	
        	final_count.add(count);
        }
        
        for(int i=0;i<from_dates.size();i++)
        {
        	System.out.println("For the week " +from_dates.get(i)+" count "+final_count.get(i));
        }
 
        String result="";
        for(int i=0;i<from_dates.size();i++)
        {
        	result=result+from_dates.get(i)+","+final_count.get(i).toString()+",";
        }
	  
        System.out.println(result.substring(0, result.length() - 1));
        String text = result.substring(0, result.length() - 1);

	    response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
	    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
	    response.getWriter().write(text); 
	
 
        
	}
        
      
		
		
		

}
