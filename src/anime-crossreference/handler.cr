require "http/server"

module AnimeCrossreference
    class Handler < HTTP::Handler
        def call(request)
            return HTTP::Response.new 405, "" if request.method != "GET"
            return HTTP::Response.new 400, "" unless request.path.includes? ':'
            
            type, data = request.path.split ':', limit = 2
            case type
                when "/mal"
                    HTTP::Response.new 200, "My Anime List #{data}"
                else
                    HTTP::Response.new 400, "Invalid identifier type"
            end
        end
    end
end
