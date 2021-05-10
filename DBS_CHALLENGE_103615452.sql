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





