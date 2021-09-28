#create database Countries;
show databases;
use Countries; 
Show tables;

create table country_info (
name varchar(25), 
Id int PRIMARY KEY, 
numberCitizens int);

insert into country_info
values ("Canada", 0, 0), ("USA", 1, 0);

create table Citizens (
first_name varchar(30), 
last_name varchar(30),
company_name varchar(50),	
address	varchar(50),
city varchar(30),
country_id int,
county varchar(20),
stateORprovince varchar(2),
zipORpostal	varchar(7),
phone1	varchar(12),
phone2	varchar(12),
email	varchar(60),
web varchar(100));

# this TRIGGER updates the numberCitizens field in the country_info table each time a citizen is added to citizens
delimiter // 
create trigger counter
after insert 
on citizens
for each row
begin
if new.country_id = 0 then
	UPDATE country_info
	SET numberCitizens = numberCitizens + 1
	WHERE name = 'Canada';
elseif new.country_id = 1 then 
	UPDATE country_info
	SET numberCitizens = numberCitizens + 1
	WHERE name = 'USA';
end if; 
end//
delimiter ;

INSERT INTO citizens SELECT first_name, last_name, company_name, address, city, 1, county, state, zip, phone1, phone2, email, web 
FROM USA;

INSERT INTO citizens SELECT first_name, last_name, company_name, address, city, 0, NULL , province, postal, phone1, phone2, email, web 
FROM Canada;

#checking counter after insertion 
SELECT * FROM country_info;

# CREATING A PROCEDURE TO SELECT ALL CITIZENS WHEN PASSED IN THE COUNTRY 
delimiter //
CREATE PROCEDURE SelectCitizens (IN Country varchar(30))
BEGIN
#return citizen records for selected country
SELECT * FROM Citizens WHERE country_id = 
(SELECT Id from country_info 
where name = Country);

#resetting counter 
UPDATE country_info
SET numberCitizens = 0 
Where name = Country;
END; //
delimiter ;

#calling procedure
CALL SelectCitizens('Canada');
CALL SelectCitizens('USA');

#checking counter after procedure call
SELECT * from country_info;
