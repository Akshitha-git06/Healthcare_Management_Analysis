CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age > 0),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    BloodType VARCHAR(5)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    DoctorName VARCHAR(100) NOT NULL
);

CREATE TABLE Hospitals (
    HospitalID INT PRIMARY KEY IDENTITY(1,1),
    HospitalName VARCHAR(100) NOT NULL
);


CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY IDENTITY(1,1),
    ProviderName VARCHAR(100) NOT NULL
); 

CREATE TABLE Admissions (
    AdmissionID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    DoctorID INT,
    HospitalID INT,
    InsuranceID INT,
    RoomNumber INT,
    AdmissionType VARCHAR(20),
    DateOfAdmission DATE,
    DischargeDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID),
    FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID)
);

CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY IDENTITY(1,1),
    AdmissionID INT,
    Medication VARCHAR(50),
    FOREIGN KEY (AdmissionID) REFERENCES Admissions(AdmissionID)
);

CREATE TABLE TestResults (
    TestID INT PRIMARY KEY IDENTITY(1,1),
    AdmissionID INT,
    Result VARCHAR(50),
    FOREIGN KEY (AdmissionID) REFERENCES Admissions(AdmissionID)
);

CREATE TABLE Billing (
    BillingID INT PRIMARY KEY IDENTITY(1,1),
    AdmissionID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (AdmissionID) REFERENCES Admissions(AdmissionID)
);