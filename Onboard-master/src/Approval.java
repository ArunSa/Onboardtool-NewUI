

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Approval
 */
@WebServlet("/Approval")
public class Approval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Approval() {
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

		/*String username[]=new String[10];
		String firstname[]=new String[10];
		String lastname[]=new String[10];
		String email[]=new String[10];
		String role[]=new String[10];
		String Approval[]=new String[10];*/
	
		String name=request.getParameter("bala123");
		System.out.println(name);
		/*try{
			for(int i=0;i<5;i++){
			username[i]=request.getParameter("usrname"+i);
			firstname[i]=request.getParameter("fname"+i);
			lastname[i] = request.getParameter("lname"+i);
			email[i]=request.getParameter("email"+i);
			role[i]=request.getParameter("role"+i);
			Approval[i]=request.getParameter("approval"+i);

}
		for(int i=0;i<5;i++)
			System.out.println(username[i]+" "+email[i]+" "+Approval[i]+"\n-------");
		
		response.sendRedirect("Registration.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}*/
	}

}
