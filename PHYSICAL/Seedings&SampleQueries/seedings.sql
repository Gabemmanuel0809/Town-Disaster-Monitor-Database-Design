INSERT INTO weather_types(weather_type) VALUES 
('Clear'), ('Fog'), ('Thick Fog'), ('Drizzle'), ('Slight Rainfall'),
('Moderate Rainfall'), ('Heavy Rainfall'),
('Hail'), ('Thunderstorm'), ('Storm Surge');

INSERT INTO users (fname, mname, lname, suffix, role, address, phone_number, bdate, email, hashed_password) VALUES
('Ava', NULL, 'Santos', NULL, 'Resident', '101 Mabini Street', '09170000001', '1990-01-15', 'ava.santos@example.com', 'hash001'),
('Noah', 'Luis', 'Reyes', NULL, 'Resident', '102 Mabini Street', '09170000002', '1988-02-20', 'noah.reyes@example.com', 'hash002'),
('Mia', NULL, 'Cruz', NULL, 'Resident', '103 Rizal Avenue', '09170000003', '1995-03-10', 'mia.cruz@example.com', 'hash003'),
('Liam', 'Jose', 'Garcia', NULL, 'Official', '104 Rizal Avenue', '09170000004', '1985-04-05', 'liam.garcia@example.com', 'hash004'),
('Isla', NULL, 'Mendoza', NULL, 'Resident', '105 Bonifacio Street', '09170000005', '1992-05-22', 'isla.mendoza@example.com', 'hash005'),
('Ethan', NULL, 'Torres', NULL, 'Resident', '106 Bonifacio Street', '09170000006', '1987-06-12', 'ethan.torres@example.com', 'hash006'),
('Sofia', 'Mae', 'Flores', NULL, 'Official', '107 Luna Street', '09170000007', '1991-07-08', 'sofia.flores@example.com', 'hash007'),
('Lucas', NULL, 'Ramos', NULL, 'Resident', '108 Luna Street', '09170000008', '1998-08-18', 'lucas.ramos@example.com', 'hash008'),
('Amara', NULL, 'Villanueva', NULL, 'Resident', '109 Quezon Road', '09170000009', '1993-09-25', 'amara.villanueva@example.com', 'hash009'),
('James', 'Paul', 'Aquino', NULL, 'Resident', '110 Quezon Road', '09170000010', '1989-10-14', 'james.aquino@example.com', 'hash010'),
('Zoe', NULL, 'Castillo', NULL, 'Resident', '111 Bonifacio Street', '09170000011', '1996-11-03', 'zoe.castillo@example.com', 'hash011'),
('Daniel', NULL, 'Bautista', NULL, 'Official', '112 Luna Street', '09170000012', '1984-12-19', 'daniel.bautista@example.com', 'hash012'),
('Ella', 'Rose', 'Navarro', NULL, 'Resident', '113 Mabini Street', '09170000013', '1994-01-27', 'ella.navarro@example.com', 'hash013'),
('Mateo', NULL, 'Domingo', NULL, 'Resident', '114 Rizal Avenue', '09170000014', '1997-02-16', 'mateo.domingo@example.com', 'hash014'),
('Grace', NULL, 'Delos Santos', NULL, 'Resident', '115 Quezon Road', '09170000015', '1990-03-29', 'grace.delossantos@example.com', 'hash015'),
('Benjamin', 'Lee', 'Ocampo', NULL, 'Official', '116 Bonifacio Street', '09170000016', '1986-04-11', 'benjamin.ocampo@example.com', 'hash016'),
('Luna', NULL, 'Salazar', NULL, 'Resident', '117 Luna Street', '09170000017', '1999-05-06', 'luna.salazar@example.com', 'hash017'),
('Elijah', NULL, 'Pascual', NULL, 'Resident', '118 Mabini Street', '09170000018', '1983-06-23', 'elijah.pascual@example.com', 'hash018'),
('Chloe', 'Ann', 'Soriano', NULL, 'Resident', '119 Quezon Road', '09170000019', '1992-07-30', 'chloe.soriano@example.com', 'hash019'),
('Mason', NULL, 'Dela Cruz', NULL, 'Resident', '120 Rizal Avenue', '09170000020', '1988-08-09', 'mason.delacruz@example.com', 'hash020');

