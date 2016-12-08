class Display
    def initialize(x = 50, y = 6)
        @x = x
        @y = y
        @grid = Array.new(y){Array.new(x, false)}
    end

    def row(y, count)
        @grid[y].rotate!(-count)
        self
    end

    def column(x, count)
        @grid = (0...@x).map{|i|
            @grid.map {|e| e[i]}
        }
        @grid[x].rotate!(-count)

        @grid = (0...@y).map{|i|
            @grid.map {|e| e[i]}
        }
        self
    end

    def rect(a, b)
        (0...a).each do |x|
            (0...b).each do |y|
                @grid[y % @y][x % @x] = true
            end
        end
        self
    end

    def show
        @grid.each do |y|
            y.each do |x|
                print (x ? "▧ " : "  ")
            end
            puts
        end
        self
    end

    def count
        @grid.map do |e|
            e.count(true)
        end.inject :+
    end
end

input = File.open('./inputs/8.txt', "r").readlines.map{|e| e.chomp}

display = Display.new.show

input.each do |inst|
nums = inst.scan(/([0-9]+)/).map {|e| e.first.to_i}
    if inst.include? 'column'
        display.send(:column, nums[0], nums[1])
    elsif inst.include? 'row'
        display.send(:row, nums[0], nums[1])
    elsif inst.include? 'rect'
        display.send(:rect, nums[0], nums[1])
    end
    sleep 0.09
    system 'clear'
    display.show
    puts display.count
end
