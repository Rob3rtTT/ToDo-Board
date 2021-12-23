require_relative 'list.rb'
class TodoBoard
    def initialize(label)
        @list=List.new(label)
    end

    def command_list
        p 'mktodo <title> <deadline> <optional description>'
        p 'makes a todo with the given information'
        p '-'*20

        p 'up <index> <optional amount>'
        p 'raises the todo up the list'
        p '-'*20

        p 'down <index> <optional amount>'
        p 'lowers the todo down the list'
        p '-'*20

        p 'swap <index_1> <index_2>'
        p 'swaps the position of todos'
        p '-'*20

        p 'sort'
        p 'sorts the todos by date'
        p '-'*20

        p 'priority'
        p 'prints the todo at the top of the list'
        p '-'*20

        p 'print <optional index>'
        p '     prints all todos if no index is provided'
        p '     prints full information of the specified todo if an index is provided'
        p '-'*20

        p 'quit'
        p 'returns false'
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            @list.up(*args.map(&:to_i))
        when 'down'
            @list.down(*args.map(&:to_i))
        when 'swap'
            @list.swap(*args.map(&:to_i))
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.print_priority
        when 'print'
            if args.empty?
                @list.print
            else
                @list.print_full_item(args[0].to_i)
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run 
        until self.get_command == false
            self.get_command
        end
    end
end