DROP DATABASE booking;
CREATE DATABASE booking;
USE booking;


DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (
	ID SERIAL PRIMARY KEY,
	firstname VARCHAR(255),
	lastname VARCHAR(255),
	birthday DATE,
	telephone INT(10),
	nick_name VARCHAR(255),
	EMAIL VARCHAR(255), 
	adress VARCHAR(255)
);

ALTER TABLE USERS
ADD index (nick_name);

INSERT INTO `USERS` VALUES ('1','Brianne','Walker','1997-08-11','337786','sapiente','kjacobs@example.net','Nevada'),
('2','Josue','Moen','2012-04-17','0','labore','hettie.kemmer@example.net','Arizona'),
('3','Emil','Reinger','2015-08-20','1','dolor','nina.heathcote@example.com','Minnesota'),
('4','Theodore','Roberts','2008-10-03','539','vitae','hector.padberg@example.org','Arkansas'),
('5','Thelma','Stiedemann','2005-10-24','954','aut','maynard.orn@example.net','District of Columbia'),
('6','Pinkie','Smitham','1992-10-02','119423','voluptatem','torey.o\'keefe@example.org','Virginia'),
('7','Rosamond','Daniel','2012-08-08','1','qui','kovacek.pink@example.org','Ohio'),
('8','Yasmine','Ward','2012-05-07','564','earum','avery.emmerich@example.com','Hawaii'),
('9','Lavina','Beier','2005-02-12','0','autem','charlie.lindgren@example.com','Wisconsin'),
('10','Desiree','Ondricka','2007-05-03','0','cum','lamont82@example.org','Florida'); 

DROP TABLE IF EXISTS aprt;
CREATE TABLE aprt(
	ID SERIAL PRIMARY KEY,
	adress VARCHAR(255) NOT NULL,
	possible_date date NOT NULL,
	name VARCHAR(255) UNIQUE NOT NULL,
	price_per_night INT(100) NOT NULL,
	index(name),
	index(adress)
	);

INSERT INTO `aprt` VALUES ('1','Nicaragua','2018-11-10','voluptatem','7902'),
('2','Singapore','2020-12-23','neque','0'),
('3','Austria','2019-06-10','qui','0'),
('4','Nepal','2001-12-01','incidunt','40667'),
('5','Bahamas','2021-01-29','enim','45932'),
('6','Azerbaijan','2021-05-25','consequatur','41443091'),
('7','Nauru','2022-09-27','quod','75738'),
('8','China','1999-04-02','voluptas','4723075'),
('9','Guinea','2007-12-27','molestiae','253'),
('10','Saint Helena','2008-02-12','rerum','0'); 

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	ID SERIAL PRIMARY KEY,
	account INT(250),
	history_booking INT(12),
	user_level INT(12),
	future_trip INT(12),
	FOREIGN KEY (ID) REFERENCES  USERS(ID)
	);

INSERT INTO `profiles` VALUES 
('1','20000','5','2','4'),
('2','50000','5','3','4'),
('3','10000','5','2','4'),
('4','90000','5','5','8'),
('5','250000','5','1','6'),
('6','80000','5','4','7'),
('7','60000','5','2','6'),
('8','70000','5','2','5'),
('9','150000','5','2','0'),
('10','20000','5','0','8'); 
	
DROP TABLE IF EXISTS preferences;
CREATE TABLE preferences (
	ID SERIAL PRIMARY KEY,
	smoke tinyint(1) default NULL,
	stars int(5),
	CONSTRAINT `which_users_pref` FOREIGN KEY (`ID`) REFERENCES `USERS` (`ID`),
	CONSTRAINT `which_aprt` FOREIGN KEY (`ID`) REFERENCES `aprt` (`ID`)
	);


INSERT INTO `preferences` VALUES
('1','1','3'),
('2','0','5'),
('3','1','5'),
('4','0','3'),
('5','1','4'),
('6','0','1'),
('7','1','2'),
('8','0','5'),
('9','1','4'),
('10','0','3'); 
	
	

DROP TABLE IF EXISTS kind_apartments;
CREATE TABLE kind_apartments(
	ID SERIAL PRIMARY KEY,
	hotels tinyint(1) default NULL,
	guest_home tinyint(1) default NULL,
	apartments tinyint(1) default NULL,
	villas tinyint(1) default NULL,
	CONSTRAINT `which_kind_aprt` FOREIGN KEY (`ID`) REFERENCES `aprt` (`ID`)
	);

INSERT INTO `kind_apartments` VALUES ('1','3','2','9','5'),
('2','2','3','5','9'),
('3','9','0','5','3'),
('4','2','4','4','2'),
('5','1','6','7','9'),
('6','6','9','6','5'),
('7','6','1','6','9'),
('8','9','2','9','1'),
('9','9','3','5','0'),
('10','9','9','5','0'); 

