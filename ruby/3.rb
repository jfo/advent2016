@input = File.open('./inputs/3.txt', "r").readlines.collect! {|e| e.split(' ').map! {|e|e.to_i}}
slicediff = (0..2).map{|i| @input.map {|e| e[i]}.each_slice(3).to_a}.flatten 1

is_valid = ->(e){ e.inject(:+) > e.max * 2 }

puts @input.select(&is_valid).count
puts slicediff.select(&is_valid).count
