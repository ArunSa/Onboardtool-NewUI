
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import onboard.encryption;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		//System.out.println("HI");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	   System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Login servlet-----[INFO]");  
		// TODO Auto-generated method stub
		HttpSession details=request.getSession(); 
		HttpSession session=request.getSession();
		String userid=request.getParameter("usr");
		String pwd=request.getParameter("pwd"); 
		session.setAttribute("username",userid);
		details.setAttribute("u_Name",userid);
		
	
	class Samp
	{
		
		String seq_num,level,name,id,refid;
		Samp(String seq_num,String level,String name,String id,String refid)
		{
			this.seq_num=seq_num;
			this.level=level;
			this.name=name;
			this.id=id;
			this.refid=refid;
			
		}
	}

	class Exec
	{
		String level,name,id,refid,index;
		Exec(String level,String name,String id,String refid,String index)
		{
			this.level=level;
			this.name=name;
			this.id=id;
			this.refid=refid;
			this.index=index;
			
		}
	}

	class Role
	{
		String role,admin,app_emp,intake,arch_exe,decomm,prgm_governance,reporting,finance;
		Role(String role,String admin,String app_emp,String intake,String arch_exe,String decomm,String prgm_governance,String reporting,String finance)
		{
			this.role=role;
			this.admin=admin;
			this.app_emp=app_emp;
			this.intake=intake;
			this.arch_exe=arch_exe;
			this.decomm=decomm;
			this.prgm_governance=prgm_governance;
			this.reporting=reporting;
			this.finance=finance;
			
		}
		
	}
	
	int i=0,exec_det=0,dum=0,lm=0;
	
		
