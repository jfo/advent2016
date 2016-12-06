@input = File.open('./inputs/6.txt', "r").readlines.map {|e| e.chomp }

@new = []
(0..@input[0].length - 1).each do |i|
    @new << @input.map {|e| e[i]}
end

p @new.map{|e|
    e.max_by {|el| e.count(el)}
}.join

p @new.map{|e|
    e.min_by {|el| e.count(el)}
}.join
