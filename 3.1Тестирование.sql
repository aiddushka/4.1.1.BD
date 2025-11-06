-- *** 1. ТЕСТИРОВАНИЕ: Кадровый менеджер (anna_hr) - ПОЛНЫЙ ДОСТУП к данным HR ***

SET ROLE sc_anna_hr;

-- 1.1. Тест: Чтение (SELECT) данных сотрудников (ОЖИДАНИЕ: УСПЕХ)
SELECT * FROM employees LIMIT 5;

-- 1.2. Тест: Вставка (INSERT) нового сотрудника (ОЖИДАНИЕ: УСПЕХ)
INSERT INTO employees (full_name, department_id, position, hire_date)
VALUES ('Тест-Имя HR', 1, 'Менеджер', CURRENT_DATE);

-- 1.3. Тест: Обновление (UPDATE) данных сотрудника (ОЖИДАНИЕ: УСПЕХ)
UPDATE employees SET position = 'Менеджер (Обновлен)' WHERE full_name = 'Тест-Имя HR';

-- 1.4. Тест: Удаление (DELETE) тестового сотрудника (ОЖИДАНИЕ: УСПЕХ)
DELETE FROM employees WHERE full_name = 'Тест-Имя HR';

-- 1.5. Тест: Доступ к конфиденциальным документам (ОЖИДАНИЕ: ОШИБКА, т.к. доступ запрещен)
SELECT * FROM confidential_documents LIMIT 1;


-- *** 2. ТЕСТИРОВАНИЕ: Сотрудник охраны (oleg_sec) - ЧТЕНИЕ сотрудников и пропусков ***

SET ROLE sc_oleg_sec;

-- 2.1. Тест: Чтение (SELECT) данных сотрудников (ОЖИДАНИЕ: УСПЕХ)
SELECT employee_id, full_name, phone_number FROM employees LIMIT 5;

-- 2.2. Тест: Чтение (SELECT) пропусков (ОЖИДАНИЕ: УСПЕХ)
SELECT card_id, employee_id, is_active FROM access_cards LIMIT 5;

-- 2.3. Тест: Попытка Вставки (INSERT) в сотрудников (ОЖИДАНИЕ: ОШИБКА, т.к. нет прав)
-- Вставьте фактические значения, если есть (если нет, команда все равно вызовет ошибку прав)
INSERT INTO employees (full_name, hire_date) VALUES ('Тест Охраны', CURRENT_DATE);

-- 2.4. Тест: Попытка Обновления (UPDATE) пропусков (ОЖИДАНИЕ: ОШИБКА, т.к. нет прав UPDATE)
UPDATE access_cards SET is_active = FALSE WHERE employee_id = 1;


-- *** 3. ТЕСТИРОВАНИЕ: Обычный сотрудник (ivan_emp) - ЧТЕНИЕ представлений (VIEW) ***

SET ROLE sc_ivan_emp;

-- 3.1. Тест: Чтение (SELECT) из справочника сотрудников (VIEW) (ОЖИДАНИЕ: УСПЕХ)
SELECT * FROM v_employee_directory LIMIT 5;

-- 3.2. Тест: Чтение (SELECT) из внутренних документов (VIEW) (ОЖИДАНИЕ: УСПЕХ)
SELECT * FROM v_internal_docs LIMIT 5;

-- 3.3. Тест: Чтение (SELECT) из базовой таблицы employees (ОЖИДАНИЕ: ОШИБКА, т.к. доступ только через VIEW)
SELECT * FROM employees LIMIT 1;

-- 3.4. Тест: Чтение (SELECT) из конфиденциальных документов (ОЖИДАНИЕ: ОШИБКА, т.к. доступ только через VIEW)
SELECT * FROM confidential_documents LIMIT 1;

-- 3.5. Тест: Попытка Вставки (INSERT) в любой объект (ОЖИДАНИЕ: ОШИБКА)
-- Выберите любую таблицу или представление
INSERT INTO departments (department_name) VALUES ('Тест Отдела');


-- *** 4. ВОЗВРАТ К СУПЕРПОЛЬЗОВАТЕЛЮ (для продолжения работы) ***

-- Это команда для возврата к правам пользователя, под которым вы изначально подключились
-- (часто это postgres или ваш личный логин)
SET ROLE postgres;