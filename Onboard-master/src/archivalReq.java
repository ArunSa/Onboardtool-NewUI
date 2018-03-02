

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class archivalReq
 */
@WebServlet("/archivalReq")
public class archivalReq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public archivalReq() {
        super();
        // TODO Auto-generated constructor stub
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
		// TODO Auto-generated method stub
		String legalholds = request.getParameter("legalholds");
		String dataapp = request.getParameter("dataapp");
		String dataloc = request.getParameter("dataloc");
		String reconsttools = request.getParameter("reconsttools");
		String viewblob = request.getParameter("viewblob");
		String fieldprop = request.getParameter("fieldprop");
		String filedtype = request.getParameter("filedtype");
		String splchars = request.getParameter("splchars");
		String foreignlang = request.getParameter("foreignlang");
		String clobsource = request.getParameter("clobsource");
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
	         // create a mysql database connection
	         String myDriver = "org.gjt.mm.mysql.Driver";
	         String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
	         Class.forName(myDriver);
	         Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	         
	         // the mysql insert statement
	         String query = " insert into archivalRequirements (legalholds,dataapp,dataloc,reconsttools,viewblob,fieldprop,filedtype,splchars,foreignlang,clobsource,unstructarch,accrole,dataview,complctrl,errctrl,metadata,advsearch,searchparam)" + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	         
	         PreparedStatement preparedStmt = conn.prepareStatement(query);
	         preparedStmt.setString (1, legalholds);
	         preparedStmt.setString (2, dataapp);
	         preparedStmt.setString (3, dataloc);
	         preparedStmt.setString (4, reconsttools);
	         preparedStmt.setString (5, viewblob);
	         preparedStmt.setString (6, fieldprop);
	         preparedStmt.setString (7, filedtype);
	         preparedStmt.setString (8, splchars);
	         preparedStmt.setString (9, foreignlang);
	         preparedStmt.setString (10, clobsource);
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
	       response.sendRedirect("review.jsp");
	}

	}

