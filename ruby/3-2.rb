@input = File.open('./inputs/3.txt', "r")
.readlines
.collect! {|e|
    e.split(' ')
    .map! {|e|e.to_i}
}

p (0..2).map{|i|
    @input.map {|e| e[i]}
    .each_slice(3)
    .to_a}
.flatten(1)
.select {|e| e.inject(:+) > e.max * 2 }
.count