--


	
DROP TABLE IF EXISTS details_apartments;
CREATE TABLE details_apartments(
	ID SERIAL PRIMARY KEY,
	bedrooms_number INT(100) NOT NULL,
	bathrooms_number INT(100) NOT NULL,
	swimmingpoolls INT(100) NOT NULL,
	sauna CHAR(1),
	breakfast CHAR(1),
	smoke CHAR(1),
	stars int(1),
	FOREIGN KEY (ID) REFERENCES  kind_apartments(ID),
	FOREIGN KEY (`ID`) REFERENCES `aprt` (`ID`)
	);

INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('1', '5', '2', '0', '0', '1', '1', '4');
INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('2', '2', '2', '1', '1', '1', '0', '5');
INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('3', '2', '1', '0','0', '1', '1', '4');
INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('4', '5', '1','1', '1', '1', '0', '3');
INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('5', '2', '2', '0', '0', '1', '1', '4');
INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('6', '5', '1', '1', '1', '1', '0', '3');
INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('7', '1', '1', '0', '0', '0', '1', '5');
INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('8', '5', '1', '1','1', '0', '0', '3');
INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('9', '1', '1', '0', '1', '0', '0', '4');
INSERT INTO `details_apartments` (`ID`, `bedrooms_number`, `bathrooms_number`, `swimmingpoolls`, `sauna`, `breakfast`, `smoke`, `stars`) VALUES ('10', '1', '1', '1', '0', '0', '1', '3');


DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings(
	ID SERIAL PRIMARY KEY,
	user_name VARCHAR(255),
	aprt_id bigint(20) unsigned NOT NULL,
	date_book date,
	pay_info CHAR(1) NOT NULL,
	FOREIGN KEY (`ID`) REFERENCES `USERS` (`ID`),
	FOREIGN KEY (`ID`) REFERENCES `aprt` (`ID`)
	);



INSERT INTO `bookings` (`ID`, `user_name`, `aprt_id`, `date_book`, `pay_info`) VALUES 
('1','labore','7','2023-04-22','1'),
('2','sapiente','5','2020-08-08','1'),
('3','labore','5','2020-05-12','1'),
('4','labore','3','2021-02-06','1'),
('5','sapiente','4','2020-03-05','1'),
('6','labore','1','2020-10-25','0'),
('7','sapiente','8','2021-05-26','1'),
('8','labore','6','2020-02-08','1'),
('9','sapiente','2','2020-01-18','0'),
('10','labore','7','2022-06-28','0');


