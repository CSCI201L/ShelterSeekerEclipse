package retrieval;

public class UserInfo {
	public String username;
	public int id;
	public String imgurl;
	public String bio;
<<<<<<< HEAD
	public String address;
=======
>>>>>>> a6bdd510de972b2b55f0883dc25958926d28e9f0
	public String email; //this will be unique identifier
	public int zipcode;
	public String phoneNumber;
	public int kids;
	public int pets;
	public String password;
	public Byte isShelter;
	public UserInfo (String username, String imgurl, String bio, String email, int zipcode, Byte isShelter) {
		this.username = username;
		this.imgurl = imgurl;
		this.bio = bio;
		this.email = email;
		this.zipcode = zipcode;
		kids = 0;
		pets = 0;
		this.isShelter = isShelter;
	}
	public UserInfo () {
		this.username = "";
		this.imgurl = "";
		this.bio = "";
		this.email = "";
		this.zipcode = 0;
		kids = 0;
		pets = 0;
		isShelter = 0;
	}
}
