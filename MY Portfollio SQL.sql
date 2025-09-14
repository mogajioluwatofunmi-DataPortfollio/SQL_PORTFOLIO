MY Portfollio SQL 
Using ADVENTURE Works 
1. ---Find all engineers living in Los Angeles”


SELECT 
    Person.Person.FirstName,
    Person.Person.LastName,
    HumanResources.Employee.JobTitle,
    Person.Address.City
FROM Person.Person
JOIN HumanResources.Employee
    ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
JOIN Person.BusinessEntityAddress
    ON Person.Person.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID
JOIN Person.Address
    ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID
WHERE Person.Address.City = 'Los Angeles'
  AND HumanResources.Employee.JobTitle LIKE '%Engineer%';


2---  List the first name, last name, and job title of all employees."

 Select * From Person.person 
 Select * From HumanResources.Employee

 SELECT Person.person.Firstname, Person.Person.LastName, HumanResources.Employee.JobTitle
 FROM Person.Person
 Join HumanResources.Employee
   ON person.person.BusinessEntityID = HumanResources.Employee.BusinessEntityID

3---Find all employees living in Los Angeles.


  SELECT 
    HumanResources.Employee.BusinessEntityID, Person.Person.FirstName, Person.Person.LastName,
    Person.Address.City
FROM HumanResources.Employee
JOIN Person.Person
    ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
JOIN Person.BusinessEntityAddress
    ON Person.Person.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID
JOIN Person.Address
    ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID
WHERE Person.Address.City = 'Los Angeles';

4--- ---Count how many employees live in each city.


SELECT 
    Person.Address.City,
    COUNT(Person.Person.BusinessEntityID) AS EmployeeCount
FROM Person.Person
JOIN Person.BusinessEntityAddress
    ON Person.Person.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID
JOIN Person.Address
    ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID
GROUP BY Person.Address.City;

5-----List employees with their full names and the address line 1 where they live.

SELECT Person.person.Firstname, Person.person.middlename, person.person.lastname, Person.Address.Addressline1 
FROM PERSON.PERSON
JOIN  Person.BusinessEntityAddress
ON  Person.BusinessEntityAddress.BusinessEntityID  = Person.person.BusinessEntityID 
Join Person.Address 
 ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID


6------Find the oldest employee based  on BirthDate.

   SELECT TOP 1 
    BusinessEntityID,
    JobTitle,
    BirthDate,
    HireDate,
    NationalIDNumber,
    LoginID
FROM HumanResources.Employee  
ORDER BY BirthDate ASC;  -- oldest first        
       
       or 

       SELECT MIN(BirthDate) AS OldestBirthDate
FROM HumanResources.Employee;


7--------Find the youngest employee based on BirthDate.
 
 SELECT MAX(BirthDate) AS YoungestBirthDate
FROM HumanResources.Employee;

        OR 
          SELECT TOP 1 
    BusinessEntityID,
    JobTitle,
    BirthDate,
    HireDate,
    NationalIDNumber,
    LoginID
FROM HumanResources.Employee  
ORDER BY BirthDate DESC;  -- Youngest first   


8-------Show all employees who have more than 50 vacation hours.


SELECT 
    BusinessEntityID,
    JobTitle,
    VacationHours,
    SickLeaveHours,
    HireDate
FROM HumanResources.Employee
WHERE VacationHours > 50;
   

9--------- List employees whose marital status is 'M' (married).


SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus
FROM HumanResources.Employee
WHERE MaritalStatus = 'M';


10---- Show employees with their job title and city, sorted by city.

SELECT 
    Person.Person.FirstName,
    Person.Person.LastName,
    HumanResources.Employee.JobTitle,
    Person.Address.City
FROM HumanResources.Employee
JOIN Person.Person
    ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
JOIN Person.BusinessEntityAddress
    ON Person.Person.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID
JOIN Person.Address
    ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID
ORDER BY Person.Address.City;


11---- ---Find employees who were hired before the year 2010.

SELECT BusinessEntityID, JobTitle, HireDate
FROM HumanResources.Employee
WHERE HireDate < '2010-01-01';


12-------- Count how many employees work in each job title.

SELECT 
    HumanResources.Employee.JobTitle,
    COUNT(HumanResources.Employee.BusinessEntityID) AS EmployeeCount
FROM HumanResources.Employee
GROUP BY HumanResources.Employee.JobTitle
ORDER BY EmployeeCount DESC;


13------- Show the top 5 job titles with the highest number of employees.

