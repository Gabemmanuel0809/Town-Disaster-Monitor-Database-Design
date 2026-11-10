CREATE TABLE users(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(30) NOT NULL,
    mname VARCHAR(30) NULL,
    lname VARCHAR(30) NOT NULL,
    suffix VARCHAR(20) NULL,
    role ENUM('Resident', 'Official') NOT NULL DEFAULT 'Resident',
    address VARCHAR(150) NOT NULL,
    phone_number VARCHAR(15) NULL,
    bdate DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    hashed_password VARCHAR(255) NOT NULL
);

CREATE TABLE disasters(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   disaster_type VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE extra_needs(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE sos_alerts(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    disaster_id INT UNSIGNED NOT NULL,
	risk_level ENUM('Low', 'Moderate', 'High', 'Critical') NOT NULL,
	descript TEXT NULL,
    location_name VARCHAR(150) NOT NULL,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    sos_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sos_status ENUM('Pending', 'Declined','Approved', 'Completed') DEFAULT 'Pending',

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
    FOREIGN KEY (disaster_id) REFERENCES disasters(id) ON DELETE RESTRICT,
    INDEX idx_alerted_on(sos_date, disaster_id),
    INDEX  idx_alert_from(location_name, disaster_id)
);

CREATE TABLE incidents(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   incident_type VARCHAR(80) NOT NULL
);

CREATE TABLE incident_reports(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   incident_id INT UNSIGNED NOT NULL,
   user_id INT UNSIGNED NOT NULL,
   descript TEXT NULL,
   reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   priority_level ENUM('Low', 'Moderate', 'High') NULL, -- Officials will decide this once it was approved, so the user cant answer this in forms
   location VARCHAR(120) NOT NULL,
   report_status ENUM('Pending', 'Declined', 'Approved', 'Completed') DEFAULT 'Pending',   
   
   FOREIGN KEY (incident_id) REFERENCES incidents(id) ON DELETE RESTRICT,
   FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
   INDEX idx_reported_by(user_id, incident_id),
   INDEX idx_reported_from(location, incident_id)
);

CREATE TABLE alert_needs(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   alert_id INT UNSIGNED NOT NULL,
   needs_id INT UNSIGNED NOT NULL,
   UNIQUE(alert_id, needs_id),
   
   FOREIGN KEY (alert_id) REFERENCES sos_alerts(id) ON DELETE RESTRICT,
   FOREIGN KEY (needs_id) REFERENCES extra_needs(id) ON DELETE RESTRICT
);

CREATE TABLE town_hotlines(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   hotline_owner VARCHAR(50) NOT NULL,
   hotline_number VARCHAR(15) NOT NULL,
   number_status ENUM('Active', 'Inactive') DEFAULT 'Active'
);

CREATE TABLE events(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   event_type VARCHAR(100) NOT NULL,
   organizer VARCHAR(100) NOT NULL
);

CREATE TABLE announcements(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   event_id INT UNSIGNED NOT NULL,
   descript TEXT NOT NULL,
   event_date DATE DEFAULT (CURDATE()),
   location VARCHAR(120) NOT NULL,
   
   FOREIGN KEY(event_id) REFERENCES events(id) ON DELETE RESTRICT,
   INDEX idx_announcement_at(event_id, event_date)
);


CREATE TABLE shelters(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
    shelter_name VARCHAR(70) NOT NULL,
    location_name VARCHAR(120) NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    max_capacity INT UNSIGNED NOT NULL,
    current_capacity INT UNSIGNED NOT NULL,
	  CONSTRAINT cap_check CHECK(current_capacity <= max_capacity),
    shelter_status VARCHAR(20) GENERATED ALWAYS AS(
         CASE
             WHEN current_capacity < max_capacity THEN 'Available'
             ELSE 'Full Capacity'
          END
     ) VIRTUAL 
);

CREATE TABLE residents_on_shelter(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    resident_id INT UNSIGNED NOT NULL,
    shelter_id INT UNSIGNED NOT NULL,
    evacuation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    leaving_date TIMESTAMP NULL,
    
    FOREIGN KEY (resident_id) REFERENCES users(id) ON DELETE RESTRICT,
    FOREIGN KEY (shelter_id) REFERENCES shelters(id) ON DELETE RESTRICT
);

CREATE TABLE weather_types(
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  weather_type VARCHAR(120) NOT NULL
);

CREATE TABLE weather_report(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    report_date DATE DEFAULT (CURDATE()),
    weather_condition INT UNSIGNED NOT NULL,
    humidity DECIMAL(5, 2) NOT NULL,
    wind_direction DECIMAL(5, 2) NOT NULL, 
    chance_of_raining DECIMAL(5, 2) NOT NULL, 
	temperature DECIMAL(5, 2) NOT NULL,
	rain_millimeter DECIMAL(5, 2) NULL,
    flood_level ENUM('None', 'Low', 'Moderate', 'High') DEFAULT 'None',
	wind_speed SMALLINT NOT NULL, 
	
	FOREIGN KEY (weather_condition) REFERENCES weather_types(id) ON DELETE RESTRICT,
	INDEX idx_weather_during(weather_condition, report_date)
);

DELIMITER $$
   CREATE PROCEDURE AddEvacuees(
     IN p_resident_id INT UNSIGNED,
     IN p_shelter_id INT UNSIGNED
   ) 
   BEGIN
      DECLARE v_shelter_status VARCHAR(20);
      DECLARE v_already_inside INT;
      START TRANSACTION;

      SELECT COUNT(*) INTO v_already_inside
      FROM residents_on_shelter
      WHERE resident_id = p_resident_id
      AND shelter_id = p_shelter_id
      AND leaving_date IS NULL;

      IF v_already_inside > 0 THEN 
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "The Resident is already recorded inside";
      END IF;

      SELECT shelter_status INTO v_shelter_status 
      FROM shelters 
      WHERE id = p_shelter_id;
      
      IF v_shelter_status = 'Full Capacity' THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Shelter has reached its max capacity';
      ELSE 
         INSERT INTO residents_on_shelter(resident_id, shelter_id)
         VALUES(p_resident_id, p_shelter_id);

         UPDATE shelters 
         SET current_capacity = current_capacity + 1 
         WHERE id = p_shelter_id;
		 
         COMMIT; 
      END IF;  
   END$$

   CREATE PROCEDURE LeaveShelter(
      IN p_resident_id INT UNSIGNED,
      IN p_shelter_id INT UNSIGNED
   )
   BEGIN
      DECLARE v_is_inside INT; 
      START TRANSACTION;
      
        SELECT COUNT(*) INTO v_is_inside 
        FROM residents_on_shelter
        WHERE resident_id = p_resident_id
        AND shelter_id = p_shelter_id
        AND leaving_date IS NULL;

        IF v_is_inside = 0 THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Resident record is found in the shelter';
        ELSE 
          UPDATE shelters 
          SET current_capacity = current_capacity - 1
          WHERE resident_id = p_resident_id
          AND shelter_id = p_shelter_id
          AND leaving_date IS NULL;
       
          UPDATE residents_on_shelter
          SET leaving_date = NOW()
          WHERE resident_id = p_resident_id;
        COMMIT;
        END IF;
   END$$
DELIMITER ;
 