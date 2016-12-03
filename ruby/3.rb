@input = File.open('./inputs/3.txt', "r").readlines.each {|l| l.chomp!}.collect! {|e| e.split(' ').map! {|e|e.to_i}}
puts @input.select {|e| (e[0] + e[1] > e[2]) && (e[1] + e[2] > e[0]) && (e[2] + e[0] > e[1]) }.count

thing = @input.map {|e| e[0]}.each_slice(3).to_a +
@input.map {|e| e[1]}.each_slice(3).to_a +
@input.map {|e| e[2]}.each_slice(3).to_a

puts thing.select {|e| (e[0] + e[1] > e[2]) && (e[1] + e[2] > e[0]) && (e[2] + e[0] > e[1]) }.count