DROP TABLE IF EXISTS revievs;
CREATE TABLE revievs(
    ID SERIAL PRIMARY KEY,
	reviev_text VARCHAR(255),
	apartment_scale INT(1),
	recomends INT(1),
	CONSTRAINT `which_users` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`),
	CONSTRAINT `which_aprt_about` FOREIGN KEY (`ID`) REFERENCES `aprt` (`ID`)
	);

INSERT INTO `revievs` VALUES ('1','Ut voluptatem ut repudiandae quo consequuntur.','4','2'),
('2','Tempora commodi porro rem ullam deserunt qui blanditiis.','9','5'),
('3','Cumque architecto aliquid aperiam ea dignissimos.','9','5'),
('4','Ex molestias nulla eos.','6','2'),
('5','Omnis quasi sint consequatur et.','4','9'),
('6','Quo aut et et iusto quidem modi.','8','6'),
('7','Eos numquam vel optio qui non ex voluptas.','1','6'),
('8','Iusto nemo dolorem dolore pariatur libero voluptatibus et.','3','4'),
('9','Aut eligendi non rerum qui animi.','9','9'),
('10','Ut at sed quas velit rerum voluptate.','6','4'); 




DROP TABLE IF EXISTS services;
CREATE TABLE services(
	aprt_id_services SERIAL PRIMARY KEY,
	cleaning tinyint(1) default NULL,
	restoraunts tinyint(1) default NULL,
	transfer tinyint(1) default NULL,
	fitness tinyint(1) default NULL,
	city_tours tinyint(1) default NULL,
	CONSTRAINT `which_aprt_services` FOREIGN KEY (`aprt_id_services`) REFERENCES `aprt`(`ID`)
	);

INSERT INTO `services` VALUES ('1','1','1','1','1','0'),
('2','1','0','0','1','0'),
('3','0','1','1','0','0'),
('4','1','0','1','1','0'),
('5','0','1','1','0','0'),
('6','1','0','0','1','0'),
('7','0','0','1','0','0'),
('8','1','1','0','1','0'),
('9','0','1','0','0','0'),
('10','0','1','0','0','0');

DROP TABLE IF EXISTS treasures;
CREATE TABLE treasures(
	ID SERIAL PRIMARY KEY,
	name_treasures VARCHAR(255),
	text_about_treasures VARCHAR(2550),
	`created_at` datetime DEFAULT current_timestamp(),
	country VARCHAR(255),
	city VARCHAR(255),
	CONSTRAINT `which_aprt_adress` FOREIGN KEY (ID) REFERENCES `aprt`(ID),
	CONSTRAINT `which_user_recomend` FOREIGN KEY (ID) REFERENCES USERS(ID)
	);

INSERT INTO `treasures` VALUES ('1','debitis','Magni deserunt facilis non iste quas. Rerum dolorum vitae velit. Autem provident quisquam quis laudantium suscipit ea voluptatem.','1997-06-17 07:19:10','Nicaragua','Binsview'),
('2','sunt','Tempore asperiores molestiae earum et corporis ut et. Incidunt distinctio doloribus atque iusto voluptatibus et. Repellendus explicabo sit odio ut fugit.','1972-08-19 03:47:59','Singapore','Pacochaside'),
('3','asperiores','Quo mollitia vero sit voluptates molestias consequatur et et. Quo odit illo et qui voluptates.','1988-06-13 19:51:58','Austria','Runolfssonhaven'),
('4','ut','Laboriosam pariatur iure reprehenderit est facere explicabo. Sit iste repudiandae eligendi eos. Ipsam fugit illum nam et.','2007-05-25 12:48:35','Nepal','Alverastad'),
('5','officiis','Ab molestias qui est eos. Quia non dolorem eaque fugit. Iusto aperiam illum soluta.','2013-02-13 20:45:57','Bahamas','Jonesside'),
('6','labore','Explicabo illo nemo similique blanditiis nam. Aperiam fugiat et et corrupti. Eaque non sint nulla repellat non modi fuga. Molestias tempore rerum animi voluptatem quibusdam.','2009-04-04 13:14:40','Azerbaijan','Imeldachester'),
('7','ipsam','Qui laudantium a velit delectus dolorum. Fuga ex vel autem est. Aspernatur sit quis nostrum et nihil corrupti. Qui sed totam maxime quisquam tempora nulla distinctio.','1991-06-22 19:19:58','Nauru','Hassanport'),
('8','temporibus','Tempora autem dolores reprehenderit omnis fuga fuga. Odit animi ea unde. Impedit qui ipsa atque veritatis dolores error.','2017-01-28 16:59:16','China','Justiceville'),
('9','temporibus','Quibusdam ipsa odio quaerat ut qui. Aspernatur modi voluptatibus nam dolore. Et minus consequatur et voluptatem dolor.','1995-05-04 10:47:50','Guinea','North Kelton'),
('10','quaerat','Dolores aut sed illum qui facilis aut. Sit voluptatibus qui facere maxime libero laudantium neque. Ad enim sit porro animi omnis animi et.','2002-12-26 10:36:08','Saint Helena','Margaretestad'); 


	
-- Выборка по самому популярному отелю

SELECT ID, name from aprt 
WHERE aprt.ID = (SELECT aprt_id FROM bookings GROUP BY aprt_id LIMIT 1)

-- Выборка отелей по стране

SELECT ID, name, adress from aprt 
WHERE adress = 'CHINA'

-- Выборка отелей в которых можно курить

SELECT name from aprt
WHERE  ID in (SELECT ID from details_apartments WHERE smoke = 1)

-- выборка отелей в которых ночь стоит меньше 10000

SELECT name from aprt WHERE  price_per_night < 10000 

-- выборка из разных таблиц данных по имени фамилии и остатку на счете, отсортированных по столбцу account  в порядке убывания  

SELECT firstname, lastname, account  FROM USERS
JOIN profiles 
WHERE USERS.ID = profiles.ID ORDER BY account DESC

-- предложение путеводителя по достопримечательностям по странам где забронированы отели 

SELECT name_treasures, text_about_treasures, country FROM treasures
JOIN aprt 
WHERE treasures.country in (SELECT adress FROM aprt WHERE ID in (SELECT aprt_id FROM bookings 
JOIN USERS 
WHERE bookings.pay_info = 1  and bookings.ID = USERS.ID)) and treasures.ID = aprt.ID 
 
-- транзакция бронирования


START TRANSACTION; 
SELECT account from profiles WHERE ID = '2';
UPDATE profiles SET account = account - '1000' WHERE ID = '3';
UPDATE profiles SET account = account + '1000' WHERE user_level = '0';
COMMIT;

-- процедура с предложением путеводителя по странам в которых есть бронирования


DROP procedure if exists treasure_offers
delimiter //
CREATE procedure treasure_offers(IN for_user_id BIGINT)
begin
	
SELECT name_treasures, text_about_treasures, country FROM treasures
JOIN aprt 
WHERE treasures.country in (SELECT adress FROM aprt WHERE ID in (SELECT aprt_id FROM bookings 
JOIN USERS 
WHERE bookings.pay_info = 1  and bookings.ID = USERS.ID)) and treasures.ID = aprt.ID;
	
end//
delimiter ;

CALL treasure_offers(1);
	
	

	