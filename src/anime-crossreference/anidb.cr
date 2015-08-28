require "xml"
require "json"

module AnimeCrossreference
    class AniDB
        struct Title
            getter type, lang, title, aid

            def initialize(@type, @lang, @title, @aid)
            end

            def initialize(node : XML::Node, @aid)
                @type = node["type"]?.try &.to_s
                @lang = node["xml:lang"]?.try &.to_s
                @title = node.content.to_s
            end

            json_mapping({
                type: String,
                lang: String,
                title: String,
                aid: Int32
            })
        end

        def self.populate_db
            # Download aniDB

            aid_lookup = {} of Int32 => Array(Title)
            title_lookup = {} of String => Title

            node = XML.parse File.read("anidb_names.xml")
            
            node.children[0].children.each do |anime|
                next unless anime.element?

                aid = anime["aid"].to_i
                
                titles = [] of Title
                anime.children.each do |title|
                    next unless title.element?

                    title = Title.new(title, aid)
                    titles << title

                    title_lookup[title.title] = title
                end

                aid_lookup[aid] = titles
            end

            @@aid_lookup = aid_lookup
            @@title_lookup = title_lookup
        end
    end
end
