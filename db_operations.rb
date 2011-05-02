# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

# Для отступов используется табуляция шириной в четыре пробела.




# Константа APP_ROOT будет содержать текущую директорию
APP_ROOT = File.dirname(__FILE__)

## Добавляем текущий путь в список путей, где искать файлы
$:.unshift( File.join(APP_ROOT, 'lib') )
#$:.unshift( File.join(APP_ROOT, 'conf') )

# Подключаем библиотеки

#require 'conf'          # Конфигурация


# Проверяем параметры командной строки
case ARGV.first
	when 'populate_db'
		require 'populate_db'
		populator = PopulateDB.new(file: ARGV[1], amount: ARGV[2].to_i)
		populator.populate!
	when 'test_db'
		require 'test_db'
		tester = TestDB.new(file: ARGV[1])
		row = tester.get_value(ARGV[2].to_i)
		p row
end