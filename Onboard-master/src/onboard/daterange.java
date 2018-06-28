package onboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.*;
import java.util.Locale;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * Servlet implementation class daterange
 */
@WebServlet("/daterange")
public class daterange extends HttpServlet {
	ArrayList<String> pro_name = new ArrayList<String>();
	ArrayList<String> int_date = new ArrayList<String>();
	ArrayList<String> int_date_mod = new ArrayList<String>();
	ArrayList<String> totalDates = new ArrayList<String>();
	ArrayList<String> Range_dates = new ArrayList<String>();
	ArrayList<String> Range_dates_conv = new ArrayList<String>();
	ArrayList<String> result_projects = new ArrayList<String>();
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public daterange() {
        super();
        try
		{
		DBconnection d;
		Connection con;
		d = new DBconnection();
		con = (Connection) d.getConnection();
		Statement week = con.createStatement();
		pro_name.clear();
		int_date.clear();
		System.out.println("HI");
		ResultSet rs = week.executeQuery("select projectname,Intdate from projinfo ");
		while (rs.next()) {
			
			pro_name.add(rs.getString(1));
			int_date.add(rs.getString(2));
			
		}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	public void project_select()
	{
		try
		{
		result_projects.clear();
		for(int i=0;i<Range_dates_conv.size();i++)
		{
			for(int j=0;j<int_date_mod.size();j++)
			{
				if(Range_dates_conv.get(i).equals(int_date_mod.get(j)))
				{
					result_projects.add(pro_name.get(j));
				}
			}
		}
		
		for(int i=0;i<result_projects.size();i++)
		{
			System.out.println("result_projecs : "+result_projects.get(i));
		}
		}
		catch(Exception e)
		{
			System.out.println("HI Helo :"+e.getMessage());
		}
		
	}
	
	public void range_calc(String s1,String s2)
	{
	try
	{
		System.out.println("HIIIIIIIII");
	totalDates.clear();
	String arr[]=s1.split("/");
	String arr1[]=s2.split("/");
	if(arr[1].length()==1)
		arr[1]="0"+arr[1];
	if(arr[0].length()==1)
		arr[0]="0"+arr[0];
	if(arr1[1].length()==1)
		arr1[1]="0"+arr1[1];
	if(arr1[0].length()==1)
		arr1[0]="0"+arr1[0];
	String from=arr[2]+"-"+arr[0]+"-"+arr[1];
	String to=arr1[2]+"-"+arr1[0]+"-"+arr1[1];
	LocalDate start = LocalDate.parse(from);
	LocalDate end = LocalDate.parse(to);
	
	while (!start.isAfter(end)) {
	    totalDates.add(start.toString());
	    start = start.plusDays(1);
	}
	
	}
	catch(Exception e)
	{
	System.out.println("HIIIIIII : " + e.getMessage());	
	}
	}
	
	public void monthToYear(ArrayList<String> range)
	{
		try
		{
		Range_dates_conv.clear();
		int_date_mod.clear();
		String delimiter ="";
		if(range.get(0).contains("/"))
				{
			delimiter = "/";
			for(int i=0;i<range.size();i++)
			{
			String arr[]=range.get(i).split(delimiter);
			if(arr[1].length()==1)
				arr[1]="0"+arr[1];
			if(arr[0].length()==1)
				arr[0]="0"+arr[0];
			String newdate=arr[0]+"/"+arr[1]+"/"+arr[2];
			
			int_date_mod.add(newdate);
			}
				}
		else
		{
			delimiter="-";
			for(int i=0;i<range.size();i++)
			{
			String arr[]=range.get(i).split(delimiter);
			String newdate=arr[1]+"/"+arr[2]+"/"+arr[0];
			
			Range_dates_conv.add(newdate);
			}
		}
		}
		catch(Exception e)
		{
			System.out.println("HELLO : "+e.getMessage());
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
		System.out.println("----------dateRange page------------");
		
		String fromDate = request.getParameter("fromD");
		String toDate = request.getParameter("toD");
		
		System.out.println("FromDate : " + fromDate  + "TODate :" + toDate);
		//System.out.println("HI");
		//range_calc(fromDate,toDate);
		range_calc("5/1/2018","5/1/2018");
		monthToYear(totalDates);
		monthToYear(int_date);
		project_select();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
	}

}
