DROP table IF EXISTS subject CASCADE ;
DROP table IF EXISTS teacher CASCADE ;
DROP table IF EXISTS timetable CASCADE ;

CREATE TABLE subject (
    id serial PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE teacher (
    id serial PRIMARY KEY,
    full_name TEXT,
    subject_id INT NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE timetable (
    id serial PRIMARY KEY,
    day TEXT,
    room_number TEXT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);
-- SUBJECTS
INSERT into subject (id, name) VALUES(1, 'Основы компьютерного анализа') ON CONFLICT (name) DO NOTHING;
INSERT into subject (id, name) VALUES(2, 'Высшая математика') ON CONFLICT (name) DO NOTHING;
INSERT into subject (id, name) VALUES(3, 'Вычислительная техника') ON CONFLICT (name) DO NOTHING;
INSERT into subject (id, name) VALUES(4, 'Электроника') ON CONFLICT (name) DO NOTHING;
INSERT into subject (id, name) VALUES(5, 'Экономика') ON CONFLICT (name) DO NOTHING;

-- TEACHERS
INSERT into teacher (id, full_name, subject_id) VALUES(1, 'Городничев Михаил Геннадьевич', 1) ON CONFLICT DO NOTHING;
INSERT into teacher (id, full_name, subject_id) VALUES(2, 'Лакерник А.Р.', 2) ON CONFLICT DO NOTHING;
INSERT into teacher (id, full_name, subject_id) VALUES(3, 'Городничев Михаил Геннадьевич', 3) ON CONFLICT DO NOTHING;
INSERT into teacher (id, full_name, subject_id) VALUES(4, 'Городничев Михаил Геннадьевич', 4) ON CONFLICT DO NOTHING;
INSERT into teacher (id, full_name, subject_id) VALUES(5, 'Кухаренко Елена Геннадьевна', 5) ON CONFLICT DO NOTHING;

-- TIMETABLE
INSERT into timetable (id, day, room_number, start_time, created_at, updated_at, subject_id) VALUES
(1, 'понедельник', 'ЭЦ - 515', (current_date - ((6 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(2, 'понедельник', 'Ауд. 200', (current_date - ((6 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(3, 'понедельник', 'Ауд. ВЦ 127', (current_date - ((6 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(4, 'понедельник', 'Ауд. 525', (current_date - ((6 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(5, 'понедельник', 'Ауд. 217', (current_date - ((6 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 17:15:00')::TIMESTAMP, now(), now(), 5),
(6, 'вторник', 'ЭЦ - 515', (current_date - ((5 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(7, 'вторник', 'Ауд. 200', (current_date - ((5 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(8, 'вторник', 'Ауд. ВЦ 127', (current_date - ((5 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(9, 'вторник', 'Ауд. 525', (current_date - ((5 +cast(extract(dow FROM current_date) AS int)) % 7) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(10, 'вторник', 'Ауд. 217', (current_date - ((5 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 17:15:00')::TIMESTAMP, now(), now(), 5),
(11, 'среда', 'ЭЦ - 515', (current_date - ((4 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(12, 'среда', 'Ауд. 200', (current_date - ((4 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(13, 'среда', 'Ауд. ВЦ 127', (current_date - ((4 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(14, 'среда', 'Ауд. 525', (current_date - ((4 +cast(extract(dow FROM current_date) AS int)) % 7) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(15, 'среда', 'Ауд. 217', (current_date - ((4 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 17:15:00')::TIMESTAMP, now(), now(), 5),
(16, 'четверг', 'ЭЦ - 515', (current_date - ((3 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(17, 'четверг', 'Ауд. 200', (current_date - ((3 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(18, 'четверг', 'Ауд. ВЦ 127', (current_date - ((3 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(19, 'четверг', 'Ауд. 525', (current_date - ((3 +cast(extract(dow FROM current_date) AS int)) % 7) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(20, 'четверг', 'Ауд. 217', (current_date - ((3 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 17:15:00')::TIMESTAMP, now(), now(), 5),
(21, 'пятница', 'ЭЦ - 515', (current_date - ((2 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(22, 'пятница', 'Ауд. 200', (current_date - ((2 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(23, 'пятница', 'Ауд. ВЦ 127', (current_date - ((2 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(24, 'пятница', 'Ауд. 525', (current_date - ((2 +cast(extract(dow FROM current_date) AS int)) % 7) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(25, 'пятница', 'Ауд. 217', (current_date - ((2 + cast(extract(dow FROM current_date) AS int)) % 7) || ' 17:15:00')::TIMESTAMP, now(), now(), 5),
-- next week
(26, 'понедельник', 'ЭЦ - 515', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 1 AS int) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(27, 'понедельник', 'Ауд. 200', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 1 AS int) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(28, 'понедельник', 'Ауд. ВЦ 127', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 1 AS int) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(29, 'понедельник', 'Ауд. 525', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 1 AS int) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(30, 'понедельник', 'Ауд. 217', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 1 AS int) || ' 17:15:00')::TIMESTAMP, now(), now(), 5),
(31, 'вторник', 'ЭЦ - 515', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 2 AS int) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(32, 'вторник', 'Ауд. 200', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 2 AS int) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(33, 'вторник', 'Ауд. ВЦ 127', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 2 AS int) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(34, 'вторник', 'Ауд. 525', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 2 AS int) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(35, 'вторник', 'Ауд. 217', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 2 AS int) || ' 17:15:00')::TIMESTAMP, now(), now(), 5),
(36, 'среда', 'ЭЦ - 515', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 3 AS int) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(37, 'среда', 'Ауд. 200', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 3 AS int) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(38, 'среда', 'Ауд. ВЦ 127', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 3 AS int) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(39, 'среда', 'Ауд. 525', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 3 AS int) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(40, 'среда', 'Ауд. 217', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 3 AS int) || ' 17:15:00')::TIMESTAMP, now(), now(), 5),
(41, 'четверг', 'ЭЦ - 515', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 4 AS int) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(42, 'четверг', 'Ауд. 200', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 4 AS int) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(43, 'четверг', 'Ауд. ВЦ 127', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 4 AS int) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(44, 'четверг', 'Ауд. 525', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 4 AS int) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(45, 'четверг', 'Ауд. 217', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 4 AS int) || ' 17:15:00')::TIMESTAMP, now(), now(), 5),
(46, 'пятница', 'ЭЦ - 515', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 5 AS int) || ' 09:30:00')::TIMESTAMP, now(), now(), 1),
(47, 'пятница', 'Ауд. 200', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 5 AS int) || ' 11:20:00')::TIMESTAMP, now(), now(), 2),
(48, 'пятница', 'Ауд. ВЦ 127', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 5 AS int) || ' 13:10:00')::TIMESTAMP, now(), now(), 3),
(49, 'пятница', 'Ауд. 525', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 5 AS int) || ' 15:25:00')::TIMESTAMP, now(), now(), 4),
(50, 'пятница', 'Ауд. 217', (current_date + cast(abs(extract(dow FROM current_date) - 7) + 5 AS int) || ' 17:15:00')::TIMESTAMP, now(), now(), 5)
ON CONFLICT DO NOTHING;



