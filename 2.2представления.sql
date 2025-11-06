--🔐 Здесь мы показываем только общую информацию.
--Личные данные (personal_email, personal_phone) скрыты.
--Поле work_phone имитируем через COALESCE, чтобы не оставлять NULL.
CREATE OR REPLACE VIEW v_employee_directory AS
SELECT 
    e.full_name,
    d.department_name,
    e.position,
    COALESCE(e.phone_number, '—') AS work_phone
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;


--🔐 Здесь показываем документы с уровнем доступа не ниже Internal,
--но не раскрываем поле content (содержимое документа).
CREATE OR REPLACE VIEW v_internal_docs AS
SELECT 
    doc_id,
    doc_title,
    creator_id,
    created_date,
    access_level
FROM confidential_documents
WHERE access_level IN ('Public', 'Internal');


-- Проверить сотрудников (без личных данных)
SELECT * FROM v_employee_directory;

-- Проверить документы (только Internal и выше)
SELECT * FROM v_internal_docs;



