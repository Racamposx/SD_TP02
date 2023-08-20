require 'socket'
require 'time'

HOST = '192.168.2.7'
PORT = 1234

client = TCPSocket.new(HOST, PORT)
loop do
  begin
  #tempo do relogio do cliente
  current_time = Time.now
  #tempo da requisicao
  t1 = Time.now
  server_time = Time.parse(client.gets)
  #tempo da resposta
  t2 = Time.now
  

  round_trip_time = t2 - t1
  adjusted_time = server_time + round_trip_time / 2

  puts "-------------Sincronizacao-------------"
  puts "Round trip time (RTT): #{round_trip_time} seconds"
  puts "Tempo do servidor: #{server_time}"
  puts "Tempo atual do lado do cliente: #{current_time}"
  puts "Tempo ajustado: #{adjusted_time}"
  puts "---------------------------------------"

  sleep(5)
  rescue Errno::EPIPE
    puts "O servidor caiu"
    break
  end
end