INSERT INTO disasters (disaster_type) VALUES
('Typhoon'), ('Flood'), ('Earthquake'), ('Fire'), ('Landslide'),
('Storm Surge'), ('Drought'), ('Volcanic Eruption'), ('Tsunami'), ('Extreme Heat'),
('Tornado'), ('Lightning'), ('Hailstorm'), ('Flash Flood'), ('Coastal Erosion'),
('Chemical Spill'), ('Building Collapse'), ('Power Outage'), ('Water Shortage'), ('Road Blockage');

INSERT INTO extra_needs (name) VALUES
('Drinking Water'), ('Food Packs'), ('First Aid Kit'), ('Medicine'), ('Blankets'),
('Clothing'), ('Baby Supplies'), ('Hygiene Kit'), ('Flashlight'), ('Batteries'),
('Wheelchair'), ('Oxygen Tank'), ('Rescue Boat'), ('Temporary Shelter'), ('Pet Food'),
('Clean Water Filter'), ('Cooking Supplies'), ('Sanitary Products'), ('Communication Device'), ('Assistive Device');

INSERT INTO sos_alerts (user_id, disaster_id, risk_level, descript, location_name, latitude, longitude, sos_status) VALUES
(1, 1, 'High', 'Water entering the ground floor.', 'Mabini Street', 14.59951200, 120.98422200, 'Pending'),
(2, 2, 'Critical', 'Family trapped by rising water.', 'Rizal Avenue', 14.60010000, 120.98510000, 'Approved'),
(3, 3, 'Moderate', 'Cracks appeared after shaking.', 'Bonifacio Street', 14.60120000, 120.98620000, 'Pending'),
(4, 4, 'High', 'Smoke reported near the market.', 'Central Market', 14.60230000, 120.98730000, 'Approved'),
(5, 5, 'Low', 'Small slope movement observed.', 'Luna Street', 14.60340000, 120.98840000, 'Pending'),
(6, 6, 'Critical', 'Coastal water is rising quickly.', 'Coastal Road', 14.60450000, 120.98950000, 'Approved'),
(7, 7, 'Moderate', 'Community water supply is low.', 'Quezon Road', 14.60560000, 120.99060000, 'Pending'),
(8, 8, 'High', 'Ashfall reported in the area.', 'East District', 14.60670000, 120.99170000, 'Approved'),
(9, 9, 'Critical', 'Unusually strong waves observed.', 'North Shore', 14.60780000, 120.99280000, 'Pending'),
(10, 10, 'High', 'Several residents need assistance.', 'South District', 14.60890000, 120.99390000, 'Completed'),
(11, 11, 'Moderate', 'Roof damage after strong winds.', 'West District', 14.61000000, 120.99400000, 'Pending'),
(12, 12, 'Low', 'Lightning damaged a power line.', 'Hilltop Road', 14.61110000, 120.99510000, 'Approved'),
(13, 13, 'Moderate', 'Hail damaged nearby crops.', 'Farm Road', 14.61220000, 120.99620000, 'Pending'),
(14, 14, 'High', 'Road is flooded and impassable.', 'Bridge Street', 14.61330000, 120.99730000, 'Approved'),
(15, 15, 'Low', 'Erosion near several homes.', 'Coastal Road', 14.61440000, 120.99840000, 'Pending'),
(16, 16, 'Critical', 'Unknown chemical odor reported.', 'Industrial Zone', 14.61550000, 120.99950000, 'Approved'),
(17, 17, 'High', 'Part of a structure has collapsed.', 'Old Town', 14.61660000, 121.00060000, 'Pending'),
(18, 18, 'Moderate', 'Power has been out for hours.', 'Mabini Street', 14.61770000, 121.00170000, 'Completed'),
(19, 19, 'High', 'No water available in the block.', 'Rizal Avenue', 14.61880000, 121.00280000, 'Pending'),
(20, 20, 'Low', 'Debris is blocking the main road.', 'Luna Street', 14.61990000, 121.00390000, 'Approved');

INSERT INTO incidents (incident_type) VALUES
('Medical Emergency'), ('Road Accident'), ('Fallen Tree'), ('Electrical Hazard'), ('Missing Person'),
('Structural Damage'), ('Water Contamination'), ('Animal Rescue'), ('Fire Incident'), ('Gas Leak'),
('Blocked Drain'), ('Damaged Bridge'), ('Power Line Down'), ('Landslide Debris'), ('Flooded Road'),
('Water Main Break'), ('Public Disturbance'), ('Hazardous Waste'), ('Vehicle Breakdown'), ('Damaged Streetlight');

