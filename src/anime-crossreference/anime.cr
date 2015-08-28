module AnimeCrossreference
    struct Anime
        getter anidb_id
        getter mal_id
        getter hummingbird_id
        getter tvdb_id
        getter names

        def initialize(@anidb_id : Int32, @mal_id : Int32, @hummingbird_id : Int32, @tvdb_id :  Int32, @names : Array(String))
        end

        def self.new_from_mal(mal_id)
            #
        end

        def self.new_from_name(name)
            #
        end
    end
end
