
import java.io.IOException
;
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
 * Servlet implementation class business
 */
@WebServlet("/business")
public class business extends HttpServlet {
private static final long serialVersionUID = 1L;
private Logger logger = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public business() {
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
	HttpSession session=request.getSession();
	String u_name=(String)details.getAttribute("username");
	String u_role=(String)details.getAttribute("role");
	String application_name=(String)session.getAttribute("appidd");

		String userid=u_name;
				MDC.put("USERID", userid);
				MDC.put("USERROLE", u_role);
				String projectname=request.getParameter("project_name");
				logger.info("modified project "+projectname); 
String legappname = request.getParameter("legappname");
       String reftoapp = request.getParameter("reftoapp");
       String tid = request.getParameter("tid");
       String descr = request.getParameter("descr");
       String vendor = request.getParameter("vendor");
       String expdate = request.getParameter("expdate");
       String noticeperiod = request.getParameter("noticeperiod");
       String contractvalue = request.getParameter("contractvalue");
       String businessunits = request.getParameter("businessunits");
       if(businessunits==null)
    	   businessunits="No";
     
       String rodch = request.getParameter("rodch");
       if(rodch==null)
    	   rodch="No";
       
       String rod = request.getParameter("rod");
       String cmnt = request.getParameter("cmnt");
       String hasdep = request.getParameter("hasdep");
       String daterange = request.getParameter("daterange");
       String dbsize = request.getParameter("dbsize");
       String dataloc = request.getParameter("dataloc");
       String siteloc = request.getParameter("siteloc");
       String needarch = request.getParameter("needarch");
       String archreason = request.getParameter("archreason");
       String archcmnt = request.getParameter("archcmnt");
       String sourceoft = request.getParameter("sourceoft");
       if(sourceoft==null)
    	   sourceoft="No";
       String reccode = request.getParameter("reccode");
       String triggerdate = request.getParameter("triggerdate");
       String retentionperiod = request.getParameter("retentionperiod");
       String retentiontable = request.getParameter("retentiontable");
       String retentionname = request.getParameter("retentionname");
       String legalholds = request.getParameter("legalholds");
       String wholegal = request.getParameter("wholegal");
       String archexp = request.getParameter("archexp");
       String useforBI = request.getParameter("useforBI");
       String app_data_arch = request.getParameter("app_data_arch");
String creditacc = request.getParameter("creditacc");
if(creditacc==null)
	creditacc="No";
       String financialacc = request.getParameter("financialacc");
       if(financialacc==null)
    	   financialacc="No";
       String dob = request.getParameter("dob");
       if(dob==null)
    	   dob="No";
       String driverlic = request.getParameter("driverlic");
       if(driverlic==null)
    	   driverlic="No";
       String email = request.getParameter("email");
       if(email==null)
    	   email="No";
       String family = request.getParameter("family");
       if(family==null)
    	   family="No";
       String gender = request.getParameter("gender");
       if(gender==null)
    	   gender="No";
       String geoloc = request.getParameter("geoloc");
       if(geoloc==null)
    	   geoloc="No";
       String img = request.getParameter("img");
       if(img==null)
    	   img="No";
       String income = request.getParameter("income");
       if(income==null)
    	   income="No";
       String ipadrs = request.getParameter("ipadrs");
       if(ipadrs==null)
    	   ipadrs="No";
       String martialstatus = request.getParameter("martialstatus");
       if(martialstatus==null)
    	   martialstatus="No";
       String mobid = request.getParameter("mobid");
       if(mobid==null)
    	   mobid="No";
       String name = request.getParameter("name");
       if(name==null)
    	   name="No";
       String phno = request.getParameter("phno");
       if(phno==null)
    	   phno="No";
       String mailadrs = request.getParameter("mailadrs");
       if(mailadrs==null)
    	   mailadrs="No";
       String physic = request.getParameter("physic");
       if(physic==null)
    	   physic="No";
       String race = request.getParameter("race");
       if(race==null)
    	   race="No";
       String religion = request.getParameter("religion");
       if(religion==null)
    	   religion="No";
       String sexualpref = request.getParameter("sexualpref");
       if(sexualpref==null)
    	   sexualpref="No";
       String ssn = request.getParameter("ssn");
       if(ssn==null)
    	   ssn="No";
       String others = request.getParameter("others");
       if(others==null)
    	   others="No";
       String expl = request.getParameter("expl");
       String localreq = request.getParameter("localreq");
       String localcountry = request.getParameter("localcountry");
       String localinf = request.getParameter("localinf");
       String datacenters = request.getParameter("datacenters");
       String extaccess = request.getParameter("extaccess");
       String who = request.getParameter("who");
       String uname = request.getParameter("uname"); 
       String roledesc = request.getParameter("roledesc");
       String accreason = request.getParameter("accreason");
       String accfreq = request.getParameter("accfreq");
       String sysreq = request.getParameter("sysreq"); 
       String BItarget = request.getParameter("BItarget"); 
       if(BItarget==null)
    	   BItarget="No";
       String BIengagement = request.getParameter("BIengagement");
       if(BIengagement==null)
    	   BIengagement="No";
       
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
         String query = " insert into business (legappname, reftoapp, tid, descr, vendor, expdate,noticeperiod, contractvalue, businessunits, rodch, rod, cmnt, hasdep, daterange, dbsize, dataloc, siteloc, needarch, archreason, archcmnt, sourceoft, reccode, triggerdate, retentionperiod, retentiontable, retentionname, legalholds, wholegal, archexp, useforBI, creditacc, financialacc, dob, driverlic, email, family, gender, geoloc, img, income, ipadrs, martialstatus, mobid, name, phno, mailadrs, physic, race, religion, sexualpref, ssn, others, expl, localreq, localcountry, localinf, datacenters, extaccess, who, uname, roledesc, accreason, accfreq, sysreq, appname,projectname,app_data_arch,BItarget,BIengagement)"
           + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

         
         PreparedStatement preparedStmt = conn.prepareStatement(query);
         preparedStmt.setString (1, legappname);
         preparedStmt.setString   (2, reftoapp);
         preparedStmt.setString (3, tid);
         preparedStmt.setString(4, descr);
         preparedStmt.setString(5, vendor);
         preparedStmt.setString (6, expdate);
         preparedStmt.setString   (7, noticeperiod);
         preparedStmt.setString (8, contractvalue);
         preparedStmt.setString(9, businessunits);
         preparedStmt.setString(10, rodch);
         preparedStmt.setString (11, rod);
         preparedStmt.setString   (12, cmnt);
         preparedStmt.setString (13, hasdep);
         preparedStmt.setString(14, daterange);
         preparedStmt.setString(15, dbsize);
         preparedStmt.setString (16, dataloc);
         preparedStmt.setString   (17, siteloc);
         preparedStmt.setString (18, needarch);
         preparedStmt.setString (19, archreason);
         preparedStmt.setString(20,  archcmnt);
         preparedStmt.setString (21, sourceoft);
         preparedStmt.setString   (22, reccode);
         preparedStmt.setString (23, triggerdate);
         preparedStmt.setString   (24, retentionperiod);
         preparedStmt.setString (25, retentiontable);
         preparedStmt.setString   (26, retentionname);
         preparedStmt.setString (27, legalholds);
         preparedStmt.setString   (28, wholegal);
         preparedStmt.setString (29, archexp);
         preparedStmt.setString   (30, useforBI);
         preparedStmt.setString (31, creditacc);
         preparedStmt.setString   (32, financialacc);
         preparedStmt.setString (33, dob);
         preparedStmt.setString(34, driverlic);
         preparedStmt.setString(35, email);
         preparedStmt.setString (36, family);
         preparedStmt.setString   (37, gender);
         preparedStmt.setString (38, geoloc);
         preparedStmt.setString(39, img);
         preparedStmt.setString(40, income);
         preparedStmt.setString (41, ipadrs);
         preparedStmt.setString   (42, martialstatus);
         preparedStmt.setString (43, mobid);
         preparedStmt.setString(44, name);
         preparedStmt.setString(45, phno);
         preparedStmt.setString (46, mailadrs);
         preparedStmt.setString   (47, physic);
         preparedStmt.setString (48, race);
         preparedStmt.setString (49, religion);
         preparedStmt.setString(50,  sexualpref);
         preparedStmt.setString (51, ssn);
         preparedStmt.setString   (52, others);
         preparedStmt.setString (53, expl);
         preparedStmt.setString   (54, localreq);
         preparedStmt.setString (55, localcountry);
         preparedStmt.setString   (56, localinf);
         preparedStmt.setString (57, datacenters);
         preparedStmt.setString   (58, extaccess);
         preparedStmt.setString (59, who);
         preparedStmt.setString   (60, uname);
         preparedStmt.setString (61, roledesc);
         preparedStmt.setString   (62, accreason);
         preparedStmt.setString (63, accfreq);
         preparedStmt.setString   (64, sysreq);
         preparedStmt.setString   (65, application_name);
         preparedStmt.setString   (66, projectname);
         preparedStmt.setString   (67, app_data_arch);
         preparedStmt.setString   (68, BItarget);
         preparedStmt.setString   (69, BIengagement);

         
         

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
       response.sendRedirect("Intake_TechnicalDetails.jsp");
}

}