# My Design Decisions 

## Disasters To SOS Alerts [Relationship = One-To-Many]
An SOS Alert can point to a single disaster and a Disaster 
can be used to multiple sos alerts

## Incidents To  Incidents Reports [Relationship = One-To-Many]
An Incident Report can point to a single Incident at a time 
but an incident can be used to point into many incident reports

## User To SOS Alerts/Incident Reports [Relationship = One-To-Many]
A User can have one to many alerts/reports but alerts/reports only belongs
to a single user. To satisfy this I separated them into two different tables
[users, sos_alerts] and [users, incident_reports].

## SOS Alerts To Needs [Relationship = Many-To-Many]
An SOS Alerts can have many needs at once and a need can be use on multiple 
SOS Alerts on the same time. I implemented a junction table called 
alert_needs to break their Many-To-Many relationship into a single table.

## Users To Shelters [Relationship = One-To-Many]
A user can evacuate on a single shelter at a time, but a Shelter can house 
many users at once.

## Events To Announcements [Relationship = One-To-Many]
An Announcement can only have a single event at a time, but an event can belong 
to different Announcements at a time 

## Town Hotline [Relationship = None]
The only table that has no relationship 

## Weather To Weather Reports [Relationship = One-To-Many]
A Weather Reports can only have a single weather per report but a Weather 
can be linked to many Weather reports at a time  
