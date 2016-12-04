@input = File.open('./inputs/2.txt', "r").readlines.each {|l| l.chomp!}.collect! {|e| e.split('')}
@keypadone = [[1,2,3], [4,5,6], [7,8,9]]

def one
    x = 1
    y = 1
    acc = []
    @input.each do |elem|
        elem.each do |e|
            case e
            when 'U'
                y -= 1
            when 'D'
                y += 1
            when 'R'
                x += 1
            when 'L'
                x -= 1
            end
            x = 0 if x == -1
            x = 2 if x == 3
            y = 0 if y == -1
            y = 2 if y == 3
        end
        acc << @keypadone[y][x]
    end

    acc.join
end

p one
