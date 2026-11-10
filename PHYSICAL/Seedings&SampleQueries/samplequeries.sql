-- Shows the available shelters and its location 
SELECT 
  shelter_name,
  location_name
FROM shelters
WHERE shelter_status = 'Available';

-- Shows the total report count for each risk-level 
SELECT 
  risk_level,
  COUNT(risk_level) AS `Total Count`
FROM sos_alerts
GROUP BY risk_level;


-- shows the shelter having the most evacuees
SELECT 
  shelter_name,
  location_name,
  current_capacity
FROM shelters
WHERE current_capacity = (
   SELECT MAX(current_capacity)
   FROM shelters
);

-- shows a list of disasters that has not occured yet 
SELECT 
   disaster_type
FROM disasters AS d 
WHERE NOT EXISTS(
  SELECT 1 
  FROM sos_alerts AS sa 
  WHERE sa.disaster_id = d.id
);

-- shows the residents residing currently on the shelter and the time they evacuated 
SELECT 
   r.lname AS Resident,
   s.shelter_name AS Shelter,
   ros.evacuation_time AS `Time Evacuated` 
FROM residents_on_shelter AS ros  
JOIN users AS r ON r.id = ros.resident_id
JOIN shelters AS s ON s.id = ros.shelter_id
WHERE ros.leaving_date IS NULL
ORDER BY ros.id
LIMIT 5;

-- shows all the users sos reports where the status is Pending and Approved 
SELECT 
  r.lname AS Resident,
  d.disaster_type AS Disaster,
  sa.risk_level AS Risk,
  sa.location_name AS Location,
  sa.sos_date AS `Report Date`,
  sa.sos_status AS `Report Status`,
  sa.descript AS Description 
FROM sos_alerts AS sa 
JOIN users AS r ON r.id = sa.user_id
JOIN disasters AS d ON d.id = sa.disaster_id
WHERE sos_status IN('Pending', 'Approved')
ORDER BY sa.id;

-- shows the incident reports that has a pending status 
SELECT 
  r.lname AS Resident,
  i.incident_type AS Incident,
  ir.location AS Location,
  ir.descript AS Description,
  ir.reported_at AS `Report Date`,
  ir.priority_level AS `Priority Level`
FROM incident_reports AS ir 
JOIN users AS r ON r.id = ir.user_id
JOIN incidents AS i ON i.id = ir.incident_id
WHERE report_status = 'Pending'
ORDER BY ir.id;

-- shows the top 10 latest town announcements
SELECT 
  e.organizer AS Organizer,
  e.event_type AS Event,
  a.descript AS Description,
  a.location AS Location,
  a.event_date AS `Date of Event`
FROM announcements AS a 
JOIN events AS e ON e.id = a.event_id
ORDER BY a.event_date DESC
LIMIT 10;

-- shows the top 3 most recurring disasters
WITH MostRecurringDisasters AS(
   SELECT 
   d.disaster_type AS Disaster,
   COUNT(sa.id) AS Occurence,
   DENSE_RANK() OVER(ORDER BY d.disaster_type DESC) AS ranking
   FROM sos_alerts AS sa 
   JOIN disasters AS d ON d.id = sa.disaster_id
   GROUP BY d.disaster_type
)
SELECT 
   Disaster,
   Occurence,
   DENSE_RANK() OVER(ORDER BY Occurence DESC) AS Ranking
FROM MostRecurringDisasters
LIMIT 3;

-- Calling my two stored procedures 
CALL AddEvacuees(1, 1);
CALL LeaveShelter(1, 1);