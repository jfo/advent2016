@input = File.open('./inputs/2.txt', "r").readlines.each {|l| l.chomp!}.collect! {|e| e.split('')}
@keypadtwo = [[2,3,4], [6,7,8], ["A","B","C"]]
def two
    x = 0
    y = 1
    acc = []

    uplock = false
    downlock = false
    rightlock = false
    leftlock = true
    @input.each do |elem|
        elem.each do |e|
            case e
            when 'U'
                next if (leftlock || rightlock || uplock)
                if downlock
                    downlock = false
                    next
                end
                if y == 0 && x == 1
                    uplock = true
                    next
                end
                y -= 1
            when 'D'
                next if (leftlock || rightlock || downlock)
                if uplock
                    uplock = false
                    next
                end
                if y == 2 && x == 1
                    downlock = true
                    next
                end
                y += 1
            when 'R'
                next if (uplock || downlock || rightlock)
                if leftlock
                    leftlock = false
                    next
                end
                if y == 1 && x == 2
                    rightlock = true
                    next
                end
                x += 1
            when 'L'
                next if (uplock || downlock || leftlock)
                if rightlock
                    rightlock = false
                    next
                end
                if y == 1 && x == 0
                    leftlock = true
                    next
                end
                x -= 1
            end
            x = 0 if x == -1
            x = 2 if x == 3
            y = 0 if y == -1
            y = 2 if y == 3
        end

        if uplock
            acc << 1
        elsif downlock
            acc << 'D'
        elsif rightlock
            acc << 9
        elsif leftlock
            acc << 5
        else
            acc << @keypadtwo[y][x]
        end
    end

    acc.join
end

p two
