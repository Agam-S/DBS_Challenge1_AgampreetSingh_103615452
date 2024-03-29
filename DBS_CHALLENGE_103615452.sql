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


CREATE TABLE TOUR (
  TourName   NVARCHAR(100) 
, DESCRIPTION    NVARCHAR(500)
, PRIMARY KEY (TourName)
);


CREATE TABLE CLIENT (
  ClientID   INT 
, Surname   NVARCHAR(100) 
, GivenName   NVARCHAR(100)
, Gender      NVARCHAR(1) 
, PRIMARY KEY  (ClientID) 
);

CREATE TABLE EVENT (
  TourName  NVARCHAR(100)
, EventMonth   NVARCHAR(3)
, EventDay      INT
, EventYear   INT 
, Fee      MONEY 
, PRIMARY KEY  (TourName, EventYear, EventMonth, EventDay) 
, FOREIGN KEY (TourName) REFERENCES TOUR (TourName)
);

CREATE TABLE BOOKING (
  ClientID     INT
, TourName     NVARCHAR(100)
, EventMonth   NVARCHAR(3)
, EventDay     INT
, EventYear    INT 
, Payment      MONEY 
, DateBooked   DATE NOT NULL
, PRIMARY KEY  (ClientID, TourName, EventMonth, EventDay, EventYear)
, FOREIGN KEY (ClientID) REFERENCES CLIENT (ClientID)
, FOREIGN KEY (TourName, EventYear, EventMonth, EventDay) REFERENCES EVENT (TourName, EventYear, EventMonth, EventDay)
);

INSERT INTO Client(ClientID, Surname, GivenName, Gender)
VALUES (1, 'Price', 'Taylor', 'M'),
(2, 'Gamble', 'Ellyse', 'F'),
(3, 'Tan', 'Tilly', 'F'),
(103615452, 'Singh', 'Agam', 'M');


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

INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (1, 'North', 2016, 'Jan', 9, 200, '2015-12-10');
INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (2, 'North', 2016, 'Jan', 9, 200, '2015-12-16');
INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (1, 'North', 2016, 'Feb', 13, 225, '2016-01-08');
INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (2, 'North', 2016, 'Feb', 13, 125, '2016-01-14');
INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (3, 'North', 2016, 'Feb', 13, 225, '2016-02-03');
INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (1, 'South', 2016, 'Jan', 9, 200, '2015-12-10');
INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (2, 'West', 2016, 'Jan', 16, 200, '2015-12-18');
INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (3, 'West', 2016, 'Jan', 16, 200, '2016-01-09');
INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (2, 'South', 2016, 'Jan', 29, 225, '2015-12-17');
INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (3, 'South', 2016, 'Jan', 29, 200, '2015-12-18');

INSERT INTO Booking(ClientID, TourName, EventYear, EventMonth, EventDay, Payment, DateBooked) VALUES (103615452, 'South', 2016, 'Jan', 29, 200, '2015-12-30');


-- Task 4

--QUERY 1
SELECT C.GivenName, c.Surname, E.TourName, T.Description, E.EventYear, E.EventMonth, E.EventDay, E.Fee, B.Datebooked, B.Payment FROM Client C
INNER JOIN BOOKING B ON C.ClientID = B.ClientID
INNER JOIN EVENT E ON E.TourName = B.TourName
INNER JOIN TOUR T ON T.TourName = E.TourName;

--QUERY 2
SELECT E.EventMonth, E.TourName, COUNT(*) as NumofBooking FROM Booking E
GROUP BY EventMonth, TourName;

-- Query 3
SELECT * FROM Booking E
Where e.Payment > 
(SELECT AVG(E.Payment) 
    FROM BOOKING E
);

--Task 5
CREATE VIEW [View1] AS
SELECT C.GivenName, c.Surname, E.TourName, T.Description, E.EventYear, E.EventMonth, E.EventDay, E.Fee, B.Datebooked, B.Payment FROM Client C
INNER JOIN BOOKING B ON C.ClientID = B.ClientID
INNER JOIN EVENT E ON E.TourName = B.TourName
INNER JOIN TOUR T ON T.TourName = E.TourName;

--Task 6
SELECT * FROM CLIENT
--From this- I got the results I should - all the colunms from CLIENT
SELECT COUNT(*) FROM CLIENT
--From this- I got the results I should - all the 4 colunms as a count from CLIENT

/* Task 6- 
I know they are working because I am getting the responses as I should, that means I've done Task 6 */

