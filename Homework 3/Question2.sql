SELECT H.hotelName, H.city, R.roomNo, R.type, R.price
FROM Hotel H
JOIN Room R ON H.hotelNo = R.hotelNo
WHERE H.city = 'London'
ORDER BY H.hotelName, R.price DESC;