INSERT INTO incident_reports (incident_id, user_id, descript, priority_level, location, report_status) VALUES
(1, 1, 'Resident needs medical assistance.', 'High', 'Mabini Street', 'Pending'),
(2, 2, 'Two vehicles involved in a collision.', 'Moderate', 'Rizal Avenue', 'Approved'),
(3, 3, 'A tree is blocking the sidewalk.', 'Low', 'Bonifacio Street', 'Pending'),
(4, 4, 'A damaged cable is sparking.', 'High', 'Central Market', 'Approved'),
(5, 5, 'A child has not returned home.', 'High', 'Luna Street', 'Pending'),
(6, 6, 'Wall damage reported after shaking.', 'Moderate', 'Quezon Road', 'Approved'),
(7, 7, 'Tap water appears discolored.', 'Moderate', 'East District', 'Pending'),
(8, 8, 'A dog is stranded in floodwater.', 'Low', 'North Shore', 'Approved'),
(9, 9, 'Smoke visible from a nearby building.', 'High', 'South District', 'Pending'),
(10, 10, 'Possible gas leak near a residence.', 'High', 'West District', 'Approved'),
(11, 11, 'Drain is blocked with debris.', 'Low', 'Hilltop Road', 'Pending'),
(12, 12, 'Bridge surface is damaged.', 'Moderate', 'Bridge Street', 'Approved'),
(13, 13, 'A power line is down across the road.', 'High', 'Farm Road', 'Pending'),
(14, 14, 'Mud and rocks are covering one lane.', 'Moderate', 'Coastal Road', 'Approved'),
(15, 15, 'Vehicles cannot pass due to flooding.', 'High', 'Industrial Zone', 'Pending'),
(16, 16, 'Water is leaking from the main pipe.', 'Moderate', 'Old Town', 'Approved'),
(17, 17, 'A disturbance needs official attention.', 'Low', 'Mabini Street', 'Pending'),
(18, 18, 'Unknown waste was left near the creek.', 'High', 'Rizal Avenue', 'Approved'),
(19, 19, 'A disabled vehicle blocks one lane.', 'Low', 'Luna Street', 'Pending'),
(20, 20, 'Streetlight pole is leaning dangerously.', 'Moderate', 'Quezon Road', 'Approved');

