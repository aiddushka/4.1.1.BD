-- === Создание ролей ===
CREATE ROLE sc_hr_manager;
CREATE ROLE sc_security_officer;
CREATE ROLE sc_department_employee;


-- === Пользователи ===
CREATE ROLE sc_anna_hr LOGIN PASSWORD 'hr123';
CREATE ROLE sc_oleg_sec LOGIN PASSWORD 'sec123';
CREATE ROLE sc_ivan_emp LOGIN PASSWORD 'emp123';


-- === Назначаем роли ===
GRANT sc_hr_manager TO sc_anna_hr;
GRANT sc_security_officer TO sc_oleg_sec;
GRANT sc_department_employee TO sc_ivan_emp;

-- Добавляем полный доступ к таблицам employees и departments
GRANT SELECT, INSERT, UPDATE, DELETE ON employees TO sc_hr_manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON departments TO sc_hr_manager;
-- Разрешаем использование последовательностей для вставки (если SERIAL)
GRANT USAGE, SELECT ON SEQUENCE employees_employee_id_seq TO sc_hr_manager;
GRANT USAGE, SELECT ON SEQUENCE departments_department_id_seq TO sc_hr_manager;


-- Разрешения для Сотрудника охраны
GRANT SELECT ON employees TO sc_security_officer;
GRANT SELECT ON access_cards TO sc_security_officer;



-- Разрешения для обычного сотрудника
GRANT SELECT ON v_employee_directory TO sc_department_employee;
GRANT SELECT ON v_internal_docs TO sc_department_employee;
