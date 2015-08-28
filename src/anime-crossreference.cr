require "./anime-crossreference/**"
require "http/server"

PORT = 8080

server = HTTP::Server.new(PORT, [
    HTTP::ErrorHandler.new,
    HTTP::LogHandler.new,
    AnimeCrossreference::Handler.new
])

#puts "Listening on http://0.0.0.0:#{PORT}"
#server.listen
