package retrieval;

public class Shelter {
	//Shelter Identifiers
	public int id;
	public String shelterName;
	public int zipcode;
	
	public int capacity = 0;
	public int phoneNumber = 0;
	public String bio = "";
	public double currentRating = 0;
	public int numRatingGiven = 0;
	public Byte nearGrocery = 0;
	public int numPendingRequests = 0;
	
	// Amenities
	public int kids = 0;
	public int pets = 0;
	public Byte nearPharmacy = 0;
	public Byte nearLaundromat = 0;
	
	// Statistics
	public double avgStayDuration  = 0;
	public int pageVisits = 0;
	public int numStays = 0;
	
	
	public Shelter (String name, int phoneNumber, int zipcode) {
		this.shelterName = name;
		this.phoneNumber = 0;
		this.zipcode = zipcode;
	}
	public Shelter () {
		shelterName = "";
		phoneNumber = 0;
		zipcode = 0;
	}
}
