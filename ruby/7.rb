def pallin?(input)
    (0..input.length - 4).each do |i|
        if input[i..i+3] == input[i..i+3].reverse && input[i] != input[i + 1]
            return true
        end
    end
    false
end

def scanner(input)
    {
        good: input.scan(/(^|\])([a-z]+)(\[|$)/).map{|e|e[1]},
        bad: input.scan(/\[([a-z]+)\]/).flatten
    }
end


@input = File.open('./inputs/7.txt', "r").readlines.map{|e| scanner(e)}
p @input.map{|e|
    e[:good].map{|x| pallin? x}.include?(true) && !e[:bad].map{|x| pallin? x}.include?(true)
}.count true
