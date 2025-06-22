CREATE TRIGGER trg_DischargeDateUpdate
ON Admissions
AFTER UPDATE
AS
BEGIN
    INSERT INTO DischargeLog (AdmissionID, OldDischargeDate, NewDischargeDate)
    SELECT
        i.AdmissionID,
        d.DischargeDate,
        i.DischargeDate
    FROM inserted i
    JOIN deleted d ON i.AdmissionID = d.AdmissionID
    WHERE i.DischargeDate <> d.DischargeDate;
END;