CREATE TABLE Airline_info (
    airline_id INT PRIMARY KEY,
    airline_code VARCHAR(30) NOT NULL,
    airline_name VARCHAR(50) NOT NULL,
    airline_country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    info VARCHAR(50) NOT NULL
);

CREATE TABLE Airport (
    airport_id INT PRIMARY KEY,
    airport_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Baggage_check (
    baggage_check_id INT PRIMARY KEY,
    check_result VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    booking_id INT NOT NULL,
    passenger_id INT NOT NULL
);

CREATE TABLE Baggage (
    baggage_id INT PRIMARY KEY,
    weight_in_kg DECIMAL(4,2) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    booking_id INT NOT NULL
);

CREATE TABLE Boarding_pass (
    boarding_pass_id INT PRIMARY KEY,
    booking_id INT NOT NULL,
    seat VARCHAR(50) NOT NULL,
    boarding_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
CREATE TABLE Booking_flight (
    booking_flight_id INT PRIMARY KEY,
    booking_id INT NOT NULL,
    flight_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
    booking_platform VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL,
    price DECIMAL(7,2) NOT NULL
);
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    sch_departure_time TIMESTAMP NOT NULL,
    sch_arrival_time TIMESTAMP NOT NULL,
    departing_airport_id INT NOT NULL,
    arriving_airport_id INT NOT NULL,
    departing_gate VARCHAR(50) NOT NULL,
    arriving_gate VARCHAR(50) NOT NULL,
    airline_id INT NOT NULL,
    act_departure_time TIMESTAMP NOT NULL,
    act_arrival_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(50) NOT NULL,
    country_of_citizenship VARCHAR(50) NOT NULL,
    country_of_residence VARCHAR(50) NOT NULL,
    passport_number VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Security_check (
    security_check_id INT PRIMARY KEY,
    check_result VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    passenger_id INT NOT NULL
);

ALTER TABLE Airline_info 
RENAME TO Airline;

ALTER TABLE Booking 
RENAME COLUMN price TO ticket_price;

ALTER TABLE Flights
ALTER COLUMN departing_gate TYPE TEXT;

ALTER TABLE Airline DROP COLUMN info;


ALTER TABLE Security_check
ADD CONSTRAINT fk_security_passenger 
FOREIGN KEY (passenger_id) 
REFERENCES Passengers(passenger_id);

ALTER TABLE Booking
ADD CONSTRAINT fk_booking_passenger 
FOREIGN KEY (passenger_id) 
REFERENCES Passengers(passenger_id);

ALTER TABLE Baggage_check
ADD CONSTRAINT fk_baggagecheck_passenger 
FOREIGN KEY (passenger_id) 
REFERENCES Passengers(passenger_id);

ALTER TABLE Baggage_check
ADD CONSTRAINT fk_baggagecheck_booking 
FOREIGN KEY (booking_id) 
REFERENCES Booking(booking_id);

ALTER TABLE Baggage
ADD CONSTRAINT fk_baggage_booking 
FOREIGN KEY (booking_id) 
REFERENCES Booking(booking_id);

ALTER TABLE Boarding_pass
ADD CONSTRAINT fk_boardingpass_booking 
FOREIGN KEY (booking_id) 
REFERENCES Booking(booking_id);

ALTER TABLE Booking_flight
ADD CONSTRAINT fk_bookingflight_booking 
FOREIGN KEY (booking_id) 
REFERENCES Booking(booking_id);

ALTER TABLE Booking_flight
ADD CONSTRAINT fk_bookingflight_flight 
FOREIGN KEY (flight_id) 
REFERENCES Flights(flight_id);

ALTER TABLE Flights
ADD CONSTRAINT fk_flights_departing_airport 
FOREIGN KEY (departing_airport_id) 
REFERENCES Airport(airport_id);

ALTER TABLE Flights
ADD CONSTRAINT fk_flights_arriving_airport 
FOREIGN KEY (arriving_airport_id) 
REFERENCES Airport(airport_id);

ALTER TABLE Flights
ADD CONSTRAINT fk_flights_airline 
FOREIGN KEY (airline_id) 
REFERENCES Airline(airline_id);


INSERT INTO Airport (airport_id, airport_name, country, state, city, created_at, updated_at) 
VALUES
(1,'Airport_1','Kazakhstan','RegionA','CityA','2025-01-01 09:00:00','2025-01-01 09:00:00'),
(2,'Airport_2','Kazakhstan','RegionB','CityB','2025-01-02 09:00:00','2025-01-02 09:00:00'),
(3,'Airport_3','Kazakhstan','RegionC','CityC','2025-01-03 09:00:00','2025-01-03 09:00:00'),
(4,'Airport_4','Kazakhstan','RegionD','CityD','2025-01-04 09:00:00','2025-01-04 09:00:00'),
(5,'Airport_5','Kazakhstan','RegionE','CityE','2025-01-05 09:00:00','2025-01-05 09:00:00'),
(6,'Airport_6','France','RegionA','CityA','2025-01-06 09:00:00','2025-01-06 09:00:00'),
(7,'Airport_7','France','RegionB','CityB','2025-01-07 09:00:00','2025-01-07 09:00:00'),
(8,'Airport_8','France','RegionC','CityC','2025-01-08 09:00:00','2025-01-08 09:00:00'),
(9,'Airport_9','France','RegionD','CityD','2025-01-09 09:00:00','2025-01-09 09:00:00'),
(10,'Airport_10','France','RegionE','CityE','2025-01-10 09:00:00','2025-01-10 09:00:00'),
(11,'Airport_11','USA','California','Los Angeles','2025-01-11 09:00:00','2025-01-11 09:00:00'),
(12,'Airport_12','USA','Texas','Dallas','2025-01-12 09:00:00','2025-01-12 09:00:00'),
(13,'Airport_13','USA','Florida','Miami','2025-01-13 09:00:00','2025-01-13 09:00:00'),
(14,'Airport_14','USA','Illinois','Chicago','2025-01-14 09:00:00','2025-01-14 09:00:00'),
(15,'Airport_15','USA','New York','New York','2025-01-15 09:00:00','2025-01-15 09:00:00'),
(16,'Airport_16','Japan','Tokyo','Tokyo','2025-01-16 09:00:00','2025-01-16 09:00:00'),
(17,'Airport_17','Japan','Osaka','Osaka','2025-01-17 09:00:00','2025-01-17 09:00:00'),
(18,'Airport_18','Japan','Kyoto','Kyoto','2025-01-18 09:00:00','2025-01-18 09:00:00'),
(19,'Airport_19','Japan','Fukuoka','Fukuoka','2025-01-19 09:00:00','2025-01-19 09:00:00'),
(20,'Airport_20','Japan','Sapporo','Sapporo','2025-01-20 09:00:00','2025-01-20 09:00:00'),
(21,'Airport_21','Germany','Bavaria','Munich','2025-01-21 09:00:00','2025-01-21 09:00:00'),
(22,'Airport_22','Germany','Hesse','Frankfurt','2025-01-22 09:00:00','2025-01-22 09:00:00'),
(23,'Airport_23','Germany','Berlin','Berlin','2025-01-23 09:00:00','2025-01-23 09:00:00'),
(24,'Airport_24','Germany','Hamburg','Hamburg','2025-01-24 09:00:00','2025-01-24 09:00:00'),
(25,'Airport_25','Germany','Saxony','Leipzig','2025-01-25 09:00:00','2025-01-25 09:00:00'),
(26,'Airport_26','Russia','Moscow','Moscow','2025-01-26 09:00:00','2025-01-26 09:00:00'),
(27,'Airport_27','Russia','Saint Petersburg','Saint Petersburg','2025-01-27 09:00:00','2025-01-27 09:00:00'),
(28,'Airport_28','Russia','Kazan','Kazan','2025-01-28 09:00:00','2025-01-28 09:00:00'),
(29,'Airport_29','Russia','Sochi','Sochi','2025-01-29 09:00:00','2025-01-29 09:00:00'),
(30,'Airport_30','Russia','Novosibirsk','Novosibirsk','2025-01-30 09:00:00','2025-01-30 09:00:00'),
(31,'Airport_31','Italy','Lazio','Rome','2025-02-01 09:00:00','2025-02-01 09:00:00'),
(32,'Airport_32','Italy','Milan','Milan','2025-02-02 09:00:00','2025-02-02 09:00:00'),
(33,'Airport_33','Italy','Veneto','Venice','2025-02-03 09:00:00','2025-02-03 09:00:00'),
(34,'Airport_34','Italy','Napoli','Naples','2025-02-04 09:00:00','2025-02-04 09:00:00'),
(35,'Airport_35','Italy','Turin','Turin','2025-02-05 09:00:00','2025-02-05 09:00:00'),
(36,'Airport_36','Spain','Catalonia','Barcelona','2025-02-06 09:00:00','2025-02-06 09:00:00'),
(37,'Airport_37','Spain','Madrid','Madrid','2025-02-07 09:00:00','2025-02-07 09:00:00'),
(38,'Airport_38','Spain','Seville','Seville','2025-02-08 09:00:00','2025-02-08 09:00:00'),
(39,'Airport_39','Spain','Valencia','Valencia','2025-02-09 09:00:00','2025-02-09 09:00:00'),
(40,'Airport_40','Spain','Bilbao','Bilbao','2025-02-10 09:00:00','2025-02-10 09:00:00'),
(41,'Airport_41','Canada','Ontario','Toronto','2025-02-11 09:00:00','2025-02-11 09:00:00'),
(42,'Airport_42','Canada','Quebec','Montreal','2025-02-12 09:00:00','2025-02-12 09:00:00'),
(43,'Airport_43','Canada','British Columbia','Vancouver','2025-02-13 09:00:00','2025-02-13 09:00:00'),
(44,'Airport_44','Canada','Alberta','Calgary','2025-02-14 09:00:00','2025-02-14 09:00:00'),
(45,'Airport_45','Canada','Manitoba','Winnipeg','2025-02-15 09:00:00','2025-02-15 09:00:00'),
(46,'Airport_46','Australia','New South Wales','Sydney','2025-02-16 09:00:00','2025-02-16 09:00:00'),
(47,'Airport_47','Australia','Victoria','Melbourne','2025-02-17 09:00:00','2025-02-17 09:00:00'),
(48,'Airport_48','Australia','Queensland','Brisbane','2025-02-18 09:00:00','2025-02-18 09:00:00'),
(49,'Airport_49','Australia','South Australia','Adelaide','2025-02-19 09:00:00','2025-02-19 09:00:00'),
(50,'Airport_50','Australia','Western Australia','Perth','2025-02-20 09:00:00','2025-02-20 09:00:00'),
(51,'Airport_51','USA','RegionA','CityA','2025-02-21 09:00:00','2025-02-21 09:00:00'),
(52,'Airport_52','USA','RegionB','CityB','2025-02-22 09:00:00','2025-02-22 09:00:00'),
(53,'Airport_53','USA','RegionC','CityC','2025-02-23 09:00:00','2025-02-23 09:00:00'),
(54,'Airport_54','USA','RegionD','CityD','2025-02-24 09:00:00','2025-02-24 09:00:00'),
(55,'Airport_55','USA','RegionE','CityE','2025-02-25 09:00:00','2025-02-25 09:00:00'),
(56,'Airport_56','Brazil','RegionA','CityA','2025-02-26 09:00:00','2025-02-26 09:00:00'),
(57,'Airport_57','Brazil','RegionB','CityB','2025-02-27 09:00:00','2025-02-27 09:00:00'),
(58,'Airport_58','Brazil','RegionC','CityC','2025-02-28 09:00:00','2025-02-28 09:00:00'),
(59,'Airport_59','Brazil','RegionD','CityD','2025-03-01 09:00:00','2025-03-01 09:00:00'),
(60,'Airport_60','Brazil','RegionE','CityE','2025-03-02 09:00:00','2025-03-02 09:00:00'),
(61,'Airport_61','Turkey','RegionA','CityA','2025-03-03 09:00:00','2025-03-03 09:00:00'),
(62,'Airport_62','Turkey','RegionB','CityB','2025-03-04 09:00:00','2025-03-04 09:00:00'),
(63,'Airport_63','Turkey','RegionC','CityC','2025-03-05 09:00:00','2025-03-05 09:00:00'),
(64,'Airport_64','Turkey','RegionD','CityD','2025-03-06 09:00:00','2025-03-06 09:00:00'),
(65,'Airport_65','Turkey','RegionE','CityE','2025-03-07 09:00:00','2025-03-07 09:00:00'),
(66,'Airport_66','Qatar','RegionA','CityA','2025-03-08 09:00:00','2025-03-08 09:00:00'),
(67,'Airport_67','Qatar','RegionB','CityB','2025-03-09 09:00:00','2025-03-09 09:00:00'),
(68,'Airport_68','Qatar','RegionC','CityC','2025-03-10 09:00:00','2025-03-10 09:00:00'),
(69,'Airport_69','Qatar','RegionD','CityD','2025-03-11 09:00:00','2025-03-11 09:00:00'),
(70,'Airport_70','Qatar','RegionE','CityE','2025-03-12 09:00:00','2025-03-12 09:00:00'),
(71,'Airport_71','China','RegionA','CityA','2025-03-13 09:00:00','2025-03-13 09:00:00'),
(72,'Airport_72','China','RegionB','CityB','2025-03-14 09:00:00','2025-03-14 09:00:00'),
(73,'Airport_73','China','RegionC','CityC','2025-03-15 09:00:00','2025-03-15 09:00:00'),
(74,'Airport_74','China','RegionD','CityD','2025-03-16 09:00:00','2025-03-16 09:00:00'),
(75,'Airport_75','China','RegionE','CityE','2025-03-17 09:00:00','2025-03-17 09:00:00'),
(76,'Airport_76','India','RegionA','CityA','2025-03-18 09:00:00','2025-03-18 09:00:00'),
(77,'Airport_77','India','RegionB','CityB','2025-03-19 09:00:00','2025-03-19 09:00:00'),
(78,'Airport_78','India','RegionC','CityC','2025-03-20 09:00:00','2025-03-20 09:00:00'),
(79,'Airport_79','India','RegionD','CityD','2025-03-21 09:00:00','2025-03-21 09:00:00'),
(80,'Airport_80','India','RegionE','CityE','2025-03-22 09:00:00','2025-03-22 09:00:00'),
(81,'Airport_81','Thailand','RegionA','CityA','2025-03-23 09:00:00','2025-03-23 09:00:00'),
(82,'Airport_82','Thailand','RegionB','CityB','2025-03-24 09:00:00','2025-03-24 09:00:00'),
(83,'Airport_83','Thailand','RegionC','CityC','2025-03-25 09:00:00','2025-03-25 09:00:00'),
(84,'Airport_84','Thailand','RegionD','CityD','2025-03-26 09:00:00','2025-03-26 09:00:00'),
(85,'Airport_85','Thailand','RegionE','CityE','2025-03-27 09:00:00','2025-03-27 09:00:00'),
(86,'Airport_86','Singapore','RegionA','CityA','2025-03-28 09:00:00','2025-03-28 09:00:00'),
(87,'Airport_87','Singapore','RegionB','CityB','2025-03-29 09:00:00','2025-03-29 09:00:00'),
(88,'Airport_88','Singapore','RegionC','CityC','2025-03-30 09:00:00','2025-03-30 09:00:00'),
(89,'Airport_89','Singapore','RegionD','CityD','2025-03-31 09:00:00','2025-03-31 09:00:00'),
(90,'Airport_90','Singapore','RegionE','CityE','2025-04-01 09:00:00','2025-04-01 09:00:00'),
(91,'Airport_91','UAE','RegionA','CityA','2025-04-02 09:00:00','2025-04-02 09:00:00'),
(92,'Airport_92','UAE','RegionB','CityB','2025-04-03 09:00:00','2025-04-03 09:00:00'),
(93,'Airport_93','UAE','RegionC','CityC','2025-04-04 09:00:00','2025-04-04 09:00:00'),
(94,'Airport_94','UAE','RegionD','CityD','2025-04-05 09:00:00','2025-04-05 09:00:00'),
(95,'Airport_95','UAE','RegionE','CityE','2025-04-06 09:00:00','2025-04-06 09:00:00'),
(96,'Airport_96','Egypt','RegionA','CityA','2025-04-07 09:00:00','2025-04-07 09:00:00'),
(97,'Airport_97','Egypt','RegionB','CityB','2025-04-08 09:00:00','2025-04-08 09:00:00'),
(98,'Airport_98','Egypt','RegionC','CityC','2025-04-09 09:00:00','2025-04-09 09:00:00'),
(99,'Airport_99','Egypt','RegionD','CityD','2025-04-10 09:00:00','2025-04-10 09:00:00'),
(100,'Airport_100','Egypt','RegionE','CityE','2025-04-11 09:00:00','2025-04-11 09:00:00'),
(101,'Airport_101','France','RegionA','CityA','2025-04-12 09:00:00','2025-04-12 09:00:00'),
(102,'Airport_102','France','RegionB','CityB','2025-04-13 09:00:00','2025-04-13 09:00:00'),
(103,'Airport_103','France','RegionC','CityC','2025-04-14 09:00:00','2025-04-14 09:00:00'),
(104,'Airport_104','France','RegionD','CityD','2025-04-15 09:00:00','2025-04-15 09:00:00'),
(105,'Airport_105','France','RegionE','CityE','2025-04-16 09:00:00','2025-04-16 09:00:00'),
(106,'Airport_106','Germany','RegionA','CityA','2025-04-17 09:00:00','2025-04-17 09:00:00'),
(107,'Airport_107','Germany','RegionB','CityB','2025-04-18 09:00:00','2025-04-18 09:00:00'),
(108,'Airport_108','Germany','RegionC','CityC','2025-04-19 09:00:00','2025-04-19 09:00:00'),
(109,'Airport_109','Germany','RegionD','CityD','2025-04-20 09:00:00','2025-04-20 09:00:00'),
(110,'Airport_110','Germany','RegionE','CityE','2025-04-21 09:00:00','2025-04-21 09:00:00'),
(111,'Airport_111','Kazakhstan','RegionA','CityA','2025-04-22 09:00:00','2025-04-22 09:00:00'),
(112,'Airport_112','Kazakhstan','RegionB','CityB','2025-04-23 09:00:00','2025-04-23 09:00:00'),
(113,'Airport_113','Kazakhstan','RegionC','CityC','2025-04-24 09:00:00','2025-04-24 09:00:00'),
(114,'Airport_114','Kazakhstan','RegionD','CityD','2025-04-25 09:00:00','2025-04-25 09:00:00'),
(115,'Airport_115','Kazakhstan','RegionE','CityE','2025-04-26 09:00:00','2025-04-26 09:00:00'),
(116,'Airport_116','Brazil','RegionA','CityA','2025-04-27 09:00:00','2025-04-27 09:00:00'),
(117,'Airport_117','Brazil','RegionB','CityB','2025-04-28 09:00:00','2025-04-28 09:00:00'),
(118,'Airport_118','Brazil','RegionC','CityC','2025-04-29 09:00:00','2025-04-29 09:00:00'),
(119,'Airport_119','Brazil','RegionD','CityD','2025-04-30 09:00:00','2025-04-30 09:00:00'),
(120,'Airport_120','Brazil','RegionE','CityE','2025-05-01 09:00:00','2025-05-01 09:00:00'),
(121,'Airport_121','Italy','RegionA','CityA','2025-05-02 09:00:00','2025-05-02 09:00:00'),
(122,'Airport_122','Italy','RegionB','CityB','2025-05-03 09:00:00','2025-05-03 09:00:00'),
(123,'Airport_123','Italy','RegionC','CityC','2025-05-04 09:00:00','2025-05-04 09:00:00'),
(124,'Airport_124','Italy','RegionD','CityD','2025-05-05 09:00:00','2025-05-05 09:00:00'),
(125,'Airport_125','Italy','RegionE','CityE','2025-05-06 09:00:00','2025-05-06 09:00:00'),
(126,'Airport_126','Spain','RegionA','CityA','2025-05-07 09:00:00','2025-05-07 09:00:00'),
(127,'Airport_127','Spain','RegionB','CityB','2025-05-08 09:00:00','2025-05-08 09:00:00'),
(128,'Airport_128','Spain','RegionC','CityC','2025-05-09 09:00:00','2025-05-09 09:00:00'),
(129,'Airport_129','Spain','RegionD','CityD','2025-05-10 09:00:00','2025-05-10 09:00:00'),
(130,'Airport_130','Spain','RegionE','CityE','2025-05-11 09:00:00','2025-05-11 09:00:00'),
(131,'Airport_131','USA','RegionA','CityA','2025-05-12 09:00:00','2025-05-12 09:00:00'),
(132,'Airport_132','USA','RegionB','CityB','2025-05-13 09:00:00','2025-05-13 09:00:00'),
(133,'Airport_133','USA','RegionC','CityC','2025-05-14 09:00:00','2025-05-14 09:00:00'),
(134,'Airport_134','USA','RegionD','CityD','2025-05-15 09:00:00','2025-05-15 09:00:00'),
(135,'Airport_135','USA','RegionE','CityE','2025-05-16 09:00:00','2025-05-16 09:00:00'),
(136,'Airport_136','India','RegionA','CityA','2025-05-17 09:00:00','2025-05-17 09:00:00'),
(137,'Airport_137','India','RegionB','CityB','2025-05-18 09:00:00','2025-05-18 09:00:00'),
(138,'Airport_138','India','RegionC','CityC','2025-05-19 09:00:00','2025-05-19 09:00:00'),
(139,'Airport_139','India','RegionD','CityD','2025-05-20 09:00:00','2025-05-20 09:00:00'),
(140,'Airport_140','India','RegionE','CityE','2025-05-21 09:00:00','2025-05-21 09:00:00'),
(141,'Airport_141','China','RegionA','CityA','2025-05-22 09:00:00','2025-05-22 09:00:00'),
(142,'Airport_142','China','RegionB','CityB','2025-05-23 09:00:00','2025-05-23 09:00:00'),
(143,'Airport_143','China','RegionC','CityC','2025-05-24 09:00:00','2025-05-24 09:00:00'),
(144,'Airport_144','China','RegionD','CityD','2025-05-25 09:00:00','2025-05-25 09:00:00'),
(145,'Airport_145','China','RegionE','CityE','2025-05-26 09:00:00','2025-05-26 09:00:00'),
(146,'Airport_146','Brazil','RegionA','CityA','2025-05-27 09:00:00','2025-05-27 09:00:00'),
(147,'Airport_147','Brazil','RegionB','CityB','2025-05-28 09:00:00','2025-05-28 09:00:00'),
(148,'Airport_148','Brazil','RegionC','CityC','2025-05-29 09:00:00','2025-05-29 09:00:00'),
(149,'Airport_149','Brazil','RegionD','CityD','2025-05-30 09:00:00','2025-05-30 09:00:00'),
(150,'Airport_150','Brazil','RegionE','CityE','2025-05-31 09:00:00','2025-05-31 09:00:00'),
(151,'Airport_151','Turkey','RegionA','CityA','2025-06-01 09:00:00','2025-06-01 09:00:00'),
(152,'Airport_152','Turkey','RegionB','CityB','2025-06-02 09:00:00','2025-06-02 09:00:00'),
(153,'Airport_153','Turkey','RegionC','CityC','2025-06-03 09:00:00','2025-06-03 09:00:00'),
(154,'Airport_154','Turkey','RegionD','CityD','2025-06-04 09:00:00','2025-06-04 09:00:00'),
(155,'Airport_155','Turkey','RegionE','CityE','2025-06-05 09:00:00','2025-06-05 09:00:00'),
(156,'Airport_156','Qatar','RegionA','CityA','2025-06-06 09:00:00','2025-06-06 09:00:00'),
(157,'Airport_157','Qatar','RegionB','CityB','2025-06-07 09:00:00','2025-06-07 09:00:00'),
(158,'Airport_158','Qatar','RegionC','CityC','2025-06-08 09:00:00','2025-06-08 09:00:00'),
(159,'Airport_159','Qatar','RegionD','CityD','2025-06-09 09:00:00','2025-06-09 09:00:00'),
(160,'Airport_160','Qatar','RegionE','CityE','2025-06-10 09:00:00','2025-06-10 09:00:00'),
(161,'Airport_161','France','RegionA','CityA','2025-06-11 09:00:00','2025-06-11 09:00:00'),
(162,'Airport_162','France','RegionB','CityB','2025-06-12 09:00:00','2025-06-12 09:00:00'),
(163,'Airport_163','France','RegionC','CityC','2025-06-13 09:00:00','2025-06-13 09:00:00'),
(164,'Airport_164','France','RegionD','CityD','2025-06-14 09:00:00','2025-06-14 09:00:00'),
(165,'Airport_165','France','RegionE','CityE','2025-06-15 09:00:00','2025-06-15 09:00:00'),
(166,'Airport_166','Italy','RegionA','CityA','2025-06-16 09:00:00','2025-06-16 09:00:00'),
(167,'Airport_167','Italy','RegionB','CityB','2025-06-17 09:00:00','2025-06-17 09:00:00'),
(168,'Airport_168','Italy','RegionC','CityC','2025-06-18 09:00:00','2025-06-18 09:00:00'),
(169,'Airport_169','Italy','RegionD','CityD','2025-06-19 09:00:00','2025-06-19 09:00:00'),
(170,'Airport_170','Italy','RegionE','CityE','2025-06-20 09:00:00','2025-06-20 09:00:00'),
(171,'Airport_171','Spain','RegionA','CityA','2025-06-21 09:00:00','2025-06-21 09:00:00'),
(172,'Airport_172','Spain','RegionB','CityB','2025-06-22 09:00:00','2025-06-22 09:00:00'),
(173,'Airport_173','Spain','RegionC','CityC','2025-06-23 09:00:00','2025-06-23 09:00:00'),
(174,'Airport_174','Spain','RegionD','CityD','2025-06-24 09:00:00','2025-06-24 09:00:00'),
(175,'Airport_175','Spain','RegionE','CityE','2025-06-25 09:00:00','2025-06-25 09:00:00'),
(176,'Airport_176','UAE','RegionA','CityA','2025-06-26 09:00:00','2025-06-26 09:00:00'),
(177,'Airport_177','UAE','RegionB','CityB','2025-06-27 09:00:00','2025-06-27 09:00:00'),
(178,'Airport_178','UAE','RegionC','CityC','2025-06-28 09:00:00','2025-06-28 09:00:00'),
(179,'Airport_179','UAE','RegionD','CityD','2025-06-29 09:00:00','2025-06-29 09:00:00'),
(180,'Airport_180','UAE','RegionE','CityE','2025-06-30 09:00:00','2025-06-30 09:00:00'),
(181,'Airport_181','Singapore','RegionA','CityA','2025-07-01 09:00:00','2025-07-01 09:00:00'),
(182,'Airport_182','Singapore','RegionB','CityB','2025-07-02 09:00:00','2025-07-02 09:00:00'),
(183,'Airport_183','Singapore','RegionC','CityC','2025-07-03 09:00:00','2025-07-03 09:00:00'),
(184,'Airport_184','Singapore','RegionD','CityD','2025-07-04 09:00:00','2025-07-04 09:00:00'),
(185,'Airport_185','Singapore','RegionE','CityE','2025-07-05 09:00:00','2025-07-05 09:00:00'),
(186,'Airport_186','Brazil','RegionA','CityA','2025-07-06 09:00:00','2025-07-06 09:00:00'),
(187,'Airport_187','Brazil','RegionB','CityB','2025-07-07 09:00:00','2025-07-07 09:00:00'),
(188,'Airport_188','Brazil','RegionC','CityC','2025-07-08 09:00:00','2025-07-08 09:00:00'),
(189,'Airport_189','Brazil','RegionD','CityD','2025-07-09 09:00:00','2025-07-09 09:00:00'),
(190,'Airport_190','Brazil','RegionE','CityE','2025-07-10 09:00:00','2025-07-10 09:00:00'),
(191,'Airport_191','Kazakhstan','RegionA','CityA','2025-07-11 09:00:00','2025-07-11 09:00:00'),
(192,'Airport_192','Kazakhstan','RegionB','CityB','2025-07-12 09:00:00','2025-07-12 09:00:00'),
(193,'Airport_193','Kazakhstan','RegionC','CityC','2025-07-13 09:00:00','2025-07-13 09:00:00'),
(194,'Airport_194','Kazakhstan','RegionD','CityD','2025-07-14 09:00:00','2025-07-14 09:00:00'),
(195,'Airport_195','Kazakhstan','RegionE','CityE','2025-07-15 09:00:00','2025-07-15 09:00:00'),
(196,'Airport_196','Brazil','RegionA','CityA','2025-07-16 09:00:00','2025-07-16 09:00:00'),
(197,'Airport_197','Brazil','RegionB','CityB','2025-07-17 09:00:00','2025-07-17 09:00:00'),
(198,'Airport_198','Brazil','RegionC','CityC','2025-07-18 09:00:00','2025-07-18 09:00:00'),
(199,'Airport_199','Brazil','RegionD','CityD','2025-07-19 09:00:00','2025-07-19 09:00:00'),
(200,'Airport_200','Brazil','RegionE','CityE','2025-07-20 09:00:00','2025-07-20 09:00:00');


INSERT INTO airline
(airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES (201, 'KZ', 'KazAir', 'Kazakhstan', NOW(), NOW());

SELECT * FROM airline 
WHERE airline_name = 'KazAir';

UPDATE airline
SET airline_country = 'Turkey'
WHERE airline_name = 'KazAir';

INSERT INTO airline
(airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES
(202, 'AE', 'AirEasy', 'France', NOW(), NOW()),
(203, 'FH', 'FlyHigh', 'Brazil', NOW(), NOW()),
(204, 'FF', 'FlyFly', 'Poland', NOW(), NOW());

SELECT airline_name, airline_country FROM airline WHERE airline_id >= 202;

SELECT flight_id, sch_arrival_time
FROM Flights
WHERE EXTRACT(YEAR FROM sch_arrival_time) = 2024;

DELETE FROM Flights
WHERE EXTRACT(YEAR FROM sch_arrival_time) = 2024;

SELECT booking_id, ticket_price FROM Booking LIMIT 10;

UPDATE Booking
SET ticket_price = ticket_price * 1.15;

DELETE FROM Booking
WHERE ticket_price < 10000;





