-- Таблица employees (Сотрудники)
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    department_id INTEGER,
    position VARCHAR(100),
    hire_date DATE NOT NULL,
    personal_email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);

-- Таблица departments (Отделы)
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    director_id INTEGER
);

-- Добавляем внешний ключ к таблице employees после создания departments
ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL;

-- Добавляем внешний ключ для director_id в departments
ALTER TABLE departments
ADD CONSTRAINT fk_director
FOREIGN KEY (director_id) REFERENCES employees(employee_id) ON DELETE SET NULL;


-- Таблица access_cards (Пропуска)
CREATE TABLE access_cards (
    card_id SERIAL PRIMARY KEY,
    employee_id INTEGER UNIQUE NOT NULL, -- UNIQUE, так как у сотрудника может быть только один пропуск
    issue_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_employee_card
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);

-- Таблица confidential_documents (Конфиденциальные документы)
CREATE TABLE confidential_documents (
    doc_id SERIAL PRIMARY KEY,
    doc_title VARCHAR(255) NOT NULL,
    creator_id INTEGER NOT NULL,
    created_date DATE DEFAULT CURRENT_DATE,
    content TEXT, -- Для содержания или пути к файлу
    access_level VARCHAR(20) NOT NULL CHECK (access_level IN ('Public', 'Internal', 'Confidential', 'Strictly')),
    CONSTRAINT fk_creator
        FOREIGN KEY (creator_id) REFERENCES employees(employee_id) ON DELETE RESTRICT
);