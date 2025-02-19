# Приведение таблицы к первой нормальной форме

Этот проект представляет собой скрипт на Python, который читает данные из Excel файла и генерирует SQL-запросы для вставки этих данных в таблицу базы данных PostgreSQL. Также предоставлен пример SQL-запроса для выборки данных из таблицы.

## Структура проекта

- **Python скрипт**: Чтение данных из Excel и генерация SQL-запросов.
- **SQL запрос**: Пример выборки данных из таблицы `students`.

## Требования

- Python 3.x
- Библиотека `openpyxl` для работы с Excel файлами.
- PostgreSQL для выполнения SQL-запросов.

## Установка

1. Установите необходимые библиотеки:

   ```bash
   pip install openpyxl
   ```

2. Убедитесь, что у вас установлен PostgreSQL и настроена база данных.

## Использование

### Python скрипт

1. Укажите путь к вашему Excel файлу в переменной `path`.

   ```python
   path = "problemsSolve/basesScript/Текущий рейтинг студентов ФИТУ .xlsx"
   ```

2. Запустите скрипт. Он прочитает данные из Excel файла и сгенерирует SQL-запросы для вставки данных в таблицу `students`.

   ```bash
   python ваш_скрипт.py
   ```

3. Результат будет записан в файл `insertAtom.txt`.

## Описание кода

### Python скрипт

1. **Загрузка Excel файла**:

   ```python
   wb_obj = openpyxl.load_workbook(path)
   sheet_obj = wb_obj.active
   ```

2. **Чтение заголовков столбцов**:

   ```python
   for cl in range(1, column + 1):
       cell_obj = sheet_obj.cell(row=1, column=cl)
       value = cell_obj.value
       arr.append(value)
   ```

3. **Генерация SQL-запросов**:

   ```python
   for rw in range(2, row + 1):
       insert = ""
       for cl in range(3, column + 1):
           cell_obj = sheet_obj.cell(row=rw, column=cl)
           group = sheet_obj.cell(row=rw, column=1).value
           stud = sheet_obj.cell(row=rw, column=2).value
           value = cell_obj.value

           insert += f"INSERT INTO students VALUES ({group}, '{stud}', '{arr[cl-1]}', '{value}');\n"
       file.write(insert)
   ```

### SQL запрос

- **Выборка данных**:

  ```sql
  SELECT * FROM (SELECT GroupName, FullName, discipline, unnest(string_to_array(mark, ' '))::TEXT AS marks FROM students) WHERE marks != '';
  ```

  Этот запрос выбирает данные из таблицы `students`, разбивая строку с оценками на отдельные значения.

## Заключение

Этот проект демонстрирует, как можно избавиться от ошибки атомарности в postgresql таблице.
