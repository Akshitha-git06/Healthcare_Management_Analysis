CREATE VIEW v_ActiveAdmissions AS
SELECT
    A.AdmissionID,
    P.Name AS PatientName,
    D.DoctorName,
    H.HospitalName,
    A.DateOfAdmission,
    A.DischargeDate
FROM Admissions A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID
JOIN Hospitals H ON A.HospitalID = H.HospitalID
WHERE A.DischargeDate IS NULL OR A.DischargeDate > GETDATE();

CREATE VIEW v_BillingSummary AS
SELECT
    P.Name AS PatientName,
    SUM(B.Amount) AS TotalBilled
FROM Billing B
JOIN Admissions A ON B.AdmissionID = A.AdmissionID
JOIN Patients P ON A.PatientID = P.PatientID
GROUP BY P.Name;