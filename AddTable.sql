use shelterseeker;

DROP TABLE Adds if exists;
CREATE TABLE Adds (
	clickID int primary key,	
	shelterID int,
	zipcode int,
	kids int,
	pets int,
	phoneNumber int,
	nearGrocery boolean,
	nearPharmacy boolean,
	nearLaundromat boolean,
	foreign key (shelterID) references shelter (id)
)