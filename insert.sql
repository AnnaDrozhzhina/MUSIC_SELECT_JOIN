INSERT INTO music_genre (name_of_genre) 
VALUES ('rok'),
       ('pop'), 
       ('jazz'), 
       ('folk');

INSERT INTO list_of_musician (name_of_musician) 
VALUES ('Анна Миланова'),
       ('Серега'), 
       ('Ствс Перепелкин'), 
       ('Вероника Веронина'), 
       ('Алена Михайлова');

INSERT INTO musicians_genre (id_music_genre, id_musician) 
VALUES (2, 1),
       (1, 2),
       (3, 3),
       (1, 4),
       (2, 4),
       (4, 5), 
       (3, 5);

INSERT INTO album_list (name_of_album, year_of_release) 
VALUES ('Дождь', 2003),
       ('Цвета Радуга', 2019), 
       ('Мое Солнце', 2015), 
       ('Прогремел Гром', 2022),
       ('Молния', 2002), 
       ('Америка', 2019);

INSERT INTO musicians_album (id_album, id_musician) 
VALUES (1, 2),  
       (1, 4),
       (2, 5),
       (3, 4), 
       (4, 1),
       (4, 4),
       (5, 3),
       (5, 5),
       (6, 3);

INSERT INTO track_list (name_of_track, id_album, track_duration) 
VALUES ('Печаль мое состояние', 1, 185),
       ('мое настроение', 2, 228),
       ('Улыбка', 3, 289), 
       ('Страх', 4, 215), 
       ('Любовь', 2, 293), 
       ('Надежда', 5,  279), 
       ('Время', 6, 218), 
       ('Прошлое', 6, 115),
       ('Прошлое мое', 6, 273),
       ('my own', 6, 233),
       ('own my', 6, 243),
       ('my', 6, 222),
       ('oh my love', 6, 255),
       ('myself', 6, 250),
       ('by myself', 6, 244),
       ('bemy self', 6, 233),
       ('myself by', 6, 250),
       ('by myself by', 6, 257),
       ('beemy', 6, 255),
       ('premyne', 6, 244);

INSERT INTO collection (name_of_collection, year_of_release) 
VALUES ('Золотое яблоко', 2022), 
       ('Хиты всех времен', 2023),
       ('Погода', 2023),
       ('Прошлое', 2007),
       ('Любовь-любовь', 2019);

INSERT INTO track_collection (id_track, id_collection) 
VALUES (1, 3),
       (1, 4),
       (2, 5),
       (2, 1), 
       (3, 1),
       (3, 3),
       (4, 2),
       (5, 5),
       (5, 1),
       (6, 4);
