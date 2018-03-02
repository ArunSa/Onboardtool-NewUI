
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class uploadpic
 */
@WebServlet("/uploadpic")
public class uploadpic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadpic() {
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
		  String dbURL = "jdbc:mysql://localhost:3306/strutsdb";
		     String dbUser = "root";
		     String dbPass = "password123";
		     String firstName = request.getParameter("fname");
		        String lastName = request.getParameter("lname");
		        String username = request.getParameter("uname");
		        String email = request.getParameter("email");
		        String phonenum = request.getParameter("phonenum");
		      
		         
		        System.out.println(firstName+" "+lastName+" "+username+" "+email);
		        InputStream inputStream = null; // input stream of the upload file
		        
		        // obtains the upload file part in this multipart request
		        Part filePart = request.getPart("photo");
		        System.out.println(filePart.getName());
		        if (filePart != null) {
		            // prints out some information for debugging
		            System.out.println(filePart.getName());
		            System.out.println(filePart.getSize());
		            System.out.println(filePart.getContentType());
		             
		            // obtains input stream of the upload file
		            inputStream = filePart.getInputStream();
		        }
		        else
		        	System.out.println("it is null");
		         
		        Connection conn = null; // connection to the database
		        String message = null;  // message will be sent back to client
		         
		        try {
		            // connects to the database
		            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
		 
		            // constructs SQL statement
		            String sql = "INSERT INTO profiledetails (first_name, last_name, user_name, email, phone_num, photo) values (?, ?, ?, ?, ?, ?)";
		            PreparedStatement statement = conn.prepareStatement(sql);
		            statement.setString(1, firstName);
		            statement.setString(2, lastName);
		            statement.setString(3, username);
		            statement.setString(4, email);
		            statement.setString(5, phonenum);
		            statement.setBlob(6, inputStream);
		         /*   if (inputStream != null) {
		                // fetches input stream of the upload file for the blob column
		                statement.setBlob(6, inputStream);
		            }*/
		 
		            // sends the statement to the database server
		            int row = statement.executeUpdate();
		            if (row > 0) {
		                message = "File uploaded and saved into database";
		            }
		        } catch (SQLException ex) {
		            message = "ERROR: " + ex.getMessage();
		            ex.printStackTrace();
		        } 
	}

}
