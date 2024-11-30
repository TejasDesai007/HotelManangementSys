create schema hms;


Create table userdetails(
    userid int primary key not null auto_increment,
    UserName varchar(256) unique,
    fName varchar(256),
    lName varchar(256),
    Email varchar(256),
    Password varchar(256),
    UserType varchar(256),
    CreatedOn timestamp,
    UpdatedOn timestamp,
    EmployeeNo varchar(256) unique,
    Phone varchar(256)
);
Select * from userdetails;

CREATE TABLE rooms(
    roomid int primary key not null auto_increment,
    room_no int,
    status varchar(256),
    room_type varchar(256),
    type_id int,
    price_per_day decimal(10,3) constraint chk_price check(price_per_day > 0),
    room_dscrpt varchar(256),
    created_on timestamp,
    updated_on timestamp,
    created_by int,
    updated_by int,
    foreign key(created_by) references userdetails(userid),
    foreign key(updated_by) references userdetails(userid),
    foreign key(type_id) references roomsTypesDetails(type_id)
);
select * From rooms;




CREATE TABLE guests(
    guestid int primary key not null auto_increment,
    lname varchar(256),
    fname varchar(256),
    address1 varchar(256),
    address2 varchar(256),
    city varchar(256),
    state varchar(256),
    country varchar(256),
    pincode int,
    UID_type varchar(256),
    UID_NO varchar(256),
    phone varchar(256),
    created_on timestamp,
    update_on timestamp,
    created_by int,
    updated_by int,
    foreign key(created_by) references userdetails(userid),
    foreign key(updated_by) references userdetails(userid)
);
Select * From guests;

CREATE TABLE Bookings(
    bookingid int primary key not null auto_increment,
    guestid int,
    roomid int,
    foreign key (guestid) references guests(guestid),
    foreign key (roomid) references rooms(roomid),
    total_bill decimal(10,2) constraint chk_total_bill check(total_bill > 0),
    room_price decimal(10,2) constraint chk_room_price check(room_price > 0),
    taxes decimal(10,2) constraint chk_taxes check(taxes > 0),
    beverages decimal(10,2) constraint chk_beverages check(beverages > 0),
    check_in date,
    check_out date,
    booked_days int,
    booked_by int,
    foreign key (booked_by) references userdetails(userid)
);
select * from Bookings;


Create table roomsTypesDetails(
   type_id int primary key not null auto_increment,
   type varchar(256),
   type_price decimal(10,2) constraint chk_type_price check(type_price > 0),
   created_on timestamp,
   updated_on timestamp,
   created_by int,
   updated_by int,
   foreign key (created_by) references userdetails(userid),
   foreign key (updated_by) references userdetails(userid)
);


select type, type_price, created_by,fname from roomstypesdetails rtp 
join (
Select userid,fname from userdetails
)ud on ud.userid = rtp.created_by;

Select * from roomstypesdetails;



