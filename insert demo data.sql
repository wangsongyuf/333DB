use Graduate_School
go
insert into dbo.College
values ('Massachusetts Institute of Technology ',1,46400,null,null,null,'MA','77 Massachusetts Avenue, Room 1-206
Cambridge, MA 02139-4307');
go
insert into dbo.College
values ('Stanford University ',2,48720,null,null,null,'CA','Huang Engineering Center
Stanford, CA 94305-4121');
go
--
insert into dbo.Department
values ('Aeronautics and Astronautics',null,'aeroastro-info@mit.edu',0);
go

insert into dbo.Department
values ('Aeronautics & Astronautics','(650) 723-2757',null,1);
go

insert into Faculty
values('Hamsa Balakrishnan','Air traffic control, traffic flow management, airport operations scheduling, hybrid systems','hamsa@mit.edu')
go

insert into Faculty
values('Jaime Peraire','Numerical analysis, finite element methods, computational aerodynamics', 'peraire@mit.edu')
go

insert into Program
values('Aerospace / Aeronautical / Astronautical Engineering',1,null,0,0)
go

insert into Program
values('Aerospace / Aeronautical / Astronautical Engineering',2,null,1,1)
go


insert into ThisUser
values('admin','000000','admin',2016)
go

insert into ThisUser
values('testuser','000000','Student',2016)
go
insert into Supervise
values(0,0)
go
--incorrect

insert into Supervise
values(1,1)
go
--
insert into FRate
values(0,1,5,'Rate 1')
go

insert into FRate
values(1,1,5,'Rate 2')
go

--
insert into CRate
values(0,1,5,'Rate 1')
go

insert into CRate
values(1,1,5,'Rate 2')
go




insert into WorkIn
values(0,0)
go

insert into WorkIn
values(1,1)
go



