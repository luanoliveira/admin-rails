module Admin

    class Ui
        attr_accessor :project_name, :page_title
        attr_reader :menu
        
        def add_menu(name, title, uri=nil)
            if @menu.nil?
                @menu = []
            end

            @menu.push({
                name: name,
                title: title,
                uri: uri
            })
        end
    end
    
end