Create database Cinema
Use Cinema
Create table Genre(
Id int primary key identity,
Genre_name nvarchar(50)
)
Create table Movies(
Id int primary key identity,
Movies_name nvarchar(50),
Ticket_id int  foreign key references Tickets(Id)
)

Create table Seans(
Id int primary key identity,
Session_name nvarchar(50),
Ticket_Id int foreign key references Tickets(Id)
)

Create table Actor(
Id int primary key identity,
Actor_name nvarchar(40)
)
Create table Tickets(
Id int primary key identity,
Tickets_number int ,
Price decimal(3,1),
)

Create table Customers(
Id int primary key identity,
Customers_Name nvarchar(40),
Ticket_id int foreign key references tickets(id)
)


Create table Genre_Movies(
Id int primary key identity,
Genre_id int  foreign key references Genre(id),
Movies_id int foreign key references Actor(id)
)

Create table Actor_Movies(
Id int primary key identity,
Actor_id int foreign key references Actor(id),
Movies_id int foreign key references Movies(id)
)
Create table Halls(
Id int primary key identity,
Halls_number int,
Ticket_id int foreign key references Tickets(id)
)

----Deyerleri teyin etdik!

insert into Genre
values ('Dram'),
('Action'),
('Horror'),
('Comedy'),
('science fiction')

insert into Actor
Values('Benedict Cumberbatch'),
('Mark Ruffalo'),
('Robert Dauni'),
('scarlett johansson'),
('Simu Liu')
					
insert into Tickets
values(1,23.9),
(2,34.8),
(3,45.5),
(4,12.0)

insert into Customers
values('A1',1),
('B2',2),
('C2',3)
insert into Movies
values('Iron Man',1),
('Hulk',3),
('Shanh-chi',4),
('DoctorStrange2',2)
insert into Halls
values(1,2),
(2,3),
(3,4),
(4,1)
insert into seans
values('A1',1),
('B1',3),
('C1',2),
('D1',4)

insert into Genre_Movies
values(1,1),
(2,2),
(3,4),
(4,3),
(5,2)
insert into Actor_Movies
values (1,9),
(2,7),
(3,6),
(4,6),
(5,8)

select Genre_Movies.Movies_id, Genre.Genre_name from Genre_Movies
join Genre
on  Genre_Movies.Genre_id=Movies_id
union all
select Genre_Movies.Genre_id,Movies.Movies_name FROM Genre_Movies
JOIN Movies
on Genre_Movies.Genre_id=Movies.Id

select Actor_Movies.Actor_id, Actor.Actor_name from Actor_Movies
join Actor
on Actor_Movies.Actor_id=Actor.Id
union all
select Actor_Movies.Movies_id,Movies.Movies_name from Actor_Movies
Join Movies
on Actor_Movies.Actor_id=Movies_id

create view vW_SelectAllTickets
as

select customers.Customers_Name as Customers,Movies.Movies_name,Seans.Session_name,Halls.Halls_number as c from customers

Join Customers as customers
on c.customers.id=c.id
join movies
on c.id=movies.Ticket_id
join Halls
on c.id=Ticket_id
join Seans
on c.id=Ticket_id





































