SELECT s.FullName, s.Role, d.DepartmentName
FROM Staff s
JOIN Departments d ON s.DepartmentID = d.DepartmentID;
