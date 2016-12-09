def doodoo(src)
    acc = []
    i = 0
    until i >= src.length
        if src[i] == '('
            i += 1
            term = []
            until src[i] == ')'
                term << src[i]
                i += 1
            end
            i += 1
            inst =  term.join.scan(/([0-9]+)/).flatten.map {|e|e.to_i}
            inst[1].times do
                acc << src[i...i + inst[0]]
            end
            inst[0].times { i+=1 }
        else
            acc << src[i]
            i += 1
        end
    end
    acc.flatten.join
end

p doodoo("ADVENT") == "ADVENT"
p doodoo("A(1x5)BC") == "ABBBBBC"
p doodoo("(3x3)XYZ") == "XYZXYZXYZ"
p doodoo("A(2x2)BCD(2x2)EFG") == "ABCBCDEFEFG"
p doodoo("(6x1)(1x3)A") == "(1x3)A"
p doodoo("X(8x2)(3x3)ABCY") == "X(3x3)ABC(3x3)ABCY"

input = File.open('./inputs/9.txt', "r").read.gsub(/\s+/, "")

thing = doodoo(input)

# until !thing.include? '('
#     thing = doodoo(thing)
# end
# p thing.length
