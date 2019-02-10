module ApplicationHelper

    def class_string(*items)
        output = []

        items.each do |item|
            if (item.is_a?(Hash))
                item.each do |item_class, item_if|
                    if item_if
                        output.push(item_class)
                    end
                end
            else
                output.push(item)
            end            
        end

        output.join(" ")
    end
    
end
