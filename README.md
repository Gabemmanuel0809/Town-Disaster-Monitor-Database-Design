# Town Disaster Response and Monitoring Database Design 

## Requirements
A town wants to organize sos_alerts, incident_reports, and weather 
reports so the responders can easily track whether which place, what time,
and what happened during that particular event. The Town administrator also 
wants the users to receive on-time barangay announcements to keep everyone 
updated of what was currently happening. The town also wanted to keep track 
of evacuation shelter status so the users can be inform early before going
into it.

## Identities and attributes
Users = [Fullname, phone_no, birthdate, role, address]<br>
Disasters = [disaster type]<br>
SOS_Alert = [User Id, Disaster Id, risk level, description, location, date, status ]<br>
Needs = [Needs name]<br>
Alert_Needs  = [Alert Id, Needs Id]<br>
Incidents = [Incidents type]<br>
Incident_Reports = [User Id, Incidents Id, risk level, description, location, date, status ]<br>
Town_Hotlines = [hotline owner, hotline number, hotline status]<br>
Events = [Event type, Organizer]<br>
Announcements = [Event Id, Event Date, description, location]<br>
Shelters = [Shelter Name, Shelter location, current capacity, max capacity, shelter_status]<br>
Residents_On_Shelters = [User Id, Shelter Id, Evacuation date, leaving date]<br>
Weather Types = [Weather type]<br>
Weather Report = [report date, weather condition, humidity, wind direction, chance of raining, temperature, rain millimeter, flood_level, wind_speed]<br>

## ERD Table 
![ERD Diagram](LOGICAL/ERD.png)

## Defining Relationships
1.) A user can have multiple sos_alerts and incident_reports <br>
2.) An sos_alerts and incident_reports can only belong to one person<br>
3.) A user can have multiple needs per sos_alerts<br>
4.) A needs can be requested by multiple users at a time.<br>
5.) A user can evacuate to one shelter at a time but can evacuate to different shelter over time.<br>
6.) A shelter can house many users.<br>
7.) An Event can be used for different announcements over time.<br>
8.) An Announcements can only have one event per time.<br>

## Features 
1.) Stored Procedure with a transaction inside<br>

## How to run 
1.) Import either implementation.sql or schema.dbml in your corresponding database application program<br>
2.) Import the seeding.sql to populate the Database<br>
3.) Try the sample queries provided<br>