try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding","root","password123");

	
	
	Statement st5= con.createStatement(); 
	ResultSet rs5=st5.executeQuery("select * from ArchiveExecution_Defaultvalues");
	Statement st6= con.createStatement(); 
	ResultSet rs6=st6.executeQuery("select * from details");
	Statement st7= con.createStatement(); 
	ResultSet rs7=st7.executeQuery("select * from dummy");
	Statement st8= con.createStatement(); 
	ResultSet rs8=st8.executeQuery("select * from Role_Details");
	while(rs8.next())
	lm++;
	while(rs5.next())
		i++;
	while(rs6.next())
		exec_det++;
	while(rs7.next())
		dum++;
	if(lm==0)
	{
		Role r[]=new Role[11];
		r[0]=new Role("Admin", "X", "X", "X", "X", "X", "X", "X", "R");
		r[1]=new Role("ArchivalAdmin", "X", "X", "X", "X", "X", "R", "X", "R");
		r[2]=new Role("LegacyTechnicalSME", "N", "X", "XR", "R", "N", "N", "R", "N");
		r[3]=new Role("LegacyBusinessSME", "N", "X", "RX", "R", "N", "N", "R", "N");
		r[4]=new Role("LegacyProgramManager", "N", "X", "X", "R", "N", "N", "R", "N");
		r[5]=new Role("ArchivalBusinessAnalyst", "N", "X", "X", "X", "N", "N", "X", "N");
		r[6]=new Role("ArchivalProgramManager", "R", "X", "X", "X", "X", "X", "X", "X");
		r[7]=new Role("ArchivalProjectManager", "R", "X", "X", "X", "X", "X", "X", "X");
		r[8]=new Role("ArchivalDeveloper", "N", "R", "R", "R", "N", "N", "R", "N");
		r[9]=new Role("TestLead", "N", "N", "N", "R", "N", "N", "R", "N");
		for(int j=0;j<10;j++){
		    String query = " insert into Role_Details (role, admin, app_emp, intake, arch_exe, decomm, prgm_governance, reporting, finance)"
		            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		          PreparedStatement preparedStmt = con.prepareStatement(query);
		          preparedStmt.setString(1, r[j].role);
		          preparedStmt.setString(2, r[j].admin);
		          preparedStmt.setString(3, r[j].app_emp);
		          preparedStmt.setString(4, r[j].intake);
		          preparedStmt.setString(5, r[j].arch_exe);
		          preparedStmt.setString(6, r[j].decomm);
		          preparedStmt.setString(7, r[j].prgm_governance);
		          preparedStmt.setString(8, r[j].reporting);
		          preparedStmt.setString(9, r[j].finance);
		   
		  	          
		     preparedStmt.execute();
		}
		
	}

	if(dum==0){
	String q = " insert into dummy (value)"
	        + " values (?)";

	      PreparedStatement preparedStmt01 = con.prepareStatement(q);

	      preparedStmt01.setString (1, "10000");

	      preparedStmt01.execute();
	      }

	if(i==0){
		Samp s[]=new Samp[30];
		s[0]=new Samp("1", "1", "Ideation and Initiate", "10000", "10000");
		s[1]=new Samp("2", "2", "Develop and Approve Business Case", "10012", "10000");
		s[2]=new Samp("3", "2", "Request Project in GPS with Assigned Project", "10011", "10000");
		s[3]=new Samp("4", "2", "Assign PM and Project Owner", "10010", "10000");
		s[4]=new Samp("5", "2", "Assign Priority and Project Risk Score", "10009", "10000");
		s[5]=new Samp("6", "2", "Gate1 Approval to Plan", "10004", "10000");
		s[6]=new Samp("7", "1", "Plan", "10001", "10001");
		s[7]=new Samp("8", "2", "Onboarding", "10015", "10001");
		s[8]=new Samp("9", "3", "Allocate Resources", "10017", "10015");
		s[9]=new Samp("10", "3", "Compliance Training", "10016", "10015");
		s[10]=new Samp("11", "2", "Project Kickoff", "10014", "10001");
		s[11]=new Samp("12", "2", "Project Plan", "10013", "10001");
		s[12]=new Samp("13", "3", "Draft project Plan", "10023", "10013");
		s[13]=new Samp("14", "3", "Delivery of draft project plan", "10022", "10013");
		s[14]=new Samp("15", "3", "Review project plan", "10021", "10013");
		s[15]=new Samp("16", "3", "Revise project plan", "10020", "10013");
		s[16]=new Samp("17", "3", "Delivery of project plan for approval", "10019", "10013");
		s[17]=new Samp("18", "3", "Approval of project plan", "10018", "10013");
		s[18]=new Samp("19", "2", "Process and Procedure definition", "10005", "10001");
		s[19]=new Samp("20", "3", "Archive Information and Requirements (AIR) Template", "10024", "10005");
		s[20]=new Samp("21", "1", "Execute", "10002", "10002");
		s[21]=new Samp("22", "1", "Closure", "10025", "10025");
		s[22]=new Samp("23", "2", "Hypercare Support", "10026", "10025");
		s[23]=new Samp("24", "2", "Exit criteria meeting and Retirement communication", "10027", "10025");
		s[24]=new Samp("25", "2", "Stakeholder communication", "10028", "10025");
		s[25]=new Samp("26", "2", "Lessons learned", "10029", "10025");
		s[26]=new Samp("27", "2", "Project close check list", "10030", "10025");
		s[27]=new Samp("28", "2", "Final finances and invoices", "10031", "10025");
		
	for(int j=0;j<28;j++){
	    String query = " insert into ArchiveExecution_Defaultvalues (seq_num, level, name, id, ref_id, mem_ass, act_srt_date, act_end_date, pln_srt_date, pln_end_date,  hours, stats, planned_hrs)"
	            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	          PreparedStatement preparedStmt = con.prepareStatement(query);
	          preparedStmt.setString(1, s[j].seq_num);
	          preparedStmt.setString(2, s[j].level);
	          preparedStmt.setString(3, s[j].name);
	          preparedStmt.setString(4, s[j].id);
	          preparedStmt.setString(5, s[j].refid);
	          preparedStmt.setString(6, "");
	          preparedStmt.setString(7, "");
	          preparedStmt.setString(8, "");
	          preparedStmt.setString(9, "");
	          preparedStmt.setString(10, "");
	          preparedStmt.setString(11, "");
	          preparedStmt.setString(12, "");
	          preparedStmt.setString(13, "");
	  	          
	     preparedStmt.execute();
	}
	}
	if(exec_det==0)
	{
		Exec e[]=new Exec[62];
		e[0]=new Exec("3", "Requirements", "101", "", "1");
		e[1]=new Exec("4", "Prepopulate Draft AIR and Load in Box", "114", "101", "2");
		e[2]=new Exec("4", "Send link to draft AIR to SME", "113", "101", "3");
		e[3]=new Exec("4", "Update AIR and Load in Box", "112", "101", "4");
		e[4]=new Exec("4", "Q&A with SME", "111", "101", "5");
		e[5]=new Exec("4", "Legacy System and Database Access", "110", "101", "6");
		e[6]=new Exec("4", "Functional Pillars Review", "109", "101", "7");
		e[7]=new Exec("4", "Sign Off Requirements (AIR, Approvals)", "108", "101", "8");
		e[8]=new Exec("4", "Finalized read only date for the application", "107", "101", "9");
		e[9]=new Exec("3", "Gate 2 Approval to Build", "102", "", "10");
		e[10]=new Exec("3", "Build and Test", "103", "", "11");
		e[11]=new Exec("4", "Configuration", "136", "103", "12");
		e[12]=new Exec("5", "Technical Design Document-Development", "145", "136", "13");
		e[13]=new Exec("5", "Technical Design Document ? Approval", "144", "136", "14");
		e[14]=new Exec("5", "Shell Application Set up", "143", "136", "15");
		e[15]=new Exec("5", "Ingestion Configuration", "142", "136", "16");
		e[16]=new Exec("5", "Build & Configuration Screens and Reports", "141", "136", "17");
		e[17]=new Exec("5", "ETL Extraction Scripts", "140", "136", "18");
		e[18]=new Exec("5", "ETL Jobs setup", "139", "136", "19");
		e[19]=new Exec("5", "Build Unit Test Scripts", "138", "136", "20");
		e[20]=new Exec("5", "Test Extraction for connection validation", "137", "136", "21");
		e[21]=new Exec("4", "Cycle 1 (Dev)", "135", "103", "22");
		e[22]=new Exec("5", "First Sample Extraction", "149", "135", "23");
		e[23]=new Exec("5", "Load of the Sample Extraction", "148", "135", "24");
		e[24]=new Exec("5", "Build Index", "147", "135", "25");
		e[25]=new Exec("5", "Unit Testing", "146", "135", "26");
		e[26]=new Exec("4", "Cycle 2 (Stage)", "133", "103", "27");
		e[27]=new Exec("5", "Promote Application to Stage", "153", "133", "28");
		e[28]=new Exec("5", "Test Script inventory - approval", "152", "133", "29");
		e[29]=new Exec("5", "First Full Extraction", "151", "133", "30");
		e[30]=new Exec("5", "Full Load and Build Index", "150", "133", "31");
		e[31]=new Exec("4", "UAT setup (Stage)", "132", "103", "32");
		e[32]=new Exec("5", "Access and Authentication setup for Application", "157", "132", "33");
		e[33]=new Exec("5", "Assistance to UAT Test Plan", "156", "132", "34");
		e[34]=new Exec("5", "Stakeholder Communication", "155", "132", "35");
		e[35]=new Exec("5", "Get Business approval to proceed with UAT", "154", "132", "36");
		e[36]=new Exec("4", "UAT", "131", "103", "37");
		e[37]=new Exec("5", "Pre - Test script inventoryapproval", "162", "131", "38");
		e[38]=new Exec("5", "Coordinate Business UAT", "161", "131", "39");
		e[39]=new Exec("5", "Business UAT", "160", "131", "40");
		e[40]=new Exec("5", "Review results, Defect Fixes", "159", "131", "41");
		e[41]=new Exec("5", "Job Aid Completion", "158", "131", "42");
		e[42]=new Exec("3", "Gate 3 Approval to Deploy", "104", "", "43");
		e[43]=new Exec("3", "Implement", "105", "", "44");
		e[44]=new Exec("4", "Pre-Deployment Activities", "116", "105", "45");
		e[45]=new Exec("5", "Stakeholder Communication", "122", "116", "46");
		e[46]=new Exec("5", "Create CI - Configuration Item request", "121", "116", "47");
		e[47]=new Exec("5", "Re-evaluate Access and  authentication setup for application", "120", "116", "48");
		e[48]=new Exec("5", "Review deployment team tasks and  timeline", "119", "116", "49");
		e[49]=new Exec("5", "Active Directory Integration", "118", "116", "50");
		e[50]=new Exec("5", "Deploy Infrastructure Components", "117", "116", "51");
		e[51]=new Exec("4", "Deployment Activities", "115", "105", "52");
		e[52]=new Exec("5", "Gather meta data for all the files that are extracted from", "130", "115", "53");
		e[53]=new Exec("5", "Migrate data from stage to prod", "129", "115", "54");
		e[54]=new Exec("5", "Migrate components from Stage to Prod- Federation", "128", "115", "55");
		e[55]=new Exec("5", "Create/Validate/update indexes", "127", "115", "56");
		e[56]=new Exec("5", "Request for Change (RFC)Submission and approval", "126", "115", "57");
		e[57]=new Exec("5", "Change Approval Board (CAB) Submission and approval", "125", "115", "58");
		e[58]=new Exec("5", "Release to production/operations environment", "124", "115", "59");
		e[59]=new Exec("5", "Migration Report sign-off", "123", "115", "60");
		e[60]=new Exec("3", "Gate 4 Approval to close", "106", "", "61");
		
		for(int j=0;j<61;j++){
		    String query3 = " insert into details (level, name, id, ref_id, indx)"
		            + " values (?, ?, ?, ?, ?)";

		          PreparedStatement preparedStmt3 = con.prepareStatement(query3);
		          preparedStmt3.setString(1, e[j].level);
		          preparedStmt3.setString(2, e[j].name);
		          preparedStmt3.setString(3, e[j].id);
		          preparedStmt3.setString(4, e[j].refid);
		          preparedStmt3.setString(5, e[j].index);
		  	          
		     preparedStmt3.execute();
		}
		
	}


	Statement st= con.createStatement(); 
	ResultSet rs=st.executeQuery("select * from Admin_UserDetails where uname='"+userid+"'");


	if(userid.equals("admin")&&pwd.equals("admin"))
	{
		
		details.setAttribute("role","admin");
		details.setAttribute("projects","all");
		details.setAttribute("admin","X");
		details.setAttribute("prj","X");
		details.setAttribute("app_emp","X");
		details.setAttribute("intake","X");
		details.setAttribute("archive_exec","X");

	    String redirectURL = "Project_List.jsp";

	    response.sendRedirect(redirectURL);
	}
	else
		{
		if(rs.next()) 
		
	{
		
		encryption et=new encryption();
		  String passw=(String)et.decrypt(rs.getString(5));
		// System.out.println("decrypted pass is "+passw+" and entered passw is "+pwd);
			if((passw.equals(pwd)))
	{ 
		details.setAttribute("role",rs.getString(7));
		details.setAttribute("projects",rs.getString(6));
		details.setAttribute("applications",rs.getString(11));
		Statement st1= con.createStatement(); 
		ResultSet rs1=st.executeQuery("select * from Role_Details where role='"+rs.getString(7)+"'"); 
		if(rs1.next())
		{
			details.setAttribute("admin",rs1.getString(2));
			details.setAttribute("app_emp",rs1.getString(3));
			details.setAttribute("intake",rs1.getString(4));
			details.setAttribute("archive_exec",rs1.getString(5));
			
		}
		


		
		
		
			        String redirectURL = "Project_List.jsp";
		
			        response.sendRedirect(redirectURL);
		
			   

	}
			else 
			{ 
				
				response.sendRedirect("Login_Error.jsp");
			}
			
				
			
	
		
	}
		else 
		{ 
			//System.out.println("if");
			response.sendRedirect("Login_Error.jsp");
		}
		}
	
	String u_name=(String)details.getAttribute("username");
	String u_role=(String)details.getAttribute("role");
		String user_id=u_name;
				MDC.put("USERID", user_id);
				MDC.put("USERROLE", u_role);
				
   
				logger.info("Logged In"); 
}
catch( Exception e)
{
	  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
}
	
		
	

}
}
