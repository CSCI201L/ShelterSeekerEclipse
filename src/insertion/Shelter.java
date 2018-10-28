package insertion;

public class Shelter {
	int id;
	int zipCode;
	int kids;
	int pets;
	int phoneNumber;
	String bio;
	int availability;
	double rating;
	
	public void printInfo() {
		System.out.println("========================");
		System.out.println("Shelter id: " + id);
		System.out.println("Shelter ZipCode: " + zipCode);
		System.out.println("Shelter PhoneNumber: " + phoneNumber);
		System.out.println("Shelter Bio: " + bio);
		System.out.println("========================");
	}
}

