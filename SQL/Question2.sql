CREATE TABLE Employees (
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ReportsTo VARCHAR(50),
    Position VARCHAR(50),
    Age INT
);



INSERT INTO Employees (FirstName, LastName, ReportsTo, Position, Age)
VALUES
    ('Daniel', 'Smith', 'Bob Boss', 'Engineer Contractor', 22),
    ('Mike', 'White', 'Bob Boss', 'Sales Assistant', 25),
    ('Jenny', 'Richards', NULL, 'CEO', NULL),
    ('Noah', 'Fritz', 'Daniel Smith Jenny Richards', 'Director', NULL),
    ('David', 'S', 'Jenny Richards', 'Intern', NULL),
    ('Ashley', 'Wells', 'David S', 'Assistant', NULL),
    ('Ashley', 'Johnson', NULL, 'Intern', 25);

SELECT
    E.FirstName,
    E.LastName,
    COUNT(RT.ReportsTo) AS NumberOfReports,
    COALESCE(ROUND(AVG(E.Age)), 0) AS AverageAge
FROM
    Employees E
LEFT JOIN
    Employees RT ON E.FirstName = RT.ReportsTo
GROUP BY
    E.FirstName, E.LastName
ORDER BY
    E.FirstName, E.LastName;