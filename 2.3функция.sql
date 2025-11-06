CREATE OR REPLACE FUNCTION add_employee_simple(
    p_full_name VARCHAR(255),
    p_department_name VARCHAR(100),
    p_position VARCHAR(100) DEFAULT NULL,
    p_personal_email VARCHAR(255) DEFAULT NULL
)
RETURNS INTEGER AS $$
DECLARE
    v_dept_id INTEGER;
    v_emp_id INTEGER;
BEGIN
    -- Находим отдел
    SELECT department_id INTO v_dept_id
    FROM departments
    WHERE department_name = p_department_name;

    IF v_dept_id IS NULL THEN
        RAISE EXCEPTION 'Отдел "%" не найден. Создайте его сначала.', p_department_name;
    END IF;

    -- Добавляем сотрудника
    INSERT INTO employees (full_name, department_id, position, personal_email, hire_date)
    VALUES (p_full_name, v_dept_id, p_position, p_personal_email, CURRENT_DATE)
    RETURNING employee_id INTO v_emp_id;

    -- Выдаём пропуск
    INSERT INTO access_cards (employee_id, issue_date)
    VALUES (v_emp_id, CURRENT_DATE);

    RETURN v_emp_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

!

