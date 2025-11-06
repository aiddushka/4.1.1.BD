-- === departments (Отделы) ===
INSERT INTO departments (department_name) VALUES
('Бухгалтерия'),
('Отдел кадров'),
('Отдел информационной безопасности'),
('IT-отдел'),
('Отдел продаж');

-- === employees (Сотрудники) ===
INSERT INTO employees (full_name, department_id, position, hire_date, personal_email, phone_number)
VALUES
('Анна Кузнецова', 2, 'HR-менеджер',        '2021-03-15', 'anna.hr@example.com', '+7-900-111-2233'),
('Олег Сидоров',     3, 'Специалист по безопасности', '2020-09-10', 'oleg.sec@example.com', '+7-900-222-3344'),
('Иван Петров',      4, 'Разработчик',       '2022-01-20', 'ivan.it@example.com',  '+7-900-333-4455'),
('Мария Иванова',    1, 'Бухгалтер',         '2019-06-05', 'maria.acc@example.com','+7-900-444-5566'),
('Елена Орлова',     5, 'Менеджер по продажам', '2023-02-10','elena.sales@example.com','+7-900-555-6677'),
('Сергей Лебедев',   4, 'Системный администратор','2018-12-01','sergey.sys@example.com','+7-900-666-7788'),
('Дмитрий Смирнов',  3, 'Аналитик ИБ',       '2020-05-14', 'dmitry.ib@example.com','+7-900-777-8899'),
('Оксана Волкова',   1, 'Старший бухгалтер', '2017-07-22', 'oksana.acc@example.com','+7-900-888-9900');

-- === Назначаем директоров отделов ===
UPDATE departments SET director_id = 4 WHERE department_name = 'Бухгалтерия';             -- Мария Иванова
UPDATE departments SET director_id = 1 WHERE department_name = 'Отдел кадров';            -- Анна Кузнецова
UPDATE departments SET director_id = 2 WHERE department_name = 'Отдел информационной безопасности'; -- Олег
UPDATE departments SET director_id = 6 WHERE department_name = 'IT-отдел';                -- Сергей
UPDATE departments SET director_id = 5 WHERE department_name = 'Отдел продаж';            -- Елена

-- === access_cards (Пропуска) ===
INSERT INTO access_cards (employee_id, issue_date, is_active) VALUES
(1, '2021-03-16', TRUE),
(2, '2020-09-11', TRUE),
(3, '2022-01-21', TRUE),
(4, '2019-06-06', TRUE),
(5, '2023-02-11', TRUE),
(6, '2018-12-02', TRUE),
(7, '2020-05-15', FALSE),
(8, '2017-07-23', TRUE);

-- === confidential_documents (Конфиденциальные документы) ===
INSERT INTO confidential_documents (doc_title, creator_id, created_date, content, access_level)
VALUES
('План развития отдела кадров',        1, '2023-04-12', 'Текст плана HR', 'Internal'),
('Политика информационной безопасности', 2, '2022-11-03', 'Документ по безопасности', 'Strictly'),
('Руководство по настройке серверов',  6, '2023-01-05', 'Инструкция по установке ПО', 'Confidential'),
('Финансовый отчет 2023',              4, '2024-02-01', 'Финансовые данные компании', 'Strictly'),
('Каталог продукции',                  5, '2023-08-10', 'Описание товаров', 'Public'),
('Рекомендации по защите персональных данных', 7, '2024-03-10', 'Памятка по ИБ', 'Internal'),
('Протокол собрания IT-отдела',        3, '2023-10-02', 'Заметки совещания', 'Confidential');
