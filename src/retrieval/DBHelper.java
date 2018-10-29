package retrieval;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
//DBHelper u = new DBHELPER(....)
//u.updateUserInfo(UserInfo new);

public class DBHelper {
	public String email; //unique identifier
	public UserInfo user;
	public Connection conn = null;
	public Statement st = null;
	public ResultSet rs = null;
	public int userId = -1;
	public PreparedStatement ps = null;
	public Shelter shInfo = null;
	public static final String CLASS_NAME = "com.mysql.jdbc.Driver";
	public static final String CONNECTION_URL = "jdbc:mysql://localhost:3306/shelterseeker?user=root&password=root&useSSL=false";
	public DBHelper(String email, String password)  {
		this.email = email;
		this.user = new UserInfo();
		
		//login user to database using username and password
		//if success, populate UserInfo with values. and maintain email.
		//if connection fails, then set email to nothing
		
		try {
			Class.forName(CLASS_NAME);
			conn = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM users WHERE email=? AND pass=?";
			ps = conn.prepareStatement(query);		
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while (rs.next()) {
				this.userId = rs.getInt("userID");
				user.email = rs.getString("email");
				user.username = rs.getString("username");
				user.isShelter = rs.getByte("isShelter");
				user.password = password;
				updateUserInfo(userId);
				user.id = this.userId;
				if (user.isShelter == 1) {
					System.out.println("A SHELTER!");
					shInfo = getShelterInfo(user.id);
					shInfo.id=user.id;
				} else {
					System.out.println("NOT A SHELTER!");
				}
				//now userObject will be fully updated
				//if it is a shelter, then shInfo will also be populated!
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (conn!= null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		
	
		//DUMMY - TO BE REPLACED LATER (just so I don't get a ton of errors)
		//END DUMMY
	}
	
	public void updateUserInfo (int userId) {
		Connection conn1 = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName(CLASS_NAME);
			conn1 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM userInfo WHERE id=?";
			ps1 = conn1.prepareStatement(query);		
			ps1.setInt(1, userId);
			rs1 = ps1.executeQuery();
			while (rs1.next()) {
				user.zipcode = rs1.getInt("zipcode");
				user.kids = rs1.getInt("kids");
				user.pets = rs1.getInt("pets");
				user.phoneNumber = rs1.getInt("phoneNumber");
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs1 != null) {
					rs1.close();
				}
				if (ps1 != null) {
					ps1.close();
				}
				if (conn1!= null) {
					conn1.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
	}
	public Shelter getShelterInfo(int userId) {
		Shelter s = new Shelter();
		Connection conn1 = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName(CLASS_NAME);
			conn1 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM shelterInfo WHERE id=?";
			ps1 = conn1.prepareStatement(query);		
			ps1.setInt(1, userId);
			rs1 = ps1.executeQuery();
			while (rs1.next()) {
				System.out.println("FOUND VALUES!");
				s.id = rs1.getInt("id");
				s.zipcode = rs1.getInt("zipcode");
				s.kids = rs1.getInt("kids");
				s.pets = rs1.getInt("pets");
				s.phoneNumber = rs1.getInt("phoneNumber");
				s.bio = rs1.getString("biography");
				s.numRatingGiven = rs1.getInt("numRatingGiven");
				s.nearGrocery = rs1.getByte("nearGrocery");
				s.nearPharmacy = rs1.getByte("nearPharmacy");
				s.nearLaundromat = rs1.getByte("nearLaundromat");
				s.currentRating = rs1.getDouble("currentRating");
				s.pageVisits = rs1.getInt("pageVisits");
				s.numStays = rs1.getInt("numStays");
				s.numPendingRequests = rs1.getInt("numPendingRequests");
				s.avgStayDuration = rs1.getDouble("avgStayDuration");	
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs1 != null) {
					rs1.close();
				}
				if (ps1 != null) {
					ps1.close();
				}
				if (conn1!= null) {
					conn1.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		return s;
	}
	public boolean didConnect () {
		if (user.username.equals("")) {
			return false;
		} else {
			return true;
		}
	}
	
	//SIGN UP VARIOUS USERS ---
	public  int addNormalUser(UserInfo u) {
		//should sign up basic survivor
		int userId = -1;

		Connection conn2 = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		try {
			Class.forName(CLASS_NAME);
			conn2 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "INSERT INTO users(username,email,pass,isShelter) VALUES (?,?,?,?)";
			ps2 = conn2.prepareStatement(query);		
			ps2.setString(1, u.username);
			ps2.setString(2, u.email);
			ps2.setString(3, u.password);
			ps2.setByte(4, u.isShelter);
			ps2.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs2 != null) {
					rs2.close();
				}
				if (ps2 != null) {
					ps2.close();
				}
				if (conn2!= null) {
					conn2.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		 conn2 = null;
		 ps2 = null;
		 rs2 = null;
			//if isn't a shelter, create a table in userInfo
			try {
				Class.forName(CLASS_NAME);
				conn = DriverManager.getConnection(CONNECTION_URL); 
				
				String query = "SELECT * FROM users WHERE username=? AND pass=?";
				ps = conn.prepareStatement(query);		
				ps.setString(1, u.username);
				ps.setString(2, u.password);
				rs = ps.executeQuery();
				if (rs.next()) {
					userId = rs.getInt("userID"); 
					u.id=userId;
				}
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (ps != null) {
						ps.close();
					}
					if (conn!= null) {
						conn.close();
					}
				} catch (SQLException sqle) {
					System.out.println("sqle closing streams: " + sqle.getMessage());
				}
			}
			if (u.isShelter==0) {

			 Connection conn3 = null;
			 PreparedStatement ps3 = null;
			 ResultSet rs3 = null;
			if (userId == -1) {
				System.out.println("could not find the id?");
			} else {
				try {
					Class.forName(CLASS_NAME);
					conn3 = DriverManager.getConnection(CONNECTION_URL); 
					
					String query = "INSERT INTO userInfo(id,zipcode,kids,pets,phoneNumber) VALUES (?,?,?,?,?)";
					ps3 = conn3.prepareStatement(query);		
					ps3.setInt(1, userId);
					ps3.setInt(2, u.zipcode);
					ps3.setInt(3, u.kids);
					ps3.setInt(4, u.pets);
					ps3.setInt(5, u.phoneNumber);
					
					 ps3.executeUpdate();

				}catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					try {
						if (rs2 != null) {
							rs2.close();
						}
						if (ps2 != null) {
							ps2.close();
						}
						if (conn2!= null) {
							conn2.close();
						}
					} catch (SQLException sqle) {
						System.out.println("sqle closing streams: " + sqle.getMessage());
					}
				}
			}
		}
		return userId;
		
	}
	public void createOrg (UserInfo u, Shelter s) {
		//should sign up organization user with isShelter = true by adding to userinfo table
		//should add entry to Shelter table. Both Should contain the same values
		int userId = addNormalUser(u);
		System.out.println(userId + " is the new id ");
		Connection conn2 = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		try {
			Class.forName(CLASS_NAME);
			conn2 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "INSERT INTO shelterInfo(id,zipcode,kids,pets,phoneNumber,biography,nearGrocery,nearPharmacy,nearLaundromat) VALUES (?,?,?,?,?,?,?,?,?)";
			ps2 = conn2.prepareStatement(query);		
			ps2.setInt(1, userId);
			ps2.setInt(2, s.zipcode);
			ps2.setInt(3, s.kids);
			ps2.setInt(4, s.pets);
			ps2.setInt(5, s.phoneNumber);
			ps2.setString(6, s.bio);
			ps2.setByte(7, s.nearGrocery);
			ps2.setByte(8, s.nearPharmacy);
			ps2.setByte(9, s.nearLaundromat);
			ps2.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs2 != null) {
					rs2.close();
				}
				if (ps2 != null) {
					ps2.close();
				}
				if (conn2!= null) {
					conn2.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
	}
	
	//TO BE USED ON SEARCH SHELTER PAGE --
	public ArrayList<Shelter> getShelters(){
		ArrayList<Shelter> res = new ArrayList<>();
		try {
			Class.forName(CLASS_NAME);
			conn = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM shelters";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				int tempId = rs.getInt("userID");
				res.add(getShelterInfo(tempId));
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (conn!= null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		//populate res based on statement SELECT * FROM shelter 
		return res;
	}
	
	//MESSAGES PAGE --
	
	public boolean sendMessage (Message m) {
		//add m to messages table
		if(!userExists(m.recipient)) {
			return false;
		} else {
			//send message here
			try {
				Class.forName(CLASS_NAME);
				conn = DriverManager.getConnection(CONNECTION_URL); 
				
				String query = "INSERT INTO messages(senderID,recipientID,timeSent,mSubject,mContent,mRead) VALUES (?,?,?,?,?,?)";
				Byte b = 0;
				ps = conn.prepareStatement(query);
				ps.setInt(1, this.userId);
				ps.setInt(2, m.recipient);
				ps.setInt(3,m.timeSent);
				ps.setString(4, m.subject);
				ps.setString(5, m.body);
				ps.setByte(6, b);
				ps.executeUpdate();
				
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (st != null) {
						st.close();
					}
					if (conn!= null) {
						conn.close();
					}
				} catch (SQLException sqle) {
					System.out.println("sqle closing streams: " + sqle.getMessage());
					
				}
			}
			return true;			
		}
	}
	public ArrayList<Message> getMessages(){
		ArrayList<Message> res = new ArrayList<>();
		try {
			Class.forName(CLASS_NAME);
			conn = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM messages WHERE recipientID=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, this.userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				Message m = new Message();
				m.sender = rs.getInt("senderID");
				m.recipient = this.userId;
				m.subject = rs.getString("mSubject");
				m.body = rs.getString("mContent");
				m.read = rs.getByte("mRead");
				m.timeSent = rs.getInt("timeSent");
				res.add(m);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (conn!= null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		return res;
	}
	
	//updating Settings
	public void updateUserSettings(UserInfo user) {
		Connection conn2 = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		try {
			Class.forName(CLASS_NAME);
			conn2 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "UPDATE users SET username=?, pass=?, email=? WHERE userID=?";
			ps2 = conn2.prepareStatement(query);		
			ps2.setString(1, user.username);
			ps2.setString(3, user.email);
			ps2.setString(2, user.password);
			ps2.setInt(4, user.id);
			ps2.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs2 != null) {
					rs2.close();
				}
				if (ps2 != null) {
					ps2.close();
				}
				if (conn2!= null) {
					conn2.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		if (user.isShelter==0) {
		try {
			Class.forName(CLASS_NAME);
			conn2 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "UPDATE userInfo SET zipcode=?, kids=?, pets=?, phoneNumber=? WHERE id=?";
			ps2 = conn2.prepareStatement(query);		
			ps2.setInt(1, user.zipcode);
			ps2.setInt(2, user.kids);
			ps2.setInt(3, user.pets);
			ps2.setInt(4, user.phoneNumber);
			ps2.setInt(5, user.id);
			ps2.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs2 != null) {
					rs2.close();
				}
				if (ps2 != null) {
					ps2.close();
				}
				if (conn2!= null) {
					conn2.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		}
	}
	public void updateUserSettings(UserInfo user, Shelter s) {
		updateShelterSettings(s);
		updateUserSettings(user);
	}
	public void updateShelterSettings(Shelter s) {
		Connection conn1 = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName(CLASS_NAME);
			conn1 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "UPDATE shelterInfo SET zipcode=?, kids=?, pets=?, phoneNumber=?, biography=?,"
					+ " numRatingGiven=?, nearPharmacy=?, nearLaundromat=?, currentRating=?,"
					+ " pageVisits=?, numStays=?, numPendingRequests=?, avgStayDuration=? WHERE id=?";
			ps1 = conn1.prepareStatement(query);		
			ps1.setInt(1, s.zipcode);
			ps1.setInt(2, s.kids);
			ps1.setInt(3, s.pets);
			ps1.setInt(4, s.phoneNumber);
			ps1.setString(5, s.bio);
			ps1.setInt(6, s.numRatingGiven);
			ps1.setInt(7, s.nearGrocery);
			ps1.setInt(8, s.nearLaundromat);
			ps1.setDouble(9, s.currentRating);
			ps1.setInt(10, s.pageVisits);
			ps1.setInt(11, s.numStays);	
			ps1.setInt(12, s.numPendingRequests);			
			ps1.setDouble(13, s.avgStayDuration);	
			ps1.setInt(14, s.id);
			ps1.executeUpdate();

			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs1 != null) {
					rs1.close();
				}
				if (ps1 != null) {
					ps1.close();
				}
				if (conn1!= null) {
					conn1.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
	}
	
	//MISC. HELPER FUNCTIONS
	public static void visitShelter(int shelterId) {
		//user statement: 
		//UPDATE  shelterinfo SET visits = 
			//(SELECT visits FROM shelterinfo WHERE shelterId = shelterId)+1 
			// WHERE shelterId=shelterId'
			Connection conn1 = null;
			PreparedStatement ps1 = null;
			ResultSet rs1 = null;
			try {
				Class.forName(CLASS_NAME);
				conn1 = DriverManager.getConnection(CONNECTION_URL); 
				
				String query = "UPDATE shelterInfo SET pageVisits=pageVisits + 1 WHERE id=?";
				ps1 = conn1.prepareStatement(query);		
				ps1.setInt(1, shelterId);		
				ps1.executeUpdate();

				
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if (rs1 != null) {
						rs1.close();
					}
					if (ps1 != null) {
						ps1.close();
					}
					if (conn1!= null) {
						conn1.close();
					}
				} catch (SQLException sqle) {
					System.out.println("sqle closing streams: " + sqle.getMessage());
				}
			}
		}
	
	public boolean userExists(int id) {
		Connection conn2 = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		try {
			Class.forName(CLASS_NAME);
			conn2 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM users WHERE userID=?";
			ps2 = conn2.prepareStatement(query);		
			ps2.setInt(1, id);
			rs2 = ps2.executeQuery();
			while(rs2.next()) {
				try {
					if (rs2 != null) {
						rs2.close();
					}
					if (ps2 != null) {
						ps2.close();
					}
					if (conn2!= null) {
						conn2.close();
					}
				} catch (SQLException sqle) {
					System.out.println("sqle closing streams: " + sqle.getMessage());
				}
					return true;
				
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs2 != null) {
					rs2.close();
				}
				if (ps2 != null) {
					ps2.close();
				}
				if (conn2!= null) {
					conn2.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		//checks userInfo and sees if email exists in the table
		return false;
	}
	
	
	
	
}
