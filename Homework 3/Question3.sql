SELECT H.hotelName, G.guestName, G.guestAddress, B.roomNo
FROM Booking B
JOIN Guest G ON B.guestNo = G.guestNo
JOIN Hotel H ON B.hotelNo = H.hotelNo
ORDER BY H.hotelName, G.guestName, G.guestAddress;
