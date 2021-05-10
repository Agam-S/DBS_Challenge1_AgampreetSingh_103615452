-- Name : Agampreet Singh
-- Student ID: 103615452

/* Rational Schema ----

Tour(TourName, Description)
Primary Key TourName

Client(ClientID, Surname, GivenName, Gender)
Primary Key ClientID

Booking(ClientID, TourName, EventYear, EventMonth, EventDay, DateBooked, Payment)
Primary Key ClientID, TourName, EventYear, EventMonth, EventDay
Foreign Key ClientID REFERENCES Booking
Foreign Key TourName REFERENCES Tour

Event(TourName, EventYear, EventMonth, EventDay, Fee)
Primary Key (TourName, EventYear, EventMonth, EventDay)
Foreign Key TourName REFERENCES Tour */


CREATE TABLE Tour (
  TourName   NVARCHAR(100) 
, DESCRIPTION    NVARCHAR(500)
, PRIMARY KEY (TourName)
);

CREATE TABLE Client (
  ClientID   INT 
, Surname   NVARCHAR(100) 
, GivenName   NVARCHAR(100)
, Gender      NVARCHAR(1) 
, PRIMARY KEY  (ClientID) 
);

CREATE TABLE Event (
  TourName  NVARCHAR(100)
, EventYear   INT 
, EventMonth   NVARCHAR(3)
, EventDay      INT
, Fee      MONEY 
, PRIMARY KEY  (TourName, EventYear, EventMonth, EventDay) 
, FOREIGN KEY (TourName) REFERENCES Tour
);

CREATE TABLE Booking (
  ClientID  INT
, TourName  NVARCHAR(100)
, EventYear   INT 
, EventMonth   NVARCHAR(3)
, EventDay      INT
, Payment      MONEY 
, DateBooked   DATE
, PRIMARY KEY  (ClientID, TourName, EventYear, EventMonth, EventDay)
, FOREIGN KEY (ClientID) REFERENCES Client
, FOREIGN KEY  (TourName, EventYear, EventMonth, EventDay) REFERENCES Event
);



