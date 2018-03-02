

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Onb
 */
@WebServlet("/Onb")
public class Onb extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Onb() {
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
		String app_name = request.getParameter("app_name");
        String ref_to_app = request.getParameter("ref_to_app");
        String app_desc = request.getParameter("app_desc");
        String app_vendor = request.getParameter("app_vendor");
        String contract_exp_date = request.getParameter("contract_exp_date");
        String notice_period = request.getParameter("notice_period");
        String contract_value = request.getParameter("contract_value");
        String business_units = request.getParameter("business_units");
        String txn_module = request.getParameter("txn_module");
        String readonly_date = request.getParameter("readonly_date");
        String rod_reason = request.getParameter("rod_reason");
       
        String authority = request.getParameter("authority");
        String db_size = request.getParameter("db_size");
        String loc_data = request.getParameter("loc_data");
        String site_location_data = request.getParameter("site_location_data");
        String prod_instance = request.getParameter("prod_instance");
       
        String loc_prod_instance = request.getParameter("loc_prod_instance");
        String info_sec_classification = request.getParameter("info_sec_classification");
        String app_migrated_flg = request.getParameter("app_migrated_flg");
        String target_app_name = request.getParameter("target_app_name");
        String date_migration = request.getParameter("date_migration");
      
        	
       
        String archive_reqd_flg = request.getParameter("archive_reqd_flg");
        String reason_archive_no = request.getParameter("reason_archive_no");
        String gen_comment = request.getParameter("gen_comment");
         
        
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
          Connection conn = DriverManager.getConnection(myUrl, "root", "root");
        
         
          // the mysql insert statement
          String query = " insert into app_info (app_name, ref_to_app, app_desc, app_vendor, contract_exp_date, notice_period, contract_value, business_units, txn_module, readonly_date, db_size, loc_data, site_location_data, prod_instance, loc_prod_instance, info_sec_classification, app_migrated_flg, target_app_name, date_migration, archive_reqd_flg, reason_archive_no, gen_comment)"
            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
          preparedStmt.setString (1, app_name);
          preparedStmt.setString   (2, ref_to_app);
          preparedStmt.setString (3, app_desc);
          preparedStmt.setString(4, app_vendor);
          preparedStmt.setString(5, contract_exp_date);
          preparedStmt.setString (6, notice_period);
          preparedStmt.setString   (7, contract_value);
          preparedStmt.setString (8, business_units);
          preparedStmt.setString(9, txn_module);
          preparedStmt.setString(10, readonly_date);
          preparedStmt.setString (11, db_size);
          preparedStmt.setString   (12, loc_data);
          preparedStmt.setString (13, site_location_data);
          preparedStmt.setString(14, prod_instance);
          preparedStmt.setString(15, loc_prod_instance);
          preparedStmt.setString (16, info_sec_classification);
          preparedStmt.setString   (17, app_migrated_flg);
          preparedStmt.setString (18, target_app_name);
          preparedStmt.setString(19, (date_migration));
          preparedStmt.setString(20, archive_reqd_flg);
          preparedStmt.setString (21, reason_archive_no);
          preparedStmt.setString   (22, gen_comment);
          
          
          

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
        response.sendRedirect("component.jsp");
		

	}

}
