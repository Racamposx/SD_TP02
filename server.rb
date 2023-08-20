require 'socket'
require 'time'

HOST = '192.168.2.7'
PORT = 1234

server = TCPServer.new(HOST, PORT)
puts "Server started on #{HOST}/#{PORT}"
clients = []

loop do
  client = server.accept
  clients << client
  puts "Client connected"

  if clients.size == 2
    loop do
      clients.each do |client|
        client.puts(Time.now.iso8601(6))
      end
      puts Time.now
      sleep(5)
    end
  end
end