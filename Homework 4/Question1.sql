SELECT 
    I.VendorID,
    V.VendorName,
    I.InvoiceDate,
    I.InvoiceTotal,
    SUM(I.InvoiceTotal) AS VendorTotal,
    COUNT(I.InvoiceTotal) AS VendorCount,
    AVG(I.InvoiceTotal) AS VendorAvg
FROM 
    Invoices I
JOIN 
    Vendor V ON I.VendorID = V.VendorID
WHERE 
    (I.InvoiceTotal - I.PaymentTotal - I.CreditTotal) > 0
GROUP BY 
    I.VendorID, V.VendorName, I.InvoiceDate, I.InvoiceTotal
HAVING 
    I.InvoiceDate > '2020-01-15';
