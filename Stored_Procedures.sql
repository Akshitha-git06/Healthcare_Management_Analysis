CREATE PROCEDURE AddNewPatient
    @Name VARCHAR(100),
    @Age INT,
    @Gender VARCHAR(10),
    @BloodType VARCHAR(5)
AS
BEGIN
    INSERT INTO Patients (Name, Age, Gender, BloodType)
    VALUES (@Name, @Age, @Gender, @BloodType);
END;



CREATE PROCEDURE ScheduleAdmission
    @PatientID INT,
    @DoctorID INT,
    @HospitalID INT,
    @InsuranceID INT,
    @RoomNumber INT,
    @AdmissionType VARCHAR(20),
    @DateOfAdmission DATE,
    @DischargeDate DATE
AS
BEGIN
    INSERT INTO Admissions (PatientID, DoctorID, HospitalID, InsuranceID, RoomNumber, AdmissionType, DateOfAdmission, DischargeDate)
    VALUES (@PatientID, @DoctorID, @HospitalID, @InsuranceID, @RoomNumber, @AdmissionType, @DateOfAdmission, @DischargeDate);
END;

CREATE PROCEDURE AddBillingRecord
    @AdmissionID INT,
    @Amount DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Billing (AdmissionID, Amount)
    VALUES (@AdmissionID, @Amount);
END;