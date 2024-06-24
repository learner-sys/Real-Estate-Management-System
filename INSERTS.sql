-- Inserting values into properties table
INSERT INTO properties VALUES (11, '123', 'Manama', 1500, 3, 2);

INSERT INTO properties VALUES (12, '456', 'Muharraq', 2000, 4, 3);

INSERT INTO properties VALUES (13, '789', 'Riffa', 1800, 2, 1.5);

INSERT INTO properties VALUES (14, '987', 'Isa Town', 2200, 5, 3);

-- Inserting values into property_owners table
INSERT INTO property_owners VALUES (11, 'Ahmed', '97332123456', 'ahmed@gmail.com');

INSERT INTO property_owners VALUES (12, 'Mohammed', '97333234567', 'mohammed@gmail.com');

INSERT INTO property_owners VALUES (13, 'Abdullah', '97334345678', 'abdullah@gmail.com');

INSERT INTO property_owners VALUES (14, 'Khaled', '97335456789', 'khaled@gmail.com');

-- Inserting values into property_listings table
INSERT INTO property_listings VALUES (11, 11, 11, 2000, 'Available', 'Spacious apartment in a prime location');

INSERT INTO property_listings VALUES (12, 12, 12, 3000, 'Available', 'Luxurious house with a stunning view');

INSERT INTO property_listings VALUES (13, 13, 13, 1500, 'Rented', 'Cozy home near the city center');

INSERT INTO property_listings VALUES (14, 14, 14, 2500, 'Available', 'Modern townhouse with great amenities');

-- Inserting values into Tenants table
INSERT INTO Tenants VALUES (11, 'Ali', '97336567890', 'ali@gmail.com');

INSERT INTO Tenants VALUES (12, 'Sarah', '97337678901', 'sarah@gmail.com');

INSERT INTO Tenants VALUES (13, 'Laila', '97338789012', 'laila@gmail.com');

INSERT INTO Tenants VALUES (14, 'Emily', '97339890123', 'emily@gmail.com');

-- Inserting values into Rental_agreements table
INSERT INTO Rental_agreements VALUES (11, 11, 11, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2025-05-31', 'YYYY-MM-DD'), 2000);

INSERT INTO Rental_agreements VALUES (12, 12, 12, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2025-06-30', 'YYYY-MM-DD'), 3000);

INSERT INTO Rental_agreements VALUES (13, 13, 13, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2025-07-31', 'YYYY-MM-DD'), 1500);

INSERT INTO Rental_agreements VALUES (14, 14, 14, TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2025-08-31', 'YYYY-MM-DD'), 2500);

-- Inserting values into Maintenance_Requests table
INSERT INTO Maintenance_Requests VALUES (11, 11, 11, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'Leaky faucet', 'Pending');

INSERT INTO Maintenance_Requests VALUES (12, 12, 12, TO_DATE('2024-07-10', 'YYYY-MM-DD'), 'Broken window', 'Resolved');

INSERT INTO Maintenance_Requests VALUES (13, 13, 13, TO_DATE('2024-08-15', 'YYYY-MM-DD'), 'Clogged drain', 'Pending');

INSERT INTO Maintenance_Requests VALUES (14, 14, 14, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Electrical issue', 'In Progress');