SELECT 
    HumanResources.Employee.JobTitle,
    COUNT(HumanResources.Employee.BusinessEntityID) AS EmployeeCount
FROM HumanResources.Employee
GROUP BY HumanResources.Employee.JobTitle
ORDER BY EmployeeCount DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;


14--- Find employees who have 'Engineer' in their JobTitle but live outside Los Angeles.

SELECT 
    Person.Person.FirstName,
    Person.Person.LastName,
    HumanResources.Employee.JobTitle,
    Person.Address.City
FROM HumanResources.Employee
JOIN Person.Person
    ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
JOIN Person.BusinessEntityAddress
    ON Person.Person.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID
JOIN Person.Address
    ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID
WHERE HumanResources.Employee.JobTitle LIKE '%Engineer%'
  AND Person.Address.City <> 'Los Angeles';


15--- Find All the managers living in rentol 


SELECT 
    Person.Person.FirstName,
    Person.Person.LastName,
    HumanResources.Employee.JobTitle,
    Person.Address.City
FROM Person.Person
JOIN HumanResources.Employee
    ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
JOIN Person.BusinessEntityAddress
    ON Person.Person.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID
JOIN Person.Address
    ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID
WHERE HumanResources.Employee.JobTitle LIKE '%Engineer%'
  AND Person.Address.City = 'Rentol';


16------- List employees with their first name, last name, and postal code.


SELECT 
    Person.Person.FirstName,
    Person.Person.LastName,
    Person.Address.PostalCode
FROM Person.Person
JOIN HumanResources.Employee
    ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
JOIN Person.BusinessEntityAddress
    ON Person.Person.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID
JOIN Person.Address
    ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID;



17-- ---Show employees whose sick leave hours are greater than vacation hours.


    SELECT 
    HumanResources.Employee.BusinessEntityID,
    HumanResources.Employee.JobTitle,
    HumanResources.Employee.SickLeaveHours,
    HumanResources.Employee.VacationHours
FROM HumanResources.Employee
WHERE HumanResources.Employee.SickLeaveHours > HumanResources.Employee.VacationHours;



18 -------Find all employees with ‘Manager’ in their job title and show their city.


   SELECT  
    Person.Person.FirstName,  
    Person.Person.LastName,  
    HumanResources.Employee.JobTitle,  
    Person.Address.City  
FROM HumanResources.Employee  
JOIN Person.Person  
    ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID  
JOIN Person.BusinessEntityAddress  
    ON Person.Person.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID  
JOIN Person.Address  
    ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID  
WHERE HumanResources.Employee.JobTitle LIKE '%Manager%';


19 ----   Show the total number of employees per city.


SELECT  
    Person.Address.City,  
    COUNT(HumanResources.Employee.BusinessEntityID) AS TotalEmployees  
FROM HumanResources.Employee  
JOIN Person.BusinessEntityAddress  
    ON HumanResources.Employee.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID  
JOIN Person.Address  
    ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID  
GROUP BY Person.Address.City  
ORDER BY TotalEmployees DESC;


20   -----    List employees and show if they are salaried or not (SalariedFlag).

sELECT  
    Person.Person.FirstName,  
    Person.Person.LastName,  
    HumanResources.Employee.JobTitle,  
    HumanResources.Employee.SalariedFlag  
FROM HumanResources.Employee  
JOIN Person.Person  
    ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID;
 

 21----   Find employees who have the same last name but live in different cities.



 
    SELECT  
    Person1.FirstName,  
    Person1.LastName,  
    Address1.City AS City1,  
    Person2.FirstName AS OtherFirstName,  
    Person2.LastName AS OtherLastName,  
    Address2.City AS City2  
FROM Person.Person AS Person1  
INNER JOIN Person.BusinessEntityAddress AS BusinessEntityAddress1  
    ON Person1.BusinessEntityID = BusinessEntityAddress1.BusinessEntityID  
INNER JOIN Person.Address AS Address1  
    ON BusinessEntityAddress1.AddressID = Address1.AddressID  

INNER JOIN Person.Person AS Person2  
    ON Person1.LastName = Person2.LastName  
    AND Person1.BusinessEntityID <> Person2.BusinessEntityID  
INNER JOIN Person.BusinessEntityAddress AS BusinessEntityAddress2  
    ON Person2.BusinessEntityID = BusinessEntityAddress2.BusinessEntityID  
INNER JOIN Person.Address AS Address2  
    ON BusinessEntityAddress2.AddressID = Address2.AddressID  

WHERE Address1.City <> Address2.City;


