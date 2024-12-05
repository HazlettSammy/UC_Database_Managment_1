SELECT pr.ProjectID, pr.ProductID, pr.OrganizationID, p.ProductName, o.OrganizationName
FROM Projects pr
JOIN Products p ON pr.ProductID = p.ProductID
JOIN Organizations o ON pr.OrganizationID = o.OrganizationID
WHERE pr.StaffID = 'E011';