INSERT INTO alert_needs (alert_id, needs_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

INSERT INTO town_hotlines (hotline_owner, hotline_number, number_status) VALUES
('Municipal Emergency Desk', '0212345001', 'Active'), ('Fire Department', '0212345002', 'Active'),
('Police Station', '0212345003', 'Active'), ('Municipal Hospital', '0212345004', 'Active'),
('Disaster Response Unit', '0212345005', 'Active'), ('Coast Guard', '0212345006', 'Active'),
('Rescue Team North', '0212345007', 'Active'), ('Rescue Team South', '0212345008', 'Active'),
('Water Services', '0212345009', 'Active'), ('Electric Utility', '0212345010', 'Active'),
('Animal Control', '0212345011', 'Active'), ('Public Works', '0212345012', 'Active'),
('Health Center East', '0212345013', 'Active'), ('Health Center West', '0212345014', 'Active'),
('Shelter Coordination', '0212345015', 'Active'), ('Traffic Management', '0212345016', 'Active'),
('Community Support Desk', '0212345017', 'Active'), ('Environmental Office', '0212345018', 'Active'),
('Road Assistance', '0212345019', 'Active'), ('Emergency Operations Center', '0212345020', 'Active');

INSERT INTO events (event_type, organizer) VALUES
('Emergency Drill', 'Municipal Disaster Office'), ('First Aid Training', 'Municipal Hospital'),
('Community Cleanup', 'Public Works Department'), ('Preparedness Seminar', 'Disaster Response Unit'),
('Fire Safety Workshop', 'Fire Department'), ('Coastal Evacuation Drill', 'Coast Guard'),
('Health Outreach', 'Municipal Health Center'), ('Relief Goods Distribution', 'Community Support Desk'),
('Earthquake Drill', 'Municipal Disaster Office'), ('Water Conservation Forum', 'Water Services'),
('Volunteer Orientation', 'Disaster Response Unit'), ('Rescue Skills Training', 'Rescue Team North'),
('Shelter Management Workshop', 'Shelter Coordination'), ('Tree Planting', 'Environmental Office'),
('Road Safety Campaign', 'Traffic Management'), ('Family Preparedness Day', 'Municipal Government'),
('Blood Donation Drive', 'Municipal Hospital'), ('Flood Awareness Seminar', 'Public Works Department'),
('Emergency Communications Test', 'Emergency Operations Center'), ('Community Resilience Fair', 'Community Support Desk');

INSERT INTO announcements (event_id, descript, event_date, location) VALUES
(1, 'Residents are invited to join the emergency drill.', '2025-01-10', 'Municipal Hall'),
(2, 'Register for basic first aid training.', '2025-01-15', 'Municipal Hospital'),
(3, 'Bring gloves for the community cleanup.', '2025-01-20', 'Central Market'),
(4, 'Learn practical steps for disaster preparedness.', '2025-01-25', 'Community Center'),
(5, 'Fire safety workshop is open to all residents.', '2025-02-01', 'Fire Station'),
(6, 'Coastal households will practice evacuation routes.', '2025-02-05', 'North Shore'),
(7, 'Free health checks will be available.', '2025-02-10', 'East District Clinic'),
(8, 'Relief goods distribution schedule and details.', '2025-02-15', 'Municipal Warehouse'),
(9, 'Please participate in the earthquake drill.', '2025-02-20', 'Municipal Hall'),
(10, 'Join a discussion about conserving water.', '2025-02-25', 'Water Services Office'),
(11, 'Volunteer orientation for new responders.', '2025-03-01', 'Community Center'),
(12, 'Rescue skills training for registered volunteers.', '2025-03-05', 'Rescue Training Ground'),
(13, 'Shelter management workshop for community leaders.', '2025-03-10', 'Town Gymnasium'),
(14, 'Help plant trees along the riverbank.', '2025-03-15', 'Riverside Park'),
(15, 'Road safety campaign activities and schedule.', '2025-03-20', 'Municipal Plaza'),
(16, 'Families can learn how to prepare emergency kits.', '2025-03-25', 'Town Gymnasium'),
(17, 'Donate blood and support local patients.', '2025-04-01', 'Municipal Hospital'),
(18, 'Flood awareness seminar for riverside residents.', '2025-04-05', 'Riverside Community Hall'),
(19, 'Emergency communications system test notice.', '2025-04-10', 'All Districts'),
(20, 'Join local groups at the community resilience fair.', '2025-04-15', 'Municipal Plaza');

INSERT INTO shelters (shelter_name, location_name, latitude, longitude, max_capacity, current_capacity) VALUES
('Mabini School Shelter', 'Mabini Street', 14.59951200, 120.98422200, 50, 1),
('Rizal Gym Shelter', 'Rizal Avenue', 14.60010000, 120.98510000, 60, 1),
('Bonifacio Center Shelter', 'Bonifacio Street', 14.60120000, 120.98620000, 40, 1),
('Central Hall Shelter', 'Central Market', 14.60230000, 120.98730000, 80, 1),
('Luna Community Shelter', 'Luna Street', 14.60340000, 120.98840000, 45, 1),
('Coastal Evacuation Shelter', 'Coastal Road', 14.60450000, 120.98950000, 70, 1),
('Quezon School Shelter', 'Quezon Road', 14.60560000, 120.99060000, 55, 1),
('East District Shelter', 'East District', 14.60670000, 120.99170000, 50, 1),
('North Shore Shelter', 'North Shore', 14.60780000, 120.99280000, 65, 1),
('South District Shelter', 'South District', 14.60890000, 120.99390000, 45, 1),
('West District Shelter', 'West District', 14.61000000, 120.99400000, 50, 1),
('Hilltop Shelter', 'Hilltop Road', 14.61110000, 120.99510000, 35, 1),
('Farm Road Shelter', 'Farm Road', 14.61220000, 120.99620000, 40, 1),
('Bridge Street Shelter', 'Bridge Street', 14.61330000, 120.99730000, 60, 1),
('Industrial Zone Shelter', 'Industrial Zone', 14.61440000, 120.99840000, 55, 1),
('Old Town Shelter', 'Old Town', 14.61550000, 120.99950000, 50, 1),
('Riverside Shelter', 'Riverside Road', 14.61660000, 121.00060000, 70, 1),
('Garden District Shelter', 'Garden District', 14.61770000, 121.00170000, 40, 1),
('Market District Shelter', 'Market District', 14.61880000, 121.00280000, 45, 1),
('Town Center Shelter', 'Town Center', 14.61990000, 121.00390000, 100, 1);

INSERT INTO residents_on_shelter (resident_id, shelter_id, evacuation_time, leaving_date) VALUES
(1, 1, '2025-01-01 08:00:00', NULL), (2, 2, '2025-01-01 08:10:00', NULL),
(3, 3, '2025-01-01 08:20:00', NULL), (4, 4, '2025-01-01 08:30:00', NULL),
(5, 5, '2025-01-01 08:40:00', NULL), (6, 6, '2025-01-01 08:50:00', NULL),
(7, 7, '2025-01-01 09:00:00', NULL), (8, 8, '2025-01-01 09:10:00', NULL),
(9, 9, '2025-01-01 09:20:00', NULL), (10, 10, '2025-01-01 09:30:00', NULL),
(11, 11, '2025-01-01 09:40:00', NULL), (12, 12, '2025-01-01 09:50:00', NULL),
(13, 13, '2025-01-01 10:00:00', NULL), (14, 14, '2025-01-01 10:10:00', NULL),
(15, 15, '2025-01-01 10:20:00', NULL), (16, 16, '2025-01-01 10:30:00', NULL),
(17, 17, '2025-01-01 10:40:00', NULL), (18, 18, '2025-01-01 10:50:00', NULL),
(19, 19, '2025-01-01 11:00:00', NULL), (20, 20, '2025-01-01 11:10:00', NULL);

INSERT INTO weather_report (report_date, weather_condition, humidity, wind_direction, chance_of_raining, temperature, rain_millimeter, flood_level, wind_speed) VALUES
('2025-01-01', 1, 55.00, 90.00, 5.00, 29.50, 0.00, 'None', 12),
('2025-01-02', 2, 70.00, 110.00, 10.00, 27.00, 0.00, 'None', 15),
('2025-01-03', 3, 82.00, 130.00, 20.00, 25.50, 0.00, 'None', 18),
('2025-01-04', 4, 85.00, 150.00, 45.00, 24.00, 2.50, 'Low', 20),
('2025-01-05', 5, 88.00, 160.00, 55.00, 23.50, 5.00, 'Low', 22),
('2025-01-06', 6, 90.00, 170.00, 70.00, 22.50, 12.00, 'Moderate', 28),
('2025-01-07', 7, 94.00, 180.00, 90.00, 21.00, 30.00, 'High', 40),
('2025-01-08', 8, 80.00, 200.00, 25.00, 23.00, 1.00, 'Low', 25),
('2025-01-09', 9, 92.00, 210.00, 85.00, 22.00, 20.00, 'Moderate', 45),
('2025-01-10', 10, 96.00, 220.00, 95.00, 26.00, 40.00, 'High', 55),
('2025-01-11', 1, 58.00, 230.00, 8.00, 30.00, 0.00, 'None', 10),
('2025-01-12', 2, 68.00, 240.00, 15.00, 28.00, 0.00, 'None', 14),
('2025-01-13', 3, 78.00, 250.00, 25.00, 26.00, 0.00, 'None', 16),
('2025-01-14', 4, 84.00, 260.00, 40.00, 24.50, 3.00, 'Low', 19),
('2025-01-15', 5, 87.00, 270.00, 60.00, 23.00, 7.50, 'Moderate', 24),
('2025-01-16', 6, 91.00, 280.00, 75.00, 22.00, 15.00, 'Moderate', 32),
('2025-01-17', 7, 95.00, 290.00, 92.00, 20.50, 35.00, 'High', 48),
('2025-01-18', 8, 81.00, 300.00, 30.00, 22.50, 1.50, 'Low', 27),
('2025-01-19', 9, 93.00, 310.00, 88.00, 21.50, 25.00, 'High', 50),
('2025-01-20', 10, 97.00, 320.00, 98.00, 25.00, 45.00, 'High', 60);

