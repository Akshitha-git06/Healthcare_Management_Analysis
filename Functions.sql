CREATE FUNCTION fn_GetAgeGroup (@Age INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Group VARCHAR(20)
    IF @Age < 18 SET @Group = 'Child'
    ELSE IF @Age BETWEEN 18 AND 60 SET @Group = 'Adult'
    ELSE SET @Group = 'Senior'
    RETURN @Group
END;

SELECT Name, Age, dbo.fn_GetAgeGroup(Age) AS AgeGroup
FROM Patients;

CREATE FUNCTION fn_CalculateFinalBill (@Amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Amount * 1.10;
END;

SELECT Amount AS Original, dbo.fn_CalculateFinalBill(Amount) AS WithTax
FROM Billing;