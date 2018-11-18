

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import retrieval.DBHelper;
import retrieval.UserInfo;

/**
 * Servlet implementation class bSignUp
 */
@WebServlet("/bSignUp")
public class bSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("afsf");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int zipcode =Integer.parseInt( request.getParameter("zipcode"));
		String phone = request.getParameter("phone");
		String pets = request.getParameter("pets");
		String children = request.getParameter("children");

		UserInfo u = new UserInfo ();
		u.username = username;
		u.email = email;
		u.password = password;
		u.phoneNumber = phone;
		String path = "/userregister.jsp";
		boolean error = false;
		if (email.equals ("") || password.equals("") || username.equals("") ) {
			error = true;
		}
		if (DBHelper.userExists(email) && !error) {
			request.setAttribute("err", "User Already Exists");
		} else {
		System.out.println(pets);
		
		u.zipcode = zipcode;
		if (pets.equalsIgnoreCase("yes")) {
			u.pets = 1;
		} else {
			u.pets = 0;
		}
		if (children.equalsIgnoreCase("yes")) {
			u.kids = 1;
		} else {
			u.kids = 0;
		}
		u.isShelter = 0;
		
		 DBHelper db = new DBHelper("dne","dne");
			db.addNormalUser(u);
			db = new DBHelper(email,password);
			//ADD HTTP SESSION HERE
			HttpSession session = request.getSession();
			session.setAttribute("DBHelper", db);
			if (db.didConnect()) {
				path = "/userhomepage.jsp";
			} else {
				request.setAttribute("err", "Creation Failed");
			}
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(path);
    	
    	try {
    		dispatch.forward(request,response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
