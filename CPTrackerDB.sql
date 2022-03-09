use CPTrackerDB

create table userLogin(
	usrId int identity (1,1) primary key,
	username varchar (50),
	uEmail varchar (250),
	password varchar(10),
	uDept varchar(250),
	uBranch varchar(50),
	eRoleName varchar(50)
)


use CPTrackerDB

create table user_Role(
	eId int identity (1,1),
	eRoleName varchar(50),
	ePermissionType varchar(50),
	eCreatedDate smalldatetime default GETDATE()
)

select * from userLogin

select * from userRole


SELECT UL.*, UR.ePermissionType
FROM userLogin as UL
INNER JOIN userRole as UR
ON UL.eRoleName = UR.eRoleName;


use CPTrackerDB

create table userAddressBook(
	cId int identity (1,1),
	cName varchar (50),
	cEmail varchar (50),
	cAddress text,
	cContactNo text
)

create table empDept(
	depID int identity (1,1),
	depName varchar (50)
)

SELECT UL.*, EDep.depName
FROM userLogin as UL
INNER JOIN empDept as EDep
ON UL.uDept = EDep.depName;

use CPTrackerDB

create table empBranch(
	bID int identity (1,1),
	bCode varchar (50),
	bName varchar (50),
	bAddress text,
	bContactNo text
)

SELECT UL.*, EBar.bCode
FROM userLogin as UL
INNER JOIN empBranch as EBar
ON UL.uBranch = EBar.bCode;

create table cParcel(
	pID int identity (1,1),
	pUnique varchar unique default newid(),
	pCourierServ varchar (50),
	pMailSize varchar (50),
	pWeight text,
	pItemDesc text,
	pBarCode nvarchar (max),
	pDateTime smalldatetime default GETDATE()
)

create table cReceivePar(
	rID int identity (1,1),
	rIdentifier varchar,
	rStatus varchar (50),
	rLocation varchar (50),
	rDateTime smalldatetime default GETDATE()
)


use CPTrackerDB

create table cBatch (
	batID int identity (1,1),
	batUniqueID varchar unique default newid(),
	batFwdTo text,
	drvContact text,
	batBarCode nvarchar (max),
	batName varchar (50),
	batDateTime smalldatetime default GETDATE()
)

alter table cBatch
add pUniqueID varchar unique, pBarCode nvarchar(max)