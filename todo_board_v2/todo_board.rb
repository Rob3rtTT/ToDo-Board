require_relative 'list.rb'
class TodoBoard
    def initialize
        @list={}
        puts "Welcome back!"
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
    #maybe try adding a make new list command and see if it works then
    def get_command
        print "\nEnter a command: "
        cmd,target, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @list[target] = List.new(target)
        when 'ls'
            @list.each_key {|target| puts ' ' + target}
        when 'showall'
            @list.each_value(&:print)
        when 'mktodo'
            @list[target].add_item(*args)
        when 'up'
            @list[target].up(*args.map(&:to_i))
        when 'down'
            @list[target].down(*args.map(&:to_i))
        when 'swap'
            @list[target].swap(*args.map(&:to_i))
        when 'sort'
            @list[target].sort_by_date!
        when 'priority'
            @list[target].print_priority
        when 'print'
            if args.empty?
                @list[target].print
            else
                @list[target].print_full_item(args[0].to_i)
            end
        when 'toggle'
            @list[target].toggle_item(*args.map(&:to_i))
        when 'rm'
            @list[target].remove_item(*args.map(&:to_i))
        when 'purge'
            @list[target].purge
        when 'quit'
            puts 'Exiting...'
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

TodoBoard.new.run