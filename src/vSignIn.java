

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import retrieval.DBHelper;

/**
 * Servlet implementation class vSignIn
 */
@WebServlet("/vSignIn")
public class vSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if (email ==null) {
			email = "";
		} 
		if (password ==null) {
			password = "";
		}
		DBHelper db = new DBHelper (email,password);
		String path = "/signin.jsp";
		if (db.didConnect()) {
			if(db.user.isShelter ==1) {
				//TEMPORARY -- REDIRECT TO ORGHOMEPAGE
				path = "/orgsignin.jsp";
			} else {
				path = "/userhomepage.jsp";
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
