create database hospital;
use hospital;
-- --------------------
create table patient(
	patient_id int auto_increment primary key,
	name varchar(50) not null,
    gender varchar(10),
    email varchar(50),
    address varchar(100),
    password varchar(50)
);

create table medical_history(
	history_id int auto_increment primary key,
    surgeries text,
    medication text,
    Conditionn varchar (100),
    datetime datetime,
    patient_id int,
    foreign key (patient_id) references patient(patient_id)
);
create table doctor(
	doctor_id int auto_increment primary key,
    name varchar(50),
	Email VARCHAR(50),
    Password VARCHAR(50),
    Gender VARCHAR(10)
);

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    Day VARCHAR(10),
    Breaks TEXT,
    StartTime TIME,
    EndTime TIME,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    StartTime TIME,
    EndTime TIME,
    Date DATE,
    Status VARCHAR(20),
    patient_id INT,
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);
insert into patient (gender, email, name, address, password) values
('Male', 'john@example.com', 'John Doe', '123 Main St', 'john123'),
('Female', 'jane@example.com', 'Jane Smith', '456 Elm St Sydney', 'jane123');

INSERT INTO Medical_History (Surgeries, Medication, Conditionn, DateTime, patient_id) VALUES
('Appendectomy', 'Ibuprofen', 'Recovered', '2022-01-15 09:00:00', 1),
('Gallbladder Removal', 'Paracetamol', 'Recovered', '2023-03-22 10:30:00', 2);

INSERT INTO Doctor (Name, Email, Password, Gender) VALUES
('Dr. Alice', 'alice@example.com', 'alice123', 'Female'),
('Dr. Bob', 'bob@example.com', 'bob123', 'Male');
INSERT INTO Doctor (Name, Email, Password, Gender) VALUES
('Dr. Sara', 'sara@example.com', 'sara123', 'Female');

INSERT INTO Schedule (Day, Breaks, StartTime, EndTime, Doctor_ID) VALUES
('Monday', '12:00-13:00', '09:00', '17:00', 1),
('Tuesday', '12:00-13:00', '09:00', '17:00', 2);

INSERT INTO Appointment (StartTime, EndTime, Date, Status, Patient_ID, Doctor_ID) VALUES
('09:00', '09:30', '2024-06-07', 'Scheduled', 1, 1),
('10:00', '10:30', '2024-06-07', 'Completed', 2, 2);


-- Query
select name from patient join medical_history on patient.patient_id = medical_history.patient_id
where surgeries is not null;

-- query
select distinct email from doctor join appointment on doctor.doctor_id = appointment.doctor_id;

-- query
select address from patient join appointment on patient.patient_id = appointment.patient_id
where appointment.starttime = '9:00';

-- query
select starttime from appointment join patient on  appointment.patient_id = patient.patient_id
where patient.address like  '%Sydney%';

-- query
SELECT Doctor.Name
FROM Doctor
LEFT JOIN Appointment ON Doctor.Doctor_ID = Appointment.Doctor_ID
WHERE Appointment.Doctor_ID is null;

-- query
select conditionn from medical_history join patient on medical_history.patient_id = patient.patient_id
where patient.address like '%Sydney%';

-- query 
select date from appointment join patient on appointment.patient_id = patient.patient_id
where patient.address like '%Sydney%';