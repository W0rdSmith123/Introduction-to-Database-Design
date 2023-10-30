SELECT 
    V.VendorName,
    I.InvoiceID,
    IL.InvoiceSequence,
    IL.InvoiceLineItemAmount
FROM 
    Invoices I
JOIN 
    Vendor V ON I.VendorID = V.VendorID
JOIN 
    InvoiceLineItem IL ON I.InvoiceID = IL.InvoiceID
WHERE 
    I.InvoiceID IN (
        SELECT InvoiceID
        FROM InvoiceLineItem
        GROUP BY InvoiceID
        HAVING COUNT(InvoiceSequence) > 1
    );