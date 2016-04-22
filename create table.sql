use Graduate_School
go
CREATE TABLE College(		
CID	int IDENTITY(0,1),
Name varchar(50),
Randking INT,
Tuition money,
FundingOption varchar(50),
InstitutionControl varchar(50),
AverageStandardizedTestScore int,
InState varchar(20),
AtAddress varchar(500),
PRIMARY KEY(CID)
--all the changing about primary key will be rejected due default setting
)
go
create table Department(
DID int IDENTITY(0,1),
Name varchar(50),
Phone varchar(15),
--may add check "[0-9]*"
Email varchar(50),
--may add check "_@_"
CID  int foreign key references College(CID),
Primary key(DID),
)
go
create table Program(
PID int IDENTITY(0,1),
Name varchar(500),
USNewsRanking int,
PrincetonReviewRanking int,
CID int foreign key references College(CID),
DID int foreign key references Department(DID),
primary key(PID)
)
go
create table Faculty(
FID int IDENTITY(0,1),
Name varchar(50),
Area varchar(500),
Email varchar(50),
--may add check "_@_"
primary key(FID)
)
go
create table ThisUser(
UUID int IDENTITY(0,1),
Username varchar(50),
--may add check "only use normal letter and number"
UPassword varchar(50),
--may add check "length, Upper/Lower Case"
CurrentStatus varchar(50),
AtYear int,
primary key(UUID))
go
create table CRate(
CID int foreign key references College(CID),
UUID int foreign key references ThisUser(UUID),
Rating int,
--may add check "0<=x<=5"
Comment varchar(50),
--primary key?
)
go
create table FRate(
FID int foreign key references Faculty(FID),
UUID int foreign key references ThisUser(UUID),
Rating int,
--may add check "0<=x<=5"
Comment varchar(50),
--primary key?
)
go
create table WorkIn(
FID int foreign key references Faculty(FID),
DID int foreign key references Department(DID),
--primary key?
)
go
create table Supervise(
FID int foreign key references Faculty(FID),
PID int foreign key references Program(PID),
--primary key?
)
go