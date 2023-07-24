 -- Название и продолжительность самого длительного трека  
 
  SELECT  name_of_track, track_duration
    FROM  track_list
ORDER BY  track_duration desc
   LIMIT  1
   
 -- Название треков, продолжительность которых не менее 3,5 минут
 
SELECT  name_of_track
  FROM  track_list
 WHERE  track_duration >= 3.5*60
  
  -- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
  
SELECT  name_of_collection
  FROM  collection
 WHERE  year_of_release BETWEEN 2018 AND 2020
  
  -- Исполнители, чьё имя состоит из одного слова
  
SELECT  name_of_musician
  FROM  list_of_musician
 WHERE  name_of_musician NOT LIKE '% %'
  
  -- Название треков, которые содержат слово «мой» или «my»
  
SELECT  name_of_track
  FROM  track_list
 WHERE  name_of_track LIKE 'Моя %'
  
  -- Количество исполнителей в каждом жанре
  
   SELECT  g.name_of_genre, COUNT(m.name_of_musician)   
     FROM      music_genre  AS g
LEFT JOIN  musicians_genre  AS mg ON g.id_music_genre = mg.id_music_genre 
LEFT JOIN  list_of_musician AS m  ON mg.id_musician = m.id_musician 
 GROUP BY  g.name_of_genre
   
  -- Количество треков, вошедших в альбомы 2019–2020 годов
   
   SELECT  COUNT(t.id_track), a.year_of_release FROM album_list AS a
LEFT JOIN  track_list AS t ON t.id_album = a.id_album 
    WHERE  year_of_release BETWEEN 2019 AND 2020 
 GROUP BY  a.year_of_release
   
   --Средняя продолжительность треков по каждому альбому
   
   SELECT  AVG(t.track_duration), a.name_of_album FROM track_list AS t
LEFT JOIN  album_list AS a ON t.id_album = a.id_album
 GROUP BY  a.name_of_album 
 ORDER BY  AVG(t.track_duration)
   
   --Все исполнители, которые не выпустили альбомы в 2022 году
     
  SELECT  m.name_of_musician FROM list_of_musician AS m
   WHERE  m.name_of_musician NOT IN
       (   SELECT  m.name_of_musician FROM list_of_musician AS m
        LEFT JOIN  musicians_album AS ma ON m.id_musician = ma.id_musician  
        LEFT JOIN  album_list AS a ON ma.id_album = a.id_album 
            WHERE  year_of_release = 2022)
GROUP BY  m.name_of_musician
   
   --Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
   
   SELECT  c.name_of_collection FROM collection AS c
LEFT JOIN  track_collection AS tc ON c.id_collection = tc.id_collection 
LEFT JOIN  track_list AS tl ON tc.id_track = tl.id_track 
LEFT JOIN  album_list AS al ON tl.id_album = al.id_album 
LEFT JOIN  musicians_album AS ma ON al.id_album  = ma.id_album 
LEFT JOIN  list_of_musician AS m ON ma.id_musician = m.id_musician 
    WHERE  m.name_of_musician = 'Вероника Веронина'
 GROUP BY  c.name_of_collection
   
   -- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
   
   SELECT  a.name_of_album FROM album_list AS a
LEFT JOIN  musicians_album AS ma ON a.id_album = ma.id_album 
LEFT JOIN  list_of_musician AS m ON ma.id_musician = m.id_musician 
LEFT JOIN  musicians_genre AS mg ON m.id_musician = mg.id_musician 
LEFT JOIN  music_genre AS g ON mg.id_music_genre = g.id_music_genre 
 GROUP BY  a.name_of_album
   HAVING  COUNT (g.name_of_genre) > 1
 ORDER BY  a.name_of_album
    
   --Наименования треков, которые не входят в сборники
    
   SELECT  t.name_of_track FROM track_list AS t
LEFT JOIN  track_collection  AS tc ON t.id_track = tc.id_track 
    WHERE  tc.id_track IS NULL 
    
   --Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
    
   SELECT  m.name_of_musician FROM list_of_musician AS m
LEFT JOIN  musicians_album  AS ma ON m.id_musician = ma.id_musician 
LEFT JOIN  album_list  AS a ON ma.id_album = a.id_album 
LEFT JOIN  track_list  AS t ON a.id_album = t.id_album 
 ORDER BY  t.track_duration
    LIMIT  1
    
    -- Названия альбомов, содержащих наименьшее количество треков.
        
   SELECT  a.name_of_album 
     FROM  album_list AS a
LEFT JOIN  track_list AS t ON t.id_album  = a.id_album 
    WHERE  t.id_album IN (
         SELECT  id_album
           FROM  track_list
       GROUP BY  id_album
         HAVING  COUNT(id_album) = (
               SELECT COUNT(id_album)
                 FROM track_list
             GROUP BY id_album
             ORDER BY count
                LIMIT 1
             )
)
ORDER BY a.name_of_album 
  
  
  
  
   
