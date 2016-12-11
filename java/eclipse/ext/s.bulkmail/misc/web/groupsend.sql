/* SQL - Script - iso2000			*/
/* Author: NULL					*/

set quoted_identifier on
GO

/****** Object:  Table dbo.iso_grouptype    Script Date: 01/8/00 5:08:00 AM ******/
if exists (select * from sysobjects where id = object_id('dbo.iso_downloaders') and sysstat & 0xf = 3)
	drop table "dbo"."iso_grouptype"
GO


/****** Object:  Table dbo.iso_grouptype    Script Date: 12/7/99 4:15:16 PM ******/
CREATE TABLE "dbo"."cd_registration" (
	"cd_registrationid" "int" IDENTITY (1, 1) NOT NULL ,
	"cdcodeid" "int" NULL ,
	"emailaddress" varchar (100) NULL ,
	"name" varchar (100) NOT NULL ,
	"systemid" varchar (100) NULL ,
	"registrationdate" "datetime" NOT NULL CONSTRAINT "DF__cd_regist__regis__337FAFDD" DEFAULT (getdate()),
	"Successful" "bit" NOT NULL CONSTRAINT "DF__cd_regist__Succe__3473D416" DEFAULT (1),
	"ActivationCode" varchar (50) NULL ,
	"companyname" varchar (100) NULL ,
	"cdkey" varchar (100) NULL ,
	"title" varchar (100) NULL ,
	"firstname" varchar (100) NULL ,
	"lastname" varchar (100) NULL ,
	"address" varchar (100) NULL ,
	"city" varchar (100) NULL ,
	"province" varchar (100) NULL ,
	"zip" varchar (100) NULL ,
	"country" varchar (100) NULL ,
	"phone" varchar (100) NULL ,
	"fax" varchar (100) NULL ,
	"version" varchar (100) NULL ,
	CONSTRAINT "PK__cd_regist__cd_re__3197676B" PRIMARY KEY  CLUSTERED 
	(
		"cd_registrationid"
	),
	CONSTRAINT "FK__cd_regist__cdcod__328B8BA4" FOREIGN KEY 
	(
		"cdcodeid"
	) REFERENCES "dbo"."cdcode" (
		"cdcodeid"
	)
)
GO

