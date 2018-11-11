package backend_test;

import java.util.ArrayList;

import retrieval.DBHelper;
import retrieval.Message;
import retrieval.Shelter;
import retrieval.UserInfo;

public class DBTester {
	public static void main (String [] args) {
		DBHelper db = new DBHelper("dumbshit", "hello");
		if (db.didConnect()) {
			System.out.println("SOMEHOW CONNECTED -- ERROR");
			return;
		} else {
			System.out.println("Correct -- failed sign in");
		}
		
		//create basic users 
		UserInfo u1 = new UserInfo();
		u1.username = "survivor1";
		u1.imgurl = "https://www.dike.lib.ia.us/images/sample-1.jpg/image";
		u1.bio = "Hi this is a bio";
		u1.email = "test@usc.edu";
		u1.zipcode = 98075;
		u1.phoneNumber = 9854079;
		u1.kids = 2;
		u1.pets = 2;
		u1.password = "pass1";
		u1.isShelter = 0;
		
		db.addNormalUser(u1);
		DBHelper db1 = new DBHelper("test@usc.edu", "pass1");
		if (db1.didConnect()) {
			System.out.println("Added new survivor successfully!");
		} else {
			System.out.println("Error on adding normal survivor");
			return;
		}
		
		//create sheltered users
		u1.username = "special org";
		u1.email="org@usc.edu";
		u1.isShelter=1;
		Shelter sh = new Shelter ();
		sh.shelterName = "Super Shelter";
		sh.zipcode =  980089;
		sh.bio = "Super cool shelter";
		db.createOrg(u1, sh);
		DBHelper db2 = new DBHelper("org@usc.edu","pass1");
		if (db2.didConnect() && db2.shInfo!=null) {
			System.out.println("Added new org at " + db2.shInfo.zipcode + " under the user " + db2.user.username + " successfully!");
		} else {
			System.out.println("Error on adding org");
			return;
		}
	
		//testing message functions
		Message m = new Message ();
		m.body = " BODY TEST!";
		m.recipient = db1.user.id;
		m.sender= db2.user.id;
		m.subject = "Subject 1!";
		m.timeSent = 0;
		
		if (db2.sendMessage(m)) {
			System.out.println("Message function sent message!");
		} else {
			System.out.println("Error in sending message");
		}
		
		ArrayList<Message> mail = db1.getMessages();
		if (mail.size()!=0) {
			System.out.println("Get Messages works " + mail.get(0).body);
		} else {
			System.out.println("Error in recieving messages");
		}
		
		db2.user.username = "blahnew";
		db2.updateUserSettings(db2.user);
		db2.shInfo.zipcode = 12345;
		db2.updateShelterSettings(db2.shInfo);
		//re sign in
		db2 = new DBHelper("org@usc.edu","pass1");
		if (db2.user.username.equalsIgnoreCase("blahnew")) {
			System.out.println("update user info works");
		} else {
			System.out.println("user info not updated!");
			System.out.println(db2.user.username);
		}
		
		if (db2.shInfo.zipcode == 12345) {
			System.out.println("update shelter settings works");
		} else {
			System.out.println("shelter settings not updated!");
			System.out.println(db2.shInfo.zipcode);
		}
		DBHelper.visitShelter(db2.shInfo.id);

		
	}
}
