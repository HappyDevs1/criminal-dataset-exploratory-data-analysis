SELECT TOP (1000) [RecordID]
      ,[FirstName]
      ,[LastName]
      ,[FullName]
      ,[Age]
      ,[Gender]
      ,[Country]
      ,[Province]
      ,[SouthAfricanID]
      ,[CaseNumber]
      ,[CrimeType]
      ,[FinancialScore]
      ,[EstimatedFraudAmount_ZAR]
      ,[RiskLevel]
      ,[CaseStatus]
      ,[BankInvolved]
      ,[PreviousOffenses]
      ,[Arrested]
      ,[CrimeDate]
      ,[CourtDate]
      ,[InvestigatingOfficer]
      ,[StationCode]
  FROM [kzn_policestation].[dbo].[south_africa_criminal_database]

  DROP TABLE [kzn_policestation].[dbo].[south_africa_criminal_database]

  -- Total records
  SELECT COUNT(*) FROM [kzn_policestation].[dbo].[south_africa_criminal_database]

  -- Case in province
  SELECT COUNT(Province) FROM [kzn_policestation].[dbo].[south_africa_criminal_database]

  -- Crime type = fraud
  SELECT * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE [CrimeType] = 'Fraud'

  -- Count the number of causes for each crime
  SELECT CrimeType, COUNT(*) AS TotalCase FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY CrimeType ORDER BY TotalCases DESC

  -- High and Critical cases
  SELECT * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE ([RiskLevel] = 'High') OR ([RiskLevel] = 'Critical')

  -- Average financial score
SELECT AVG(FinancialScore) AS AvgFinancialScore FROM [kzn_policestation].[dbo].[south_africa_criminal_database]

-- Highest estimated fraud amount
SELECT MAX(EstimatedFraudAmount_ZAR) AS HighestFraudAmount FROM [kzn_policestation].[dbo].[south_africa_criminal_database]

-- Top 10 highest fraud cases
SELECT TOP 10 * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] ORDER BY EstimatedFraudAmount_ZAR DESC

-- Suspects that were arrested
SELECT * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE Arrested = 'Yes'

-- Arrested vs not arrested count
SELECT Arrested, COUNT(*) AS Total FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY Arrested

-- Cases per bank involved
SELECT BankInvolved, COUNT(*) AS TotalCases FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY BankInvolved ORDER BY TotalCases DESC

-- Total fraud amount per province
SELECT Province, SUM(EstimatedFraudAmount_ZAR) AS TotalFraud FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY Province ORDER BY TotalFraud DESC

-- Suspects older than 50
SELECT * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE Age > 50

-- Average age per province
SELECT Province, AVG(Age) AS AvgAge FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY Province

-- Cases from 2020 onwards
SELECT * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE CrimeDate >= '2020-01-01'

-- Convicted cases count
SELECT COUNT(*) AS ConvictedCases FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE CaseStatus = 'Convicted'

-- Suspects with more than 3 previous offenses
SELECT * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE PreviousOffenses > 3

-- Distribution by risk level
SELECT RiskLevel, COUNT(*) AS TotalCases FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY RiskLevel ORDER BY TotalCases DESC

-- Total fraud amount overall
SELECT SUM(EstimatedFraudAmount_ZAR) AS TotalFraudAmount FROM [kzn_policestation].[dbo].[south_africa_criminal_database]

-- Province with highest number of cases
SELECT TOP 1 Province, COUNT(*) AS TotalCases FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY Province ORDER BY TotalCases DESC

-- Youngest suspect
SELECT TOP 1 * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] ORDER BY Age ASC

-- Oldest suspect
SELECT TOP 1 * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] ORDER BY Age DESC

-- Cases handled by each investigating officer
SELECT InvestigatingOfficer, COUNT(*) AS TotalCases FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY InvestigatingOfficer ORDER BY TotalCases DESC

-- Average fraud amount per crime type
SELECT CrimeType, AVG(EstimatedFraudAmount_ZAR) AS AvgFraudAmount FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY CrimeType

-- Cases in Gauteng
SELECT * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE Province = 'Gauteng'

-- Fraud cases that are high risk
SELECT * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE CrimeType = 'Fraud' AND RiskLevel = 'High'

-- Cases per year
SELECT YEAR(CrimeDate) AS CrimeYear, COUNT(*) AS TotalCases FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY YEAR(CrimeDate) ORDER BY CrimeYear

-- Financial score below 500
SELECT * FROM [kzn_policestation].[dbo].[south_africa_criminal_database] WHERE FinancialScore < 500

-- Most common crime type
SELECT TOP 1 CrimeType, COUNT(*) AS TotalCases FROM [kzn_policestation].[dbo].[south_africa_criminal_database] GROUP BY CrimeType ORDER BY TotalCases DESC
