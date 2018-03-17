

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;

/**
 * Servlet implementation class ArchivalRequirements
 */
@WebServlet("/ArchivalRequirements")
public class ArchivalRequirements extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = null;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchivalRequirements() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException

    {

              logger=Logger.getRootLogger();

              BasicConfigurator.configure();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details=request.getSession(); 
		
		String u_name=(String)details.getAttribute("username");
		String u_role=(String)details.getAttribute("role");

			String userid=u_name;
					MDC.put("USERID", userid);
					MDC.put("USERROLE", u_role);
					
	       String legalholds = request.getParameter("legalholds");
	       String dataapp = request.getParameter("dataapp");
	       String dataloc = request.getParameter("dataloc");
	       String reconsttools = request.getParameter("reconsttools");
	       String viewblob = request.getParameter("viewblob");
	       String fieldprop = request.getParameter("fieldprop");
	       String fieldtype = request.getParameter("fieldtype");
	       String splchars = request.getParameter("splchars");
	       String foreignlang = request.getParameter("foreignlang");
	       String clob = request.getParameter("clob");
	       String unstructarch = request.getParameter("unstructarch");
	       String accrole = request.getParameter("accrole");
	       String dataview = request.getParameter("dataview");
	       String complctrl = request.getParameter("complctrl");
	       String errctrl = request.getParameter("errctrl");
	       String metadata = request.getParameter("metadata");
	       String advsearch = request.getParameter("advsearch");
	       String searchparam = request.getParameter("searchparam");
	      
	       
	       // do some processing here...
	        
	       // get response writer
	       
	       try
	       {
	    	   String idd=(String)details.getAttribute("appidd");
	         // create a mysql database connection
	         String myDriver = "org.gjt.mm.mysql.Driver";
	         String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
	         Class.forName(myDriver);
	         Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	         
	         // the mysql insert statement
	         String query = " insert into archivalRequirement (legalholds, dataapp, dataloc, reconsttools,viewblob,fieldprop,fieldtype,splchars,foreignlang,clob,unstructarch,accrole,dataview,complctrl,errctrl,metadata,advsearch,searchparam,appname)"
	           + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'"+idd+"')";

	         
	         PreparedStatement preparedStmt = conn.prepareStatement(query);
	         preparedStmt.setString (1, legalholds);
	         preparedStmt.setString   (2, dataapp);
	         preparedStmt.setString (3, dataloc);
	         preparedStmt.setString(4, reconsttools);
	         preparedStmt.setString(5, viewblob);
	         preparedStmt.setString (6, fieldprop);
	         preparedStmt.setString   (7, fieldtype);
	         preparedStmt.setString (8, splchars);
	         preparedStmt.setString (9, foreignlang);
	         preparedStmt.setString (10, clob);
	         preparedStmt.setString (11, unstructarch);
	         preparedStmt.setString (12, accrole);
	         preparedStmt.setString (13, dataview);
	         preparedStmt.setString (14, complctrl);
	         preparedStmt.setString (15, errctrl);
	         preparedStmt.setString (16, metadata);
	         preparedStmt.setString (17, advsearch);
	         preparedStmt.setString (18, searchparam);
	        
	         

	         // execute the preparedstatement
	         preparedStmt.execute();
	         
	         conn.close();
	       }
	       catch (Exception e)
	       {
	       
	         System.err.println("Got an exception!");
	         System.err.println(e.getMessage());
	       }
	       // return response
	       response.sendRedirect("Intake_ReviewPage.jsp");
	}

	}