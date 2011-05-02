# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

PORT = 6754

require 'socket'

puts "Starting connection"
client_session = TCPSocket.new("localhost", PORT)

puts "Saying hello"
client_session.puts "Client: Hello Server World!"

# Ensure session isn't closed
while !(client_session.closed?) && server_message = client_session.gets

	# Outputting server's message locally
	puts server_message

	# If a message contains 'Goodbye', we disconnect
	if server_message.include?("Goodbye")
		puts "Received Goodbye, closing connection"
		client_session.close
	end
end