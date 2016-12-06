@i = File.open('./inputs/6.txt', "r").readlines.map {|e| e.chomp }
p (0..7).map{|i|@i.map {|e| e[i]}}.map{|e|
    [e.max_by {|el| e.count(el)}, e.min_by {|el| e.count(el)}]
}.reduce {|acc, el| [acc[0]+el[0], acc[1]+el[1]]}

