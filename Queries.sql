#Queries for stage 4 

#1. Return all volunteers, sorted by last name, then first name
SELECT *
from volunteer 
order by lname, fname;








#2.Return a list of projects that have more than one location
SELECT project.project_name, project.project_id, count(project.project_id) as 'Number of Locations'
from project
inner join location on location.project_id = project.project_id
group by project_id
having count(project.project_id)>1;

# in this query we select project_name, project_id and count the locations with inner join 
# then inner join with another table named project because "inner join" joins all the common things between two tables
# so, we doing inner join on location.project_id = project.project_id
#then group by project_id 
# having is condition to check the count we want like 1 (so, count only those which have more than 1 location)








#3. Return the number of volunteers who have registered for a non timeslot based project.
SELECT project_id, count(ssn) as 'number of volunteers'
from signup
where not exists(select * from timeslot where timeslot.project_id = signup.project_id)
group by project_id;

#in this query we select project_id and count ssn from signup table it means these ssn are of those people who signed up for the project
#then we try to see in which project doesnot have a timeslot with "where not exists" by comparing project_id of both tables
#then we group by project_id












#4. Return the number of volunteers who have (schedule)signed up for a time slot associated with a given project.
select schedule.slot_id,project.project_id,project.project_name,count(schedule.ssn) as 'number of volunteers'
from schedule,signup,project
where signup.ssn= schedule.ssn and signup.project_id=project.project_id 
group by project.project_id, schedule.slot_id
order by schedule.slot_id;
 
#we select slot_id, projectid, projectname, and number of volunteers  from 3 tables like schedule,signup,project
#then we compare "ssn" of signup table with ssn of schedule and projectid of signup table with projectid of project table
#groupby projectid, slot_id



#version 2 with particular project name 
select count(schedule.ssn) as 'number of volunteers'
from schedule, signup,project
where project_name="smile event" and signup.ssn= schedule.ssn and signup.project_id=project.project_id 
group by schedule.ssn;
#we count ssn in schedule because those people are who have register for timeslot
#in where condition we put (GIVEN)project name, and compare all signup volunteer with scheduled volunter ssn
#and signup.project_id=project.project_id to filter the other project_id
#then we group by ssn #but if we groupby slot_id we will get total number of people who registed for not timeslot based peoject in slot id




#5. Return, for each project, its name, and the total amount of money donated to it.
SELECT project_name, amount as 'total amount of money donated'
from  project, donation
where project.project_id = donation.project_id;







#6. Return the first name, last name, id, and total slots signed up for before a particular date, grouped by volunteer id.
SELECT fname, lname, volunteer_id, count(slot_id) as 'Total slots signed up'
from  volunteer, timeslot, project
where volunteer_id = project_volunteer_id and  project.project_id= timeslot.project_id and timeslot.date < '2021-05-06'
group by volunteer_id;







#7. Return complete information on each volunteer, including any positions held.
SELECT volunteer.* , volunteer_position
from  volunteer
left join volunteer_position on volunteer_position.ssn = volunteer.ssn;

 # in this query we take all attributes from table "volunteer" plus table "volunteer_position"
 # then we left join the table "volunteer_position" on every volunteer_position.ssn = volunteer.ssn to compare. 
 







 
#8. Write two more queries that return “interesting” or useful data. Explain in writing why your queries are useful.
# INTRESTING QUERY1: Details of volunteer who worked for more than 20 hours a week?
SELECT ssn,fname,lname, worked_hours
from  volunteer
where volunteer.worked_hours > 20;

#with the help of this query we can know who is working more than average time which is more than 20 hours and also we can know who
#invested their time more in voluntering job and committe can give some type of rewards to those person. 










# INTRESTING QUERY2: all project supervisors first and last name, associated with which project their contact number and their volunteer id 
SELECT fname, lname, project_name, phone, project_volunteer_id
from  project,volunteer
where volunteer_id= project_volunteer_id;

#this query is very helpful to find information about the supervisor and want to talk directly on phone about their registered event. 
#with this query we can see we have 6 supervisors with different project name and contact numbers. 
