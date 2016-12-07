require "set"

class String
    def invert_triad
        self[1] + self[0] + self[1]
    end

end

def get_pallins(input)
    out = Set.new
    (0..input.length - 3).each do |i|
        if input[i..i+2] == input[i..i+2].reverse && input[i] != input[i + 1]
            out << input[i..i+2]
        end
    end
    out
end

def scanner(input)
    {
        good: input.scan(/(^|\])([a-z]+)(\[|$)/).map{|e|get_pallins(e[1])}.reduce{|acc, e| acc | e }.map{|e| e.invert_triad},
        bad: input.scan(/\[([a-z]+)\]/).flatten.join(" ")
    }
end

def goodone?(input)
    input[:good].each do |needle|
        if input[:bad].include? needle
            return true
        end
    end
    false
end


p @input = File.open('./inputs/7.txt', "r").readlines.map{|e| scanner(e)}.map{|i| goodone? i}.count(true)

