-- Индекс для ускорения поиска по имени сотрудника
CREATE INDEX idx_employees_full_name 
    ON employees (full_name);

-- Индекс для ускорения поиска сотрудников по отделу
CREATE INDEX idx_employees_department_id 
    ON employees (department_id);

-- Индекс для ускорения фильтрации документов по уровню доступа
CREATE INDEX idx_confidential_documents_access_level 
    ON confidential_documents (access_level);

-- Индекс для ускорения поиска по номеру карты
CREATE INDEX idx_access_cards_card_id
    ON access_cards (card_id);
