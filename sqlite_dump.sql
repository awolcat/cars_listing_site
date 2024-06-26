--PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);

CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);


CREATE TABLE IF NOT EXISTS "listing_site_contact" ("id" integer NOT NULL PRIMARY KEY, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar(100) NOT NULL, "email" varchar(254) NOT NULL, "phone" varchar(128) NOT NULL);
CREATE TABLE IF NOT EXISTS "listing_site_message" ("id" integer NOT NULL PRIMARY KEY, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "message" text NOT NULL, "contact_id" bigint NOT NULL REFERENCES "listing_site_contact" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "listing_site_image" ("id" integer NOT NULL PRIMARY KEY, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "image" varchar(100) NOT NULL, "car_id" bigint NOT NULL REFERENCES "listing_site_car" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO listing_site_image VALUES(1,'2024-05-06 16:03:43.130771','2024-05-06 16:03:43.130811','images/cars/Toyota_Wish_first_generation_rear_Kajang.jpg',1);
INSERT INTO listing_site_image VALUES(2,'2024-05-06 16:03:43.138775','2024-05-06 16:03:43.138820','images/cars/Toyota_Wish_first_generation_front_Kajang.jpg',1);
INSERT INTO listing_site_image VALUES(3,'2024-05-09 11:07:22.300099','2024-05-09 11:07:22.300151','images/cars/toyota-hilux-invincible-50-chrome-edition-2018-480665.jpg',2);
INSERT INTO listing_site_image VALUES(4,'2024-05-09 11:07:22.310530','2024-05-09 11:07:22.310581','images/cars/toyota-hilux-invincible-50-chrome-edition-2018-480666.jpg',2);
INSERT INTO listing_site_image VALUES(5,'2024-05-09 11:07:22.312751','2024-05-09 11:07:22.312827','images/cars/toyota-hilux-invincible-50-chrome-edition-2018-480667.jpg',2);
INSERT INTO listing_site_image VALUES(6,'2024-05-09 11:07:22.314370','2024-05-09 11:07:22.314409','images/cars/toyota-hilux-invincible-50-chrome-edition-2018-480668.jpg',2);
CREATE TABLE IF NOT EXISTS "listing_site_car" ("id" integer NOT NULL PRIMARY KEY, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "make" varchar(100) NOT NULL, "model" varchar(100) NOT NULL, "year" varchar(4) NOT NULL, "price_currency" varchar(3) NOT NULL, "price" decimal NOT NULL, "description" text NOT NULL, "body_type" varchar(100) NOT NULL, "location" varchar(100) NOT NULL, "sold" bool NOT NULL, "fuel_type" varchar(100) NOT NULL);
INSERT INTO listing_site_car VALUES(1,'2024-05-06 13:31:54.437206','2024-05-06 16:03:43.125516','Toyota','Wish','2013','KES',1300000,'Perfect condition','Wagon','Nairobi, Ngong',0,'Petrol');
INSERT INTO listing_site_car VALUES(2,'2024-05-09 11:07:22.283521','2024-06-22 10:34:31.246957','Toyota','Hilux','2018','KES',2299999.9399999999441,'Full options package','SUV','Utawala',1,'Diesel');
INSERT INTO listing_site_car VALUES(3,'2024-06-20 18:36:31','2024-06-20 18:36:31','Toyota','Corolla','2023','KES',1500000,'Clean Toyota Corolla in excellent condition.','Sedan','Nairobi',0,'Petrol');
INSERT INTO listing_site_car VALUES(4,'2024-06-20 18:36:31','2024-06-20 18:36:31','Honda','Civic','2022','KES',1200000,'Slightly used Honda Civic, well maintained.','Hatchback',' Mombasa',0,'Petrol');
INSERT INTO listing_site_car VALUES(5,'2024-06-20 18:36:31','2024-06-20 18:36:31','Nissan','X-Trail','2021','KES',2000000,'Spacious Nissan X-Trail, perfect for family outings.','SUV','Kisumu',0,'Petrol');
INSERT INTO listing_site_car VALUES(6,'2024-06-20 18:36:31','2024-06-20 18:36:31','Ford','Escape','2020','KES',1800000,'Reliable Ford Escape with low mileage.','SUV','Eldoret',0,'Petrol');
INSERT INTO listing_site_car VALUES(7,'2024-06-20 18:36:31','2024-06-20 18:36:31','Mitsubishi','Outlander','2024','KES',2200000,'Brand new Mitsubishi Outlander, full warranty.','SUV','Nakuru',0,'Petrol');
INSERT INTO listing_site_car VALUES(8,'2024-06-20 18:36:31','2024-06-20 18:36:31','Subaru','Forester','2023','KES',1900000,'Safe and comfortable Subaru Forester for all terrains.','SUV','Nyeri',0,'Petrol');
INSERT INTO listing_site_car VALUES(9,'2024-06-20 18:36:31','2024-06-20 18:36:31','Kia','Sportage','2022','KES',1600000,'Stylish Kia Sportage with all the features.','SUV','Kakamega',0,'Petrol');
INSERT INTO listing_site_car VALUES(10,'2024-06-20 18:36:31','2024-06-20 18:36:31','Hyundai','Tucson','2021','KES',1700000,'Fuel-efficient Hyundai Tucson, perfect for city driving.','SUV','Kisii',0,'Petrol');
INSERT INTO listing_site_car VALUES(11,'2024-06-20 18:36:40','2024-06-20 18:36:40','Mazda','CX-5','2020','KES',1400000,'Sporty Mazda CX-5 with excellent handling.','SUV','Meru',0,'Petrol');
INSERT INTO listing_site_car VALUES(12,'2024-06-20 18:42:07','2024-06-20 18:42:07','Chevrolet','Spark','2019','KES',1000000,'Compact Chevrolet Spark, ideal for city commuting.','Hatchback','Nairobi',0,'Petrol');
INSERT INTO listing_site_car VALUES(13,'2024-06-20 18:42:07','2024-06-20 18:42:07','Volkswagen','Golf','2022','KES',1400000,'Well-maintained Volkswagen Golf with modern features.','Hatchback','Mombasa',0,'Petrol');
INSERT INTO listing_site_car VALUES(14,'2024-06-20 18:42:07','2024-06-20 18:42:07','BMW','X3','2021','KES',3500000,'Luxurious BMW X3 with advanced safety features.','SUV','Kisumu',0,'Petrol');
INSERT INTO listing_site_car VALUES(15,'2024-06-20 18:42:07','2024-06-20 18:42:07','Audi','Q5','2020','KES',3200000,'Audi Q5 with excellent performance and style.','SUV','Eldoret',0,'Petrol');
INSERT INTO listing_site_car VALUES(16,'2024-06-20 18:42:07','2024-06-20 18:42:07','Mercedes-Benz','C-Class','2019','KES',2800000,'Elegant Mercedes-Benz C-Class, very low mileage.','Sedan','Nakuru',0,'Petrol');
INSERT INTO listing_site_car VALUES(17,'2024-06-20 18:42:07','2024-06-20 18:42:07','Peugeot','3008','2024','KES',2100000,'New Peugeot 3008, top of the range.','SUV','Nyeri',0,'Petrol');
INSERT INTO listing_site_car VALUES(18,'2024-06-20 18:42:07','2024-06-20 18:42:07','Jeep','Grand Cherokee','2023','KES',4000000,'Powerful Jeep Grand Cherokee, ready for adventure.','SUV','Kakamega',0,'Petrol');
INSERT INTO listing_site_car VALUES(19,'2024-06-20 18:42:07','2024-06-20 18:42:07','Land Rover','Discovery','2022','KES',5000000,'Land Rover Discovery, perfect for off-road expeditions.','SUV','Kisii',0,'Diesel');
INSERT INTO listing_site_car VALUES(20,'2024-06-20 18:42:07','2024-06-20 18:42:07','Renault','Duster','2021','KES',1500000,'Reliable Renault Duster, great for family trips.','SUV','Meru',0,'Petrol');
INSERT INTO listing_site_car VALUES(21,'2024-06-20 18:42:07','2024-06-20 18:42:07','Volvo','XC60','2020','KES',3700000,'Safe and stylish Volvo XC60.','SUV','Nairobi',0,'Petrol');
INSERT INTO listing_site_car VALUES(22,'2024-06-20 18:42:07','2024-06-20 18:42:07','Lexus','RX 350','2019','KES',4500000,'Luxurious Lexus RX 350 with low mileage.','SUV','Mombasa',0,'Petrol');
INSERT INTO listing_site_car VALUES(23,'2024-06-20 18:42:07','2024-06-20 18:42:07','Skoda','Kodiaq','2022','KES',2500000,'Spacious Skoda Kodiaq, perfect for family.','SUV','Kisumu',0,'Diesel');
INSERT INTO listing_site_car VALUES(24,'2024-06-20 18:42:08','2024-06-20 18:42:08','Tesla','Model 3','2023','KES',6000000,'Brand new Tesla Model 3, environmentally friendly.','Sedan','Eldoret',0,'Electric');
INSERT INTO listing_site_car VALUES(25,'2024-06-20 18:42:08','2024-06-20 18:42:08','Jaguar','F-Pace','2021','KES',5000000,'Elegant Jaguar F-Pace with advanced features.','SUV','Nakuru',0,'Petrol');
INSERT INTO listing_site_car VALUES(26,'2024-06-20 18:42:08','2024-06-20 18:42:08','Porsche','Cayenne','2020','KES',6500000,'High-performance Porsche Cayenne.','SUV','Nyeri',0,'Petrol');
INSERT INTO listing_site_car VALUES(27,'2024-06-20 18:42:08','2024-06-20 18:42:08','Fiat','500','2019','KES',800000,'Compact and stylish Fiat 500.','Hatchback','Kakamega',0,'Petrol');
INSERT INTO listing_site_car VALUES(28,'2024-06-20 18:42:08','2024-06-20 18:42:08','Alfa Romeo','Giulia','2022','KES',3800000,'Sporty Alfa Romeo Giulia with modern features.','Sedan','Kisii',0,'Petrol');
INSERT INTO listing_site_car VALUES(29,'2024-06-20 18:42:08','2024-06-20 18:42:08','Toyota','Land Cruiser','2021','KES',6000000,'Robust Toyota Land Cruiser, great for all terrains.','SUV','Meru',0,'Diesel');
INSERT INTO listing_site_car VALUES(30,'2024-06-20 18:42:08','2024-06-20 18:42:08','Suzuki','Vitara','2020','KES',1800000,'Affordable Suzuki Vitara with good fuel efficiency.','SUV','Nairobi',0,'Petrol');
INSERT INTO listing_site_car VALUES(31,'2024-06-20 18:42:08','2024-06-20 18:42:08','Mazda','6','2019','KES',1600000,'Sleek Mazda 6 with excellent handling.','Sedan','Mombasa',0,'Petrol');
INSERT INTO listing_site_car VALUES(32,'2024-06-20 18:42:08','2024-06-20 18:42:08','Nissan','Qashqai','2024','KES',2100000,'New Nissan Qashqai, loaded with features.','SUV','Kisumu',0,'Petrol');
INSERT INTO listing_site_car VALUES(33,'2024-06-20 18:42:08','2024-06-20 18:42:08','Ford','Ranger','2023','KES',3500000,'Tough Ford Ranger, perfect for work and leisure.','Pickup','Eldoret',0,'Diesel');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',22);
INSERT INTO sqlite_sequence VALUES('django_admin_log',6);
INSERT INTO sqlite_sequence VALUES('django_content_type',10);
INSERT INTO sqlite_sequence VALUES('auth_permission',44);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('auth_user',1);
INSERT INTO sqlite_sequence VALUES('listing_site_image',6);
INSERT INTO sqlite_sequence VALUES('listing_site_car',33);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "listing_site_message_contact_id_3999d9a6" ON "listing_site_message" ("contact_id");
CREATE INDEX "listing_site_images_car_id_4d740e65" ON "listing_site_image" ("car_id");
COMMIT;
