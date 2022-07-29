USE P1G9;
GO

CREATE SCHEMA RESERVATION_FLIGHT;
GO

CREATE TABLE RESERVATION_FLIGHT.AIRPORT(
	code			NCHAR(3),
	city			NVARCHAR(30),
	air_state		NVARCHAR(30),
	air_name		NVARCHAR(30),

	CONSTRAINT PK_AIRPORT PRIMARY KEY(code)
);

CREATE TABLE RESERVATION_FLIGHT.CAN_LAND(
	airport_code	NCHAR(3),
	airplane_typeName	NVARCHAR(30),
	
	CONSTRAINT PKS_CAN_LAND PRIMARY KEY(airport_code,airplane_typeName),
	CONSTRAINT FK1_CAN_LAND	FOREIGN KEY (airport_code) REFERENCES RESERVATION_FLIGHT.AIRPORT(code),
	CONSTRAINT FK2_CAN_LAND	FOREIGN KEY (airplane_typeName) REFERENCES RESERVATION_FLIGHT.AIRPLANE_TYPE(typeName)
);

CREATE TABLE RESERVATION_FLIGHT.AIRPLANE_TYPE(
	typeName	NVARCHAR(30),
	company		NVARCHAR(30),
	max_seats	int,

	CONSTRAINT PK_AIRPLANE_TYPE PRIMARY KEY(typeName)
);

CREATE TABLE RESERVATION_FLIGHT.AIRPLANE(
	ID				int,
	total_number_of_seats	int,

	CONSTRAINT PK_AIRPLANE PRIMARY KEY(ID)
);

CREATE TABLE RESERVATION_FLIGHT.FLIGHT(
	number		int,
	airline		NVARCHAR(30),
	weekdays	int,
	airplaneID	int,

	CONSTRAINT PK_FLIGHT PRIMARY KEY(number)
);

CREATE TABLE RESERVATION_FLIGHT.FLIGH_LEG(
	number_flight	int,
	leg_number		int,
	codeDep_time	NCHAR(3),
	codeArr_time	NCHAR(3),
	sche_dep_time	DATETIME,
	sche_arr_time	DATETIME,

	CONSTRAINT PKS_FLIGHT_LEG PRIMARY KEY(number_flight,leg_number),
	CONSTRAINT FK1_FLIGHT_LEG FOREIGN KEY(codeDep_time) REFERENCES RESERVATION_FLIGHT.AIRPORT(code),
	CONSTRAINT FK2_FLIGHT_LEG FOREIGN KEY(codeArr_time) REFERENCES RESERVATION_FLIGHT.AIRPORT(code),
	CONSTRAINT FK3_FLIGHT_LEG FOREIGN KEY(number_flight) REFERENCES RESERVATION_FLIGHT.FLIGHT(number),
	check (sche_dep_time < sche_arr_time)
);

CREATE TABLE RESERVATION_FLIGHT.FARE(
	number_flight	int,
	restrictions	NVARCHAR(1000),
	amount			int		DEFAULT 0,
	code			int,

	CONSTRAINT PK_FARE PRIMARY KEY(number_flight),
	CONSTRAINT FK_FARE FOREIGN KEY(number_flight) REFERENCES RESERVATION_FLIGHT.FLIGHT(number)
);

CREATE TABLE RESERVATION_FLIGHT.LEG_INSTANCE(
	number_flight		int,
	leg_number			int,
	leg_date			date,
	num_available_seats	int		default 0,
	departe_air			NCHAR(3),
	arrive_air			NCHAR(3),
	depart_time			DATETIME,
	arrive_time			DATETIME,
	plane_id			int,

	CONSTRAINT PKS_LEG_INSTANCE PRIMARY KEY(number_flight,leg_number,leg_date),
	CONSTRAINT FK1_2_LEG_INSTANCE FOREIGN KEY(number_flight,leg_number) REFERENCES RESERVATION_FLIGHT.FLIGH_LEG(number_flight,leg_number),
	CONSTRAINT FK3_LEG_INSTANCE FOREIGN KEY(departe_air) REFERENCES RESERVATION_FLIGHT.AIRPORT(code),
	CONSTRAINT FK4_LEG_INSTANCE FOREIGN KEY(arrive_air) REFERENCES RESERVATION_FLIGHT.AIRPORT(code),
	CONSTRAINT FK5_LEG_INSTANCE FOREIGN KEY(plane_id) REFERENCES RESERVATION_FLIGHT.AIRPLANE(ID),
	check(depart_time < arrive_time)
);

CREATE TABLE RESERVATION_FLIGHT.SEAT(
	number_flight	int,
	legNumber		int,
	s_date			date,
	seat_number		int,
	custumers_name	NVARCHAR(100),
	cPhone			int,

	CONSTRAINT PKS_SEAT PRIMARY KEY(number_flight,legNumber,s_date,seat_number),
	CONSTRAINT FKS_SEAT FOREIGN KEY(number_flight,legNumber,s_date) REFERENCES RESERVATION_FLIGHT.LEG_INSTANCE(number_flight,leg_number,leg_date)
);


DROP TABLE RESERVATION_FLIGHT.FLIGH_LEG;