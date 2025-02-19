SELECT GroupName, FullName, discipline, unnest(string_to_array(mark, ' '))::TEXT FROM students;
