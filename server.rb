# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

# Для отступов используется табуляция шириной в четыре пробела.

PORT = 6754

require 'socket'

# Константа APP_ROOT будет содержать текущую директорию
APP_ROOT = File.dirname(__FILE__)

## Добавляем текущий путь в список путей, где искать файлы
$:.unshift( File.join(APP_ROOT, 'lib') )
#$:.unshift( File.join(APP_ROOT, 'conf') )

# Подключаем библиотеки

#require 'conf'          # Конфигурация


puts "Starting up server."

# Establishing the server
server = TCPServer.new(PORT)

# Listen and accept connections
while (session = server.accept)

	# Start new thread conversation
	Thread.start do

		# Server-side log
		puts "Connection from #{session.peeraddr[2]} at #{session.peeraddr[3]}"
		puts "Got input from client"

		# What does the client say?
		input = session.gets
		puts "Client input: #{input}"

		# Responding
		session.puts "Server: Welcome, #{session.peeraddr[2]}\n"

		# Ending sessoin
		puts "Sending goodbye"
		session.puts "Server: Goodbye\n"

	end # Thread.start

end # while
