SELECT o.OrderID, o.Country, o.ContractLength, o.DateEstablished, o.ActiveStatus, p.ProductName
FROM OrderDetails o
JOIN Products p ON o.ProductID = p.ProductID
WHERE o.OrganizationID = 'C001';
