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
, FOREIGN KEY (TourName, EventYear, EventMonth, EventDay) REFERENCES Event
);

INSERT INTO Client(ClientID, Surname, GivenName, Gender)
VALUES (1, 'Price', 'Taylor', 'M'),
(2, 'Gamble', 'Ellyse', 'F'),
(3, 'Tan', 'Tilly', 'F'),
(4, 'Singh', 'Agam', 'M');


INSERT INTO Tour(TourName, Description)
VALUES ('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South', 'Tour of wineries and outlets of Mornington Penisula'),
('West', 'Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO Event(TourName, EventYear, EventMonth, EventDay, Fee)
VALUES ('North', 2016, 'Jan', 9, 200),
('North', 2016, 'Feb', 13, 225),
('South', 2016, 'Jan', 9 ,200),
('South', 2016, 'Jan', 29, 200),
('West', 2016, 'Jan', 16, 225);

INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked)
VALUES (2, 'North', 2016, 'Feb', 9, 200, '2015/12/16'),
(1, 'North', 2016, 'Feb', 13, 225, '2016/01/08'),
(2, 'North', 2016, 'Jan', 13, 125, '2016/01/14'),
(3, 'North', 2016, 'Feb', 13, 225, '2016/02/03'),
(1, 'South', 2016, 'Jan', 9, 200, '2015/12/10'),
(2, 'South', 2016, 'Jan', 16, 200, '2015/12/18'),
(3, 'South', 2016, 'Jan', 16, 200, '2016/01/09'),
(2, 'West', 2016, 'Jan', 29, 225, '2015/12/17'),
(3, 'West', 2016, 'Jan', 29, 200, '2015/12/18'),
(4, 'West', 2016, 'Jan', 29, 200, '2015/12/15');