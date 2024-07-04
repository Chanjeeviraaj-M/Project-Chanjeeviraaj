CREATE DATABASE if not exists Event_Management_System;
USE Event_Management_System;



CREATE TABLE Events (
    Event_Id SERIAL PRIMARY KEY,
    Event_Name VARCHAR(100) NOT NULL,
    Event_Date DATE NOT NULL,
    Event_Location VARCHAR(255) NOT NULL,
    Event_Description TEXT
);

-- Create Attendees table
CREATE TABLE Attendees (
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name VARCHAR(100) NOT NULL,
    Attendee_Phone VARCHAR(20),
    Attendee_Email VARCHAR(100),
    Attendee_City VARCHAR(100)
);

-- Create Registrations table
CREATE TABLE Registrations (
    Registration_Id SERIAL PRIMARY KEY,
    Event_Id INT NOT NULL,
    Attendee_Id INT NOT NULL,
    Registration_Date DATE NOT NULL,
    Registration_Amount DECIMAL(10, 2),  -- Assuming registration might have a fee
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);



#### Example Data Insertion:

-- Insert sample events
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) 
VALUES 
    ('Tech Summit 2024', '2024-09-15', 'San Francisco', 'Annual tech conference'),
    ('Music Festival', '2024-08-10', 'New York', 'Outdoor music event');

-- Insert sample attendees
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES 
    ('Alice Johnson', '123-456-7890', 'alice@example.com', 'San Francisco'),
    ('Bob Smith', '987-654-3210', 'bob@example.com', 'New York');

-- Insert sample registrations
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) 
VALUES 
    (1, 1, '2024-08-01', 50.00),
    (2, 2, '2024-07-20', 75.00);


### 3. Manage Event Details

#### a) Inserting a new event:

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) 
VALUES ('New Event Name', 'YYYY-MM-DD', 'Location', 'Description');


#### b) Updating an event's information:

UPDATE Events 
SET Event_Name = 'Updated Event Name', Event_Date = 'YYYY-MM-DD', Event_Location = 'Updated Location', Event_Description = 'Updated Description'
WHERE Event_Id = 1; -- Example: Updating event with Event_Id 1


#### c) Deleting an event:

DELETE FROM Events 
WHERE Event_Id = 2; -- Example: Deleting event with Event_Id 2


### 4. Manage Track Attendees & Handle Events

#### a) Inserting a new attendee:

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES ('New Attendee Name', 'Phone Number', 'email@example.com', 'City');


#### b) Registering an attendee for an event:

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) 
VALUES (1, 3, 'YYYY-MM-DD', 0.00); -- Example: Registering Attendee_Id 3 for Event_Id 1


### 5. Develop queries

#### Retrieve event information:

SELECT * FROM Events;


#### Generate attendee lists:

SELECT * FROM Attendees;


#### Calculate event attendance statistics:

SELECT Event_Id, COUNT(Attendee_Id) AS Attendee_Count
FROM Registrations
GROUP BY Event_Id;