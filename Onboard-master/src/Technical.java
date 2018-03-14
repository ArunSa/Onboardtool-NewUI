import java.io.IOException;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import org.apache.log4j.BasicConfigurator;

import org.apache.log4j.Logger;

import org.apache.log4j.MDC;
import javax.servlet.ServletConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class comp
 */
@WebServlet("/Technical")
public class Technical extends HttpServlet {
private static final long serialVersionUID = 1L;
private Logger logger = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Technical() {
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

		String userid=u_name;
				MDC.put("USERID", userid);
				String u_role=(String)details.getAttribute("role");
				MDC.put("USERROLE", u_role);
				String projectname=request.getParameter("project_name");
				logger.info("modified project "+projectname); 
String datatype = request.getParameter("datatype");
       String pname = request.getParameter("pname");
       String archneed = request.getParameter("archneed");
       String formatsp = request.getParameter("format");
       String mlang = request.getParameter("mlang");
       String loclang = request.getParameter("loclang");
       String dataretain = request.getParameter("dataretain");
       String systemdoc = request.getParameter("systemdoc");
       String userdoc = request.getParameter("userdoc");
       String techdoc = request.getParameter("techdoc");
       String traindoc = request.getParameter("traindoc");
       String supportdoc = request.getParameter("supportdoc");
       String datadic = request.getParameter("datadic");
       String testcasedoc = request.getParameter("testcasedoc");
       String testrec = request.getParameter("testrec");
       String designspec = request.getParameter("designspec");
       String validityplan = request.getParameter("validityplan");
       String dataloc = request.getParameter("dataloc");
       String servername = request.getParameter("servername");
       String prodinstance = request.getParameter("prodinstance");
       String prodinstanceloc = request.getParameter("prodinstanceloc");
       String infraengage = request.getParameter("infraengage");
       String sourcearch = request.getParameter("sourcearch");
       String apphost = request.getParameter("apphost");
       String retenduration = request.getParameter("retenduration");
       String clientapp = request.getParameter("clientapp");
       String extcustfacing = request.getParameter("extcustfacing");
       String url = request.getParameter("url");
       String dbsize = request.getParameter("dbsize");
       String nooftable = request.getParameter("nooftable");
       String noofrec = request.getParameter("noofrec");
       String xmlcount = request.getParameter("xmlcount");
       String anyvpn = request.getParameter("anyvpn");
       String vpnacces = request.getParameter("vpnacces");
       String appintegrate = request.getParameter("appintegrate");
       String integname = request.getParameter("integname");
       String decomdate = request.getParameter("decomdate");
    
        
       
       // do some processing here...
        
       // get response writer
       PrintWriter writer = response.getWriter();
        
       // build HTML code
       String htmlRespone = "<html>";
       htmlRespone += "<h2>Your Order Has been Taken</h2>";  
       htmlRespone += "</html>";
       writer.println(htmlRespone);
       try
       {
         // create a mysql database connection
         String myDriver = "org.gjt.mm.mysql.Driver";
         String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
         Class.forName(myDriver);
         Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
       
   
         
         // the mysql insert statement
         String query = " insert into technical (datatype, pname, archneed, formatsp, mlang, loclang, dataretain, systemdoc, userdoc, techdoc, traindoc, supportdoc, datadic, testcasedoc, testrec, designspec, validityplan, dataloc, servername, prodinstance, prodinstanceloc, infraengage, sourcearch, apphost, retenduration, clientapp, extcustfacing, url, dbsize, nooftable, noofrec, xmlcount, anyvpn, vpnacces, appintegrate,integname,decomdate)"
           + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";

         // create the mysql insert preparedstatement
         //Scanner sin=new Scanner(System.in);
         //String id,food,extra;
         //System.out.println("Enter Your id");
         //id=sin.next();
         //System.out.println("Please tell what food you want");
         //food=sin.next();
         //System.out.println("would you like to have extra food today say y or n");
         //extra=sin.next();
         PreparedStatement preparedStmt = conn.prepareStatement(query);
         preparedStmt.setString(1, datatype);
         preparedStmt.setString(2, pname);
         preparedStmt.setString(3, archneed);
         preparedStmt.setString(4, formatsp);
         preparedStmt.setString(5, mlang);
         preparedStmt.setString(6, loclang);
         preparedStmt.setString(7, dataretain);
         preparedStmt.setString(8, systemdoc);
         preparedStmt.setString(9, userdoc);
         preparedStmt.setString(10, techdoc);
         preparedStmt.setString(11, traindoc);
         preparedStmt.setString(12, supportdoc);
         preparedStmt.setString(13, datadic);
         preparedStmt.setString(14, testcasedoc);
         preparedStmt.setString(15, testrec);
         preparedStmt.setString(16, designspec);
         preparedStmt.setString(17, validityplan);
         preparedStmt.setString(18, dataloc);
         preparedStmt.setString(19, servername);
         preparedStmt.setString(20, prodinstance);
         preparedStmt.setString(21, prodinstanceloc);
         preparedStmt.setString(22, infraengage);
         preparedStmt.setString(23, sourcearch);
         preparedStmt.setString(24, apphost);
         preparedStmt.setString(25, retenduration);
         preparedStmt.setString(26, clientapp);
         preparedStmt.setString(27, extcustfacing);
         preparedStmt.setString(28, url);
         preparedStmt.setString(29, dbsize);
         preparedStmt.setString(30, nooftable);
         preparedStmt.setString(31, noofrec);
         preparedStmt.setString(32, xmlcount);
         preparedStmt.setString(33, anyvpn);
         preparedStmt.setString(34, vpnacces);
         preparedStmt.setString(35, appintegrate);
         preparedStmt.setString(36, integname);
         preparedStmt.setString(37, decomdate);
        
         
         
         

         // execute the preparedstatement
         preparedStmt.execute();
         
         conn.close();
       }
       catch (Exception e)
       {
       
System.out.println("HIII");
         System.err.println("Got an exception!");
         System.err.println(e.getMessage());
         System.out.println("Hello");
         e.getStackTrace();
       }
       // return response
       response.sendRedirect("Intake_ArchiveRequirements.jsp");


}

}

