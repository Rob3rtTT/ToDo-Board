class Item 
    attr_accessor :title, :description
    attr_reader :deadline, :done
    def self.valid_date?(date_string)
        parts = date_string.split("-")
        if parts.length != 3
            raise "Please enter a date format like DD-MM-YYYY"
        end
        dd = parts[0].to_i
        mm = parts[1].to_i
        yyyy = parts[2].to_i
        return true if (1..31).to_a.include?(dd) && (1..12).to_a.include?(mm) && (2021..9999).to_a.include?(yyyy)   
        false
    end

    def initialize(title, deadline, description)
        @title=title
        if Item.valid_date?(deadline)
            @deadline=deadline
        else
            raise 'Date is not valid'
        end
        @description=description
        @done = false
    end

    def toggle
        @done= !done
    end
    
    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise 'Invalid deadline'
        end
    end
end