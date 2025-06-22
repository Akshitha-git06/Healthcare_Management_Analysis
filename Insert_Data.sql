INSERT INTO Patients (Name, Age, Gender, BloodType)
SELECT DISTINCT Name, Age, Gender, Blood_Type
FROM Hospital_Management;

INSERT INTO Doctors (DoctorName)
SELECT DISTINCT Doctor
FROM Hospital_Management;

INSERT INTO Hospitals (HospitalName)
SELECT DISTINCT Hospital
FROM Hospital_Management;

INSERT INTO Insurance (ProviderName)
SELECT DISTINCT Insurance_Provider
FROM Hospital_Management;

INSERT INTO Admissions (
    PatientID, DoctorID, HospitalID, InsuranceID, RoomNumber,
    AdmissionType, DateOfAdmission, DischargeDate
)
SELECT
    P.PatientID,
    D.DoctorID,
    H.HospitalID,
    I.InsuranceID,
    HM.Room_Number,
    HM.Admission_Type,
    HM.Date_of_Admission,
    HM.Discharge_Date
FROM Hospital_Management HM
JOIN Patients P ON HM.Name = P.Name AND HM.Age = P.Age
JOIN Doctors D ON HM.Doctor = D.DoctorName
JOIN Hospitals H ON HM.Hospital = H.HospitalName
JOIN Insurance I ON HM.Insurance_Provider = I.ProviderName;

INSERT INTO Medications (AdmissionID, Medication)
SELECT
    A.AdmissionID,
    HM.Medication
FROM Hospital_Management HM
JOIN Patients P ON HM.Name = P.Name AND HM.Age = P.Age
JOIN Admissions A ON A.PatientID = P.PatientID AND A.DateOfAdmission = HM.Date_of_Admission;

INSERT INTO TestResults (AdmissionID, Result)
SELECT
    A.AdmissionID,
    HM.Test_Results
FROM Hospital_Management HM
JOIN Patients P ON HM.Name = P.Name AND HM.Age = P.Age
JOIN Admissions A ON A.PatientID = P.PatientID AND A.DateOfAdmission = HM.Date_of_Admission;

INSERT INTO Billing (AdmissionID, Amount)
SELECT
    A.AdmissionID,
    HM.Billing_Amount
FROM Hospital_Management HM
JOIN Patients P ON HM.Name = P.Name AND HM.Age = P.Age
JOIN Admissions A ON A.PatientID = P.PatientID AND A.DateOfAdmission = HM.Date_of_Admission;