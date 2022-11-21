# frozen_string_literal: true

# 1
def fetch_two_max_values(array)
  array.max(2)
end

def fetch_two_min_values(array)
  array.min(2)
end

fetch_two_max_values(
  [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33, 54, 763, 893]
)

fetch_two_min_values(
  [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33, 54, 763, 893]
)

# 2
arr = [{ a: 1, b: 2, c: 45 }, { d: 123, c: 12 }, { e: 87 }]

# a) напишите выражение, которое получает массив всех ключей
arr.inject(:merge).keys

# b) напишите выражение, которое получает массив всех значений
arr.inject(:merge).values

# c) напишите выражение, которое получает сумму всех значений
arr.inject(:merge).values.sum

# 3 Объясните разницу между двумя выражениями и скажите значения переменных el1, el2
# оператор and отличается от оператора && более низким приоритетом. Необходимо использовать
# оператор &&, так как оператор and запишет в переменную левый операнд, а оператор && 
# запишет в переменную логическое значение
el1 = true
el2 = false

# 4) Покажите пример удаления nil значений в Ruby массиве
# можно использовать метод compact
[nil, 1, :foo].compact #=> [1, :foo]

# 5 Найдите вхождения каждого элемента в массив
arr = [
        nil, 2, :foo, 'bar', 'foo', 'apple', 'orange',
        :orange, 45, nil, :foo, :bar, 25, 45, :apple, 'bar', nil
      ]

frequency_counter = arr.tally

# or

def number_of_occurences(array)
  array.each_with_object(Hash.new(0)) { |word, counts| counts[word] += 1 }
end

number_of_occurences(arr)

# 6 Напишите функцию
# a) которая переводит градусы по Цельсию в градусы по Фаренгейту

def celsium_to_fahrenheit(number)
  (9 / 5.to_f) * number + 32
end

#b) напишите консольную программу, которая просит юзера ввести число (градусы по
  #Цельсию) и переводит его в Фаренгейты

def celsium_to_fahrenheit_with_input
  puts 'Please enter a number'
  number = gets.chomp
  puts ((9 / 5.to_f) * number.to_i + 32).round
end

#c) Напишите обработку ошибок, если юзер ввел неправильные данные
# (программа должна просить ввести число заново и сообщать об
# ошибке, но не прерываться)

def celsium_to_fahrenheit_with_input_error
  puts 'Please enter a number'

  while number = gets.chomp
    x = Integer(number) rescue false
    if x
      puts ((9 / 5.to_f) * number.to_i + 32).round
    else
      puts 'Wrong type of data. Please enter a number'
    end
  end
end

# 7 Напишите функцию, которая имитирует работу светафора
# a) на вход она получает один из цветов в виде строки (‘red’, ‘green’, ‘yellow’ ), на выходе
# будет результат (идти, стоять или ждать)

def traffic_light_action(color)
  traffic_light = {
    'red' => 'stop',
    'yellow' => 'wait',
    'green' => 'go'
  }

  traffic_light[color]
end

# b) напишите это в виде консольной программы, которая не прекращает работу после
# однократного вызова, а ждет следующих запросов

def traffic_light_action_with_input
  traffic_light = {
    'red' => 'stop',
    'yellow' => 'wait',
    'green' => 'go'
  }

  puts 'Please enter "green", "yellow" or "red" '

  while color = gets.chomp
    if color == 'red' || color == 'yellow' || color == 'green'
      puts traffic_light[color]
    elsif color == 'exit'
      break
    else
      puts 'Wrong data. Please enter "green", "yellow" or "red" '
    end

    puts 'type "exit" to stop the program'
  end
end

# 8)
<<-SQL
  SELECT count(id) FROM students;
SQL
<<-SQL
  SELECT count(id) FROM students WHERE name = 'Иван';
SQL
<<-SQL
  SELECT count(id) FROM students WHERE created_at >= '01-09-20';
SQL

# 9
# a) read amount of students with parents

<<-SQL
  SELECT count(students.id) FROM students
    JOIN parents on students.parent_id = parents.id;
SQL

# b) read amount of student with parent name = Marina

<<-SQL
  SELECT count(students.id) FROM students
    JOIN parents on students.parent_id = parents.id
    WHERE parent.name = 'Марина';
SQL

# c) read amount of students without parent

<<-SQL
  SELECT count(students.id) FROM students
    WHERE students.parent_id IS NULL;
SQL
