SELECT * FROM (SELECT GroupName, FullName, discipline, unnest(string_to_array(mark, ' '))::TEXT AS marks FROM students) WHERE marks != ''; 
