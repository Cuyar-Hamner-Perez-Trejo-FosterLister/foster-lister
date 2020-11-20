USE fosterlister_db;

INSERT INTO users(email, first_name, last_name, password, address, number_pets, phone, is_admin, image_url)
VALUES ('jim.eagle23@example.com', 'Jim', 'Eagle', '$2a$12$/3bvW/pqZV.xn0saGpJMxuwEpEYliSDgHbcq83zGLVpaxTmV2sQou', '456 Simple Street San Antonio, TX 78444', 3, '444-5555', 1, ''),
       ('reya.loxos@example.com', 'Reya', 'Loxos', '$2a$12$kmv.lliCNfppI6oCgsUefeLvq7JUeyTD2Ycyj1ISMiZoA/jdiwrF.', '227 Why You Asking St San Antonio, TX 76555', 1, '111-0123', 0, ''),
       ('amos.veno99@example.com', 'Amos', 'Veno', '$2a$12$OyC8RAGpWH7kT1Vc9KNWRewYF0Tsz96zezROVaS0Ka75KyKlwoTTq', '4567 Counting Ave San Antonio TX 78432', 2, '856-0082', 0, ''),
       ('kelly.kapoor43@example.com', 'Kelly', 'Kapoor', '$2a$12$WuKdC1X9zHWi/cIhl1er5.DLODQD4CtCTShVvEmbmfROGconrHsyO', '88 Clearing Ave San Antonio TX 78832', 1, '895-0091', 1, ''),
       ('rocky.balboa8@example.com', 'Rocky', 'Balboa', '$2a$12$Gxm/NHUAx/mk1eDU9hz6Q.1X4yRYFlOrdBoUyCkOhMOG6SpasO9i.', '5555 Sequel Master St San Antonio TX 78333', 0, '111-555', 0, '');

/*Jim password = rockingeagle */
/*Reya password = loxosreya */
/*Amos password = amosveno */
/*Kelly password = kellykapoor */
/*Rocky password = rockybalboa */

INSERT INTO roles (name)
VALUES ('Adoption'),
('Foster'),
('Volunteer');

INSERT INTO users_roles (user_id, role_id) VALUES (2,2), (3,1), (3,3), (5,1), (5,2), (5,3);

INSERT INTO listings (user_id, image_url, name, type, breed, dob, gender, conditions, description, size, litter_size, foster_duration, created_time, role_id)
VALUES (1, 'https://cdn2.thecatapi.com/images/a18.png', 'Fluffy', 'Cat', 'Bengal', '3-5 years', 'F', 'None', 'Loveable playful cat needing a home', 'young adult', null, 'N/A', '2020-05-17 07:12:56', 1 ),
       (1, 'https://images.dog.ceo/breeds/affenpinscher/n02110627_6796.jpg', 'Max', 'Dog', 'Affenpinscher', '6-7 years', 'M', 'None', 'Lovable cuddly puppy dog', 'Small', 0, '4 months', '2020-09-10 09:11:56', 2),
       (4, '"https://cdn2.thecatapi.com/images/b6c.jpg"', 'Maximillion', 'Cat', 'Main Coon', '1-2 years', 'M', 'Special Medication', 'Young cat looking for a nice home.', 'young adult', null, 'None', '2020-04-10 12:10:45', 1),
       (4,'https://images.dog.ceo/breeds/terrier-scottish/n02097298_6462.jpg', 'Wendy', 'Dog', 'Scottish Terrier', '4-5 years', 'F', '', 'Dog looking for a great home. Pet-friendly.', 'adult', null, '1 month', '2019-11-10 09:32:12', 2);

INSERT INTO requests (user_id, listing_id, request_date)
VALUES (2, 2, '2020-09-10 09:11:56');

INSERT INTO volunteers (user_id, date, title, description, contact, image_url)
VALUES (4, 'January 5, 2021', 'Walking fun dogs','Volunteers are needed to help walk dogs in the nearby area to the shelter.', 'volunteer@shelter.com', ''),
       (1, 'February 3, 2021', 'Help with donations!', 'Volunteers are needed to help deliver food donations to the shelter.', 'uvolunteer@shelter.com', ''),
       (4, 'January 17, 2021', 'Cleaning day!', 'Volunteers needed to help us clean out and organize to get ready for our new cat section.', 'uvolunteernow@shelter.com', ''),
       (1, 'January 26 2021', 'Help with event.', 'Volunteers are needed for setting up our MEET OUR ANIMAL FRIENDS event.', 'ustillneedtobehere@shelter.com', '');